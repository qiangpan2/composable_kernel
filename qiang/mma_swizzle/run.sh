hipcc --offload-arch=gfx1101 -save-temps -o test_wmma_fp32_16_16_16_fp16_buildin test_wmma_fp32_16_16_16_fp16_buildin.cpp
llc -march=amdgcn -mcpu=gfx1101 test_wmma_fp32_16_16_16_fp16_buildin-hip-amdgcn-amd-amdhsa-gfx1101.bc -o kernel.s
