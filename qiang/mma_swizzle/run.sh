# choose ID by hip device query
export HIP_VISIBLE_DEVICES=1,2
#dump isa
hipcc --offload-arch=gfx1101 -save-temps -o test_wmma_fp32_16_16_16_fp16_buildin test_wmma_fp32_16_16_16_fp16_buildin.cpp
llc -march=amdgcn -mcpu=gfx1101 test_wmma_fp32_16_16_16_fp16_buildin-hip-amdgcn-amd-amdhsa-gfx1101.bc -o kernel.s
#dump att
rocprofv3 --att -d dump --att-simd-select 0x0 -- ./test_wmma_fp32_16_16_16_fp16_buildin
