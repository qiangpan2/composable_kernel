DEPS_PREFIX="/opt/rocm"
cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DGPU_ARCHS="gfx1100;gfx1201" \
    -DCK_TILE_USE_WMMA=ON \
    -DCMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_C_COMPILER=/opt/rocm/llvm/bin/clang \
    -DCMAKE_CXX_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX} \
    -G Ninja > config.log 2>&1
cmake --build build -j 120 > build.log 2>&1
cmake --install build

#DGPU_TARGETS="gfx1100;gfx1201"
ninja tile_example_grouped_conv_fwd
./bin/tile_example_grouped_conv_fwd -n=1 -c=16 -d=5 -h=104 -w=60 -k=16 -z=1 -y=1 -x=1 -stride_d=1 -stride_h=1 -stride_w=1 -dilation_d=1 -dilation_h=1 -dilation_w=1 -lpad_d=0 -lpad_h=0 -lpad_w=0 -rpad_d=0 -rpad_h=0 -rpad_w=0 -g=1 -in_layout=NDHWGC -wei_layout=GKZYXC -out_layout=NDHWGK -prec=fp16 -v=1
