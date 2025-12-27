// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2025, Advanced Micro Devices, Inc. All rights reserved.

#include "fmha_fwd_v3.hpp"
#include "fmha_fwd_v3_head_dim_policies.hpp"
#include "mask.hpp"

namespace ck_tile {

std::ostream& operator<<(std::ostream& stream, const fmha_fwd_v3_args::data_type_enum& data_type)
{
    switch(data_type)
    {
    case fmha_fwd_v3_args::data_type_enum::fp16: return stream << "fp16";
    case fmha_fwd_v3_args::data_type_enum::bf16: return stream << "bf16";
    default: return stream << "unknown";
    }
}

std::pair<bool, float> fmha_fwd_v3(const fmha_fwd_v3_args& args, const stream_config& config)
{
    auto unsupported_hdim = [&]() {
        // Return false to indicate "no kernel launched" (caller will TORCH_CHECK(success)).
        return std::make_pair(false, -1.f);
    };

    if(args.data_type == fmha_fwd_v3_args::data_type_enum::fp16)
    {
        if(args.mask_type == static_cast<int>(mask_enum::no_mask))
        {
            if(args.hdim_qk == 64)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::fp16, false, 64>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            if(args.hdim_qk == 128)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::fp16, false, 128>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            return unsupported_hdim();
        }
        else
        {
            if(args.hdim_qk == 64)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::fp16, true, 64>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            if(args.hdim_qk == 128)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::fp16, true, 128>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            return unsupported_hdim();
        }
    }
    else if(args.data_type == fmha_fwd_v3_args::data_type_enum::bf16)
    {
        if(args.mask_type == static_cast<int>(mask_enum::no_mask))
        {
            if(args.hdim_qk == 64)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::bf16, false, 64>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            if(args.hdim_qk == 128)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::bf16, false, 128>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            return unsupported_hdim();
        }
        else
        {
            if(args.hdim_qk == 64)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::bf16, true, 64>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            if(args.hdim_qk == 128)
            {
                using kernel_traits = typename fmha_fwd_v3_kernel_traits_selector<
                    fmha_fwd_v3_args::data_type_enum::bf16, true, 128>::type;
                return fmha_fwd_v3_kernel_dispatch<kernel_traits>(args, config);
            }
            return unsupported_hdim();
        }
    }

    return std::make_pair(false, -1.f);
}

} // namespace ck_tile
