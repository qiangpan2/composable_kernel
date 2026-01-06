#!/bin/bash
# Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
# SPDX-License-Identifier: MIT
#
# Smoke test for FMHA FWD v3 WMMA path on gfx1100/gfx1201.
# Tests v3 dispatch: hdim=128, no bias/lse/dropout/qscale, mask=no/causal

set -euo pipefail

EXE="$(find . -name tile_example_fmha_fwd -type f | head -n 1)"
[ -z "$EXE" ] && { echo "ERROR: tile_example_fmha_fwd not found"; exit 1; }

export CK_WARMUP=0
export CK_REPEAT=1
COMMON='-v=1 -warmup=0 -repeat=1 -kname=1'

echo "FMHA FWD v3 WMMA Smoke Test (gfx1100/gfx1201)"
echo "=============================================="

for prec in fp16 bf16; do
for mode in 0 1; do
for mask in 0 1; do

$EXE -prec=$prec -mode=$mode -b=2 -h=4 -d=128 -s=256 -mask=$mask \
    -bias=n -lse=0 -p_drop=0.0 -vlayout=r -iperm=0 -operm=0 $COMMON

$EXE -prec=$prec -mode=$mode -b=2 -h=8 -h_k=2 -d=128 -s=512 -mask=$mask \
    -bias=n -lse=0 -p_drop=0.0 -vlayout=r -iperm=0 -operm=0 $COMMON

$EXE -prec=$prec -mode=$mode -b=1 -h=16 -d=128 -s=1024 -mask=$mask \
    -bias=n -lse=0 -p_drop=0.0 -vlayout=r -iperm=0 -operm=0 $COMMON

done
done
done

echo "All tests completed."

