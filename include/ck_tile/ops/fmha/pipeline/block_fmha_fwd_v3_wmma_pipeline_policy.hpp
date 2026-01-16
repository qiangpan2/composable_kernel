// Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
// SPDX-License-Identifier: MIT

#pragma once

#include "ck_tile/core.hpp"
#include "ck_tile/ops/gemm/block/block_gemm_areg_breg_creg_v2.hpp"
#include "ck_tile/ops/gemm/block/block_gemm_areg_breg_creg_v2_custom_policy.hpp"
#include "ck_tile/ops/gemm/block/block_gemm_problem.hpp"
#include "ck_tile/ops/gemm/pipeline/tile_gemm_shape.hpp"
#include "ck_tile/ops/gemm/warp/warp_gemm_dispatcher.hpp"

namespace ck_tile {

/// @brief WMMA-specific policy for v3 pipeline on gfx11/gfx12 (wave32)
///
/// Key differences from BlockFmhaV3PipelineDefaultPolicy:
/// - Fixed WarpSize = 32 (wave32)
/// - Uses KIssues > 1 for K dimension instead of requiring WarpSize*KVector >= kKPerBlock
/// - Simplified LDS layout for wave32
struct BlockFmhaV3WmmaPipelinePolicy
{
    static constexpr ck_tile::index_t NumWarpPerGroup = 4;
    // wave32 fixed: 4 warps * 32 threads = 128 threads per warp group
    static constexpr ck_tile::index_t NumThreadPerWarpGroup = NumWarpPerGroup * 32;

    // ========================================================================
    // Alignment methods - can be reused from default policy
    // ========================================================================

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetAlignmentQ()
    {
        constexpr index_t MaxVectorSize = 16 / sizeof(typename Problem::QDataType);

        using BlockGemm       = remove_cvref_t<decltype(GetQKBlockGemm<Problem>())>;
        constexpr auto config = BlockGemm::Policy::template GetWarpGemmMWarpNWarp<Problem>();
        using WG              = remove_cvref_t<decltype(config.template at<0>())>;

        return min(MaxVectorSize, WG::kK / WG::WarpGemmAttribute::Impl::kABKLane);
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetAlignmentK()
    {
        using namespace ck_tile;
        using KDataType = remove_cvref_t<typename Problem::KDataType>;
        // wave32: dword only (4 bytes)
        constexpr index_t MaxReadSizeInBytes = 4;
        return MaxReadSizeInBytes / sizeof(KDataType);
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetAlignmentV()
    {
        using namespace ck_tile;
        using VDataType = remove_cvref_t<typename Problem::VDataType>;
        // wave32: dword only (4 bytes)
        constexpr index_t MaxReadSizeInBytes = 4;
        return MaxReadSizeInBytes / sizeof(VDataType);
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetAlignmentO()
    {
        using BlockGemm       = remove_cvref_t<decltype(GetPVBlockGemm<Problem>())>;
        constexpr auto config = BlockGemm::Policy::template GetWarpGemmMWarpNWarp<Problem>();
        using WG              = remove_cvref_t<decltype(config.template at<0>())>;

        return WG::WarpGemmAttribute::Impl::kCM1PerLane;
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetSmemKPackK()
    {
        using namespace ck_tile;
        using KDataType = remove_cvref_t<typename Problem::KDataType>;
        return 16 / sizeof(KDataType);
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetSmemVPackK()
    {
        using namespace ck_tile;
        using VDataType = remove_cvref_t<typename Problem::VDataType>;
        return 16 / sizeof(VDataType);
    }

    // ========================================================================
    // DRAM tile distributions - rewritten for wave32 with KIssues
    // ========================================================================

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeKDramTileDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetQKBlockGemm<Problem>())>;
        // Use BlockGemm B distribution to ensure consistency with LDS load
        // K is the B matrix in GEMM0 (Q x K^T = S)
        return make_static_tile_distribution(BlockGemm::MakeBBlockDistributionEncode());
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeVDramTileDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetPVBlockGemm<Problem>())>;
        // Use BlockGemm B distribution to ensure consistency with LDS load
        // V is the B matrix in GEMM1 (P x V = O)
        return make_static_tile_distribution(BlockGemm::MakeBBlockDistributionEncode());
    }

    // ========================================================================
    // Register tile distributions - reuse BlockGemm encoding (handled by WarpGemmDispatcher)
    // ========================================================================

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeQRegTileDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetQKBlockGemm<Problem>())>;
        return make_static_tile_distribution(BlockGemm::MakeABlockDistributionEncode());
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeKRegTileDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetQKBlockGemm<Problem>())>;
        return make_static_tile_distribution(BlockGemm::MakeBBlockDistributionEncode());
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakePRegTileDistribution()
    {
        using namespace ck_tile;
        // NOTE: This returns GEMM1 A distribution for use in GEMM1.
        // However, sp_compute (GEMM0 C output) has GEMM0 C distribution which is DIFFERENT.
        // The union between sp_compute and p DOES NOT WORK correctly because the
        // thread-to-coordinate mappings are different:
        // - GEMM0 C: R=<MWarp=4>, H=[<MIterPerWarp>, <NIterPerWarp, NWarp=2>]
        // - GEMM1 A: R=<NWarp=2>, H=[<MIterPerWarp>, <KIterPerWarp>]
        // The pipeline must redistribute P through LDS before passing to GEMM1.
        using BlockGemm = remove_cvref_t<decltype(GetPVBlockGemm<Problem>())>;
        return make_static_tile_distribution(BlockGemm::MakeABlockDistributionEncode());
    }

