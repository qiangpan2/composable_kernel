// Wave Matrix Multiply Accumulate (WMMA) using HIP compiler intrinsic
// Does a matrix multiplication of two 16x16, fp16 matrices, and stores them into a 16x16 fp16 result matrix

#include <iostream>
#include <hip/hip_runtime.h>
#include <hip/hip_fp16.h>

using namespace std;

// Use half16 as an alias of the internal clang vector type of 16 fp16 values
typedef _Float16 half16 __attribute__((ext_vector_type(16)));



__global__ void wmma_matmul(__half* a, __half* b, __half* c)
{
    const int gIdx = blockIdx.x * blockDim.x + threadIdx.x;
    const int lIdx = threadIdx.x;

    // a and b fragments are stored in 8 VGPRs each, in packed format, so 16 elements each for a and b
    // a_frag will store one column of the 16x16 matrix A tile
    // b_frag will store one row of the 16x16 matrix B tile
    
    /*
    v[0:7] 对应 a_frag
    v[8:15] 对应 b_frag
    v[16:23] 对应 c_frag
    */
     // 手动声明 a_frag (v0-v7) // half16 a_frag;
    register uint32_t a_frag_0 asm("v0");
    register uint32_t a_frag_1 asm("v1");
    register uint32_t a_frag_2 asm("v2");
    register uint32_t a_frag_3 asm("v3");
    register uint32_t a_frag_4 asm("v4");
    register uint32_t a_frag_5 asm("v5");
    register uint32_t a_frag_6 asm("v6");
    register uint32_t a_frag_7 asm("v7");

    // 手动声明 b_frag (v8-v15) // half16 b_frag;
    register uint32_t b_frag_0 asm("v8");
    register uint32_t b_frag_1 asm("v9");
    register uint32_t b_frag_2 asm("v10");
    register uint32_t b_frag_3 asm("v11");
    register uint32_t b_frag_4 asm("v12");
    register uint32_t b_frag_5 asm("v13");
    register uint32_t b_frag_6 asm("v14");
    register uint32_t b_frag_7 asm("v15");

    // 手动声明 c_frag (v16-v23)// half16 c_frag = {};
    register float c_frag_0 asm("v16");
    register float c_frag_1 asm("v17");
    register float c_frag_2 asm("v18");
    register float c_frag_3 asm("v19");
    register float c_frag_4 asm("v20");
    register float c_frag_5 asm("v21");
    register float c_frag_6 asm("v22");
    register float c_frag_7 asm("v23");

    // 初始化 c_frag 为 0
    c_frag_0 = c_frag_1 = c_frag_2 = c_frag_3 = 0;
    c_frag_4 = c_frag_5 = c_frag_6 = c_frag_7 = 0;

    // lane is (0-31) mod 16 instead of 0-31 due to matrix replication in RDNA 3
    const int lane = lIdx % 16;
    

    {
        //row major
        // for (int ele = 0; ele < 16; ++ele)
        // {
        //     b_frag[ele] = b[16*ele + lane];
        // }
        // 将16个fp16数据打包到8个VGPR
        for (int ele = 0; ele < 8; ++ele)
        {
            // 每个VGPR存2个fp16，低16位和高16位
            uint32_t packed = 0;
            // 低16位
            reinterpret_cast<__half*>(&packed)[0] = b[16 * (ele * 2 + 0) + lane];
            // 高16位
            reinterpret_cast<__half*>(&packed)[1] = b[16 * (ele * 2 + 1) + lane];
            // 存到VGPR
            (&b_frag_0)[ele] = packed;
        }

    }

    {
        // for (int ele = 0; ele < 16; ++ele)
        // {
        //     a_frag[ele] = a[16 * lane + ele];
        // }
        for (int ele = 0; ele < 8; ++ele)
        {
            uint32_t packed = 0;
            // 低16位
            reinterpret_cast<__half*>(&packed)[0] = a[16 * lane + (ele * 2 + 0)];
            // 高16位
            reinterpret_cast<__half*>(&packed)[1] = a[16 * lane + (ele * 2 + 1)];
            // 存到VGPR
            (&a_frag_0)[ele] = packed;
        }

    }

    // call the WMMA intrinsic with OPSEL set to "false"
    //__builtin_amdgcn_wmma_f32_16x16x16_f16_w32 compiler auto register handle
    asm volatile(
        "v_wmma_f32_16x16x16_f16 v[16:23], v[0:7], v[8:15], v[16:23]"
        : // 输出：c_frag 寄存器 (v16-v23)
        "+v"(c_frag_0), "+v"(c_frag_1), "+v"(c_frag_2), "+v"(c_frag_3),
        "+v"(c_frag_4), "+v"(c_frag_5), "+v"(c_frag_6), "+v"(c_frag_7)
        : // 输入：a_frag, b_frag, c_frag (用于累加)
        "v"(a_frag_0), "v"(a_frag_1), "v"(a_frag_2), "v"(a_frag_3),
        "v"(a_frag_4), "v"(a_frag_5), "v"(a_frag_6), "v"(a_frag_7),
        "v"(b_frag_0), "v"(b_frag_1), "v"(b_frag_2), "v"(b_frag_3),
        "v"(b_frag_4), "v"(b_frag_5), "v"(b_frag_6), "v"(b_frag_7)
        : "memory"
    );

    for (int ele = 0; ele < 8; ++ele)
    {
        //const int r = ele * 2 + (lIdx / 16);
    
        float t= (&c_frag_0)[ele];
        if(lane==0){
            c[ele] =t;
        }
        
    }


}

int main(int argc, char* argv[])

{
    __half a[16 * 16] = {};
    __half b[16 * 16] = {};
    __half c[16 * 16] = {};
    __half *a_gpu, *b_gpu, *c_gpu;
    hipMalloc(&a_gpu, 16*16 * sizeof(__half));
    hipMalloc(&b_gpu, 16*16 * sizeof(__half));
    hipMalloc(&c_gpu, 16*16 * sizeof(__half));

    // fill in some data into matrices A and B
    for (int i = 0; i < 16; ++i)
    {
        for (int j = 0; j < 16; ++j)
        {
            a[i * 16 + j] = (__half)1.f;
            b[i * 16 + j] = (__half)1.f;
        }
    }

    hipMemcpy(a_gpu, a, (16*16) * sizeof(__half), hipMemcpyHostToDevice);
    hipMemcpy(b_gpu, b, (16*16) * sizeof(__half), hipMemcpyHostToDevice);
    hipMemcpy(c_gpu, c, (16*16) * sizeof(__half), hipMemcpyHostToDevice);

    wmma_matmul<<<dim3(1), dim3(32, 1, 1), 0, 0>>>(a_gpu, b_gpu, c_gpu);

    hipMemcpy(c, c_gpu, (16 * 16) * sizeof(__half), hipMemcpyDeviceToHost);

    hipFree(a_gpu);
    hipFree(b_gpu);
    hipFree(c_gpu);

    for (int i = 0; i < 16; ++i)
    {
        for (int j = 0; j < 16; ++j)
        {
            printf("%f ", (float)c[i * 16 + j]);
        }
        printf("\n");
    }

    return 0;
}