// Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#pragma once

// WMMA v3 Pipeline for gfx11/gfx12 (RDNA3/RDNA4)
// This is a specialized version of BlockFmhaFwdV3Pipeline optimized for WMMA instructions.
// Key differences from MFMA v3:
// - No MFMA scheduling barriers (CK_TILE_SCHED_BARRIER_MFMA)
// - Uses synchronous load_tile instead of async_load_tile_raw
// - Uses load_tile instead of load_tile_transpose for V tile (WMMA has symmetric A/B distribution)
// - Uses block_tile_reduce_sync instead of permlane32_swap for cross-wave reduction

#include "ck_tile/core.hpp"
#include "ck_tile/ops/fmha/block/block_attention_bias_enum.hpp"
#include "ck_tile/ops/fmha/block/block_attention_quant_scale_enum.hpp"
#include "ck_tile/ops/fmha/pipeline/block_fmha_fwd_v3_wmma_pipeline_policy.hpp"
#include "ck_tile/ops/reduce/block/block_reduce.hpp"

#define ENABLE_ASM_MARKER_WMMA 1
#if ENABLE_ASM_MARKER_WMMA
#define ASM_MARKER_WMMA(marker)          \
    __builtin_amdgcn_sched_barrier(0);   \
    asm volatile("; [WMMA] " #marker);   \
    __builtin_amdgcn_sched_barrier(0);
#else
#define ASM_MARKER_WMMA(marker)
#endif

#define ADD_SBARRIER_FOR_PHASE0_WMMA 1
#if !defined(CK_TILE_DISABLE_PACKED_FP32)
#define CK_TILE_DISABLE_PACKED_FP32 0
#endif

#define WARP_ID_WMMA 0
#define LANE_ID_WMMA 0

#define ENABLE_DEBUG_STMTS_WMMA 1
#if ENABLE_DEBUG_STMTS_WMMA
#define DEBUG_STMTS_WMMA \
    if(get_block_1d_id() == 0 && get_warp_id() == WARP_ID_WMMA && get_lane_id() == LANE_ID_WMMA)
#else
#define DEBUG_STMTS_WMMA if constexpr(false)
#endif

namespace ck_tile {

// Simplified CoreLoopScheduler for WMMA - no MFMA scheduling barriers
template <typename PipelineProblem, bool kIsMasking>
struct CoreLoopSchedulerWmma;

template <typename PipelineProblem>
struct CoreLoopSchedulerWmma<PipelineProblem, /*kIsMasking=*/true>
{
    template <ck_tile::index_t WaveGroup, ck_tile::index_t Phase>
    CK_TILE_DEVICE static constexpr void schedule(ck_tile::number<WaveGroup>,
                                                  ck_tile::number<Phase>)
    {
        using namespace ck_tile;

        // WMMA version: only VALU/SALU barriers, no MFMA scheduling
        if constexpr(WaveGroup == 0)
        {
            if constexpr(Phase == 0)
            {
                static_for<0, 8, 1>{}([&](auto) {
                    // No MFMA barrier - WMMA scheduling handled by compiler
                    __builtin_amdgcn_sched_group_barrier(0x200, 2, 0); // TRANS
                    __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                });
            }
            else if constexpr(Phase == 1)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 2)
            {
#if !CK_TILE_DISABLE_PACKED_FP32
                __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
#endif
                static_for<0, 8, 1>{}([&](auto) {
                    // No MFMA barrier
                    __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
                });
            }
            else if constexpr(Phase == 3)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
        }
        else
        {
            if constexpr(Phase == 0)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 1)
            {
                static_for<0, 8, 1>{}([&](auto) {
                    // No MFMA barrier
                    __builtin_amdgcn_sched_group_barrier(0x200, 2, 0); // TRANS
                    __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                });
            }
            else if constexpr(Phase == 2)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 3)
            {
#if !CK_TILE_DISABLE_PACKED_FP32
                __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
#endif
                static_for<0, 8, 1>{}([&](auto) {
                    // No MFMA barrier
                    __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
                });
            }
        }
    }
};

template <typename PipelineProblem>
struct CoreLoopSchedulerWmma<PipelineProblem, /*kIsMasking=*/false>
{
    template <ck_tile::index_t WaveGroup, ck_tile::index_t Phase>
    CK_TILE_DEVICE static constexpr void schedule(ck_tile::number<WaveGroup>,
                                                  ck_tile::number<Phase>)
    {
        using namespace ck_tile;

        // WMMA version: only VALU/SALU barriers, no MFMA scheduling
        if constexpr(WaveGroup == 0)
        {
            if constexpr(Phase == 0)
            {
                static_for<0, 8, 1>{}([&](auto) {
                    __builtin_amdgcn_sched_group_barrier(0x200, 2, 0); // TRANS
                    __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                });
            }
            else if constexpr(Phase == 1)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 2)
            {
#if !CK_TILE_DISABLE_PACKED_FP32
                __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
#endif
                static_for<0, 8, 1>{}([&](auto) {
                    __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
                });
            }
            else if constexpr(Phase == 3)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
        }
        else
        {
            if constexpr(Phase == 0)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 1)
            {
                static_for<0, 8, 1>{}([&](auto) {
                    __builtin_amdgcn_sched_group_barrier(0x200, 2, 0); // TRANS
                    __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                });
            }
            else if constexpr(Phase == 2)
            {
                __builtin_amdgcn_sched_group_barrier(0x002, 2, 0); // VALU
                __builtin_amdgcn_sched_group_barrier(0x004, 4, 0); // SALU
            }
            else if constexpr(Phase == 3)
            {
#if !CK_TILE_DISABLE_PACKED_FP32
                __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
#endif
                static_for<0, 8, 1>{}([&](auto) {
                    __builtin_amdgcn_sched_group_barrier(0x002, 4, 0); // VALU
                });
            }
        }
    }
};

namespace detail {
CK_TILE_DEVICE float fma_impl_vsv_wmma(float a, float b, float c)
{
#if CK_TILE_DISABLE_PACKED_FP32
    return a * b + c;
#else
    float result;
    asm volatile("v_fma_f32 %[result], %[a], %[b], %[c]"
                 : [result] "=v"(result)
                 : [a] "v"(a), [b] "s"(b), [c] "v"(c));
    return result;
#endif
}

CK_TILE_DEVICE float add_impl_vv_wmma(float lhs, float rhs)
{
    float result;
    asm volatile("v_add_f32_e32 %[result], %[lhs], %[rhs]"
                 : [result] "=v"(result)
                 : [lhs] "v"(lhs), [rhs] "v"(rhs));
    return result;
}

CK_TILE_DEVICE float mul_impl_vv_wmma(float lhs, float rhs)
{
    float result;
    asm volatile("v_mul_f32_e32 %[result], %[lhs], %[rhs]"
                 : [result] "=v"(result)
                 : [lhs] "v"(lhs), [rhs] "v"(rhs));
    return result;
}

CK_TILE_DEVICE fp16x2_t cvt_pk_fp16_f32_wmma(float a, float b)
{
    // Hardware accelerated packed fp32->fp16 conversion (RTZ)
    // bit_cast between __fp16 and _Float16 vector types (same underlying representation)
    return ck_tile::bit_cast<fp16x2_t>(__builtin_amdgcn_cvt_pkrtz(a, b));
}

CK_TILE_DEVICE bf16x2_t cvt_pk_bf16_f32_wmma(float a, float b)
{
    // No bf16 packed builtin, use CK scalar conversion
    return ck_tile::fp32x2_to_bf16x2(fp32x2_t{a, b});
}

CK_TILE_DEVICE fp32x2_t pk_mul_f32_wmma(fp32x2_t lhs, fp32x2_t rhs)
{
    // RDNA has no packed f32 multiply, use scalar operations
    fp32x2_t result;
    result.x = lhs.x * rhs.x;
    result.y = lhs.y * rhs.y;
    return result;
}
} // namespace detail

