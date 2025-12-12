// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2025, Advanced Micro Devices, Inc. All rights reserved.

#pragma once

#include "ck_tile/ops/fmha/pipeline/block_fmha_fwd_v3_pipeline_default_policy.hpp"

namespace ck_tile {

// Policy optimized for WMMA architectures (warp size=32)
struct BlockFmhaV3PipelineWmmaPolicy : public BlockFmhaV3PipelineDefaultPolicy
{
    // For WMMA architectures with warp size=32:
    // - NumWarpPerGroup = 2 (reduced from 4 for warp size=32)
    // - NumThreadPerWarpGroup = 2 * 32 = 64 threads per group (HARDCODED for reliability)
    // - To satisfy v3 pipeline requirement NumWarpGroups = 2:
    //   BlockSize = 2 * 64 = 128 threads = 4 warps
    // 
    // This means we need Gemm0BlockWarps to produce 4 warps total:
    // - For sequence<2, 2, 1>: 2*2*1 = 4 warps ✓
    static constexpr ck_tile::index_t NumWarpPerGroup = 2;
    // HARDCODE 64 instead of computing from get_warp_size() to avoid macro dependency issues
    static constexpr ck_tile::index_t NumThreadPerWarpGroup = 64;  // 2 * 32 = NumWarpPerGroup * warp_size
    
    // WMMA-specific V register tile distribution
    // RDNA3/4 WMMA has different ps_to_rhss structure than MFMA, requires adjusted outer encoding
    // Also, WMMA doesn't support TransposeTileDistributionTraits, so we handle RowMajor V specially
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeVRegTileDistribution()
    {
        using namespace ck_tile;

        using BlockGemm       = remove_cvref_t<decltype(BlockFmhaV3PipelineDefaultPolicy::GetPVBlockGemm<Problem>())>;
        constexpr auto config = BlockGemm::Policy::template GetWarpGemmMWarpNWarp<Problem>();
        using WarpGemm        = remove_cvref_t<decltype(config.template at<0>())>;

        constexpr index_t MWarp = Problem::BlockFmhaShape::Gemm1BlockWarps::at(number<0>{});
        constexpr index_t NWarp = Problem::BlockFmhaShape::Gemm1BlockWarps::at(number<1>{});

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN1;
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kK1;

        constexpr index_t NIterPerWarp = kNPerBlock / (NWarp * WarpGemm::kN);
        constexpr index_t KIterPerWarp = kKPerBlock / WarpGemm::kK;

        // For WMMA: Place MWarp in R dimension (not P dimension) to avoid ps_to_rhss conflicts
        // Empty Ps2RHss allows WMMA's BWarpDstrEncoding ps_to_rhss to work for both RDNA3/4
        constexpr auto v_block_outer_dstr_encoding =
            tile_distribution_encoding<sequence<MWarp>,  // MWarp in R dimension  
                                       tuple<sequence<NIterPerWarp, NWarp>, sequence<KIterPerWarp>>,
                                       tuple<>,  // Empty Ps2RHssMajor - no P dimensions in outer encoding
                                       tuple<>,  // Empty Ps2RHssMinor
                                       sequence<1, 2>,
                                       sequence<0, 0>>{};

        constexpr auto v_block_dstr_encode = detail::make_embed_tile_distribution_encoding(
            v_block_outer_dstr_encoding, typename WarpGemm::BWarpDstrEncoding{});

        // V is RowMajor (seqlen, hdim) in DRAM as per FlashAttention standard
        // WMMA doesn't support TransposeTileDistributionTraits, so use encoding directly
        // The encoding already accounts for the correct memory access pattern
        static_assert(Problem::BlockFmhaShape::IsVLayoutRowMajor == true,
                      "Expected RowMajor V layout to match FlashAttention standard");
        
        constexpr auto v_block_dstr = make_static_tile_distribution(v_block_dstr_encode);
        return v_block_dstr;
    }
};

} // namespace ck_tile
