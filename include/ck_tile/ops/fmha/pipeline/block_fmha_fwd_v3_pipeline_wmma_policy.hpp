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
    
    // WMMA-specific V tile type:
    // - Never use load_tile_transpose (some WMMA paths don't support it / shouldn't instantiate it).
    // - Enforce ColumnMajor V layout for WMMA policy.
    template <typename VLdsWindow, bool IsVLayoutRowMajor>
    struct MakeVTileType
    {
        static_assert(!IsVLayoutRowMajor,
                      "BlockFmhaV3PipelineWmmaPolicy requires V layout to be ColumnMajor "
                      "(IsVLayoutRowMajor=false). If you hit this, use a non-WMMA policy or "
                      "a shape with ColumnMajor V layout.");
        using type = decltype(load_tile(std::declval<VLdsWindow>()));
    };

    // WMMA uses the same V register tile distribution contract as the underlying PV GEMM.
    // Rely on the default policy's implementation so the resulting B-tile distribution
    // matches `GetPVBlockGemm<Problem>()` expectations (see "B distribution is wrong!" asserts).
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeVRegTileDistribution()
    {
        return BlockFmhaV3PipelineDefaultPolicy::template MakeVRegTileDistribution<Problem>();
    }
};

} // namespace ck_tile