/// WMMA v3 Pipeline for gfx11/gfx12 (RDNA3/RDNA4)
/// This is optimized for WMMA 16x16x16 instructions with wave32.
template <typename Problem_, typename Policy_ = BlockFmhaV3WmmaPipelinePolicy>
struct BlockFmhaFwdV3WmmaPipeline
{
    using Problem             = ck_tile::remove_cvref_t<Problem_>;
    using Policy              = ck_tile::remove_cvref_t<Policy_>;
    using QDataType           = ck_tile::remove_cvref_t<typename Problem::QDataType>;
    using KDataType           = ck_tile::remove_cvref_t<typename Problem::KDataType>;
    using VDataType           = ck_tile::remove_cvref_t<typename Problem::VDataType>;
    using SaccDataType        = ck_tile::remove_cvref_t<typename Problem::SaccDataType>;
    using SMPLComputeDataType = ck_tile::remove_cvref_t<typename Problem::SMPLComputeDataType>;
    using LSEDataType         = ck_tile::remove_cvref_t<typename Problem::LSEDataType>;
    using PDataType           = ck_tile::remove_cvref_t<typename Problem::PDataType>;
    using OaccDataType        = ck_tile::remove_cvref_t<typename Problem::OaccDataType>;
    using ODataType           = ck_tile::remove_cvref_t<typename Problem::ODataType>;
    using AttentionVariant    = ck_tile::remove_cvref_t<typename Problem::AttentionVariant>;
    using FmhaMask            = ck_tile::remove_cvref_t<typename Problem::FmhaMask>;
    static_assert(is_generic_attention_mask_v<FmhaMask>);

    static_assert(std::is_same_v<SaccDataType, SMPLComputeDataType>,
                  "we will the same dist tensor 'sp_compute' for both gemm0 & softmax");

    using BlockFmhaShape = ck_tile::remove_cvref_t<typename Problem::BlockFmhaShape>;

    using VLayout = remove_cvref_t<typename BlockFmhaShape::VLayout>;
    static_assert(std::is_same_v<VLayout, ck_tile::tensor_layout::gemm::RowMajor>);

    // WMMA uses wave32, hardcode kBlockSize to avoid host-side get_warp_size() returning 64
    // NumWarps * 32 (wave32) instead of NumWarps * get_warp_size()
    static constexpr ck_tile::index_t kBlockSize = BlockFmhaShape::NumWarps * 32;

    static constexpr ck_tile::index_t kM0           = BlockFmhaShape::kM0;
    static constexpr ck_tile::index_t kN0           = BlockFmhaShape::kN0;
    static constexpr ck_tile::index_t kK0           = BlockFmhaShape::kK0;
    static constexpr ck_tile::index_t kN1           = BlockFmhaShape::kN1;
    static constexpr ck_tile::index_t kK1           = BlockFmhaShape::kK1;
    static constexpr ck_tile::index_t kQKHeaddim    = BlockFmhaShape::kQKHeaddim;
    static constexpr ck_tile::index_t kSubQKHeaddim = BlockFmhaShape::kSubQKHeaddim;

    static_assert(kQKHeaddim == 128 && kSubQKHeaddim == 128, "only supports hdim=hdim_v=128");

    static constexpr bool kIsGroupMode      = Problem::kIsGroupMode;
    static constexpr bool kPadSeqLenQ       = Problem::kPadSeqLenQ;
    static constexpr bool kPadSeqLenK       = Problem::kPadSeqLenK;
    static constexpr bool kPadHeadDimQ      = Problem::kPadHeadDimQ;
    static constexpr bool kPadHeadDimV      = Problem::kPadHeadDimV;
    static constexpr bool kHasLogitsSoftCap = Problem::kHasLogitsSoftCap;
    static constexpr auto BiasEnum          = Problem::BiasEnum;
    static constexpr bool kStoreLSE         = Problem::kStoreLSE;
    static constexpr bool kHasDropout       = Problem::kHasDropout;
    static constexpr auto QScaleEnum        = Problem::QScaleEnum;
    static constexpr bool kSkipMinSeqlenQ   = Problem::kSkipMinSeqlenQ;
    static_assert((BiasEnum == BlockAttentionBiasEnum::NO_BIAS && !kStoreLSE && !kHasDropout &&
                   (QScaleEnum == ck_tile::BlockAttentionQuantScaleEnum::NO_SCALE) &&
                   !kSkipMinSeqlenQ),
                  "enable unsupported features");

    // last dimension vector length used to create tensor view(and decide buffer_load vector length)
    // ... together with tensor distribution. tensor dist should able to overwrite this
    static constexpr ck_tile::index_t kAlignmentQ =
        kPadHeadDimQ ? 1 : Policy::template GetAlignmentQ<Problem>();
    static constexpr ck_tile::index_t kAlignmentK =
        kPadHeadDimQ ? 1 : Policy::template GetAlignmentK<Problem>();
    static constexpr ck_tile::index_t kAlignmentV =
        kPadHeadDimV ? 1 : Policy::template GetAlignmentV<Problem>();

    static constexpr ck_tile::index_t kAlignmentO =
        kPadHeadDimV ? 1 : Policy::template GetAlignmentO<Problem>();

    static constexpr ck_tile::index_t kBlockPerCu = []() {
        if constexpr(Problem::kBlockPerCu != -1)
            return Problem::kBlockPerCu;
        else
        {
            return 2;
        }
    }();

    CK_TILE_HOST_DEVICE static constexpr ck_tile::index_t GetSmemSize()
    {
        // create another LDS buffer for p
        return ck_tile::max(kM0 * kN1 * sizeof(PDataType),
                            Policy::template GetSmemSize<Problem>() +
                                kM0 * kN0 * sizeof(PDataType));
    }

    // for debug only
    template <ck_tile::index_t MPerBlock, ck_tile::index_t NPerBlock>
    CK_TILE_DEVICE static constexpr auto MakeSimpleLdsDesc()
    {
        using namespace ck_tile;
        constexpr auto lds_block_desc =
            make_naive_tensor_descriptor(make_tuple(number<MPerBlock>{}, number<NPerBlock>{}),
                                         make_tuple(number<NPerBlock>{}, number<1>{}),
                                         number<1>{},
                                         number<1>{});

        return lds_block_desc;
    }

    // for debug only
    template <ck_tile::index_t MPerBlock>
    CK_TILE_DEVICE static constexpr auto MakeSimpleLdsDesc1D()
    {
        using namespace ck_tile;
        constexpr auto lds_block_desc = make_naive_tensor_descriptor(
            make_tuple(number<MPerBlock>{}), make_tuple(number<1>{}), number<1>{}, number<1>{});

        return lds_block_desc;
    }

    template <typename DataType, typename Descriptor>
    CK_TILE_DEVICE static constexpr auto make_lds_tile_window(void* base, const Descriptor& desc)
    {
        using namespace ck_tile;

        auto tensor_view =
            make_tensor_view<address_space_enum::lds>(reinterpret_cast<DataType*>(base), desc);
        return make_tile_window(tensor_view, desc.get_lengths(), {0, 0});
    }

