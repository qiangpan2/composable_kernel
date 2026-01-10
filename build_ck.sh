DEPS_PREFIX="${HOME}/ck-deps"
cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DGPU_TARGETS="gfx1100;gfx1201" \
    -DCK_TILE_USE_WMMA=ON \
    -DCMAKE_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_C_COMPILER=/opt/rocm/llvm/bin/clang \
    -DCMAKE_CXX_COMPILER=/opt/rocm/llvm/bin/clang++ \
    -DCMAKE_INSTALL_PREFIX=${DEPS_PREFIX} \
    -G Ninja > config.log 2>&1
cmake --build build -j 120 > build.log 2>&1

ninja tile_example_fmha_fwd 2>&1 | tee failure.log

tile_example_fmha_fwd -b=4 -h=8 -s=1024 -d=64 -prec=fp16 -v=1 -repeat=10
tile_example_fmha_fwd -b=4 -h=8 -s=1024 -d=128 -prec=fp16 -v=1 -repeat=10
tile_example_fmha_fwd -b=4 -h=8 -s=1024 -d=256 -prec=fp16 -v=1 -repeat=10

cmake --install build