    // Get GEMM0 C distribution (used by sp_compute in the union)
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeSPComputeDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetQKBlockGemm<Problem>())>;
        return make_static_tile_distribution(BlockGemm::MakeCBlockDistributionEncode());
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeVRegTileDistribution()
    {
        using namespace ck_tile;
        using BlockGemm = remove_cvref_t<decltype(GetPVBlockGemm<Problem>())>;
        // V is B matrix in GEMM1 (P x V = O), must use B distribution encoding
        return make_static_tile_distribution(BlockGemm::MakeBBlockDistributionEncode());
    }

    // ========================================================================
    // Block GEMM - reuse with WarpGemmDispatcher (auto-selects WMMA for gfx11/12)
    // ========================================================================

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto GetQKBlockGemm()
    {
        using namespace ck_tile;

        using GemmProblem =
            BlockGemmProblem<typename Problem::QDataType,
                             typename Problem::KDataType,
                             typename Problem::SaccDataType,
                             Problem::kBlockSize,
                             TileGemmShape<sequence<Problem::BlockFmhaShape::kM0,
                                                    Problem::BlockFmhaShape::kN0,
                                                    Problem::BlockFmhaShape::kK0>,
                                           typename Problem::BlockFmhaShape::Gemm0BlockWarps,
                                           typename Problem::BlockFmhaShape::Gemm0WarpTile>>;

        // WMMA path: use WarpGemmDispatcher to auto-select WMMA 16x16x16
        constexpr auto warp_gemm = WarpGemmDispatcher<typename Problem::QDataType,
                                                      typename Problem::KDataType,
                                                      typename Problem::SaccDataType,
                                                      Problem::BlockFmhaShape::Gemm0WarpTile::at(number<0>{}),
                                                      Problem::BlockFmhaShape::Gemm0WarpTile::at(number<1>{}),
                                                      Problem::BlockFmhaShape::Gemm0WarpTile::at(number<2>{}),
                                                      true>{};  // TransposeC

        using BlockGemmPolicy =
            BlockGemmARegBRegCRegV2CustomPolicy<typename Problem::QDataType,
                                                typename Problem::KDataType,
                                                typename Problem::SaccDataType,
                                                typename Problem::BlockFmhaShape::Gemm0BlockWarps,
                                                decltype(warp_gemm),
                                                GemmLoopOrder::MNK>;

        return BlockGemmARegBRegCRegV2<GemmProblem, BlockGemmPolicy>{};
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto GetPVBlockGemm()
    {
        using namespace ck_tile;

        using GemmProblem =
            BlockGemmProblem<typename Problem::PDataType,
                             typename Problem::VDataType,
                             typename Problem::OaccDataType,
                             Problem::kBlockSize,
                             TileGemmShape<sequence<Problem::BlockFmhaShape::kM0,
                                                    Problem::BlockFmhaShape::kN1,
                                                    Problem::BlockFmhaShape::kK1>,
                                           typename Problem::BlockFmhaShape::Gemm1BlockWarps,
                                           typename Problem::BlockFmhaShape::Gemm1WarpTile>>;

        // WMMA path: use Single access (no EDouble specialization for WMMA)
        using WarpGemm = WarpGemmDispatcher<typename Problem::PDataType,
                                            typename Problem::VDataType,
                                            typename Problem::OaccDataType,
                                            Problem::BlockFmhaShape::Gemm1WarpTile::at(number<0>{}),
                                            Problem::BlockFmhaShape::Gemm1WarpTile::at(number<1>{}),
                                            Problem::BlockFmhaShape::Gemm1WarpTile::at(number<2>{}),
                                            true,
                                            false,
                                            false,
                                            WGAttrNumAccessEnum::Single>;

        using BlockGemmPolicy =
            BlockGemmARegBRegCRegV2CustomPolicy<typename Problem::PDataType,
                                                typename Problem::VDataType,
                                                typename Problem::OaccDataType,
                                                typename Problem::BlockFmhaShape::Gemm1BlockWarps,
                                                WarpGemm,
                                                GemmLoopOrder::MNK>;
        return BlockGemmARegBRegCRegV2<GemmProblem, BlockGemmPolicy>{};
    }

    // ========================================================================
    // LDS layout - rewritten for wave32 with KIssues
    // ========================================================================

    static constexpr ck_tile::index_t kKLdsPadInBytes = 4 * 4;   // 4 dwords = 16 bytes
    static constexpr ck_tile::index_t kVLdsPadInBytes = 4 * 16;  // 16 dwords = 64 bytes

    template <typename Problem, ck_tile::index_t IBuf = 0>
    CK_TILE_DEVICE static constexpr auto
    MakeKLdsStoreBlockDescriptor(ck_tile::number<IBuf> = ck_tile::number<0>{})
    {
        using namespace ck_tile;

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kK0;  // 128
        constexpr index_t NumWarps   = Problem::BlockFmhaShape::NumWarps;  // 8
        constexpr index_t WarpSize   = 32;

        constexpr index_t KVector = GetAlignmentK<Problem>();  // 2
        constexpr index_t kPad = kKLdsPadInBytes / sizeof(typename Problem::KDataType);  // 8

        // wave32 layout: multiple K issues
        constexpr index_t ElementsPerWarpK = WarpSize * KVector;  // 64
        constexpr index_t KIssues = kKPerBlock / ElementsPerWarpK;  // 2
        constexpr index_t NPerWarp = kNPerBlock / NumWarps;  // 4

        // LDS layout: [NPerWarp, NumWarps, KIssues, WarpSize, KVector] with padding
        // Physical layout in LDS (row-major with padding per warp):
        // Each warp's K slice: WarpSize * KVector + kPad elements
        constexpr index_t WarpKSliceWithPad = WarpSize * KVector + kPad;  // 72

        constexpr auto k_lds_block_desc_0 = make_naive_tensor_descriptor_with_offset(
            make_tuple(number<NPerWarp>{},   // n0
                       number<NumWarps>{},   // n1
                       number<KIssues>{},    // k0
                       number<WarpSize>{},   // k1
                       number<KVector>{}),   // k2
            make_tuple(number<NumWarps * KIssues * WarpKSliceWithPad>{},
                       number<KIssues * WarpKSliceWithPad>{},
                       number<WarpKSliceWithPad>{},
                       number<KVector>{},
                       number<1>{}),
            number<IBuf * GetSingleSmemElementSpaceSize<Problem>()>{},
            number<KVector>{},
            number<1>{});

        // Transform to 2D [kNPerBlock, kKPerBlock] format to match DRAM tile distribution
        // Note: Must output 2D to be compatible with store_tile from 2D DRAM tile
        constexpr auto k_lds_block_desc_2d = transform_tensor_descriptor(
            k_lds_block_desc_0,
            make_tuple(
                make_merge_transform(make_tuple(number<NPerWarp>{}, number<NumWarps>{})),
                make_merge_transform(make_tuple(number<KIssues>{}, number<WarpSize>{}, number<KVector>{}))),
            make_tuple(sequence<0, 1>{}, sequence<2, 3, 4>{}),
            make_tuple(sequence<0>{}, sequence<1>{}));

        return k_lds_block_desc_2d;
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeKLdsLoadBlockDescriptor()
    {
        using namespace ck_tile;

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kK0;  // 128
        constexpr index_t NumWarps   = Problem::BlockFmhaShape::NumWarps;  // 8
        constexpr index_t WarpSize   = 32;

        constexpr index_t KPack   = GetSmemKPackK<Problem>();  // 8
        constexpr index_t KVector = GetAlignmentK<Problem>();  // 2
        constexpr index_t kPad = kKLdsPadInBytes / sizeof(typename Problem::KDataType);  // 8

        constexpr index_t ElementsPerWarpK = WarpSize * KVector;  // 64
        constexpr index_t KIssues = kKPerBlock / ElementsPerWarpK;  // 2
        constexpr index_t NPerWarp = kNPerBlock / NumWarps;  // 4
        constexpr index_t WarpKSliceWithPad = WarpSize * KVector + kPad;  // 72

        // Load descriptor: reshape to [kNPerBlock, kKPerBlock] logical view
        constexpr auto k_lds_block_desc_0 = make_naive_tensor_descriptor(
            make_tuple(number<NPerWarp>{},
                       number<NumWarps>{},
                       number<KIssues>{},
                       number<ElementsPerWarpK / KPack>{},
                       number<KPack>{}),
            make_tuple(number<NumWarps * KIssues * WarpKSliceWithPad>{},
                       number<KIssues * WarpKSliceWithPad>{},
                       number<WarpKSliceWithPad>{},
                       number<KPack>{},
                       number<1>{}),
            number<KPack>{},
            number<1>{});

        // Merge to [N, K] logical view
        constexpr auto k_lds_block_desc = transform_tensor_descriptor(
            k_lds_block_desc_0,
            make_tuple(
                make_merge_transform(make_tuple(number<NPerWarp>{}, number<NumWarps>{})),
                make_merge_transform(make_tuple(number<KIssues>{}, number<ElementsPerWarpK / KPack>{}, number<KPack>{}))),
            make_tuple(sequence<0, 1>{}, sequence<2, 3, 4>{}),
            make_tuple(sequence<0>{}, sequence<1>{}));

        return k_lds_block_desc;
    }

    template <typename Problem, ck_tile::index_t IBuf = 0>
    CK_TILE_DEVICE static constexpr auto
    MakeVLdsStoreBlockDescriptor(ck_tile::number<IBuf> = ck_tile::number<0>{})
    {
        using namespace ck_tile;
        using VDataType = remove_cvref_t<typename Problem::VDataType>;

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kK1;  // 32
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kN1;  // 32
        constexpr index_t kPad = kVLdsPadInBytes / sizeof(VDataType); // 32

        // Simple 2D naive layout: [N, K+pad] - works with any distribution
        // This layout is compatible with BlockGemm B distribution used for V DRAM load
        constexpr auto v_lds_block_desc = make_naive_tensor_descriptor_with_offset(
            make_tuple(number<kNPerBlock>{}, number<kKPerBlock>{}),
            make_tuple(number<kKPerBlock + kPad>{}, number<1>{}),
            number<(IBuf + 2) * GetSingleSmemElementSpaceSize<Problem>()>{},
            number<GetAlignmentV<Problem>()>{},
            number<1>{});

        return v_lds_block_desc;
    }

    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakeVLdsLoadBlockDescriptor()
    {
        using namespace ck_tile;
        using VDataType = remove_cvref_t<typename Problem::VDataType>;

        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kK1;  // 32
        constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kN1;  // 32
        constexpr index_t kPad = kVLdsPadInBytes / sizeof(VDataType); // 32
        constexpr index_t KPack = GetSmemVPackK<Problem>();           // 8

        // Simple 2D naive layout matching Store, with vectorized K access
        // Layout: [N, K/KPack, KPack] with stride [K+pad, KPack, 1]
        constexpr auto v_lds_block_desc_0 = make_naive_tensor_descriptor(
            make_tuple(number<kNPerBlock>{}, number<kKPerBlock / KPack>{}, number<KPack>{}),
            make_tuple(number<kKPerBlock + kPad>{}, number<KPack>{}, number<1>{}),
            number<KPack>{},
            number<1>{});

        // Merge K dimensions to get [N, K] logical view
        constexpr auto v_lds_block_desc = transform_tensor_descriptor(
            v_lds_block_desc_0,
            make_tuple(
                make_pass_through_transform(number<kNPerBlock>{}),
                make_merge_transform(make_tuple(number<kKPerBlock / KPack>{}, number<KPack>{}))),
            make_tuple(sequence<0>{}, sequence<1, 2>{}),
            make_tuple(sequence<0>{}, sequence<1>{}));

        return v_lds_block_desc;
    }

    // ========================================================================
    // P LDS descriptors for redistribution (GEMM0 C -> GEMM1 A)
    // ========================================================================

    static constexpr ck_tile::index_t kPLdsPadInBytes = 16;  // 16 bytes padding

    // P LDS size for redistribution: [kM0, kN0] with padding
    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetPLdsSize()
    {
        using namespace ck_tile;
        using PDataType = remove_cvref_t<typename Problem::PDataType>;
        constexpr index_t kMPerBlock = Problem::BlockFmhaShape::kM0;  // 64
        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32
        constexpr index_t kPad = kPLdsPadInBytes / sizeof(PDataType); // 8

        // Simple 2D layout: M rows × (N + pad) columns
        return kMPerBlock * (kNPerBlock + kPad) * sizeof(PDataType);  // 64 * 40 * 2 = 5120 bytes
    }

    // P LDS Store descriptor: simple 2D [M, N+pad] layout for storing sp_compute
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakePLdsStoreBlockDescriptor()
    {
        using namespace ck_tile;
        using PDataType = remove_cvref_t<typename Problem::PDataType>;

        constexpr index_t kMPerBlock = Problem::BlockFmhaShape::kM0;  // 64
        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32
        constexpr index_t kPad = kPLdsPadInBytes / sizeof(PDataType); // 8

        // Simple 2D naive layout: [M, N+pad]
        constexpr auto p_lds_block_desc = make_naive_tensor_descriptor(
            make_tuple(number<kMPerBlock>{}, number<kNPerBlock>{}),
            make_tuple(number<kNPerBlock + kPad>{}, number<1>{}),
            number<1>{},  // alignment
            number<1>{});

        return p_lds_block_desc;
    }

    // P LDS Load descriptor: simple 2D layout with vectorized N access for loading as GEMM1 A
    template <typename Problem>
    CK_TILE_DEVICE static constexpr auto MakePLdsLoadBlockDescriptor()
    {
        using namespace ck_tile;
        using PDataType = remove_cvref_t<typename Problem::PDataType>;

        constexpr index_t kMPerBlock = Problem::BlockFmhaShape::kM0;  // 64
        constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32 (this is kK1 for GEMM1)
        constexpr index_t kPad = kPLdsPadInBytes / sizeof(PDataType); // 8

        constexpr index_t NPack = 16 / sizeof(PDataType);  // 8 for fp16

        // 3D layout for vectorized access: [M, N/NPack, NPack]
        constexpr auto p_lds_block_desc_0 = make_naive_tensor_descriptor(
            make_tuple(number<kMPerBlock>{}, number<kNPerBlock / NPack>{}, number<NPack>{}),
            make_tuple(number<kNPerBlock + kPad>{}, number<NPack>{}, number<1>{}),
            number<NPack>{},
            number<1>{});

        // Merge back to 2D: [M, N]
        constexpr auto p_lds_block_desc = transform_tensor_descriptor(
            p_lds_block_desc_0,
            make_tuple(
                make_pass_through_transform(number<kMPerBlock>{}),
                make_merge_transform(make_tuple(number<kNPerBlock / NPack>{}, number<NPack>{}))),
            make_tuple(sequence<0>{}, sequence<1, 2>{}),
            make_tuple(sequence<0>{}, sequence<1>{}));

        return p_lds_block_desc;
    }

    // ========================================================================
    // SMEM size calculation - rewritten for wave32 layout
    // ========================================================================

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr auto GetSingleSmemElementSpaceSize()
    {
        using namespace ck_tile;

        // K LDS size
        constexpr index_t SingleKSize = [&]() {
            constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kN0;  // 32
            constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kK0;  // 128
            constexpr index_t NumWarps   = Problem::BlockFmhaShape::NumWarps;  // 8
            constexpr index_t WarpSize   = 32;

            constexpr index_t KVector = GetAlignmentK<Problem>();  // 2
            constexpr index_t kPad = kKLdsPadInBytes / sizeof(typename Problem::KDataType);  // 8

            constexpr index_t ElementsPerWarpK = WarpSize * KVector;  // 64
            constexpr index_t KIssues = kKPerBlock / ElementsPerWarpK;  // 2
            constexpr index_t NPerWarp = kNPerBlock / NumWarps;  // 4
            constexpr index_t WarpKSliceWithPad = ElementsPerWarpK + kPad;  // 72

            // Total: NPerWarp * NumWarps * KIssues * WarpKSliceWithPad
            return NPerWarp * NumWarps * KIssues * WarpKSliceWithPad;  // 4 * 8 * 2 * 72 = 4608
        }();

        // V LDS size with simple 2D layout
        constexpr index_t SingleVSize = [&]() {
            using VDataType = remove_cvref_t<typename Problem::VDataType>;
            constexpr index_t kNPerBlock = Problem::BlockFmhaShape::kK1;  // 32
            constexpr index_t kKPerBlock = Problem::BlockFmhaShape::kN1;  // 32
            constexpr index_t kPad = kVLdsPadInBytes / sizeof(VDataType); // 32

            // Simple 2D layout: N rows × (K + pad) columns
            return kNPerBlock * (kKPerBlock + kPad);  // 32 * 64 = 2048
        }();

        return max(SingleKSize, SingleVSize);
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr ck_tile::index_t GetSmemSizeKV()
    {
        using namespace ck_tile;

        // Use max of K and V single buffer size, then multiply by element size
        static_assert(std::is_same_v<typename Problem::KDataType, typename Problem::VDataType>);
        constexpr index_t kv_element_space_size_in_bytes =
            GetSingleSmemElementSpaceSize<Problem>() * sizeof(typename Problem::KDataType);

        return kv_element_space_size_in_bytes;
    }

    template <typename Problem>
    CK_TILE_HOST_DEVICE static constexpr ck_tile::index_t GetSmemSize()
    {
        // 4 buffers: K double buffer (2) + V double buffer (2) + P redistribution buffer (1)
        // P LDS is used to redistribute P from GEMM0 C distribution to GEMM1 A distribution
        return 4 * GetSmemSizeKV<Problem>() + GetPLdsSize<Problem>();
    }
};

} // namespace ck_tile