    // vmcnt=0~63, lgkmcnt=0~15, expcnt=0~7
    template <uint16_t Vmcnt, uint8_t Lgkmcnt, uint8_t Expcnt = 7>
    CK_TILE_DEVICE static constexpr void s_waitcnt()
    {
        // vmcnt use bits {[15:14],[3:0]}
        // expcnt use bits [6:4]
        // lgkmcnt use bits [11:8]
        __builtin_amdgcn_s_waitcnt((((0b110000 & Vmcnt) << (14 - 4)) | (0b1111 & Vmcnt)) |
                                   ((0b111 & Expcnt) << 4) | ((0b1111 & Lgkmcnt) << 8));
    }

    template <uint16_t Vmcnt>
    CK_TILE_DEVICE static constexpr void s_waitcnt_vmcnt()
    {
        s_waitcnt<Vmcnt, 15>();
    }

    template <uint8_t Lgkmcnt>
    CK_TILE_DEVICE static constexpr void s_waitcnt_lgkmcnt()
    {
        s_waitcnt<63, Lgkmcnt>();
    }

    template <typename QDramBlockWindowTmp,
              typename KDramBlockWindowTmp,
              typename VDramBlockWindowTmp,
              typename LSEDramBlockWindowTmp,
              typename QElementFunction,
              typename KElementFunction,
              typename VElementFunction,
              typename LSEElementFunction,
              typename SAccElementFunction,
              typename PComputeElementFunction,
              typename OAccElementFunction,
              typename AttentionVariantParams,
              typename BlockIndices>
    CK_TILE_DEVICE auto operator()(const QDramBlockWindowTmp& q_dram_block_window_tmp, // M0*K0 tile
                                   const QElementFunction& q_element_func,
                                   const KDramBlockWindowTmp& k_dram_block_window_tmp, // N0*K0 tile
                                   [[maybe_unused]] const KElementFunction& k_element_func,
                                   const VDramBlockWindowTmp& v_dram_block_window_tmp, // N1*K1 tile
                                   [[maybe_unused]] const VElementFunction& v_element_func,
                                   LSEDramBlockWindowTmp& lse_dram_window_tmp, // M0*1 tile
                                   const LSEElementFunction& lse_element_func,
                                   [[maybe_unused]] const SAccElementFunction& s_acc_element_func,
                                   const PComputeElementFunction& p_compute_element_func,
                                   const OAccElementFunction& o_acc_element_func,
                                   FmhaMask mask,
                                   float scale_s,
                                   const AttentionVariant& variant,
                                   const AttentionVariantParams& variant_params,
                                   const BlockIndices& block_indices,
                                   void* smem_ptr) const
    {
        using namespace ck_tile;

        static_assert(
            std::is_same_v<QDataType, remove_cvref_t<typename QDramBlockWindowTmp::DataType>> &&
                std::is_same_v<KDataType, remove_cvref_t<typename KDramBlockWindowTmp::DataType>> &&
                std::is_same_v<VDataType, remove_cvref_t<typename VDramBlockWindowTmp::DataType>>,
            "wrong!");

        static_assert(kM0 == QDramBlockWindowTmp{}.get_window_lengths()[number<0>{}] &&
                          kN0 == KDramBlockWindowTmp{}.get_window_lengths()[number<0>{}] &&
                          kK0 == KDramBlockWindowTmp{}.get_window_lengths()[number<1>{}] &&
                          kK1 == VDramBlockWindowTmp{}.get_window_lengths()[number<0>{}] &&
                          kN1 == VDramBlockWindowTmp{}.get_window_lengths()[number<1>{}],
                      "wrong!");

        static_assert(sizeof(SaccDataType) * kM0 * kN0 <= GetSmemSize());
        auto s_lds = make_tensor_view<address_space_enum::lds>(
            reinterpret_cast<SaccDataType*>(static_cast<char*>(smem_ptr)),
            MakeSimpleLdsDesc<kM0, kN0>());
        [[maybe_unused]] auto s_lds_window =
            make_tile_window(s_lds, make_tuple(number<kM0>{}, number<kN0>{}), {0, 0});

        auto p_lds = make_tensor_view<address_space_enum::lds>(
            reinterpret_cast<PDataType*>(static_cast<char*>(smem_ptr) +
                                         Policy::template GetSmemSize<Problem>()),
            MakeSimpleLdsDesc<kM0, kN0>());
        [[maybe_unused]] auto p_lds_window =
            make_tile_window(p_lds, make_tuple(number<kM0>{}, number<kN0>{}), {0, 0});

        auto o_lds = make_tensor_view<address_space_enum::lds>(
            reinterpret_cast<PDataType*>(static_cast<char*>(smem_ptr)),
            MakeSimpleLdsDesc<kM0, kN1>());
        [[maybe_unused]] auto o_lds_window =
            make_tile_window(o_lds, make_tuple(number<kM0>{}, number<kN1>{}), {0, 0});

        auto m_lds = make_tensor_view<address_space_enum::lds>(
            reinterpret_cast<SMPLComputeDataType*>(static_cast<char*>(smem_ptr) +
                                                   Policy::template GetSmemSize<Problem>()),
            MakeSimpleLdsDesc1D<kM0>());
        [[maybe_unused]] auto m_lds_window =
            make_tile_window(m_lds, make_tuple(number<kM0>{}), {0});

        const index_t warp_group_id = get_warp_id() / 4;

        // Block GEMM
        constexpr auto gemm_0 = Policy::template GetQKBlockGemm<Problem>();
        constexpr auto gemm_1 = Policy::template GetPVBlockGemm<Problem>();

        auto q_dram_window = make_tile_window_linear(
            q_dram_block_window_tmp, Policy::template MakeQRegTileDistribution<Problem>());

        // reduction function for softmax
        const auto f_max = [](auto e0, auto e1) { return max(e0, e1); };
        const auto f_sum = [](auto e0, auto e1) { return e0 + e1; };

        auto k_lds_window_store = generate_tuple(
            [&](auto i_buf) {
                return make_lds_tile_window<KDataType>(
                    smem_ptr, Policy::template MakeKLdsStoreBlockDescriptor<Problem>(i_buf));
            },
            number<2>{});

        auto v_lds_window_store = generate_tuple(
            [&](auto i_buf) {
                return make_lds_tile_window<KDataType>(
                    smem_ptr, Policy::template MakeVLdsStoreBlockDescriptor<Problem>(i_buf));
            },
            number<2>{});

        statically_indexed_array<decltype(make_tile_window(
                                     make_lds_tile_window<KDataType>(
                                         nullptr,
                                         Policy::template MakeKLdsLoadBlockDescriptor<Problem>()),
                                     Policy::template MakeKRegTileDistribution<Problem>())),
                                 2>
            k_lds_window_load;

        statically_indexed_array<decltype(make_tile_window(
                                     make_lds_tile_window<VDataType>(
                                         nullptr,
                                         Policy::template MakeVLdsLoadBlockDescriptor<Problem>()),
                                     Policy::template MakeVRegTileDistribution<Problem>())),
                                 2>
            v_lds_window_load;

        decltype(make_static_distributed_tensor<QDataType>(
            Policy::template MakeQRegTileDistribution<Problem>())) q_tile;

        // WMMA: Use regular load for both K and V tiles
        // WMMA 16x16x16 has symmetric A/B distribution (kAMLane == kBNLane == 16)
        union kv_tile_type
        {
            CK_TILE_DEVICE kv_tile_type() {}

            decltype(load_tile(k_lds_window_load(number<0>{}))) k_tile;
            // WMMA: Use regular load instead of load_tile_transpose
            decltype(load_tile(v_lds_window_load(number<0>{}))) v_tile;
        } kv_tile;

        union sp_compute_type
        {
            CK_TILE_DEVICE sp_compute_type() {}

            decltype(gemm_0.MakeCBlockTile()) sp_compute;
            decltype(make_static_distributed_tensor<PDataType>(
                Policy::template MakePRegTileDistribution<Problem>())) p;
        };
        statically_indexed_array<sp_compute_type, 2> sp;

        decltype(gemm_1.MakeCBlockTile()) o_acc;
        constexpr index_t fmha_alu_D_reg_cnt = 6; // threshold to decide how many fmha_alu_D_upd()
                                                  // instructions should we move to fmha_alu1()
        static_assert(fmha_alu_D_reg_cnt <= o_acc.thread_buf_.size());

        decltype(block_tile_reduce<SMPLComputeDataType>(
            sp(number<0>{}).sp_compute, sequence<1>{}, f_max, SMPLComputeDataType{0})) m;
        decltype(m) l;

        // initialize k_lds_window and v_lds_window
        static_for<0, 2, 1>{}([&](auto idx) {
            k_lds_window_load(idx) = make_tile_window(
                make_lds_tile_window<KDataType>(
                    static_cast<char*>(smem_ptr) + (idx)*Policy::template GetSmemSizeKV<Problem>(),
                    Policy::template MakeKLdsLoadBlockDescriptor<Problem>()),
                Policy::template MakeKRegTileDistribution<Problem>());
        });

        static_for<0, 2, 1>{}([&](auto idx) {
            v_lds_window_load(idx) =
                make_tile_window(make_lds_tile_window<VDataType>(
                                     static_cast<char*>(smem_ptr) +
                                         (idx + 2) * Policy::template GetSmemSizeKV<Problem>(),
                                     Policy::template MakeVLdsLoadBlockDescriptor<Problem>()),
                                 Policy::template MakeVRegTileDistribution<Problem>());
        });

        // P tile LDS redistribution: GEMM0 C distribution -> GEMM1 A distribution
        // This is needed because GEMM0 C splits N across warps, but GEMM1 needs full K per warp
        constexpr index_t p_lds_offset = 4 * Policy::template GetSmemSizeKV<Problem>();
        // Store window uses GEMM0 C distribution (matching sp.p)
        auto p_lds_store_window = make_tile_window(
            make_lds_tile_window<PDataType>(
                static_cast<char*>(smem_ptr) + p_lds_offset,
                Policy::template MakePLdsStoreBlockDescriptor<Problem>()),
            Policy::template MakePRegTileDistributionForStore<Problem>());

        auto p_lds_load_window = make_tile_window(
            make_lds_tile_window<PDataType>(
                static_cast<char*>(smem_ptr) + p_lds_offset,
                Policy::template MakePLdsLoadBlockDescriptor<Problem>()),
            Policy::template MakePRegTileDistributionForGemm1<Problem>());

        // p_tile_for_gemm1: independent tile with GEMM1 A distribution (16 elements per thread)
        // This is separate from the union (sp.p has 8 elements with GEMM0 C distribution)
        auto p_tile_for_gemm1 = make_static_distributed_tensor<PDataType>(
            Policy::template MakePRegTileDistributionForGemm1<Problem>());

        // Cross-warp reduction LDS for rowsum_p and m
        // Needed because block_tile_reduce_sync only reduces within a warp, not across warps
        constexpr index_t reduce_lds_offset = 4 * Policy::template GetSmemSizeKV<Problem>() 
                                            + Policy::template GetPLdsSize<Problem>();
        float* reduce_lds = reinterpret_cast<float*>(static_cast<char*>(smem_ptr) + reduce_lds_offset);

        {
            auto origin_q      = load_tile(q_dram_window);
            auto transformed_q = tile_elementwise_in(q_element_func, origin_q);

            q_tile = transformed_q;
        }

        clear_tile(o_acc);
        set_tile(m, bit_cast<float>(0xff7fffff)); // a bit larger than -infinity
        clear_tile(l);

        const auto q_origin = q_dram_window.get_window_origin();
        const auto [seqlen_k_start, seqlen_k_end] =
            mask.GetTileRangeAlongX(q_origin.at(number<0>{}), number<kM0>{}, number<kN0>{});

        const auto num_total_loop = integer_divide_ceil(seqlen_k_end - seqlen_k_start, kN0);
        index_t kv_token_start    = seqlen_k_start;

        // check early exit if no work to do
        if constexpr(FmhaMask::IsMasking || kPadSeqLenK)
        {
            if(num_total_loop <= 0)
            {
                if constexpr(kStoreLSE)
                {
                    auto lse =
                        make_static_distributed_tensor<LSEDataType>(m.get_tile_distribution());

                    set_tile(lse, -numeric<SMPLComputeDataType>::infinity());

                    store_tile(lse_dram_window_tmp, tile_elementwise_in(lse_element_func, lse));
                }

                // Note: here occ are all cleard, return it
                // Note: q loaded but no fence, ignore it.
                return o_acc;
            }
        }

        auto k_dram_window =
            make_tile_window(k_dram_block_window_tmp.get_bottom_tensor_view(),
                             k_dram_block_window_tmp.get_window_lengths(),
                             {seqlen_k_start, 0},
                             Policy::template MakeKDramTileDistribution<Problem>());
        k_dram_window.init_raw();

        // Get the original hdim offset from the input V window (for hdim slicing support)
        // WMMA v3 (bn1=32, hdim_v=128) needs 4 tiles, each with different hdim offset
        const auto v_origin = v_dram_block_window_tmp.get_window_origin();
        const index_t v_hdim_offset = v_origin.at(number<1>{}); // hdim offset (i_n1 * kN1)

        auto v_dram_window =
            make_tile_window(v_dram_block_window_tmp.get_bottom_tensor_view(),
                             v_dram_block_window_tmp.get_window_lengths(),
                             {seqlen_k_start, v_hdim_offset},
                             Policy::template MakeVDramTileDistribution<Problem>());
        v_dram_window.init_raw();

        // prefetch K tile
        index_t i_total_loops      = 0;
        constexpr index_t k0_loops = kQKHeaddim / kK0;
        constexpr index_t k1_loops = kN0 / kK1;
        static_assert(1 == k0_loops);
        static_assert(1 == k1_loops);
        static_assert(kN0 == kK1);

        constexpr index_t NumWarpGroups = Problem::kBlockSize / Policy::NumThreadPerWarpGroup;
        static_assert(NumWarpGroups == 2);

        [[maybe_unused]] auto print_dist_tensor = [&](const auto& dist_tensor, const char* name) {
            printf("[WMMA] %s (size=%d): %5.2f",
                   name,
                   decltype(dist_tensor.thread_buf_)::size(),
                   ck_tile::type_convert<float>(dist_tensor.thread_buf_[0]));
            static_for<1, decltype(dist_tensor.thread_buf_)::size(), 1>{}([&](auto i) {
                printf(", %5.2f", ck_tile::type_convert<float>(dist_tensor.thread_buf_[i]));
            });
            printf("\n");
        };

        [[maybe_unused]] auto print_lds = [&](auto lds_tile_window, const char* name) {
            const auto num_rows = lds_tile_window.get_window_lengths().at(number<0>{});
            const auto num_cols = lds_tile_window.get_window_lengths().at(number<1>{});

            auto desc = lds_tile_window.get_bottom_tensor_view().desc_;
            auto data = lds_tile_window.get_bottom_tensor_view().buf_.p_data_;

            if constexpr(true || num_rows < num_cols)
            {
                for(int row = 0; row < num_rows; ++row)
                {
                    int offset = desc.calculate_offset(make_tuple(row, 0));
                    printf("[DEVICE] %s[%3d] = %5.2f",
                           name,
                           row,
                           ck_tile::type_convert<float>(data[offset]));
                    for(int col = 1; col < num_cols; ++col)
                    {
                        printf(", ");
                        offset = desc.calculate_offset(make_tuple(row, col));
                        printf("%5.2f", ck_tile::type_convert<float>(data[offset]));
                    }
                    printf("\n");
                }
            }
            else
            {
                for(int col = 0; col < num_cols; ++col)
                {
                    int offset = desc.calculate_offset(make_tuple(0, col));
                    printf("[DEVICE] %s[%3d] = %5.2f",
                           name,
                           col,
                           ck_tile::type_convert<float>(data[offset]));
                    for(int row = 1; row < num_rows; ++row)
                    {
                        printf(", ");
                        offset = desc.calculate_offset(make_tuple(row, col));
                        printf("%5.2f", ck_tile::type_convert<float>(data[offset]));
                    }
                    printf("\n");
                }
            }
        };

        [[maybe_unused]] auto print_lds_1d = [&](auto lds_tile_window, const char* name) {
            const auto num_elems = lds_tile_window.get_window_lengths().at(number<0>{});

            auto desc = lds_tile_window.get_bottom_tensor_view().desc_;
            auto data = lds_tile_window.get_bottom_tensor_view().buf_.p_data_;

            int offset = desc.calculate_offset(make_tuple(0));
            printf("[DEVICE] %s = %5.2f", name, ck_tile::type_convert<float>(data[offset]));
            for(int e = 1; e < num_elems; ++e)
            {
                printf(", ");
                offset = desc.calculate_offset(make_tuple(e));
                printf("%5.2f", ck_tile::type_convert<float>(data[offset]));
            }
            printf("\n");
        };

        // K_mem_su_ld_insts = 1 for 32 x 128
        // V_mem_su_ld_insts = 1 for 128 x 32
        constexpr int K_mem_su_ld_insts = k_dram_window.get_num_of_access();
        constexpr int V_mem_su_ld_insts = v_dram_window.get_num_of_access();

        // WMMA: Use synchronous load + store instead of async_load_tile_raw
        auto K_mem_load = [&](auto k_lds_write_idx) {
            auto k_tile_tmp = load_tile(k_dram_window);
            store_tile(k_lds_window_store(k_lds_write_idx), k_tile_tmp);

            /// FIXME: use the future-predicting method to move the window
            // move K tile windows
            move_tile_window(k_dram_window, {kN0, 0});
        };

        auto K_lds_load = [&](auto k_lds_read_idx) {
            kv_tile.k_tile = load_tile(k_lds_window_load(k_lds_read_idx));
        };

        // WMMA: Use synchronous load + store instead of async_load_tile_raw
        auto V_mem_load = [&](auto v_lds_write_idx) {
            auto v_tile_tmp = load_tile(v_dram_window);
            store_tile(v_lds_window_store(v_lds_write_idx), v_tile_tmp);

            /// FIXME: use the future-predicting method to move the window
            move_tile_window(v_dram_window, {kK1, 0});
        };

        // WMMA: Use regular load (no transpose needed due to symmetric A/B distribution)
        auto V_lds_load = [&](auto v_lds_read_idx) {
            kv_tile.v_tile = load_tile(v_lds_window_load(v_lds_read_idx));
        };

        decltype(m) m_old;
        SMPLComputeDataType o_acc_scale; // rescale o_acc in fmha_alu1() & fmha_alu_D_upd()
        /// TODO: remove the sp_delta and use sp_compute directly
        statically_indexed_array<decltype(sp(number<0>{}).sp_compute), 2> sp_delta;

        auto fmha_logits_trans = [&](auto sp_reg_idx) {
            if constexpr(kHasLogitsSoftCap)
            {
                auto apply_logits_transform = [&variant, &variant_params, &block_indices](
                                                  auto& logits) {
                    logits = variant.LogitsTransform(variant_params,
                                                     variant.QueryTransform(variant_params, logits),
                                                     block_indices.batch_idx,
                                                     block_indices.qo_head_idx,
                                                     block_indices.kv_head_idx);
                };

                tile_elementwise_inout(apply_logits_transform, sp(sp_reg_idx).sp_compute);
            }
        };

        auto fmha_alu0 = [&](auto sp_reg_idx) {
            m_old = m; // m{j-1}
            static_assert(m.thread_buf_.size() == 1,
                          "assuming that each thread holds 1 rowmax value");
            auto m_latest = block_tile_reduce<SMPLComputeDataType>(
                sp(sp_reg_idx).sp_compute, sequence<1>{}, f_max, m.thread_buf_[0]);
            // WMMA: Use block_tile_reduce_sync instead of permlane32_swap
            block_tile_reduce_sync(m_latest, f_max, bool_constant<false>{});
            
            // Cross-warp reduction for m_latest via LDS (max reduction)
            // block_tile_reduce_sync only reduces within a warp, we need to reduce across N-warps
            // Only reduce within the same M-warp group (NWarp warps per group)
            {
                constexpr index_t NWarp = Problem::BlockFmhaShape::Gemm0BlockWarps::at(number<1>{});
                const index_t warp_id = threadIdx.x / 32;
                const index_t lane_id = threadIdx.x % 32;
                const index_t m_warp_id = warp_id / NWarp;  // Which M-warp group (0, 1, 2, 3)
                
                // Lane 0 of each warp stores to LDS[warp_id]
                if (lane_id == 0) {
                    reduce_lds[warp_id] = m_latest.thread_buf_[0];
                }
                __syncthreads();
                
                // Each warp's lane 0 reduces its M-warp group
                if (lane_id == 0) {
                    float max_val = reduce_lds[m_warp_id * NWarp];
                    for (index_t n = 1; n < NWarp; ++n) {
                        max_val = f_max(max_val, reduce_lds[m_warp_id * NWarp + n]);
                    }
                    reduce_lds[m_warp_id * NWarp] = max_val;
                }
                __syncthreads();
                
                // All threads read their M-warp's reduced value
                m_latest.thread_buf_[0] = reduce_lds[m_warp_id * NWarp];
            }
            
            m = m_latest;
            constexpr auto p_spans =
                std::decay_t<decltype(sp(sp_reg_idx).sp_compute)>::get_distributed_spans();
            sweep_tile_span(p_spans[number<0>{}], [&](auto idx0) {
                sweep_tile_span(p_spans[number<1>{}], [&](auto idx1) {
                    constexpr auto i_j_idx = make_tuple(idx0, idx1);
                    if constexpr(kHasLogitsSoftCap)
                    {
                        sp_delta(sp_reg_idx)(i_j_idx) =
                            sp(sp_reg_idx).sp_compute(i_j_idx) - m(i_j_idx);
                    }
                    else
                    {
                        sp_delta(sp_reg_idx)(i_j_idx) = detail::fma_impl_vsv_wmma(
                            sp(sp_reg_idx).sp_compute(i_j_idx), scale_s, -scale_s * m(i_j_idx));
                    }
                });
            });
            /// TODO: move some fmha_alu1() code here if necessary
        };

        auto fmha_alu1 = [&](auto sp_reg_idx) {
            constexpr auto p_spans =
                std::decay_t<decltype(sp(sp_reg_idx).sp_compute)>::get_distributed_spans();
            sweep_tile_span(p_spans[number<0>{}], [&](auto idx0) {
                sweep_tile_span(p_spans[number<1>{}], [&](auto idx1) {
                    constexpr auto i_j_idx = make_tuple(idx0, idx1);
                    sp(sp_reg_idx).sp_compute(i_j_idx) =
                        ck_tile::exp2(sp_delta(sp_reg_idx)(i_j_idx));
                });
            });

            auto rowsum_p = block_tile_reduce<SMPLComputeDataType>(
                sp(sp_reg_idx).sp_compute,
                sequence<1>{},
                f_sum,
                SMPLComputeDataType{0}); // rowsum(Pcompute{j})
            static_assert(rowsum_p.thread_buf_.size() == 1,
                          "assuming that each thread holds 1 rowsum value");
            
            // WMMA: Use block_tile_reduce_sync instead of permlane32_swap
            block_tile_reduce_sync(rowsum_p, f_sum, bool_constant<false>{});
            
            // Cross-warp reduction for rowsum_p via LDS
            // block_tile_reduce_sync only reduces within a warp, we need to reduce across N-warps
            // Only reduce within the same M-warp group (NWarp warps per group)
            {
                constexpr index_t NWarp = Problem::BlockFmhaShape::Gemm0BlockWarps::at(number<1>{});
                const index_t warp_id = threadIdx.x / 32;
                const index_t lane_id = threadIdx.x % 32;
                const index_t m_warp_id = warp_id / NWarp;  // Which M-warp group (0, 1, 2, 3)
                
                // Lane 0 of each warp stores to LDS[warp_id]
                if (lane_id == 0) {
                    reduce_lds[warp_id] = rowsum_p.thread_buf_[0];
                }
                __syncthreads();
                
                // Each warp's lane 0 reduces its M-warp group
                if (lane_id == 0) {
                    float total = 0.f;
                    for (index_t n = 0; n < NWarp; ++n) {
                        total += reduce_lds[m_warp_id * NWarp + n];
                    }
                    reduce_lds[m_warp_id * NWarp] = total;
                }
                __syncthreads();
                
                // All threads read their M-warp's reduced value
                rowsum_p.thread_buf_[0] = reduce_lds[m_warp_id * NWarp];
            }

            // l{j}
            /// Note: The compiler keeps moving the following instructions elsewhere because 'l'
            /// is first consumed later. To anchor them here, we rewrite the final addition in
            /// inline assembly to create a dependency, forcing the dependent instructions to
            /// be emitted at this point.
            constexpr auto o_spans = decltype(o_acc)::get_distributed_spans();
            sweep_tile_span(o_spans[number<0>{}], [&](auto idx0) {
                constexpr auto i_idx = make_tuple(idx0);
                const auto tmp       = [&] {
                    if constexpr(kHasLogitsSoftCap)
                    {
                        return ck_tile::exp2(m_old[i_idx] - m[i_idx]);
                    }
                    else
                    {
                        return ck_tile::exp2(scale_s * (m_old[i_idx] - m[i_idx]));
                    }
                }();
                l(i_idx) = detail::add_impl_vv_wmma(tmp * l[i_idx], rowsum_p[i_idx]);
            });

            // update partial o_acc [0, fmha_alu_D_reg_cnt)
            static_for<0, fmha_alu_D_reg_cnt, 1>{}([&](auto idx) {
                o_acc.thread_buf_[idx] = detail::mul_impl_vv_wmma(o_acc.thread_buf_[idx], o_acc_scale);
            });

            /// Note: The compiler keeps sinking the conversion instructions because the
            /// result 'p' is only consumed later. To anchor them here, we rewrite
            /// the cast_tile() call as inline assembly, forcing the conversions to be
            /// emitted at this point.
            static_assert(sp(sp_reg_idx).p.thread_buf_.size() % 2 == 0);
            static_for<0, sp(sp_reg_idx).p.thread_buf_.size(), 2>{}([&](auto idx) {
                float x = p_compute_element_func(sp(sp_reg_idx).sp_compute.thread_buf_[idx]);
                float y = p_compute_element_func(sp(sp_reg_idx).sp_compute.thread_buf_[idx + 1]);
                if constexpr(std::is_same_v<PDataType, fp16_t>)
                {
                    auto casted                           = detail::cvt_pk_fp16_f32_wmma(x, y);
                    sp(sp_reg_idx).p.thread_buf_[idx]     = casted.x;
                    sp(sp_reg_idx).p.thread_buf_[idx + 1] = casted.y;
                }
                else
                {
                    auto casted                           = detail::cvt_pk_bf16_f32_wmma(x, y);
                    sp(sp_reg_idx).p.thread_buf_[idx]     = casted.x;
                    sp(sp_reg_idx).p.thread_buf_[idx + 1] = casted.y;
                }
            });

            /// Note: Place fmha_alu1() at the end of the phase. The surrounding inline assembly
            /// can interfere with the behavior of sched_group_barrier(), so ending the phase here
            /// avoids unintended reordering.
        };

        auto gemm = [&](auto sp_reg_idx, auto gemm_idx) {
            if constexpr(gemm_idx == 0)
            {
                clear_tile(sp(sp_reg_idx).sp_compute); // initialize C
                // Note: Since k0_loops == 1 (v3 constraint), slice is full tile access
                // Removed get_slice_tile to avoid tile distribution incompatibility with WMMA
                gemm_0(sp(sp_reg_idx).sp_compute, q_tile, kv_tile.k_tile);
            }
            else
            {
                // P tile LDS redistribution: GEMM0 C -> GEMM1 A
                // Required because GEMM0 C splits N across warps, but GEMM1 needs full K per warp
                store_tile(p_lds_store_window, sp(sp_reg_idx).p);  // Store with GEMM0 C distribution
                
                block_sync_lds();
                p_tile_for_gemm1 = load_tile(p_lds_load_window);   // Load with GEMM1 A distribution
                
                // Use redistributed P tile for GEMM1
                gemm_1(o_acc, p_tile_for_gemm1, kv_tile.v_tile);
            }
        };

        auto cl_calc = [&](auto sp_reg_idx, auto gemm_idx) {
            if constexpr(gemm_idx == 0)
            {
                clear_tile(sp(sp_reg_idx).sp_compute); // initialize C
                // Note: Since k0_loops == 1 (v3 constraint), slice is full tile access
                // Removed get_slice_tile to avoid tile distribution incompatibility with WMMA
                gemm_0(sp(sp_reg_idx).sp_compute, q_tile, kv_tile.k_tile);
            }
            else
            {
                // P tile LDS redistribution: GEMM0 C -> GEMM1 A
                store_tile(p_lds_store_window, sp(sp_reg_idx).p);
                block_sync_lds();
                p_tile_for_gemm1 = load_tile(p_lds_load_window);
                
                // Use redistributed P tile for GEMM1
                gemm_1(o_acc, p_tile_for_gemm1, kv_tile.v_tile);

                fmha_alu0(number<1>{} - sp_reg_idx);
            }
        };

        auto fmha_alu_D_upd = [&] {
            o_acc_scale = [&] {
                if constexpr(kHasLogitsSoftCap)
                {
                    return ck_tile::exp2(m_old.thread_buf_[0] - m.thread_buf_[0]);
                }
                else
                {
                    return ck_tile::exp2(scale_s * (m_old.thread_buf_[0] - m.thread_buf_[0]));
                }
            }();

            fp32x2_t pk_o_acc_scale;
            pk_o_acc_scale.x = o_acc_scale;
            pk_o_acc_scale.y = o_acc_scale;

            static_assert((o_acc.thread_buf_.size() - fmha_alu_D_reg_cnt) % 2 == 0);
#if CK_TILE_DISABLE_PACKED_FP32
            static_assert(fmha_alu_D_reg_cnt + 2 <= o_acc.thread_buf_.size());
            static_for<fmha_alu_D_reg_cnt, fmha_alu_D_reg_cnt + 2, 1>{}(
                [&](auto idx) { o_acc.thread_buf_[idx] *= o_acc_scale; });
#endif

            constexpr auto issued_D_reg_cnt =
#if CK_TILE_DISABLE_PACKED_FP32
                fmha_alu_D_reg_cnt + 2
#else
                fmha_alu_D_reg_cnt
#endif
                ;
            /// NOTICE: Use inline asm v_pk_mul_f32 to reduce latency. The fmha_alu_D_upd() call
            /// should be placed at the end of a phase.
            // update partial o_acc after [issued_D_reg_cnt]

            static_for<issued_D_reg_cnt, o_acc.thread_buf_.size(), 2>{}([&](auto idx) {
                fp32x2_t input;
                input.x = o_acc.thread_buf_[idx];
                input.y = o_acc.thread_buf_[idx + 1];

                auto output = detail::pk_mul_f32_wmma(input, pk_o_acc_scale);

                o_acc.thread_buf_[idx]     = output.x;
                o_acc.thread_buf_[idx + 1] = output.y;
            });
        };

        auto fmha_mask = [&](auto sp_reg_idx) {
            if constexpr(kPadSeqLenK || FmhaMask::IsMasking)
            {
                bool need_perpixel_check = mask.IsEdgeTile(
                    q_origin.at(number<0>{}), kv_token_start, number<kM0>{}, number<kN0>{});
                if(need_perpixel_check)
                {
                    set_tile_if(sp(sp_reg_idx).sp_compute,
                                -numeric<SMPLComputeDataType>::infinity(),
                                [&](auto tile_idx) {
                                    const auto row =
                                        q_origin.at(number<0>{}) + tile_idx.at(number<0>{});
                                    const auto col = kv_token_start + tile_idx.at(number<1>{});
                                    return !variant.LogitsMask(variant_params,
                                                               block_indices.batch_idx,
                                                               row,
                                                               col,
                                                               block_indices.qo_head_idx,
                                                               block_indices.kv_head_idx);
                                });
                }
            }
        };

        auto cl_load = [&](auto load_type, auto mem_wr_idx, auto lds_rd_idx) {
            if constexpr(load_type == 0)
            {
                V_mem_load(mem_wr_idx);
                K_lds_load(lds_rd_idx);
            }
            else
            {
                K_mem_load(mem_wr_idx);
                V_lds_load(lds_rd_idx);
            }
        };

        auto core_loop = [&](auto cl_p) {
            auto gemm0 = number<0>{};
            auto gemm1 = number<1>{};

            auto memV = number<0>{};
            auto memK = number<1>{};

            // Use WMMA-specific scheduler
            using Scheduler = CoreLoopSchedulerWmma<Problem, FmhaMask::IsMasking>;

            auto iteration = [&](auto pi) {
                auto sp_p01_reg_idx = number<1>{} - pi;
                auto sp_p23_reg_idx = pi;

                auto K_w0_lds_wr_idx = number<1>{} - pi;
                auto V_w0_lds_wr_idx = pi;
                auto K_w0_lds_rd_idx = pi;
                auto V_w0_lds_rd_idx = pi;

                auto K_w4_lds_wr_idx = number<1>{} - pi;
                auto V_w4_lds_wr_idx = number<1>{} - pi;
                auto K_w4_lds_rd_idx = number<1>{} - pi;
                auto V_w4_lds_rd_idx = pi;

                bool result = true;

                if constexpr(cl_p == 0)
                {
#if ADD_SBARRIER_FOR_PHASE0_WMMA
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
#endif
                    __builtin_amdgcn_sched_barrier(0);
                    // phase0
                    if constexpr(pi == 0)
                    {
                        ASM_MARKER_WMMA("phase0 Wave0-3 (pi=0)");
                    }
                    else
                    {
                        ASM_MARKER_WMMA("phase0 Wave0-3 (pi=1)");
                    }
                    s_waitcnt_lgkmcnt<0>();
                    __builtin_amdgcn_sched_barrier(0);
                    cl_calc(sp_p01_reg_idx, gemm0);
                    fmha_alu1(sp_p23_reg_idx);
                    fmha_logits_trans(sp_p01_reg_idx);

                    Scheduler::schedule(cl_p, number<0>{});
                    __builtin_amdgcn_sched_barrier(0);
                    // phase1
                    ASM_MARKER_WMMA("phase1 Wave0-3");
                    s_waitcnt_vmcnt<K_mem_su_ld_insts + V_mem_su_ld_insts>();
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    cl_load(memK, K_w0_lds_wr_idx, V_w0_lds_rd_idx);
                    Scheduler::schedule(cl_p, number<1>{});
                    fmha_mask(sp_p01_reg_idx);

                    __builtin_amdgcn_sched_barrier(0);
                    // phase2
                    ASM_MARKER_WMMA("phase2 Wave0-3");
                    s_waitcnt_lgkmcnt<0>();
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    asm volatile("s_nop 0");
                    __builtin_amdgcn_sched_barrier(0);
                    cl_calc(sp_p23_reg_idx, gemm1);

                    Scheduler::schedule(cl_p, number<2>{});
                    __builtin_amdgcn_sched_barrier(0);
                    fmha_alu_D_upd();

                    __builtin_amdgcn_sched_barrier(0);
                    // phase3
                    ASM_MARKER_WMMA("phase3 Wave0-3");
                    s_waitcnt_vmcnt<K_mem_su_ld_insts + V_mem_su_ld_insts>();
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    cl_load(memV, V_w0_lds_wr_idx, K_w0_lds_rd_idx);

                    Scheduler::schedule(cl_p, number<3>{});
                    kv_token_start += kN0;
                    if(num_total_loop <= ++i_total_loops)
                    {
                        result = false;
                    }
                }
                else
                {
#if ADD_SBARRIER_FOR_PHASE0_WMMA
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
#endif
                    __builtin_amdgcn_sched_barrier(0);
                    // phase0
                    if constexpr(pi == 0)
                    {
                        ASM_MARKER_WMMA("phase0 Wave4-7 (pi=0)");
                    }
                    else
                    {
                        ASM_MARKER_WMMA("phase0 Wave4-7 (pi=1)");
                    }
                    cl_load(memV, V_w4_lds_wr_idx, K_w4_lds_rd_idx);

                    Scheduler::schedule(cl_p, number<0>{});
                    __builtin_amdgcn_sched_barrier(0);
                    // phase1
                    ASM_MARKER_WMMA("phase1 Wave4-7");
                    s_waitcnt<K_mem_su_ld_insts + V_mem_su_ld_insts, 0>();
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    asm volatile("s_nop 1");
                    __builtin_amdgcn_sched_barrier(0);
                    cl_calc(sp_p01_reg_idx, gemm0);
                    fmha_alu1(sp_p23_reg_idx);
                    fmha_logits_trans(sp_p01_reg_idx);

                    Scheduler::schedule(cl_p, number<1>{});
                    __builtin_amdgcn_sched_barrier(0);
                    // phase2
                    ASM_MARKER_WMMA("phase2 Wave4-7");
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    cl_load(memK, K_w4_lds_wr_idx, V_w4_lds_rd_idx);
                    Scheduler::schedule(cl_p, number<2>{});
                    fmha_mask(sp_p01_reg_idx);

                    kv_token_start += kN0;
                    if(num_total_loop <= ++i_total_loops)
                    {
                        result = false;
                    }

                    __builtin_amdgcn_sched_barrier(0);
                    // phase3
                    ASM_MARKER_WMMA("phase3 Wave4-7");
                    s_waitcnt<K_mem_su_ld_insts + V_mem_su_ld_insts, 0>();
                    __builtin_amdgcn_sched_barrier(0);
                    __builtin_amdgcn_s_barrier();
                    __builtin_amdgcn_sched_barrier(0);
                    asm volatile("s_nop 1");
                    __builtin_amdgcn_sched_barrier(0);
                    cl_calc(sp_p23_reg_idx, gemm1);

                    Scheduler::schedule(cl_p, number<3>{});
                    __builtin_amdgcn_sched_barrier(0);
                    fmha_alu_D_upd();
                }
                return result;
            };
            return iteration(number<0>{}) && iteration(number<1>{});
        };

        auto fmha_post_process = [&](auto d) {
            auto ps_pi        = number<1>{} - d;
            auto V_lds_rd_idx = ps_pi;

            if(1 < num_total_loop)
            {
                s_waitcnt_vmcnt<K_mem_su_ld_insts>();
            }
            else
            {
                s_waitcnt_vmcnt<0>();
            }
            __builtin_amdgcn_s_barrier();

            V_lds_load(V_lds_rd_idx);
            fmha_alu1(ps_pi);

            s_waitcnt_lgkmcnt<0>();

            auto sp_p23_reg_idx = ps_pi;
            gemm(sp_p23_reg_idx, /*gemm_idx=*/number<1>{});
        };

        // pre-stage
        {
            ASM_MARKER_WMMA("before pre-stage");
            // (1) load K0 to LDS & VGPR
            K_mem_load(number<0>{}); // mem_K0

            s_waitcnt_vmcnt<0>();
            __builtin_amdgcn_s_barrier();

            K_lds_load(number<0>{}); // lds_K0

            s_waitcnt_lgkmcnt<0>();
            __builtin_amdgcn_s_barrier();

            // (2) prefetch K1 and V0 to LDS in parallel with GEMM0
            if(1 < num_total_loop)
            {
                K_mem_load(number<1>{}); // mem_K1
            }
            V_mem_load(number<0>{}); // mem_V0

            // (3) wmma (Q*K0) + softmax
            gemm(number<0>{}, /*gemm_idx=*/number<0>{});
            fmha_logits_trans(number<0>{});
            fmha_mask(number<0>{});
            /// TODO: find better way to map fmha_alu(0,96) call
            fmha_alu0(number<0>{});
            fmha_alu_D_upd();

            kv_token_start += kN0;
            ++i_total_loops;
            if(num_total_loop <= i_total_loops)
            {
                goto label_main_loops_exit_wmma;
            }

            if(2 < num_total_loop)
            {
                K_mem_load(number<0>{}); // mem_K2

                s_waitcnt_vmcnt<K_mem_su_ld_insts + V_mem_su_ld_insts>();
                __builtin_amdgcn_s_barrier();
            }

            ASM_MARKER_WMMA("end pre-stage");
        }

        if(1 < num_total_loop)
        {
            if(warp_group_id == 0)
            {
                V_mem_load(number<1>{}); // V1
                K_lds_load(number<1>{}); // K1

                __builtin_amdgcn_s_setprio(0);
                __builtin_amdgcn_s_barrier();
                while(core_loop(number<0>{}))
                    ;
            }
            if(warp_group_id != 0)
            {
                __builtin_amdgcn_s_setprio(1);
                __builtin_amdgcn_s_barrier();
                while(core_loop(number<1>{}))
                    ;
            }
        }
    label_main_loops_exit_wmma:
        if(num_total_loop % 2)
        {
            fmha_post_process(number<1>{});
        }
        if(!(num_total_loop % 2))
        {
            fmha_post_process(number<0>{});
        }

        // store lse
        if constexpr(kStoreLSE)
        {
            auto lse = make_static_distributed_tensor<LSEDataType>(m.get_tile_distribution());

            constexpr auto lse_spans = decltype(lse)::get_distributed_spans();
            sweep_tile_span(lse_spans[number<0>{}], [&](auto idx0) {
                constexpr auto i_idx = make_tuple(idx0);
                lse(i_idx)           = m[i_idx] / C_LOG2E + log(l[i_idx]);
            });

            store_tile(lse_dram_window_tmp, tile_elementwise_in(lse_element_func, lse));
        }

        // finally, O
        constexpr auto o_spans = decltype(o_acc)::get_distributed_spans();

        sweep_tile_span(o_spans[number<0>{}], [&](auto idx0) {
            constexpr auto i_idx = make_tuple(idx0);
            const auto tmp       = [&]() {
                if constexpr(FmhaMask::IsMasking)
                {
                    return l[i_idx] == 0.f ? 0.f : 1 / l[i_idx];
                }
                else
                    return 1 / l[i_idx];
            }();
            sweep_tile_span(o_spans[number<1>{}], [&](auto idx1) {
                constexpr auto i_j_idx = make_tuple(idx0, idx1);
                o_acc(i_j_idx) *= tmp;
            });
        });

        o_acc = tile_elementwise_in(o_acc_element_func, o_acc);

        return o_acc;
    }

