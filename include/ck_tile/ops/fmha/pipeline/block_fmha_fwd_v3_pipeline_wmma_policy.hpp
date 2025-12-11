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
    static constexpr ck_tile::index_t NumThreadPerWarpGroup = 64;  // 2 * 32 NumWarpPerGroup * ck_tile::get_warp_size();
    
    // Override MakeVRegTileDistribution for WMMA to handle RowMajor V layout
    // WMMA's BWarpDstrEncoding doesn't support transpose via TransposeTileDistributionTraits
    // Instead, we construct a distribution that naturally matches RowMajor memory layout
    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto MakeVRegTileDistribution()
    {
        using namespace ck_tile;

        constexpr index_t MWarp = Problem::BlockFmhaShape::Gemm1BlockWarps::at(number<0>{});
        constexpr index_t NWarp = Problem::BlockFmhaShape::Gemm1BlockWarps::at(number<1>{});

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN1;
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kK1;

        // WMMA warp tile is 16x16x16 (format: sequence<M, N, K>)
        constexpr index_t kWarpN = Problem::BlockFmhaShape::Gemm1WarpTile::at(number<1>{}); // N dimension
        constexpr index_t kWarpK = Problem::BlockFmhaShape::Gemm1WarpTile::at(number<2>{}); // K dimension

        constexpr index_t NIterPerWarp = kNPerBlock / (NWarp * kWarpN);
        constexpr index_t KIterPerWarp = kKPerBlock / kWarpK;

        if constexpr(Problem::BlockFmhaShape::IsVLayoutRowMajor)
        {
            // For RowMajor V on WMMA: Create a simplified distribution that doesn't require transpose
            // 
            // For P@V gemm: P[M,K] @ V[K,N] where K=seqlen, N=hdim
            // V is [K, N] in RowMajor storage
            //
            // The key insight: instead of using BWarpDstrEncoding and transposing,
            // we create a distribution that directly maps to WMMA's expected B-matrix layout
            // This avoids the TransposeTileDistributionTraits validation failure
            
            // Simplified tile distribution: distribute iterations over warps
            // Format: [M_warp][N_iter, N_warp][K_iter]
            constexpr auto v_block_outer_dstr_encoding =
                tile_distribution_encoding<sequence<MWarp>,
                                          tuple<sequence<NIterPerWarp, NWarp>, 
                                                sequence<KIterPerWarp>>,
                                          tuple<sequence<0, 1>>,
                                          tuple<sequence<0>>,
                                          sequence<2, 1>,
                                          sequence<0, 0>>{};
            
            // Create the tile distribution directly
            constexpr auto v_block_dstr = make_static_tile_distribution(v_block_outer_dstr_encoding);
            return v_block_dstr;
        }
        else
        {
            // ColumnMajor V: use parent implementation (standard path, no transpose needed)
            return BlockFmhaV3PipelineDefaultPolicy::template MakeVRegTileDistribution<Problem>();
        }
    }
};

} // namespace ck_tile
