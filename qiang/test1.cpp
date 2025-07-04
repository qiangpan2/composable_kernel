#include <iostream>
#include <hip/hip_runtime.h>

__global__ void hello_world() {
    printf("Hello, world from GPU!\n");
}

int main() {
    hello_world<<<1, 1>>>();
    hipDeviceSynchronize();
    std::cout << "Hello, world from CPU!\n";
    return 0;
}