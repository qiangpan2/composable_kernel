// Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#pragma once

#include "ck_tile/core.hpp"
#include "ck_tile/ops/gemm/block/block_gemm_areg_breg_creg_v2.hpp"

namespace ck_tile {

// Custom BlockGemm for FMHA that allows using a different A distribution encoding.
// This is needed because FMHA's softmax output (P tile) has GEMM0 C distribution,
// but standard GEMM1 expects GEMM1 A distribution. By using this class with a
// custom A distribution encoder, we can pass P tile directly to GEMM1 without
// LDS redistribution.
//
// Template parameters:
// - Problem_: BlockGemm problem definition
// - Policy_: BlockGemm policy (warp layout, loop order, etc.)
// - CustomADistEncoder_: Optional encoder that provides the A distribution.
//   If void (default), uses the standard GEMM A distribution.
//   Otherwise, must provide: template <typename Problem> static auto Get();
template <typename Problem_, typename Policy_, typename CustomADistEncoder_ = void>
struct BlockGemmARegBRegCRegV2FmhaWmma
{
    using Base = BlockGemmARegBRegCRegV2<Problem_, Policy_>;

    using Problem = typename Base::Problem;
    using Policy  = typename Base::Policy;
    using Traits  = typename Base::Traits;

    using WarpGemm                           = typename Base::WarpGemm;
    using BlockGemmShape                     = typename Base::BlockGemmShape;
    static constexpr auto BlockGemmLoopOrder = Base::BlockGemmLoopOrder;

    using ADataType = typename Base::ADataType;
    using BDataType = typename Base::BDataType;
    using CDataType = typename Base::CDataType;

    static constexpr index_t KIterPerWarp = Base::KIterPerWarp;
    static constexpr index_t MIterPerWarp = Base::MIterPerWarp;
    static constexpr index_t NIterPerWarp = Base::NIterPerWarp;

    static constexpr index_t MWarp            = Base::MWarp;
    static constexpr index_t NWarp            = Base::NWarp;
    static constexpr bool UseDefaultScheduler = Base::UseDefaultScheduler;

    // Custom A distribution: use provided encoder or fall back to base
    CK_TILE_DEVICE static constexpr auto MakeABlockDistributionEncode()
    {
        if constexpr(std::is_void_v<CustomADistEncoder_>)
        {
            return Base::MakeABlockDistributionEncode();
        }
        else
        {
            return CustomADistEncoder_::template Get<Problem>();
        }
    }

    // B and C distributions are unchanged
    CK_TILE_DEVICE static constexpr auto MakeBBlockDistributionEncode()
    {
        return Base::MakeBBlockDistributionEncode();
    }

    CK_TILE_DEVICE static constexpr auto MakeCBlockDistributionEncode()
    {
        return Base::MakeCBlockDistributionEncode();
    }