    template <typename QDramBlockWindowTmp,
              typename KDramBlockWindowTmp,
              typename VDramBlockWindowTmp,
              typename LSEDramBlockWindowTmp,
              typename AttentionVariantParams,
              typename BlockIndices>
    CK_TILE_DEVICE auto operator()(const QDramBlockWindowTmp& q_dram_block_window_tmp, // M0*K0 tile
                                   const KDramBlockWindowTmp& k_dram_block_window_tmp, // N0*K0 tile
                                   const VDramBlockWindowTmp& v_dram_block_window_tmp, // N1*K1 tile
                                   LSEDramBlockWindowTmp& lse_dram_block_window_tmp,   // M0*1 tile
                                   FmhaMask mask,
                                   float scale_s,
                                   const AttentionVariant& variant,
                                   const AttentionVariantParams& variant_params,
                                   const BlockIndices& block_indices,
                                   void* smem_ptr) const
    {
        using namespace ck_tile;

        return operator()(q_dram_block_window_tmp,
                          identity{},
                          k_dram_block_window_tmp,
                          identity{},
                          v_dram_block_window_tmp,
                          identity{},
                          lse_dram_block_window_tmp,
                          identity{},
                          identity{},
                          identity{},
                          identity{},
                          mask,
                          scale_s,
                          variant,
                          variant_params,
                          block_indices,
                          smem_ptr);
    }
};

} // namespace ck_tile

