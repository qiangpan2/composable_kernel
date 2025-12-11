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
    
    // Rest of the methods are inherited from default policy
};

} // namespace ck_tile
