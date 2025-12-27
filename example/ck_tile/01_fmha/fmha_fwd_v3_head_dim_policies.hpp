// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2025, Advanced Micro Devices, Inc. All rights reserved.

#pragma once


#include "fmha_fwd_v3_impl.hpp"
#include "ck_tile/ops/fmha/pipeline/block_fmha_fwd_v3_pipeline_wmma_policy.hpp"

namespace ck_tile {

struct FmhaFwdV3Policy_Hdim128_Kvec8B : public BlockFmhaV3PipelineDefaultPolicy
{
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto GetAlignmentK()
    {
        // Only override for gfx11/gfx12 wave32 targets; otherwise use the default policy.
#if defined(__gfx1100__) || defined(__gfx1101__) || defined(__gfx1200__) || defined(__gfx1201__)
        using KDataType = remove_cvref_t<typename Problem::KDataType>;
        constexpr index_t MaxReadSizeInBytes = 8;
        return MaxReadSizeInBytes / sizeof(KDataType);
#else
        return BlockFmhaV3PipelineDefaultPolicy::template GetAlignmentK<Problem>();
#endif
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto GetAlignmentV()
    {
        // Only override for gfx11/gfx12 wave32 targets; otherwise use the default policy.
#if defined(__gfx1100__) || defined(__gfx1101__) || defined(__gfx1200__) || defined(__gfx1201__)
        using VDataType = remove_cvref_t<typename Problem::VDataType>;
        constexpr index_t MaxReadSizeInBytes = 8;
        return MaxReadSizeInBytes / sizeof(VDataType);
#else
        return BlockFmhaV3PipelineDefaultPolicy::template GetAlignmentV<Problem>();
#endif
    }
};

struct FmhaFwdV3Policy_Hdim64_Wmma : public BlockFmhaV3PipelineWmmaPolicy
{
};

template <fmha_fwd_v3_args::data_type_enum DataType, bool IsMasking>
struct fmha_fwd_v3_kernel_traits_ext_hdim64
{
    static constexpr auto date_type          = DataType;
    static constexpr bool is_variable_seqlen = false;
    static constexpr bool is_masking         = IsMasking;

    using qkvp_dtype = typename fmha_fwd_v3_problem_traits<date_type>::qkvp_dtype;
    using acc_dtype  = typename fmha_fwd_v3_problem_traits<date_type>::acc_dtype;
    using o_dtype    = typename fmha_fwd_v3_problem_traits<date_type>::o_dtype;
    using lse_dtype  = typename fmha_fwd_v3_problem_traits<date_type>::lse_dtype;

    using fmha_shape  = typename TileFmhaShape_Wmma<64>::Type;
    using fmha_traits = TileFmhaFwdV3Traits<true, true, false, false, false, -1>;
    using fmha_mask   = GenericAttentionMask<IsMasking, /*IsLocal=*/false>;

    using fmha_pipeline_problem = BlockFmhaFwdV3PipelineProblem<qkvp_dtype,
                                                                qkvp_dtype,
                                                                qkvp_dtype,
                                                                acc_dtype,
                                                                acc_dtype,
                                                                lse_dtype,
                                                                qkvp_dtype,
                                                                acc_dtype,
                                                                o_dtype,
                                                                fmha_shape,
                                                                is_variable_seqlen,
                                                                fmha_mask,
                                                                fmha_traits>;

    using fmha_pipeline =
        BlockFmhaFwdV3Pipeline<fmha_pipeline_problem, FmhaFwdV3Policy_Hdim64_Wmma>;

    using epilogue = Default2DEpilogue<
        Default2DEpilogueProblem<lse_dtype,
                                 o_dtype,
                                 true, // kPadM
                                 true  // kPadN
                                 >>;

    using kernel = FmhaFwdV3Kernel<fmha_pipeline, epilogue>;
};

template <fmha_fwd_v3_args::data_type_enum DataType, bool IsMasking>
struct fmha_fwd_v3_kernel_traits_ext_hdim128
{
    static constexpr auto date_type          = DataType;
    static constexpr bool is_variable_seqlen = false;
    static constexpr bool is_masking         = IsMasking;

    //                                    M0   N0  K0   N1   K1
    using fmha_block_tile      = sequence<256, 32, 128, 128, 32, 128>;
    using fmha_warp_gemm_shape = sequence<32, 32, 16>;
    using fmha_block_warps     = sequence<8, 1, 1>;

    using fmha_shape = TileFmhaShape<fmha_block_tile,
                                     fmha_block_warps,
                                     fmha_warp_gemm_shape,
                                     fmha_block_warps,
                                     fmha_warp_gemm_shape,
                                     true // IsVLayoutRowMajor
                                     >;

    using fmha_traits = TileFmhaFwdV3Traits<true,  // kPadSeqLenQ
                                            true,  // kPadSeqLenK
                                            false, // kPadHeadDimQ
                                            false, // kPadHeadDimV
                                            false, // kStoreLSE
                                            -1     // kBlockPerCu
                                            >;

    using fmha_mask = GenericAttentionMask<IsMasking, /*IsLocal=*/false>;

    using fmha_pipeline_problem =
        BlockFmhaFwdV3PipelineProblem<typename fmha_fwd_v3_problem_traits<date_type>::qkvp_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::qkvp_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::qkvp_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::acc_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::acc_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::lse_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::qkvp_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::acc_dtype,
                                      typename fmha_fwd_v3_problem_traits<date_type>::o_dtype,
                                      fmha_shape,
                                      is_variable_seqlen,
                                      fmha_mask,
                                      fmha_traits>;

    using fmha_pipeline =
        BlockFmhaFwdV3Pipeline<fmha_pipeline_problem, FmhaFwdV3Policy_Hdim128_Kvec8B>;

    using epilogue = Default2DEpilogue<
        Default2DEpilogueProblem<typename fmha_fwd_v3_problem_traits<date_type>::acc_dtype,
                                 typename fmha_fwd_v3_problem_traits<date_type>::o_dtype,
                                 true, // kPadM
                                 true, // kPadM
                                 true  // UseRawStore
                                 >>;

    using kernel = FmhaFwdV3Kernel<fmha_pipeline, epilogue>;
};

template <fmha_fwd_v3_args::data_type_enum DataType, bool IsMasking, index_t Hdim>
struct fmha_fwd_v3_kernel_traits_selector;

template <fmha_fwd_v3_args::data_type_enum DataType, bool IsMasking>
struct fmha_fwd_v3_kernel_traits_selector<DataType, IsMasking, 64>
{
    using type = fmha_fwd_v3_kernel_traits_ext_hdim64<DataType, IsMasking>;
};

template <fmha_fwd_v3_args::data_type_enum DataType, bool IsMasking>
struct fmha_fwd_v3_kernel_traits_selector<DataType, IsMasking, 128>
{
    using type = fmha_fwd_v3_kernel_traits_ext_hdim128<DataType, IsMasking>;
};

} // namespace ck_tile