    // C += A * B
    // This version skips the A distribution check when using custom A distribution
    template <typename CBlockTensor, typename ABlockTensor, typename BBlockTensor>
    CK_TILE_DEVICE void operator()(CBlockTensor& c_block_tensor,
                                   const ABlockTensor& a_block_tensor,
                                   const BBlockTensor& b_block_tensor) const
    {
        static_assert(std::is_same_v<ADataType, remove_cv_t<typename ABlockTensor::DataType>> &&
                          std::is_same_v<BDataType, remove_cv_t<typename BBlockTensor::DataType>> &&
                          std::is_same_v<CDataType, remove_cv_t<typename CBlockTensor::DataType>>,
                      "wrong!");

        // Check A distribution: when using custom encoder, check against custom distribution
        static_assert(
            std::is_same_v<remove_cvref_t<decltype(MakeABlockDistributionEncode())>,
                           remove_cvref_t<decltype(ABlockTensor::get_tile_distribution()
                                                       .get_static_tile_distribution_encoding())>>,
            "A distribution is wrong!");

        // B and C distributions must still match standard expectations
        static_assert(
            std::is_same_v<remove_cvref_t<decltype(MakeBBlockDistributionEncode())>,
                           remove_cvref_t<decltype(BBlockTensor::get_tile_distribution()
                                                       .get_static_tile_distribution_encoding())>>,
            "B distribution is wrong!");
        static_assert(
            std::is_same_v<remove_cvref_t<decltype(MakeCBlockDistributionEncode())>,
                           remove_cvref_t<decltype(CBlockTensor::get_tile_distribution()
                                                       .get_static_tile_distribution_encoding())>>,
            "C distribution is wrong!");

        using AWarpDstr = typename WarpGemm::AWarpDstr;
        using BWarpDstr = typename WarpGemm::BWarpDstr;
        using CWarpDstr = typename WarpGemm::CWarpDstr;

        using AWarpTensor = typename WarpGemm::AWarpTensor;
        using BWarpTensor = typename WarpGemm::BWarpTensor;
        using CWarpTensor = typename WarpGemm::CWarpTensor;

        constexpr auto a_warp_y_lengths =
            to_sequence(AWarpDstr{}.get_ys_to_d_descriptor().get_lengths());
        constexpr auto b_warp_y_lengths =
            to_sequence(BWarpDstr{}.get_ys_to_d_descriptor().get_lengths());
        constexpr auto c_warp_y_lengths =
            to_sequence(CWarpDstr{}.get_ys_to_d_descriptor().get_lengths());

        constexpr auto a_warp_y_index_zeros = uniform_sequence_gen_t<AWarpDstr::NDimY, 0>{};
        constexpr auto b_warp_y_index_zeros = uniform_sequence_gen_t<BWarpDstr::NDimY, 0>{};
        constexpr auto c_warp_y_index_zeros = uniform_sequence_gen_t<CWarpDstr::NDimY, 0>{};

        // hot loop:
        if constexpr(BlockGemmLoopOrder == GemmLoopOrder::KMN)
        {
            static_for<0, KIterPerWarp, 1>{}([&](auto kIter) {
                static_for<0, MIterPerWarp, 1>{}([&](auto mIter) {
                    // read A warp tensor from A Block window
                    AWarpTensor a_warp_tensor;
                    a_warp_tensor.get_thread_buffer() = a_block_tensor.get_y_sliced_thread_data(
                        merge_sequences(sequence<kIter, mIter>{}, a_warp_y_index_zeros),
                        merge_sequences(sequence<1, 1>{}, a_warp_y_lengths));

                    // Debug: check warp slicing values
                    if (threadIdx.x == 0 && blockIdx.x == 0 && blockIdx.y == 0 && blockIdx.z == 0 
                        && kIter == 0 && mIter == 0) {
                        printf("[DBG] GEMM1 warp slice (KMN): A_block[0]=%f, A_warp[0]=%f\n",
                               (float)a_block_tensor.thread_buf_[0],
                               (float)a_warp_tensor.get_thread_buffer()[0]);
                    }

                    static_for<0, NIterPerWarp, 1>{}([&](auto nIter) {
                        // read B warp tensor from B block tensor
                        BWarpTensor b_warp_tensor;
                        b_warp_tensor.get_thread_buffer() = b_block_tensor.get_y_sliced_thread_data(
                            merge_sequences(sequence<kIter, nIter>{}, b_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, b_warp_y_lengths));

                        CWarpTensor c_warp_tensor;
                        c_warp_tensor.get_thread_buffer() = c_block_tensor.get_y_sliced_thread_data(
                            merge_sequences(sequence<mIter, nIter>{}, c_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, c_warp_y_lengths));

                        // warp GEMM
                        WarpGemm{}(c_warp_tensor, a_warp_tensor, b_warp_tensor);

                        // write C warp tensor into C block tensor
                        c_block_tensor.set_y_sliced_thread_data(
                            merge_sequences(sequence<mIter, nIter>{}, c_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, c_warp_y_lengths),
                            c_warp_tensor.get_thread_buffer());
                    });
                });
            });
        }
        else if constexpr(BlockGemmLoopOrder == GemmLoopOrder::MNK)
        {
            static_for<0, MIterPerWarp, 1>{}([&](auto mIter) {
                static_for<0, NIterPerWarp, 1>{}([&](auto nIter) {
                    static_for<0, KIterPerWarp, 1>{}([&](auto kIter) {
                        // read A warp tensor from A Block window
                        AWarpTensor a_warp_tensor;

                        a_warp_tensor.get_thread_buffer() = a_block_tensor.get_y_sliced_thread_data(
                            merge_sequences(sequence<mIter, kIter>{}, a_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, a_warp_y_lengths));

                        // Debug: check warp slicing values
                        if (threadIdx.x == 0 && blockIdx.x == 0 && blockIdx.y == 0 && blockIdx.z == 0 
                            && mIter == 0 && kIter == 0) {
                            printf("[DBG] GEMM1 warp slice (MNK): A_block[0]=%f, A_warp[0]=%f\n",
                                   (float)a_block_tensor.thread_buf_[0],
                                   (float)a_warp_tensor.get_thread_buffer()[0]);
                        }

                        // read B warp tensor from B block tensor
                        BWarpTensor b_warp_tensor;

                        b_warp_tensor.get_thread_buffer() = b_block_tensor.get_y_sliced_thread_data(
                            merge_sequences(sequence<nIter, kIter>{}, b_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, b_warp_y_lengths));

                        // read C warp tensor from C block tensor
                        CWarpTensor c_warp_tensor;

                        c_warp_tensor.get_thread_buffer() = c_block_tensor.get_y_sliced_thread_data(
                            merge_sequences(sequence<mIter, nIter>{}, c_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, c_warp_y_lengths));

                        // warp GEMM
                        WarpGemm{}(c_warp_tensor, a_warp_tensor, b_warp_tensor);

                        // write C warp tensor into C block tensor
                        c_block_tensor.set_y_sliced_thread_data(
                            merge_sequences(sequence<mIter, nIter>{}, c_warp_y_index_zeros),
                            merge_sequences(sequence<1, 1>{}, c_warp_y_lengths),
                            c_warp_tensor.get_thread_buffer());
                    });
                });
            });
        }
    }

    CK_TILE_DEVICE static constexpr auto MakeCBlockTile()
    {
        return Base::MakeCBlockTile();
    }

    // C = A * B
    template <typename ABlockTensor, typename BBlockTensor>
    CK_TILE_DEVICE auto operator()(const ABlockTensor& a_block_tensor,
                                   const BBlockTensor& b_block_tensor) const
    {
        auto c_block_tensor = MakeCBlockTile();
        operator()(c_block_tensor, a_block_tensor, b_block_tensor);
        return c_block_tensor;
    }
};

} // namespace ck_tile

