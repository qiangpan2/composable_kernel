# for isystem in miopen  https://rocm.docs.amd.com/en/latest/reference/gpu-arch-specs.html
cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DGPU_ARCHS="gfx1100" \
    -DCK_TILE_USE_WMMA=ON \
    -DCMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_C_COMPILER=/opt/rocm/llvm/bin/clang \
    -DCMAKE_CXX_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_CXX_FLAGS="-Wno-gnu-line-marker" \
    -DCMAKE_C_FLAGS="-Wno-gnu-line-marker" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -G Ninja > build.log 2>&1
#DEPS_PREFIX="${HOME}/miopen-deps"
# cmake -B build \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DGPU_TARGETS="gfx1100" \
#     -DCK_TILE_USE_WMMA=ON \
#     -DCMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
#     -DCMAKE_C_COMPILER=/opt/rocm/llvm/bin/clang \
#     -DCMAKE_CXX_COMPILER=/opt/rocm/llvm/bin/clang++ \
#     -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX} \
#     -G Ninja > build.log 2>&1
cmake --build build --target install -j128

ninja tile_example_grouped_conv_fwd

echo "Running grouped convolution forward example..."
./bin/tile_example_grouped_conv_fwd -n=1 -c=16 -d=5 -h=104 -w=60 -k=16 -z=1 -y=1 -x=1 -stride_d=1 -stride_h=1 -stride_w=1 -dilation_d=1 -dilation_h=1 -dilation_w=1 -lpad_d=0 -lpad_h=0 -lpad_w=0 -rpad_d=0 -rpad_h=0 -rpad_w=0 -g=1 -in_layout=NDHWGC -wei_layout=GKZYXC -out_layout=NDHWGK -prec=fp16 -v=1


#2D conv case for test
echo "Running new grouped convolution example (N=1, H=256, W=512, C=3, 5x5 kernel)..."
./bin/tile_example_grouped_conv_fwd -n=1 -c=3 -d=1 -h=256 -w=512 -k=16 -z=1 -y=5 -x=5 -stride_d=1 -stride_h=1 -stride_w=1 -dilation_d=1 -dilation_h=1 -dilation_w=1 -lpad_d=0 -lpad_h=2 -lpad_w=2 -rpad_d=0 -rpad_h=2 -rpad_w=2 -g=1 -in_layout=NDHWGC -wei_layout=GKZYXC -out_layout=NDHWGK -prec=fp16 -v=1


