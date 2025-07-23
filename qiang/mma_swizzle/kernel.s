	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx1101"
	.weak	__cxa_pure_virtual              ; -- Begin function __cxa_pure_virtual
	.p2align	2
	.type	__cxa_pure_virtual,@function
__cxa_pure_virtual:                     ; @__cxa_pure_virtual
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_trap 2
	s_sendmsg_rtn_b32 s0, sendmsg(MSG_RTN_GET_DOORBELL)
	s_mov_b32 ttmp2, m0
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0x3ff
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_bitset1_b32 s0, 10
	s_mov_b32 m0, s0
	s_sendmsg sendmsg(MSG_INTERRUPT)
	s_mov_b32 m0, ttmp2
.LBB0_1:                                ; =>This Inner Loop Header: Depth=1
	s_sethalt 5
	s_branch .LBB0_1
.Lfunc_end0:
	.size	__cxa_pure_virtual, .Lfunc_end0-__cxa_pure_virtual
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 56
; NumSgprs: 1
; NumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.weak	__cxa_deleted_virtual           ; -- Begin function __cxa_deleted_virtual
	.p2align	2
	.type	__cxa_deleted_virtual,@function
__cxa_deleted_virtual:                  ; @__cxa_deleted_virtual
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_trap 2
	s_sendmsg_rtn_b32 s0, sendmsg(MSG_RTN_GET_DOORBELL)
	s_mov_b32 ttmp2, m0
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0x3ff
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_bitset1_b32 s0, 10
	s_mov_b32 m0, s0
	s_sendmsg sendmsg(MSG_INTERRUPT)
	s_mov_b32 m0, ttmp2
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	s_sethalt 5
	s_branch .LBB1_1
.Lfunc_end1:
	.size	__cxa_deleted_virtual, .Lfunc_end1-__cxa_deleted_virtual
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 56
; NumSgprs: 1
; NumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_hsa_signal_add
	.type	__ockl_hsa_signal_add,@function
__ockl_hsa_signal_add:                  ; @__ockl_hsa_signal_add
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_cmp_lt_i32_e32 vcc_lo, 3, v4
	s_mov_b32 s0, 0
	s_mov_b32 s1, 0
	s_xor_b32 s2, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB2_8
; %bb.1:                                ; %NodeBlock12
	v_cmp_lt_i32_e32 vcc_lo, 4, v4
	s_mov_b32 s3, 0
	s_xor_b32 s1, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB2_5
; %bb.2:                                ; %LeafBlock10
	v_cmp_eq_u32_e32 vcc_lo, 5, v4
	s_mov_b32 s3, exec_lo
	s_mov_b32 s4, -1
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB2_4
; %bb.3:
	s_waitcnt_vscnt null, 0x0
	global_atomic_add_u64 v[0:1], v[2:3], off offset:8
	s_waitcnt_vscnt null, 0x0
	buffer_gl1_inv
	buffer_gl0_inv
	s_xor_b32 s4, exec_lo, -1
	s_or_b32 exec_lo, exec_lo, s3
.LBB2_4:                                ; %Flow17
	s_delay_alu instid0(SALU_CYCLE_1)
	s_and_b32 s3, s4, exec_lo
	s_or_b32 exec_lo, exec_lo, s1
.LBB2_5:                                ; %Flow16
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s4, s1, exec_lo
	s_cmp_lg_u32 s1, 0
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB2_7
; %bb.6:
	s_waitcnt_vscnt null, 0x0
	global_atomic_add_u64 v[0:1], v[2:3], off offset:8
	s_waitcnt_vscnt null, 0x0
	buffer_gl1_inv
	buffer_gl0_inv
	s_or_b32 exec_lo, exec_lo, s4
.LBB2_7:                                ; %Flow18
	s_delay_alu instid0(SALU_CYCLE_1)
	s_and_b32 s1, s3, exec_lo
                                        ; implicit-def: $vgpr4
	s_or_b32 exec_lo, exec_lo, s2
.LBB2_8:                                ; %Flow
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s3, s2, exec_lo
	s_cmp_lg_u32 s2, 0
	s_cmov_b32 exec_lo, s2
	s_cbranch_scc0 .LBB2_14
; %bb.9:                                ; %NodeBlock
	v_cmp_lt_i32_e32 vcc_lo, 2, v4
	s_xor_b32 s2, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB2_11
; %bb.10:
	s_waitcnt_vscnt null, 0x0
	global_atomic_add_u64 v[0:1], v[2:3], off offset:8
                                        ; implicit-def: $vgpr4
	s_or_b32 exec_lo, exec_lo, s2
.LBB2_11:                               ; %Flow20
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s5, s2, exec_lo
	s_mov_b32 s4, s1
	s_cmp_lg_u32 s2, 0
	s_cmov_b32 exec_lo, s2
	s_cbranch_scc0 .LBB2_13
; %bb.12:                               ; %LeafBlock
	v_cmp_gt_i32_e32 vcc_lo, 1, v4
	s_and_not1_b32 s2, s1, exec_lo
	s_mov_b32 s0, exec_lo
	s_and_b32 s4, vcc_lo, exec_lo
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 s4, s2, s4
	s_or_b32 exec_lo, exec_lo, s5
.LBB2_13:                               ; %Flow21
	s_delay_alu instid0(SALU_CYCLE_1)
	s_and_not1_b32 s1, s1, exec_lo
	s_and_b32 s2, s4, exec_lo
	s_and_b32 s0, s0, exec_lo
	s_or_b32 s1, s1, s2
	s_or_b32 exec_lo, exec_lo, s3
.LBB2_14:                               ; %Flow19
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_b32 s2, s1, exec_lo
	s_xor_b32 s1, s2, exec_lo
	s_cmp_lg_u32 s2, 0
	s_cmov_b32 exec_lo, s2
	s_cbranch_scc0 .LBB2_16
; %bb.15:
	global_atomic_add_u64 v[0:1], v[2:3], off offset:8
	s_and_not1_b32 s0, s0, exec_lo
	s_or_b32 exec_lo, exec_lo, s1
.LBB2_16:                               ; %Flow22
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)
	s_mov_b32 s1, exec_lo
	s_and_b32 s0, s0, exec_lo
	s_cmov_b32 exec_lo, s0
	s_cbranch_scc0 .LBB2_18
; %bb.17:
	global_atomic_add_u64 v[0:1], v[2:3], off offset:8
	s_waitcnt_vscnt null, 0x0
	buffer_gl1_inv
	buffer_gl0_inv
	s_or_b32 exec_lo, exec_lo, s1
.LBB2_18:
	global_load_b64 v[2:3], v[0:1], off offset:16
	s_mov_b32 s0, exec_lo
	s_waitcnt vmcnt(0)
	v_cmp_ne_u64_e32 vcc_lo, 0, v[2:3]
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB2_20
; %bb.19:
	global_load_b32 v0, v[0:1], off offset:24
	v_mov_b32_e32 v1, 0
	s_waitcnt vmcnt(0)
	v_readfirstlane_b32 s1, v0
	s_waitcnt_vscnt null, 0x0
	global_store_b64 v[2:3], v[0:1], off
	s_and_b32 m0, s1, 0xff
	s_sendmsg sendmsg(MSG_INTERRUPT)
	s_or_b32 exec_lo, exec_lo, s0
.LBB2_20:                               ; %UnifiedReturnBlock
	s_waitcnt lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end2:
	.size	__ockl_hsa_signal_add, .Lfunc_end2-__ockl_hsa_signal_add
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 512
; NumSgprs: 34
; NumVgprs: 5
; ScratchSize: 0
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_hostcall_internal
	.type	__ockl_hostcall_internal,@function
__ockl_hostcall_internal:               ; @__ockl_hostcall_internal
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s10, s33
	s_mov_b32 s33, s32
	s_xor_saveexec_b32 s0, -1
	scratch_store_b32 off, v33, s33         ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	v_writelane_b32 v33, s30, 0
	s_add_i32 s32, s32, 16
	v_writelane_b32 v33, s31, 1
	v_mov_b32_e32 v23, v0
	v_mbcnt_lo_u32_b32 v0, -1, 0
	v_dual_mov_b32 v21, v2 :: v_dual_mov_b32 v24, v1
	v_mov_b32_e32 v1, 0
	v_mov_b32_e32 v2, 0
	s_delay_alu instid0(VALU_DEP_4) | instskip(SKIP_1) | instid1(VALU_DEP_1)
	v_mbcnt_hi_u32_b32 v0, -1, v0
	;;#ASMSTART
	;;#ASMEND
	v_readfirstlane_b32 s1, v0
	s_mov_b32 s0, exec_lo
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_cmp_eq_u32_e64 s6, s1, v0
	s_cmp_lg_u32 s6, 0
	s_cmov_b32 exec_lo, s6
	s_cbranch_scc0 .LBB3_6
; %bb.1:
	global_load_b64 v[27:28], v[23:24], off offset:24 glc
	s_waitcnt vmcnt(0)
	buffer_gl1_inv
	buffer_gl0_inv
	s_clause 0x1
	global_load_b64 v[1:2], v[23:24], off offset:40
	global_load_b64 v[19:20], v[23:24], off
	s_mov_b32 s1, exec_lo
	s_waitcnt vmcnt(1)
	v_and_b32_e32 v1, v1, v27
	v_and_b32_e32 v2, v2, v28
	s_waitcnt vmcnt(0)
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mad_u64_u32 v[25:26], null, v1, 24, v[19:20]
	v_mov_b32_e32 v1, v26
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mad_u64_u32 v[19:20], null, v2, 24, v[1:2]
	v_mov_b32_e32 v26, v19
	global_load_b64 v[25:26], v[25:26], off glc
	s_waitcnt vmcnt(0)
	global_atomic_cmpswap_b64 v[1:2], v[23:24], v[25:28], off offset:24 glc
	s_waitcnt vmcnt(0)
	buffer_gl1_inv
	buffer_gl0_inv
	v_cmp_ne_u64_e32 vcc_lo, v[1:2], v[27:28]
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB3_5
; %bb.2:                                ; %.preheader3
	s_mov_b32 s2, 0
	.p2align	6
.LBB3_3:                                ; =>This Inner Loop Header: Depth=1
	s_sleep 1
	s_clause 0x1
	global_load_b64 v[19:20], v[23:24], off offset:40
	global_load_b64 v[25:26], v[23:24], off
	v_dual_mov_b32 v28, v2 :: v_dual_mov_b32 v27, v1
	s_waitcnt vmcnt(1)
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)
	v_and_b32_e32 v19, v19, v27
	v_and_b32_e32 v22, v20, v28
	s_waitcnt vmcnt(0)
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mad_u64_u32 v[1:2], null, v19, 24, v[25:26]
	v_mad_u64_u32 v[19:20], null, v22, 24, v[2:3]
	s_delay_alu instid0(VALU_DEP_1)
	v_mov_b32_e32 v2, v19
	global_load_b64 v[25:26], v[1:2], off glc
	s_waitcnt vmcnt(0)
	global_atomic_cmpswap_b64 v[1:2], v[23:24], v[25:28], off offset:24 glc
	s_waitcnt vmcnt(0)
	buffer_gl1_inv
	buffer_gl0_inv
	v_cmp_eq_u64_e32 vcc_lo, v[1:2], v[27:28]
	s_or_b32 s2, vcc_lo, s2
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_not1_b32 s3, exec_lo, s2
	s_cselect_b32 exec_lo, s3, s2
	s_cbranch_scc1 .LBB3_3
; %bb.4:                                ; %Flow18
	s_or_b32 exec_lo, exec_lo, s1
.LBB3_5:                                ; %Flow20
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s0
.LBB3_6:
	s_clause 0x1
	global_load_b64 v[19:20], v[23:24], off offset:40
	global_load_b128 v[25:28], v[23:24], off
	v_readfirstlane_b32 s7, v2
	v_readfirstlane_b32 s8, v1
	s_mov_b64 s[0:1], exec
	s_mov_b32 s2, exec_lo
	s_and_b32 s3, s6, exec_lo
	s_waitcnt vmcnt(1)
	v_and_b32_e32 v30, s7, v20
	v_and_b32_e32 v29, s8, v19
	s_cmov_b32 exec_lo, s3
	s_cbranch_scc0 .LBB3_8
; %bb.7:
	s_waitcnt vmcnt(0)
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_3)
	v_mad_u64_u32 v[1:2], null, v29, 24, v[25:26]
	v_dual_mov_b32 v20, s1 :: v_dual_mov_b32 v19, s0
	v_mov_b32_e32 v22, 1
	v_mad_u64_u32 v[31:32], null, v30, 24, v[2:3]
	s_delay_alu instid0(VALU_DEP_1)
	v_mov_b32_e32 v2, v31
	global_store_b128 v[1:2], v[19:22], off offset:8
	s_or_b32 exec_lo, exec_lo, s2
.LBB3_8:
	v_mov_b32_e32 v1, 0
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_2) | instid1(VALU_DEP_2)
	v_lshlrev_b64 v[19:20], 12, v[29:30]
	s_mov_b32 s9, exec_lo
	s_and_b32 s0, s6, exec_lo
	v_lshlrev_b64 v[0:1], 6, v[0:1]
	s_waitcnt vmcnt(0)
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_1) | instid1(VALU_DEP_2)
	v_add_co_u32 v2, vcc_lo, v27, v19
	v_add_co_ci_u32_e32 v20, vcc_lo, v28, v20, vcc_lo
	v_add_co_u32 v19, vcc_lo, v2, v0
	s_delay_alu instid0(VALU_DEP_2)
	v_add_co_ci_u32_e32 v20, vcc_lo, v20, v1, vcc_lo
	s_clause 0x3
	global_store_b128 v[19:20], v[3:6], off
	global_store_b128 v[19:20], v[7:10], off offset:16
	global_store_b128 v[19:20], v[11:14], off offset:32
	global_store_b128 v[19:20], v[15:18], off offset:48
	s_cmov_b32 exec_lo, s0
	s_cbranch_scc0 .LBB3_14
; %bb.9:
	s_clause 0x1
	global_load_b64 v[8:9], v[23:24], off offset:32 glc
	global_load_b64 v[0:1], v[23:24], off offset:40
	v_dual_mov_b32 v6, s8 :: v_dual_mov_b32 v7, s7
	s_mov_b32 s0, exec_lo
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v0, s8, v0
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mad_u64_u32 v[4:5], null, v0, 24, v[25:26]
	v_dual_mov_b32 v0, v5 :: v_dual_and_b32 v3, s7, v1
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mad_u64_u32 v[1:2], null, v3, 24, v[0:1]
	v_mov_b32_e32 v5, v1
	global_store_b64 v[4:5], v[8:9], off
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_b64 v[2:3], v[23:24], v[6:9], off offset:32 glc
	s_waitcnt vmcnt(0)
	v_cmp_ne_u64_e32 vcc_lo, v[2:3], v[8:9]
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB3_13
; %bb.10:                               ; %.preheader1
	s_mov_b32 s1, 0
.LBB3_11:                               ; =>This Inner Loop Header: Depth=1
	v_dual_mov_b32 v0, s8 :: v_dual_mov_b32 v1, s7
	s_sleep 1
	global_store_b64 v[4:5], v[2:3], off
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_b64 v[0:1], v[23:24], v[0:3], off offset:32 glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e32 vcc_lo, v[0:1], v[2:3]
	v_dual_mov_b32 v3, v1 :: v_dual_mov_b32 v2, v0
	s_or_b32 s1, vcc_lo, s1
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_not1_b32 s2, exec_lo, s1
	s_cselect_b32 exec_lo, s2, s1
	s_cbranch_scc1 .LBB3_11
; %bb.12:                               ; %Flow14
	s_or_b32 exec_lo, exec_lo, s0
.LBB3_13:
	global_load_b64 v[0:1], v[23:24], off offset:16
	v_dual_mov_b32 v2, 1 :: v_dual_mov_b32 v3, 0
	v_mov_b32_e32 v4, 3
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_hsa_signal_add@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_hsa_signal_add@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1)
	s_swappc_b64 s[30:31], s[0:1]
	s_or_b32 exec_lo, exec_lo, s9
.LBB3_14:
	v_mad_u64_u32 v[0:1], null, v29, 24, v[25:26]
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)
	v_mad_u64_u32 v[2:3], null, v30, 24, v[1:2]
	v_add_co_u32 v0, vcc_lo, v0, 20
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mov_b32_e32 v1, v2
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo
	s_branch .LBB3_18
	.p2align	6
.LBB3_15:                               ;   in Loop: Header=BB3_18 Depth=1
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_readfirstlane_b32 s0, v2
	s_cmp_eq_u32 s0, 0
	s_cbranch_scc1 .LBB3_17
; %bb.16:                               ;   in Loop: Header=BB3_18 Depth=1
	s_sleep 1
	s_cbranch_execnz .LBB3_18
	s_branch .LBB3_20
	.p2align	6
.LBB3_17:
	s_branch .LBB3_20
.LBB3_18:                               ; =>This Inner Loop Header: Depth=1
	v_mov_b32_e32 v2, 1
	s_mov_b32 s0, exec_lo
	s_and_b32 s1, s6, exec_lo
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB3_15
; %bb.19:                               ;   in Loop: Header=BB3_18 Depth=1
	global_load_b32 v2, v[0:1], off glc
	s_waitcnt vmcnt(0)
	buffer_gl1_inv
	buffer_gl0_inv
	v_and_b32_e32 v2, 1, v2
	s_or_b32 exec_lo, exec_lo, s0
	s_branch .LBB3_15
.LBB3_20:
	global_load_b128 v[0:3], v[19:20], off
	s_mov_b32 s0, exec_lo
	s_and_b32 s1, s6, exec_lo
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB3_25
; %bb.21:
	s_clause 0x2
	global_load_b64 v[4:5], v[23:24], off offset:40
	global_load_b64 v[10:11], v[23:24], off offset:24 glc
	global_load_b64 v[6:7], v[23:24], off
	s_waitcnt vmcnt(2)
	v_add_co_u32 v12, vcc_lo, v4, 1
	v_add_co_ci_u32_e32 v13, vcc_lo, 0, v5, vcc_lo
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)
	v_add_co_u32 v8, vcc_lo, v12, s8
	v_add_co_ci_u32_e32 v9, vcc_lo, s7, v13, vcc_lo
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_1)
	v_cmp_eq_u64_e32 vcc_lo, 0, v[8:9]
	v_dual_cndmask_b32 v9, v9, v13 :: v_dual_cndmask_b32 v8, v8, v12
	v_and_b32_e32 v4, v8, v4
	s_waitcnt vmcnt(0)
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_3)
	v_mad_u64_u32 v[12:13], null, v4, 24, v[6:7]
	v_and_b32_e32 v7, v9, v5
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_mov_b32_e32 v4, v13
	v_mad_u64_u32 v[5:6], null, v7, 24, v[4:5]
	s_delay_alu instid0(VALU_DEP_1)
	v_mov_b32_e32 v13, v5
	global_store_b64 v[12:13], v[10:11], off
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_b64 v[6:7], v[23:24], v[8:11], off offset:24 glc
	s_waitcnt vmcnt(0)
	v_cmp_ne_u64_e32 vcc_lo, v[6:7], v[10:11]
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB3_24
; %bb.22:                               ; %.preheader
	v_dual_mov_b32 v5, v9 :: v_dual_mov_b32 v4, v8
	s_mov_b32 s1, 0
.LBB3_23:                               ; =>This Inner Loop Header: Depth=1
	s_sleep 1
	global_store_b64 v[12:13], v[6:7], off
	s_waitcnt_vscnt null, 0x0
	global_atomic_cmpswap_b64 v[8:9], v[23:24], v[4:7], off offset:24 glc
	s_waitcnt vmcnt(0)
	v_cmp_eq_u64_e32 vcc_lo, v[8:9], v[6:7]
	v_dual_mov_b32 v6, v8 :: v_dual_mov_b32 v7, v9
	s_or_b32 s1, vcc_lo, s1
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_not1_b32 s2, exec_lo, s1
	s_cselect_b32 exec_lo, s2, s1
	s_cbranch_scc1 .LBB3_23
.LBB3_24:                               ; %Flow11
	s_or_b32 exec_lo, exec_lo, s0
.LBB3_25:
	v_readlane_b32 s30, v33, 0
	v_readlane_b32 s31, v33, 1
	s_xor_saveexec_b32 s0, -1
	scratch_load_b32 v33, off, s33          ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_add_i32 s32, s32, -16
	s_mov_b32 s33, s10
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end3:
	.size	__ockl_hostcall_internal, .Lfunc_end3-__ockl_hostcall_internal
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 1364
; NumSgprs: 36
; NumVgprs: 34
; ScratchSize: 16
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_hostcall_preview
	.type	__ockl_hostcall_preview,@function
__ockl_hostcall_preview:                ; @__ockl_hostcall_preview
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_xor_saveexec_b32 s0, -1
	scratch_store_b32 off, v34, s32         ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	v_writelane_b32 v34, s33, 0
	v_writelane_b32 v34, s30, 1
	v_writelane_b32 v34, s31, 2
	s_load_b64 s[0:1], s[8:9], 0x50
	s_delay_alu instid0(VALU_DEP_1)
	v_readlane_b32 s30, v34, 1
	v_dual_mov_b32 v18, v16 :: v_dual_mov_b32 v17, v15
	v_dual_mov_b32 v16, v14 :: v_dual_mov_b32 v15, v13
	v_dual_mov_b32 v14, v12 :: v_dual_mov_b32 v13, v11
	v_dual_mov_b32 v12, v10 :: v_dual_mov_b32 v11, v9
	v_dual_mov_b32 v10, v8 :: v_dual_mov_b32 v9, v7
	v_dual_mov_b32 v8, v6 :: v_dual_mov_b32 v7, v5
	v_dual_mov_b32 v6, v4 :: v_dual_mov_b32 v5, v3
	v_dual_mov_b32 v4, v2 :: v_dual_mov_b32 v3, v1
	s_getpc_b64 s[2:3]
	s_add_u32 s2, s2, __ockl_hostcall_internal@rel32@lo+4
	s_addc_u32 s3, s3, __ockl_hostcall_internal@rel32@hi+12
	s_waitcnt lgkmcnt(0)
	v_dual_mov_b32 v2, v0 :: v_dual_mov_b32 v1, s1
	v_mov_b32_e32 v0, s0
	v_readlane_b32 s31, v34, 2
	v_readlane_b32 s33, v34, 0
	s_xor_saveexec_b32 s0, -1
	scratch_load_b32 v34, off, s32          ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_setpc_b64 s[2:3]
.Lfunc_end4:
	.size	__ockl_hostcall_preview, .Lfunc_end4-__ockl_hostcall_preview
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 200
; NumSgprs: 36
; NumVgprs: 35
; ScratchSize: 24
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_fprintf_stderr_begin
	.type	__ockl_fprintf_stderr_begin,@function
__ockl_fprintf_stderr_begin:            ; @__ockl_fprintf_stderr_begin
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s11, s33
	s_mov_b32 s33, s32
	s_xor_saveexec_b32 s0, -1
	scratch_store_b32 off, v35, s33         ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	v_writelane_b32 v35, s30, 0
	s_add_i32 s32, s32, 16
	v_writelane_b32 v35, s31, 1
	v_dual_mov_b32 v0, 2 :: v_dual_mov_b32 v1, 33
	v_dual_mov_b32 v2, 0 :: v_dual_mov_b32 v3, 1
	v_dual_mov_b32 v4, 0 :: v_dual_mov_b32 v5, 0
	v_dual_mov_b32 v6, 0 :: v_dual_mov_b32 v7, 0
	v_dual_mov_b32 v8, 0 :: v_dual_mov_b32 v9, 0
	v_dual_mov_b32 v10, 0 :: v_dual_mov_b32 v11, 0
	v_dual_mov_b32 v12, 0 :: v_dual_mov_b32 v13, 0
	v_dual_mov_b32 v14, 0 :: v_dual_mov_b32 v15, 0
	v_mov_b32_e32 v16, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_hostcall_preview@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_hostcall_preview@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1)
	s_swappc_b64 s[30:31], s[0:1]
	v_readlane_b32 s30, v35, 0
	v_readlane_b32 s31, v35, 1
	s_xor_saveexec_b32 s0, -1
	scratch_load_b32 v35, off, s33          ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_add_i32 s32, s32, -16
	s_mov_b32 s33, s11
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end5:
	.size	__ockl_fprintf_stderr_begin, .Lfunc_end5-__ockl_fprintf_stderr_begin
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 192
; NumSgprs: 36
; NumVgprs: 36
; ScratchSize: 40
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_fprintf_append_string_n
	.type	__ockl_fprintf_append_string_n,@function
__ockl_fprintf_append_string_n:         ; @__ockl_fprintf_append_string_n
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s16, s33
	s_mov_b32 s33, s32
	s_or_saveexec_b32 s0, -1
	scratch_store_b32 off, v40, s33         ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	v_writelane_b32 v40, s30, 0
	s_add_i32 s32, s32, 16
	v_writelane_b32 v40, s31, 1
	v_dual_mov_b32 v36, v3 :: v_dual_mov_b32 v35, v2
	v_or_b32_e32 v2, 2, v0
	v_cmp_eq_u32_e64 s0, 0, v6
	v_dual_mov_b32 v38, v5 :: v_dual_mov_b32 v37, v4
	s_delay_alu instid0(VALU_DEP_4)
	v_cmp_ne_u64_e32 vcc_lo, 0, v[35:36]
	s_mov_b64 s[12:13], s[8:9]
	s_mov_b32 s14, 0
	v_cndmask_b32_e64 v2, v2, v0, s0
                                        ; implicit-def: $vgpr0_vgpr1_vgpr2_vgpr3
	s_xor_b32 s11, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_60
; %bb.1:
	v_and_b32_e32 v39, 2, v2
	v_and_b32_e32 v0, -3, v2
	s_mov_b32 s15, 0
	s_branch .LBB6_3
.LBB6_2:                                ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_lt_u64_e32 vcc_lo, 56, v[37:38]
	v_or_b32_e32 v2, 0, v1
	v_lshl_add_u32 v17, v48, 2, 28
	v_or_b32_e32 v18, v0, v39
	s_mov_b64 s[8:9], s[12:13]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_hostcall_preview@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_hostcall_preview@rel32@hi+12
	v_cndmask_b32_e32 v2, v2, v1, vcc_lo
	v_dual_cndmask_b32 v0, v18, v0 :: v_dual_and_b32 v1, 0x1e0, v17
	s_delay_alu instid0(VALU_DEP_1)
	v_and_or_b32 v1, 0xffffff1f, v0, v1
	v_mov_b32_e32 v0, 2
	s_swappc_b64 s[30:31], s[0:1]
	v_sub_co_u32 v37, vcc_lo, v37, v48
	v_sub_co_ci_u32_e32 v38, vcc_lo, v38, v49, vcc_lo
	v_add_co_u32 v35, s0, v35, v48
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_3)
	v_add_co_ci_u32_e64 v36, s0, v36, v49, s0
	v_cmp_eq_u64_e32 vcc_lo, 0, v[37:38]
	s_or_b32 s15, vcc_lo, s15
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_not1_b32 s0, exec_lo, s15
	s_cselect_b32 exec_lo, s0, s15
	s_cbranch_scc0 .LBB6_59
.LBB6_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_6 Depth 2
                                        ;     Child Loop BB6_14 Depth 2
                                        ;     Child Loop BB6_22 Depth 2
                                        ;     Child Loop BB6_30 Depth 2
                                        ;     Child Loop BB6_38 Depth 2
                                        ;     Child Loop BB6_46 Depth 2
                                        ;     Child Loop BB6_54 Depth 2
	v_cmp_gt_u64_e32 vcc_lo, 56, v[37:38]
                                        ; implicit-def: $vgpr3_vgpr4
                                        ; implicit-def: $sgpr0
	v_dual_cndmask_b32 v49, 0, v38 :: v_dual_cndmask_b32 v48, 56, v37
	s_delay_alu instid0(VALU_DEP_1)
	v_cmp_gt_u32_e32 vcc_lo, 8, v48
	s_xor_b32 s1, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_9
; %bb.4:                                ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v48
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v4, 0
	s_mov_b32 s4, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_8
; %bb.5:                                ; %.preheader11
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_lshlrev_b64 v[2:3], 3, v[48:49]
	v_mov_b32_e32 v3, 0
	v_dual_mov_b32 v4, 0 :: v_dual_mov_b32 v5, v35
	v_mov_b32_e32 v6, v36
	s_mov_b64 s[2:3], 0
	s_mov_b32 s5, 0
	.p2align	6
.LBB6_6:                                ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	flat_load_u8 v7, v[5:6]
	v_mov_b32_e32 v8, s14
	v_add_co_u32 v5, vcc_lo, v5, 1
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v6, vcc_lo
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v7, 0xffff, v7
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(VALU_DEP_2)
	v_lshlrev_b64 v[7:8], s2, v[7:8]
	s_add_u32 s2, s2, 8
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e64 s0, s2, v2
	v_or_b32_e32 v4, v8, v4
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)
	v_or_b32_e32 v3, v7, v3
	s_or_b32 s5, s0, s5
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_and_not1_b32 s0, exec_lo, s5
	s_cselect_b32 exec_lo, s0, s5
	s_cbranch_scc1 .LBB6_6
; %bb.7:                                ; %Flow86
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_8:                                ; %Flow87
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
	s_or_b32 exec_lo, exec_lo, s1
.LBB6_9:                                ; %Flow88
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_dual_mov_b32 v2, s0 :: v_dual_mov_b32 v17, v35
	v_mov_b32_e32 v18, v36
	s_xor_b32 s0, s1, exec_lo
	s_cmp_lg_u32 s1, 0
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB6_11
; %bb.10:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v2, v[35:36]
	flat_load_u8 v3, v[35:36] offset:1
	flat_load_u8 v4, v[35:36] offset:2
	flat_load_u8 v5, v[35:36] offset:3
	flat_load_u8 v6, v[35:36] offset:5
	flat_load_u8 v7, v[35:36] offset:4
	v_mov_b32_e32 v8, 0
	v_add_co_u32 v17, vcc_lo, v35, 8
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v36, vcc_lo
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_and_b32_e32 v2, 0xffff, v2
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v3, 8, v3
	s_clause 0x1
	flat_load_u8 v9, v[35:36] offset:7
	flat_load_d16_hi_u8 v8, v[35:36] offset:6
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v4, 16, v4
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v5, 24, v5
	v_or_b32_e32 v2, v3, v2
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v3, 8, v6
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_1) | instid1(VALU_DEP_2)
	v_or3_b32 v2, v2, v4, v5
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v3, 0, v7, v3
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_4) | instid1(VALU_DEP_1)
	v_or3_b32 v5, v2, 0, 0
	v_add_nc_u32_e32 v2, -8, v48
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v4, 24, v9
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_or3_b32 v4, v3, v8, v4
	v_or3_b32 v3, v5, 0, 0
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_11:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v2
                                        ; implicit-def: $vgpr5_vgpr6
                                        ; implicit-def: $sgpr0
	s_xor_b32 s4, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_17
; %bb.12:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v2
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_mov_b32 s5, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_16
; %bb.13:                               ; %.preheader9
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v5, 0
	v_mov_b32_e32 v6, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s6, 0
	s_mov_b64 s[2:3], 0
	.p2align	6
.LBB6_14:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_delay_alu instid0(SALU_CYCLE_1)
	v_add_co_u32 v7, vcc_lo, v17, s2
	v_add_co_ci_u32_e32 v8, vcc_lo, s3, v18, vcc_lo
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e32 vcc_lo, s2, v2
	flat_load_u8 v7, v[7:8]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_dual_mov_b32 v8, s14 :: v_dual_and_b32 v7, 0xffff, v7
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_lshlrev_b64 v[7:8], s0, v[7:8]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s6, vcc_lo, s6
	s_and_not1_b32 s7, exec_lo, s6
	s_delay_alu instid0(VALU_DEP_1)
	v_or_b32_e32 v6, v8, v6
	v_or_b32_e32 v5, v7, v5
	s_cselect_b32 exec_lo, s7, s6
	s_cbranch_scc1 .LBB6_14
; %bb.15:                               ; %Flow83
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
.LBB6_16:                               ; %Flow84
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
                                        ; implicit-def: $vgpr2
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_17:                               ; %Flow85
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v9, s0
	s_xor_b32 s0, s4, exec_lo
	s_cmp_lg_u32 s4, 0
	s_cmov_b32 exec_lo, s4
	s_cbranch_scc0 .LBB6_19
; %bb.18:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v5, v[17:18]
	flat_load_u8 v6, v[17:18] offset:1
	flat_load_u8 v7, v[17:18] offset:2
	flat_load_u8 v8, v[17:18] offset:3
	flat_load_u8 v9, v[17:18] offset:5
	flat_load_u8 v10, v[17:18] offset:4
	v_mov_b32_e32 v11, 0
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_and_b32_e32 v5, 0xffff, v5
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v6, 8, v6
	s_clause 0x1
	flat_load_u8 v12, v[17:18] offset:7
	flat_load_d16_hi_u8 v11, v[17:18] offset:6
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v7, 16, v7
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v8, 24, v8
	v_add_co_u32 v17, vcc_lo, v17, 8
	v_or_b32_e32 v5, v6, v5
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v6, 8, v9
	v_add_nc_u32_e32 v9, -8, v2
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	v_or3_b32 v5, v5, v7, v8
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v6, 0, v10, v6
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_or3_b32 v5, v5, 0, 0
	v_or3_b32 v5, v5, 0, 0
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v7, 24, v12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_delay_alu instid0(VALU_DEP_1)
	v_or3_b32 v6, v6, v11, v7
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_19:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v9
                                        ; implicit-def: $vgpr7_vgpr8
                                        ; implicit-def: $sgpr0
	s_xor_b32 s4, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_25
; %bb.20:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v9
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	s_mov_b32 s5, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_24
; %bb.21:                               ; %.preheader7
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v7, 0
	v_mov_b32_e32 v8, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s6, 0
	s_mov_b64 s[2:3], 0
	.p2align	6
.LBB6_22:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_delay_alu instid0(SALU_CYCLE_1)
	v_add_co_u32 v10, vcc_lo, v17, s2
	v_add_co_ci_u32_e32 v11, vcc_lo, s3, v18, vcc_lo
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e32 vcc_lo, s2, v9
	flat_load_u8 v2, v[10:11]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_dual_mov_b32 v11, s14 :: v_dual_and_b32 v10, 0xffff, v2
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_lshlrev_b64 v[10:11], s0, v[10:11]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s6, vcc_lo, s6
	s_and_not1_b32 s7, exec_lo, s6
	s_delay_alu instid0(VALU_DEP_1)
	v_or_b32_e32 v8, v11, v8
	v_or_b32_e32 v7, v10, v7
	s_cselect_b32 exec_lo, s7, s6
	s_cbranch_scc1 .LBB6_22
; %bb.23:                               ; %Flow80
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
.LBB6_24:                               ; %Flow81
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
                                        ; implicit-def: $vgpr9
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_25:                               ; %Flow82
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v2, s0
	s_xor_b32 s0, s4, exec_lo
	s_cmp_lg_u32 s4, 0
	s_cmov_b32 exec_lo, s4
	s_cbranch_scc0 .LBB6_27
; %bb.26:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v2, v[17:18]
	flat_load_u8 v7, v[17:18] offset:1
	flat_load_u8 v8, v[17:18] offset:2
	flat_load_u8 v10, v[17:18] offset:3
	flat_load_u8 v11, v[17:18] offset:5
	flat_load_u8 v12, v[17:18] offset:4
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_dual_mov_b32 v13, 0 :: v_dual_and_b32 v2, 0xffff, v2
	s_clause 0x1
	flat_load_u8 v14, v[17:18] offset:7
	flat_load_d16_hi_u8 v13, v[17:18] offset:6
	s_waitcnt vmcnt(6) lgkmcnt(6)
	v_lshlrev_b32_e32 v7, 8, v7
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v8, 16, v8
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v10, 24, v10
	v_add_co_u32 v17, vcc_lo, v17, 8
	v_or_b32_e32 v2, v7, v2
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v7, 8, v11
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	s_delay_alu instid0(VALU_DEP_3) | instskip(SKIP_1) | instid1(VALU_DEP_3)
	v_or3_b32 v2, v2, v8, v10
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v7, 0, v12, v7
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_4) | instid1(VALU_DEP_1)
	v_or3_b32 v10, v2, 0, 0
	v_add_nc_u32_e32 v2, -8, v9
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v8, 24, v14
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_or3_b32 v8, v7, v13, v8
	v_or3_b32 v7, v10, 0, 0
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_27:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v2
                                        ; implicit-def: $vgpr9_vgpr10
                                        ; implicit-def: $sgpr0
	s_xor_b32 s4, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_33
; %bb.28:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v2
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	s_mov_b32 s5, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_32
; %bb.29:                               ; %.preheader5
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v9, 0
	v_mov_b32_e32 v10, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s6, 0
	s_mov_b64 s[2:3], 0
	.p2align	6
.LBB6_30:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_delay_alu instid0(SALU_CYCLE_1)
	v_add_co_u32 v11, vcc_lo, v17, s2
	v_add_co_ci_u32_e32 v12, vcc_lo, s3, v18, vcc_lo
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e32 vcc_lo, s2, v2
	flat_load_u8 v11, v[11:12]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_dual_mov_b32 v12, s14 :: v_dual_and_b32 v11, 0xffff, v11
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_lshlrev_b64 v[11:12], s0, v[11:12]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s6, vcc_lo, s6
	s_and_not1_b32 s7, exec_lo, s6
	s_delay_alu instid0(VALU_DEP_1)
	v_or_b32_e32 v10, v12, v10
	v_or_b32_e32 v9, v11, v9
	s_cselect_b32 exec_lo, s7, s6
	s_cbranch_scc1 .LBB6_30
; %bb.31:                               ; %Flow77
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
.LBB6_32:                               ; %Flow78
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
                                        ; implicit-def: $vgpr2
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_33:                               ; %Flow79
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v13, s0
	s_xor_b32 s0, s4, exec_lo
	s_cmp_lg_u32 s4, 0
	s_cmov_b32 exec_lo, s4
	s_cbranch_scc0 .LBB6_35
; %bb.34:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v9, v[17:18]
	flat_load_u8 v10, v[17:18] offset:1
	flat_load_u8 v11, v[17:18] offset:2
	flat_load_u8 v12, v[17:18] offset:3
	flat_load_u8 v13, v[17:18] offset:5
	flat_load_u8 v14, v[17:18] offset:4
	v_mov_b32_e32 v15, 0
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_and_b32_e32 v9, 0xffff, v9
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v10, 8, v10
	s_clause 0x1
	flat_load_u8 v16, v[17:18] offset:7
	flat_load_d16_hi_u8 v15, v[17:18] offset:6
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v11, 16, v11
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v12, 24, v12
	v_add_co_u32 v17, vcc_lo, v17, 8
	v_or_b32_e32 v9, v10, v9
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v10, 8, v13
	v_add_nc_u32_e32 v13, -8, v2
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	v_or3_b32 v9, v9, v11, v12
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v10, 0, v14, v10
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_or3_b32 v9, v9, 0, 0
	v_or3_b32 v9, v9, 0, 0
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v11, 24, v16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_delay_alu instid0(VALU_DEP_1)
	v_or3_b32 v10, v10, v15, v11
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_35:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v13
                                        ; implicit-def: $vgpr11_vgpr12
                                        ; implicit-def: $sgpr0
	s_xor_b32 s4, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_41
; %bb.36:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v13
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	s_mov_b32 s5, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_40
; %bb.37:                               ; %.preheader3
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v11, 0
	v_mov_b32_e32 v12, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s6, 0
	s_mov_b64 s[2:3], 0
	.p2align	6
.LBB6_38:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_delay_alu instid0(SALU_CYCLE_1)
	v_add_co_u32 v14, vcc_lo, v17, s2
	v_add_co_ci_u32_e32 v15, vcc_lo, s3, v18, vcc_lo
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e32 vcc_lo, s2, v13
	flat_load_u8 v2, v[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_dual_mov_b32 v15, s14 :: v_dual_and_b32 v14, 0xffff, v2
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_lshlrev_b64 v[14:15], s0, v[14:15]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s6, vcc_lo, s6
	s_and_not1_b32 s7, exec_lo, s6
	s_delay_alu instid0(VALU_DEP_1)
	v_or_b32_e32 v12, v15, v12
	v_or_b32_e32 v11, v14, v11
	s_cselect_b32 exec_lo, s7, s6
	s_cbranch_scc1 .LBB6_38
; %bb.39:                               ; %Flow74
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
.LBB6_40:                               ; %Flow75
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
                                        ; implicit-def: $vgpr13
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_41:                               ; %Flow76
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v2, s0
	s_xor_b32 s0, s4, exec_lo
	s_cmp_lg_u32 s4, 0
	s_cmov_b32 exec_lo, s4
	s_cbranch_scc0 .LBB6_43
; %bb.42:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v2, v[17:18]
	flat_load_u8 v11, v[17:18] offset:1
	flat_load_u8 v12, v[17:18] offset:2
	flat_load_u8 v14, v[17:18] offset:3
	flat_load_u8 v15, v[17:18] offset:5
	flat_load_u8 v16, v[17:18] offset:4
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_dual_mov_b32 v19, 0 :: v_dual_and_b32 v2, 0xffff, v2
	s_clause 0x1
	flat_load_u8 v20, v[17:18] offset:7
	flat_load_d16_hi_u8 v19, v[17:18] offset:6
	s_waitcnt vmcnt(6) lgkmcnt(6)
	v_lshlrev_b32_e32 v11, 8, v11
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v12, 16, v12
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v14, 24, v14
	v_add_co_u32 v17, vcc_lo, v17, 8
	v_or_b32_e32 v2, v11, v2
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v11, 8, v15
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	s_delay_alu instid0(VALU_DEP_3) | instskip(SKIP_1) | instid1(VALU_DEP_3)
	v_or3_b32 v2, v2, v12, v14
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v11, 0, v16, v11
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_4) | instid1(VALU_DEP_1)
	v_or3_b32 v14, v2, 0, 0
	v_add_nc_u32_e32 v2, -8, v13
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v12, 24, v20
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_or3_b32 v12, v11, v19, v12
	v_or3_b32 v11, v14, 0, 0
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_43:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v2
                                        ; implicit-def: $vgpr13_vgpr14
                                        ; implicit-def: $sgpr0
	s_xor_b32 s4, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_49
; %bb.44:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v2
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	s_mov_b32 s5, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_48
; %bb.45:                               ; %.preheader1
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v13, 0
	v_mov_b32_e32 v14, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s6, 0
	s_mov_b64 s[2:3], 0
	.p2align	6
.LBB6_46:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_delay_alu instid0(SALU_CYCLE_1)
	v_add_co_u32 v15, vcc_lo, v17, s2
	v_add_co_ci_u32_e32 v16, vcc_lo, s3, v18, vcc_lo
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	v_cmp_eq_u32_e32 vcc_lo, s2, v2
	flat_load_u8 v15, v[15:16]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_dual_mov_b32 v16, s14 :: v_dual_and_b32 v15, 0xffff, v15
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_lshlrev_b64 v[15:16], s0, v[15:16]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s6, vcc_lo, s6
	s_and_not1_b32 s7, exec_lo, s6
	s_delay_alu instid0(VALU_DEP_1)
	v_or_b32_e32 v14, v16, v14
	v_or_b32_e32 v13, v15, v13
	s_cselect_b32 exec_lo, s7, s6
	s_cbranch_scc1 .LBB6_46
; %bb.47:                               ; %Flow71
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s5
.LBB6_48:                               ; %Flow72
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_mov_b32 s0, 0
                                        ; implicit-def: $vgpr2
	s_or_b32 exec_lo, exec_lo, s4
.LBB6_49:                               ; %Flow73
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v19, s0
	s_xor_b32 s0, s4, exec_lo
	s_cmp_lg_u32 s4, 0
	s_cmov_b32 exec_lo, s4
	s_cbranch_scc0 .LBB6_51
; %bb.50:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v13, v[17:18]
	flat_load_u8 v14, v[17:18] offset:1
	flat_load_u8 v15, v[17:18] offset:2
	flat_load_u8 v16, v[17:18] offset:3
	flat_load_u8 v19, v[17:18] offset:5
	flat_load_u8 v20, v[17:18] offset:4
	v_mov_b32_e32 v21, 0
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_and_b32_e32 v13, 0xffff, v13
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v14, 8, v14
	s_clause 0x1
	flat_load_u8 v22, v[17:18] offset:7
	flat_load_d16_hi_u8 v21, v[17:18] offset:6
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v15, 16, v15
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v16, 24, v16
	v_add_co_u32 v17, vcc_lo, v17, 8
	v_or_b32_e32 v13, v14, v13
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v14, 8, v19
	v_add_nc_u32_e32 v19, -8, v2
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	v_or3_b32 v13, v13, v15, v16
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v14, 0, v20, v14
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_or3_b32 v13, v13, 0, 0
	v_or3_b32 v13, v13, 0, 0
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v15, 24, v22
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_delay_alu instid0(VALU_DEP_1)
	v_or3_b32 v14, v14, v21, v15
	s_or_b32 exec_lo, exec_lo, s0
.LBB6_51:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_gt_u32_e32 vcc_lo, 8, v19
                                        ; implicit-def: $vgpr15_vgpr16
	s_xor_b32 s2, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_57
; %bb.52:                               ;   in Loop: Header=BB6_3 Depth=1
	v_cmp_ne_u32_e32 vcc_lo, 0, v19
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	s_mov_b32 s3, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB6_56
; %bb.53:                               ; %.preheader
                                        ;   in Loop: Header=BB6_3 Depth=1
	v_mov_b32_e32 v15, 0
	v_mov_b32_e32 v16, 0
	s_mov_b64 s[0:1], 0
	s_mov_b32 s4, 0
	.p2align	6
.LBB6_54:                               ;   Parent Loop BB6_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	flat_load_u8 v2, v[17:18]
	v_mov_b32_e32 v21, s14
	v_add_nc_u32_e32 v19, -1, v19
	v_add_co_u32 v17, vcc_lo, v17, 1
	v_add_co_ci_u32_e32 v18, vcc_lo, 0, v18, vcc_lo
	s_delay_alu instid0(VALU_DEP_3) | instskip(SKIP_2) | instid1(VALU_DEP_1)
	v_cmp_eq_u32_e32 vcc_lo, 0, v19
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v20, 0xffff, v2
	v_lshlrev_b64 v[20:21], s0, v[20:21]
	s_add_u32 s0, s0, 8
	s_addc_u32 s1, s1, 0
	s_or_b32 s4, vcc_lo, s4
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	s_and_not1_b32 s5, exec_lo, s4
	v_or_b32_e32 v16, v21, v16
	v_or_b32_e32 v15, v20, v15
	s_cselect_b32 exec_lo, s5, s4
	s_cbranch_scc1 .LBB6_54
; %bb.55:                               ; %Flow
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_or_b32 exec_lo, exec_lo, s3
.LBB6_56:                               ; %Flow69
                                        ;   in Loop: Header=BB6_3 Depth=1
                                        ; implicit-def: $vgpr17_vgpr18
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s2
.LBB6_57:                               ; %Flow70
                                        ;   in Loop: Header=BB6_3 Depth=1
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s0, s2, exec_lo
	s_cmp_lg_u32 s2, 0
	s_cmov_b32 exec_lo, s2
	s_cbranch_scc0 .LBB6_2
; %bb.58:                               ;   in Loop: Header=BB6_3 Depth=1
	s_clause 0x5
	flat_load_u8 v2, v[17:18]
	flat_load_u8 v15, v[17:18] offset:1
	flat_load_u8 v16, v[17:18] offset:2
	flat_load_u8 v19, v[17:18] offset:3
	flat_load_u8 v20, v[17:18] offset:5
	flat_load_u8 v21, v[17:18] offset:4
	v_mov_b32_e32 v22, 0
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_and_b32_e32 v2, 0xffff, v2
	s_waitcnt vmcnt(4) lgkmcnt(4)
	v_lshlrev_b32_e32 v15, 8, v15
	s_clause 0x1
	flat_load_u8 v23, v[17:18] offset:7
	flat_load_d16_hi_u8 v22, v[17:18] offset:6
	s_waitcnt vmcnt(5) lgkmcnt(5)
	v_lshlrev_b32_e32 v16, 16, v16
	s_waitcnt vmcnt(3) lgkmcnt(3)
	v_lshlrev_b32_e32 v17, 8, v20
	v_or_b32_e32 v2, v15, v2
	v_lshlrev_b32_e32 v15, 24, v19
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_2)
	v_or3_b32 v2, v2, v16, v15
	s_waitcnt vmcnt(2) lgkmcnt(2)
	v_or3_b32 v15, 0, v21, v17
	v_or3_b32 v2, v2, 0, 0
	s_waitcnt vmcnt(1) lgkmcnt(1)
	v_lshlrev_b32_e32 v16, 24, v23
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_delay_alu instid0(VALU_DEP_1)
	v_or3_b32 v16, v15, v22, v16
	v_or3_b32 v15, v2, 0, 0
	s_or_b32 exec_lo, exec_lo, s0
	s_branch .LBB6_2
.LBB6_59:                               ; %Flow89
                                        ; implicit-def: $vgpr2
	s_or_b32 exec_lo, exec_lo, s11
.LBB6_60:                               ; %Flow90
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s14, s11, exec_lo
	s_cmp_lg_u32 s11, 0
	s_cmov_b32 exec_lo, s11
	s_cbranch_scc0 .LBB6_62
; %bb.61:
	v_and_or_b32 v3, 0xffffff1f, v2, 32
	v_mov_b32_e32 v0, 2
	v_mov_b32_e32 v2, v1
	v_dual_mov_b32 v4, 0 :: v_dual_mov_b32 v5, 0
	s_delay_alu instid0(VALU_DEP_4)
	v_mov_b32_e32 v1, v3
	v_dual_mov_b32 v3, 0 :: v_dual_mov_b32 v6, 0
	v_dual_mov_b32 v7, 0 :: v_dual_mov_b32 v8, 0
	v_dual_mov_b32 v9, 0 :: v_dual_mov_b32 v10, 0
	v_dual_mov_b32 v11, 0 :: v_dual_mov_b32 v12, 0
	v_dual_mov_b32 v13, 0 :: v_dual_mov_b32 v14, 0
	v_dual_mov_b32 v15, 0 :: v_dual_mov_b32 v16, 0
	s_mov_b64 s[8:9], s[12:13]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_hostcall_preview@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_hostcall_preview@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1)
	s_swappc_b64 s[30:31], s[0:1]
	s_or_b32 exec_lo, exec_lo, s14
.LBB6_62:
	v_readlane_b32 s30, v40, 0
	v_readlane_b32 s31, v40, 1
	s_or_saveexec_b32 s0, -1
	scratch_load_b32 v40, off, s33          ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_add_i32 s32, s32, -16
	s_mov_b32 s33, s16
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end6:
	.size	__ockl_fprintf_append_string_n, .Lfunc_end6-__ockl_fprintf_append_string_n
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 3324
; NumSgprs: 36
; NumVgprs: 50
; ScratchSize: 40
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_fprintf_append_args
	.type	__ockl_fprintf_append_args,@function
__ockl_fprintf_append_args:             ; @__ockl_fprintf_append_args
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s11, s33
	s_mov_b32 s33, s32
	s_xor_saveexec_b32 s0, -1
	scratch_store_b32 off, v35, s33         ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	v_writelane_b32 v35, s30, 0
	s_add_i32 s32, s32, 16
	v_writelane_b32 v35, s31, 1
	v_or_b32_e32 v19, 2, v0
	v_cmp_eq_u32_e32 vcc_lo, 0, v17
	v_dual_mov_b32 v18, v3 :: v_dual_mov_b32 v3, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_hostcall_preview@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_hostcall_preview@rel32@hi+12
	v_cndmask_b32_e32 v0, v19, v0, vcc_lo
	v_lshlrev_b64 v[19:20], 5, v[2:3]
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)
	v_and_b32_e32 v0, 0xffffff1f, v0
	v_or_b32_e32 v2, v1, v20
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_or_b32_e32 v3, v0, v19
	v_dual_mov_b32 v0, 2 :: v_dual_mov_b32 v1, v3
	v_mov_b32_e32 v3, v18
	s_swappc_b64 s[30:31], s[0:1]
	v_readlane_b32 s30, v35, 0
	v_readlane_b32 s31, v35, 1
	s_xor_saveexec_b32 s0, -1
	scratch_load_b32 v35, off, s33          ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_add_i32 s32, s32, -16
	s_mov_b32 s33, s11
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end7:
	.size	__ockl_fprintf_append_args, .Lfunc_end7-__ockl_fprintf_append_args
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 184
; NumSgprs: 36
; NumVgprs: 36
; ScratchSize: 40
; MemoryBound: 0
	.text
	.hidden	__assert_fail                   ; -- Begin function __assert_fail
	.weak	__assert_fail
	.p2align	2
	.type	__assert_fail,@function
__assert_fail:                          ; @__assert_fail
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_mov_b32 s20, s33
	s_mov_b32 s33, s32
	s_or_saveexec_b32 s0, -1
	scratch_store_b32 off, v41, s33 offset:120 ; 4-byte Folded Spill
	s_mov_b32 exec_lo, s0
	s_addk_i32 s32, 0x80
	scratch_store_b32 off, v40, s33         ; 4-byte Folded Spill
	v_writelane_b32 v41, s30, 0
	v_writelane_b32 v41, s31, 1
	v_dual_mov_b32 v7, 0x253a7325 :: v_dual_mov_b32 v36, 0
	v_mov_b32_e32 v8, 0x25203a75
	v_mov_b32_e32 v9, 0x44203a73
	v_mov_b32_e32 v10, 0x63697665
	v_mov_b32_e32 v11, 0x69732d65
	v_mov_b32_e32 v12, 0x61206564
	v_mov_b32_e32 v13, 0x72657373
	v_mov_b32_e32 v14, 0x6e6f6974
	s_clause 0x5
	scratch_store_b64 off, v[0:1], s33 offset:8
	scratch_store_b64 off, v[2:3], s33 offset:16
	scratch_store_b32 off, v4, s33 offset:24
	scratch_store_b64 off, v[5:6], s33 offset:32
	scratch_store_b128 off, v[7:10], s33 offset:48
	scratch_store_b128 off, v[11:14], s33 offset:64
	v_mov_b32_e32 v2, 0xa2e
	v_mov_b32_e32 v3, 0x64656c69
	s_add_i32 s0, s33, 48
	v_mov_b32_e32 v0, 0x73256020
	v_mov_b32_e32 v1, 0x61662027
	s_mov_b64 s[12:13], src_private_base
	s_mov_b64 s[18:19], s[8:9]
	s_mov_b32 s12, s0
	s_mov_b32 s14, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_stderr_begin@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_stderr_begin@rel32@hi+12
	s_clause 0x3
	scratch_store_b8 off, v36, s33 offset:94
	scratch_store_b16 off, v2, s33 offset:92
	scratch_store_b32 off, v3, s33 offset:88
	scratch_store_b64 off, v[0:1], s33 offset:80
	s_swappc_b64 s[30:31], s[0:1]
	v_dual_mov_b32 v2, s12 :: v_dual_mov_b32 v3, s13
	s_mov_b64 s[0:1], s[12:13]
	s_clause 0x2
	scratch_store_b32 off, v36, s33 offset:104
	scratch_store_b64 off, v[0:1], s33 offset:96
	scratch_store_b64 off, v[2:3], s33 offset:112
.LBB8_1:                                ; =>This Inner Loop Header: Depth=1
	v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
	s_add_u32 s0, s0, 1
	s_addc_u32 s1, s1, 0
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_4) | instid1(SALU_CYCLE_1)
	v_dual_mov_b32 v3, s1 :: v_dual_mov_b32 v2, s0
	flat_load_u8 v0, v[0:1]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u16_e32 vcc_lo, 0, v0
	s_or_b32 s14, vcc_lo, s14
	s_and_not1_b32 s2, exec_lo, s14
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cselect_b32 exec_lo, s2, s14
	s_cbranch_scc1 .LBB8_1
; %bb.2:
	scratch_load_b64 v[0:1], off, s33 offset:96
	s_add_i32 s0, s33, 48
	v_mov_b32_e32 v3, s13
	v_sub_co_u32 v4, null, v2, s0
	v_mov_b32_e32 v2, s12
	v_mov_b32_e32 v6, 0
	s_mov_b64 s[8:9], s[18:19]
	s_delay_alu instid0(VALU_DEP_3)
	v_ashrrev_i32_e32 v5, 31, v4
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_append_string_n@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_append_string_n@rel32@hi+12
	s_mov_b32 s17, 0
	scratch_store_b32 off, v4, s33 offset:104
	s_swappc_b64 s[30:31], s[0:1]
	scratch_load_b64 v[2:3], off, s33 offset:16
	scratch_store_b64 off, v[0:1], s33 offset:96
	s_waitcnt vmcnt(0)
	scratch_store_b64 off, v[2:3], s33 offset:112
.LBB8_3:                                ; =>This Inner Loop Header: Depth=1
	flat_load_u8 v0, v[2:3]
	v_add_co_u32 v4, vcc_lo, v2, 1
	v_add_co_ci_u32_e32 v5, vcc_lo, 0, v3, vcc_lo
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_dual_mov_b32 v2, v4 :: v_dual_mov_b32 v3, v5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u16_e32 vcc_lo, 0, v0
	s_or_b32 s17, vcc_lo, s17
	s_and_not1_b32 s0, exec_lo, s17
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cselect_b32 exec_lo, s0, s17
	s_cbranch_scc1 .LBB8_3
; %bb.4:
	s_clause 0x1
	scratch_load_b64 v[2:3], off, s33 offset:16
	scratch_load_b64 v[0:1], off, s33 offset:96
	v_mov_b32_e32 v6, 0
	s_mov_b64 s[8:9], s[18:19]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_append_string_n@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_append_string_n@rel32@hi+12
	s_waitcnt vmcnt(1)
	v_sub_co_u32 v4, null, v4, v2
	s_delay_alu instid0(VALU_DEP_1)
	v_ashrrev_i32_e32 v5, 31, v4
	scratch_store_b32 off, v4, s33 offset:104
	s_swappc_b64 s[30:31], s[0:1]
	scratch_load_b32 v3, off, s33 offset:24
	v_dual_mov_b32 v2, 1 :: v_dual_mov_b32 v5, 0
	v_dual_mov_b32 v4, 0 :: v_dual_mov_b32 v7, 0
	v_dual_mov_b32 v6, 0 :: v_dual_mov_b32 v9, 0
	v_dual_mov_b32 v8, 0 :: v_dual_mov_b32 v11, 0
	v_dual_mov_b32 v10, 0 :: v_dual_mov_b32 v13, 0
	v_dual_mov_b32 v12, 0 :: v_dual_mov_b32 v15, 0
	v_dual_mov_b32 v14, 0 :: v_dual_mov_b32 v17, 0
	v_mov_b32_e32 v16, 0
	s_mov_b64 s[8:9], s[18:19]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_append_args@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_append_args@rel32@hi+12
	scratch_store_b64 off, v[0:1], s33 offset:96
	s_swappc_b64 s[30:31], s[0:1]
	scratch_load_b64 v[2:3], off, s33 offset:32
	s_mov_b32 s0, 0
	scratch_store_b64 off, v[0:1], s33 offset:96
	s_waitcnt vmcnt(0)
	scratch_store_b64 off, v[2:3], s33 offset:112
.LBB8_5:                                ; =>This Inner Loop Header: Depth=1
	flat_load_u8 v0, v[2:3]
	v_add_co_u32 v4, vcc_lo, v2, 1
	v_add_co_ci_u32_e32 v5, vcc_lo, 0, v3, vcc_lo
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_dual_mov_b32 v2, v4 :: v_dual_mov_b32 v3, v5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u16_e32 vcc_lo, 0, v0
	s_or_b32 s0, vcc_lo, s0
	s_and_not1_b32 s1, exec_lo, s0
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cselect_b32 exec_lo, s1, s0
	s_cbranch_scc1 .LBB8_5
; %bb.6:
	s_clause 0x1
	scratch_load_b64 v[2:3], off, s33 offset:32
	scratch_load_b64 v[0:1], off, s33 offset:96
	v_mov_b32_e32 v6, 0
	s_mov_b64 s[8:9], s[18:19]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_append_string_n@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_append_string_n@rel32@hi+12
	s_mov_b32 s17, 0
	s_waitcnt vmcnt(1)
	v_sub_co_u32 v4, null, v4, v2
	s_delay_alu instid0(VALU_DEP_1)
	v_ashrrev_i32_e32 v5, 31, v4
	scratch_store_b32 off, v4, s33 offset:104
	s_swappc_b64 s[30:31], s[0:1]
	scratch_load_b64 v[2:3], off, s33 offset:8
	scratch_store_b64 off, v[0:1], s33 offset:96
	s_waitcnt vmcnt(0)
	scratch_store_b64 off, v[2:3], s33 offset:112
.LBB8_7:                                ; =>This Inner Loop Header: Depth=1
	flat_load_u8 v0, v[2:3]
	v_add_co_u32 v4, vcc_lo, v2, 1
	v_add_co_ci_u32_e32 v5, vcc_lo, 0, v3, vcc_lo
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_3) | instid1(SALU_CYCLE_1)
	v_dual_mov_b32 v2, v4 :: v_dual_mov_b32 v3, v5
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_eq_u16_e32 vcc_lo, 0, v0
	s_or_b32 s17, vcc_lo, s17
	s_and_not1_b32 s0, exec_lo, s17
	s_delay_alu instid0(SALU_CYCLE_1)
	s_cselect_b32 exec_lo, s0, s17
	s_cbranch_scc1 .LBB8_7
; %bb.8:
	s_clause 0x1
	scratch_load_b64 v[2:3], off, s33 offset:8
	scratch_load_b64 v[0:1], off, s33 offset:96
	v_mov_b32_e32 v6, 1
	s_mov_b64 s[8:9], s[18:19]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_fprintf_append_string_n@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_fprintf_append_string_n@rel32@hi+12
	s_waitcnt vmcnt(1)
	v_sub_co_u32 v4, null, v4, v2
	s_delay_alu instid0(VALU_DEP_1)
	v_ashrrev_i32_e32 v5, 31, v4
	scratch_store_b32 off, v4, s33 offset:104
	s_swappc_b64 s[30:31], s[0:1]
	s_cbranch_execnz .LBB8_10
; %bb.9:
	scratch_load_b32 v40, off, s33          ; 4-byte Folded Reload
	v_readlane_b32 s30, v41, 0
	v_readlane_b32 s31, v41, 1
	s_or_saveexec_b32 s0, -1
	scratch_load_b32 v41, off, s33 offset:120 ; 4-byte Folded Reload
	s_mov_b32 exec_lo, s0
	s_addk_i32 s32, 0xff80
	s_mov_b32 s33, s20
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.LBB8_10:
	s_trap 2
	s_sendmsg_rtn_b32 s0, sendmsg(MSG_RTN_GET_DOORBELL)
	s_mov_b32 ttmp2, m0
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0x3ff
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_bitset1_b32 s0, 10
	s_mov_b32 m0, s0
	s_sendmsg sendmsg(MSG_INTERRUPT)
	s_mov_b32 m0, ttmp2
.LBB8_11:                               ; =>This Inner Loop Header: Depth=1
	s_sethalt 5
	s_branch .LBB8_11
.Lfunc_end8:
	.size	__assert_fail, .Lfunc_end8-__assert_fail
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 1200
; NumSgprs: 36
; NumVgprs: 50
; ScratchSize: 168
; MemoryBound: 0
	.text
	.hidden	__assertfail                    ; -- Begin function __assertfail
	.weak	__assertfail
	.p2align	2
	.type	__assertfail,@function
__assertfail:                           ; @__assertfail
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_cbranch_execnz .LBB9_2
; %bb.1:
	s_setpc_b64 s[30:31]
.LBB9_2:
	s_trap 2
	s_sendmsg_rtn_b32 s0, sendmsg(MSG_RTN_GET_DOORBELL)
	s_mov_b32 ttmp2, m0
	s_waitcnt lgkmcnt(0)
	s_and_b32 s0, s0, 0x3ff
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)
	s_bitset1_b32 s0, 10
	s_mov_b32 m0, s0
	s_sendmsg sendmsg(MSG_INTERRUPT)
	s_mov_b32 m0, ttmp2
.LBB9_3:                                ; =>This Inner Loop Header: Depth=1
	s_sethalt 5
	s_branch .LBB9_3
.Lfunc_end9:
	.size	__assertfail, .Lfunc_end9-__assertfail
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 64
; NumSgprs: 32
; NumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_get_group_id
	.type	__ockl_get_group_id,@function
__ockl_get_group_id:                    ; @__ockl_get_group_id
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v1, v0
                                        ; implicit-def: $vgpr0
	s_delay_alu instid0(VALU_DEP_1)
	v_cmp_lt_i32_e32 vcc_lo, 0, v1
	s_xor_b32 s0, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB10_8
; %bb.1:                                ; %NodeBlock
	v_cmp_lt_i32_e32 vcc_lo, 1, v1
                                        ; implicit-def: $vgpr0
	s_xor_b32 s1, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB10_5
; %bb.2:                                ; %LeafBlock1
	v_cmp_eq_u32_e32 vcc_lo, 2, v1
	v_mov_b32_e32 v0, 0
	s_mov_b32 s2, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB10_4
; %bb.3:
	v_mov_b32_e32 v0, s14
	s_or_b32 exec_lo, exec_lo, s2
.LBB10_4:                               ; %Flow
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB10_5:                               ; %Flow5
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s2, s1, exec_lo
	s_cmp_lg_u32 s1, 0
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB10_7
; %bb.6:
	v_mov_b32_e32 v0, s13
	s_or_b32 exec_lo, exec_lo, s2
.LBB10_7:                               ; %Flow6
                                        ; implicit-def: $vgpr1
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s0
.LBB10_8:                               ; %Flow8
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s1, s0, exec_lo
	s_cmp_lg_u32 s0, 0
	s_cmov_b32 exec_lo, s0
	s_cbranch_scc0 .LBB10_12
; %bb.9:                                ; %LeafBlock
	v_cmp_eq_u32_e32 vcc_lo, 0, v1
	v_mov_b32_e32 v0, 0
	s_mov_b32 s0, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB10_11
; %bb.10:
	v_mov_b32_e32 v0, s12
	s_or_b32 exec_lo, exec_lo, s0
.LBB10_11:                              ; %Flow7
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB10_12:
	v_mov_b32_e32 v1, 0
	s_setpc_b64 s[30:31]
.Lfunc_end10:
	.size	__ockl_get_group_id, .Lfunc_end10-__ockl_get_group_id
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 196
; NumSgprs: 34
; NumVgprs: 2
; ScratchSize: 0
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_get_local_size
	.type	__ockl_get_local_size,@function
__ockl_get_local_size:                  ; @__ockl_get_local_size
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v2, v0
                                        ; implicit-def: $vgpr0_vgpr1
	s_delay_alu instid0(VALU_DEP_1)
	v_cmp_lt_i32_e32 vcc_lo, 0, v2
	s_xor_b32 s0, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB11_8
; %bb.1:                                ; %NodeBlock
	v_cmp_lt_i32_e32 vcc_lo, 1, v2
                                        ; implicit-def: $vgpr0_vgpr1
	s_xor_b32 s1, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB11_5
; %bb.2:                                ; %LeafBlock1
	v_cmp_eq_u32_e32 vcc_lo, 2, v2
	v_mov_b32_e32 v0, 1
	v_mov_b32_e32 v1, 0
	s_mov_b32 s2, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB11_4
; %bb.3:
	s_load_b32 s3, s[8:9], 0x8
	v_mov_b32_e32 v1, 0
	s_waitcnt lgkmcnt(0)
	s_cmp_lt_u32 s14, s3
	s_cselect_b32 s3, 16, 22
	s_delay_alu instid0(SALU_CYCLE_1)
	v_mov_b32_e32 v0, s3
	global_load_u16 v0, v0, s[8:9]
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
	s_or_b32 exec_lo, exec_lo, s2
.LBB11_4:                               ; %Flow
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB11_5:                               ; %Flow5
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s2, s1, exec_lo
	s_cmp_lg_u32 s1, 0
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB11_7
; %bb.6:
	s_load_b32 s1, s[8:9], 0x4
	v_mov_b32_e32 v1, 0
	s_waitcnt lgkmcnt(0)
	s_cmp_lt_u32 s13, s1
	s_cselect_b32 s1, 14, 20
	s_delay_alu instid0(SALU_CYCLE_1)
	v_mov_b32_e32 v0, s1
	global_load_u16 v0, v0, s[8:9]
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
	s_or_b32 exec_lo, exec_lo, s2
.LBB11_7:                               ; %Flow6
                                        ; implicit-def: $vgpr2
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s0
.LBB11_8:                               ; %Flow8
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s1, s0, exec_lo
	s_cmp_lg_u32 s0, 0
	s_cmov_b32 exec_lo, s0
	s_cbranch_scc0 .LBB11_12
; %bb.9:                                ; %LeafBlock
	v_cmp_eq_u32_e32 vcc_lo, 0, v2
	v_mov_b32_e32 v0, 1
	v_mov_b32_e32 v1, 0
	s_mov_b32 s0, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB11_11
; %bb.10:
	s_load_b32 s2, s[8:9], 0x0
	v_mov_b32_e32 v1, 0
	s_waitcnt lgkmcnt(0)
	s_cmp_lt_u32 s12, s2
	s_cselect_b32 s2, 12, 18
	s_delay_alu instid0(SALU_CYCLE_1)
	v_mov_b32_e32 v0, s2
	global_load_u16 v0, v0, s[8:9]
	s_waitcnt vmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
	s_or_b32 exec_lo, exec_lo, s0
.LBB11_11:                              ; %Flow7
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB11_12:
	s_setpc_b64 s[30:31]
.Lfunc_end11:
	.size	__ockl_get_local_size, .Lfunc_end11-__ockl_get_local_size
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 344
; NumSgprs: 34
; NumVgprs: 3
; ScratchSize: 0
; MemoryBound: 0
	.text
	.p2align	2                               ; -- Begin function __ockl_get_local_id
	.type	__ockl_get_local_id,@function
__ockl_get_local_id:                    ; @__ockl_get_local_id
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v1, v0
                                        ; implicit-def: $vgpr0
	s_delay_alu instid0(VALU_DEP_1)
	v_cmp_lt_i32_e32 vcc_lo, 0, v1
	s_xor_b32 s0, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB12_8
; %bb.1:                                ; %NodeBlock
	v_cmp_lt_i32_e32 vcc_lo, 1, v1
                                        ; implicit-def: $vgpr0
	s_xor_b32 s1, vcc_lo, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB12_5
; %bb.2:                                ; %LeafBlock1
	v_cmp_eq_u32_e32 vcc_lo, 2, v1
	v_mov_b32_e32 v0, 0
	s_mov_b32 s2, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB12_4
; %bb.3:
	v_bfe_u32 v0, v31, 20, 10
	s_or_b32 exec_lo, exec_lo, s2
.LBB12_4:                               ; %Flow
                                        ; implicit-def: $vgpr31
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB12_5:                               ; %Flow5
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s2, s1, exec_lo
	s_cmp_lg_u32 s1, 0
	s_cmov_b32 exec_lo, s1
	s_cbranch_scc0 .LBB12_7
; %bb.6:
	v_bfe_u32 v0, v31, 10, 10
	s_or_b32 exec_lo, exec_lo, s2
.LBB12_7:                               ; %Flow6
                                        ; implicit-def: $vgpr1
                                        ; implicit-def: $vgpr31
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s0
.LBB12_8:                               ; %Flow8
	s_delay_alu instid0(SALU_CYCLE_1)
	s_xor_b32 s1, s0, exec_lo
	s_cmp_lg_u32 s0, 0
	s_cmov_b32 exec_lo, s0
	s_cbranch_scc0 .LBB12_12
; %bb.9:                                ; %LeafBlock
	v_cmp_eq_u32_e32 vcc_lo, 0, v1
	v_mov_b32_e32 v0, 0
	s_mov_b32 s0, exec_lo
	s_cmp_lg_u32 vcc_lo, 0
	s_cmov_b32 exec_lo, vcc_lo
	s_cbranch_scc0 .LBB12_11
; %bb.10:
	v_and_b32_e32 v0, 0x3ff, v31
	s_or_b32 exec_lo, exec_lo, s0
.LBB12_11:                              ; %Flow7
	s_delay_alu instid0(SALU_CYCLE_1)
	s_or_b32 exec_lo, exec_lo, s1
.LBB12_12:
	v_mov_b32_e32 v1, 0
	s_setpc_b64 s[30:31]
.Lfunc_end12:
	.size	__ockl_get_local_id, .Lfunc_end12-__ockl_get_local_id
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 208
; NumSgprs: 34
; NumVgprs: 32
; ScratchSize: 0
; MemoryBound: 0
	.section	.text._ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv,"axG",@progbits,_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv,comdat
	.hidden	_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv ; -- Begin function _ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv
	.weak	_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv
	.p2align	2
	.type	_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv,@function
_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv: ; @_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	flat_load_u16 v2, v[0:1]
	scratch_store_b64 off, v[0:1], s32
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v0, v2
	s_setpc_b64 s[30:31]
.Lfunc_end13:
	.size	_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv, .Lfunc_end13-_ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 32
; NumSgprs: 33
; NumVgprs: 3
; ScratchSize: 16
; MemoryBound: 0
	.section	.text._ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_,"axG",@progbits,_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_,comdat
	.hidden	_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_ ; -- Begin function _ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_
	.weak	_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_
	.p2align	2
	.type	_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_,@function
_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_: ; @_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_
; %bb.0:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	v_cvt_f16_f32_e32 v3, v2
	s_clause 0x1
	scratch_store_b64 off, v[0:1], s32
	scratch_store_b32 off, v2, s32 offset:8
	flat_store_b16 v[0:1], v3
	s_waitcnt lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end14:
	.size	_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_, .Lfunc_end14-_ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Function info:
; codeLenInByte = 44
; NumSgprs: 33
; NumVgprs: 4
; ScratchSize: 16
; MemoryBound: 0
	.text
	.protected	_Z11wmma_matmulP6__halfS0_S0_ ; -- Begin function _Z11wmma_matmulP6__halfS0_S0_
	.globl	_Z11wmma_matmulP6__halfS0_S0_
	.p2align	8
	.type	_Z11wmma_matmulP6__halfS0_S0_,@function
_Z11wmma_matmulP6__halfS0_S0_:          ; @_Z11wmma_matmulP6__halfS0_S0_
; %bb.0:
	s_mov_b64 s[34:35], s[0:1]
	s_mov_b64 s[36:37], s[2:3]
	s_mov_b32 s40, s7
	s_mov_b32 s41, s6
	s_mov_b64 s[38:39], s[4:5]
	s_load_b64 s[4:5], s[0:1], 0x4
	s_clause 0x1
	s_load_b128 s[0:3], s[2:3], 0x0
	s_load_b64 s[6:7], s[36:37], 0x10
	v_mov_b32_e32 v40, v0
	s_mov_b32 s12, s41
	s_mov_b32 s13, s40
	s_mov_b32 s14, s8
	s_mov_b32 s32, 48
	v_and_b32_e32 v0, 0x3ff, v40
	v_bfe_u32 v1, v40, 10, 10
	s_mov_b32 s33, s8
	s_waitcnt lgkmcnt(0)
	s_lshr_b32 s4, s4, 16
	v_dual_mov_b32 v2, s2 :: v_dual_mov_b32 v3, s3
	s_mul_i32 s4, s4, s5
	v_mov_b32_e32 v4, s6
	v_mul_lo_u32 v0, s4, v0
	v_mov_b32_e32 v5, s7
	s_clause 0x1
	scratch_store_b64 off, v[2:3], off offset:8
	scratch_store_b64 off, v[4:5], off offset:16
	v_mad_u32_u24 v7, v1, s5, v0
	v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
	v_bfe_u32 v6, v40, 20, 10
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_group_id@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_group_id@rel32@hi+12
	s_delay_alu instid0(VALU_DEP_1)
	v_add_lshl_u32 v45, v7, v6, 3
	ds_store_2addr_stride64_b64 v45, v[2:3], v[0:1] offset0:32 offset1:48
	ds_store_2addr_stride64_b64 v45, v[0:1], v[4:5] offset1:16
	v_mov_b32_e32 v0, 0
	v_mov_b32_e32 v6, 0
	s_swappc_b64 s[30:31], s[0:1]
	s_delay_alu instid0(VALU_DEP_2)
	v_dual_mov_b32 v3, v0 :: v_dual_mov_b32 v0, 0
	s_add_u32 s8, s36, 24
	s_addc_u32 s9, s37, 0
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b32 s14, s33
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_local_size@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_local_size@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1)
	s_swappc_b64 s[30:31], s[0:1]
	v_mov_b32_e32 v2, v0
	v_dual_mov_b32 v31, v40 :: v_dual_mov_b32 v0, 0
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, __ockl_get_local_id@rel32@lo+4
	s_addc_u32 s1, s1, __ockl_get_local_id@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_3) | instid1(VALU_DEP_1)
	s_swappc_b64 s[30:31], s[0:1]
	scratch_load_b64 v[41:42], off, off offset:8
	v_ashrrev_i32_e32 v1, 31, v0
	s_mov_b32 s42, 0
                                        ; implicit-def: $vgpr7
	v_lshrrev_b32_e32 v1, 28, v1
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_add_nc_u32_e32 v1, v0, v1
	v_mad_u64_u32 v[4:5], null, v3, v2, v[0:1]
	v_and_b32_e32 v1, -16, v1
                                        ; implicit-def: $vgpr2
                                        ; implicit-def: $vgpr3
                                        ; implicit-def: $vgpr5
	s_delay_alu instid0(VALU_DEP_1)
	v_sub_nc_u32_e32 v43, v0, v1
	s_clause 0x3
	scratch_store_b32 off, v4, off offset:24
	scratch_store_b32 off, v0, off offset:28
	scratch_store_b32 off, v43, off offset:32
	scratch_store_b32 off, v6, off offset:36
                                        ; implicit-def: $vgpr0
                                        ; implicit-def: $vgpr1
                                        ; implicit-def: $vgpr4
                                        ; implicit-def: $vgpr6
	s_branch .LBB15_2
.LBB15_1:
                                        ; implicit-def: $vgpr7
                                        ; implicit-def: $vgpr6
                                        ; implicit-def: $vgpr5
                                        ; implicit-def: $vgpr4
                                        ; implicit-def: $vgpr3
                                        ; implicit-def: $vgpr2
                                        ; implicit-def: $vgpr1
                                        ; implicit-def: $vgpr0
                                        ; implicit-def: $sgpr42
                                        ; implicit-def: $vgpr43
	s_branch .LBB15_4
.LBB15_2:                               ; =>This Inner Loop Header: Depth=1
	v_dual_mov_b32 v56, v0 :: v_dual_mov_b32 v57, v1
	v_dual_mov_b32 v58, v2 :: v_dual_mov_b32 v59, v3
	v_dual_mov_b32 v60, v4 :: v_dual_mov_b32 v61, v5
	v_dual_mov_b32 v62, v6 :: v_dual_mov_b32 v63, v7
	s_cmp_lt_i32 s42, 16
	s_cbranch_scc0 .LBB15_1
; %bb.3:                                ;   in Loop: Header=BB15_2 Depth=1
	v_ashrrev_i32_e32 v44, 31, v43
	v_mov_b32_e32 v31, v40
	s_add_u32 s8, s36, 24
	s_addc_u32 s9, s37, 0
	s_mov_b64 s[4:5], s[34:35]
	v_lshlrev_b64 v[0:1], 1, v[43:44]
	s_mov_b64 s[10:11], s[38:39]
	s_mov_b32 s12, s41
	s_mov_b32 s13, s40
	s_mov_b32 s14, s33
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, _ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv@rel32@lo+4
	s_addc_u32 s1, s1, _ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv@rel32@hi+12
	s_waitcnt vmcnt(0)
	v_add_co_u32 v0, vcc_lo, v41, v0
	v_add_co_ci_u32_e32 v1, vcc_lo, v42, v1, vcc_lo
	s_swappc_b64 s[30:31], s[0:1]
	s_cmp_eq_u32 s42, 14
	v_lshrrev_b32_e32 v1, 16, v63
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 15
	v_cndmask_b32_e32 v7, v63, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 12
	v_dual_cndmask_b32 v8, v1, v0 :: v_dual_add_nc_u32 v43, 16, v43
	v_lshrrev_b32_e32 v1, 16, v62
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 13
	v_cndmask_b32_e32 v6, v62, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 10
	v_cndmask_b32_e32 v9, v1, v0, vcc_lo
	v_lshrrev_b32_e32 v1, 16, v61
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 11
	v_cndmask_b32_e32 v5, v61, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 8
	v_cndmask_b32_e32 v10, v1, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 9
	v_cndmask_b32_e32 v4, v60, v0, vcc_lo
	s_cselect_b32 s0, -1, 0
	s_cmp_eq_u32 s42, 6
	v_lshrrev_b32_e32 v1, 16, v60
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 7
	v_cndmask_b32_e32 v3, v59, v0, vcc_lo
	s_cselect_b32 s1, -1, 0
	s_cmp_eq_u32 s42, 4
	v_lshrrev_b32_e32 v2, 16, v59
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 5
	v_cndmask_b32_e32 v12, v58, v0, vcc_lo
	s_cselect_b32 s2, -1, 0
	s_cmp_eq_u32 s42, 2
	v_lshrrev_b32_e32 v11, 16, v58
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 3
	v_cndmask_b32_e32 v13, v57, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 0
	v_lshrrev_b32_e32 v14, 16, v57
	v_lshrrev_b32_e32 v15, 16, v56
	s_cselect_b32 s3, -1, 0
	s_cmp_eq_u32 s42, 1
	v_cndmask_b32_e64 v16, v56, v0, s3
	s_cselect_b32 s3, -1, 0
	v_cndmask_b32_e32 v14, v14, v0, vcc_lo
	v_cndmask_b32_e64 v15, v15, v0, s3
	v_cndmask_b32_e64 v11, v11, v0, s2
	v_cndmask_b32_e64 v17, v2, v0, s1
	v_cndmask_b32_e64 v18, v1, v0, s0
	v_perm_b32 v1, v14, v13, 0x5040100
	v_perm_b32 v0, v15, v16, 0x5040100
	v_perm_b32 v2, v11, v12, 0x5040100
	v_perm_b32 v3, v17, v3, 0x5040100
	v_perm_b32 v4, v18, v4, 0x5040100
	v_perm_b32 v5, v10, v5, 0x5040100
	v_perm_b32 v6, v9, v6, 0x5040100
	v_perm_b32 v7, v8, v7, 0x5040100
	s_add_i32 s42, s42, 1
	s_cbranch_execnz .LBB15_2
.LBB15_4:
	scratch_load_b32 v0, off, off offset:32
	v_mov_b32_e32 v1, 0
	s_mov_b32 s42, 0
                                        ; implicit-def: $vgpr2
                                        ; implicit-def: $vgpr3
                                        ; implicit-def: $vgpr4
                                        ; implicit-def: $vgpr5
                                        ; implicit-def: $vgpr6
                                        ; implicit-def: $vgpr7
	scratch_store_b32 off, v1, off offset:36
                                        ; implicit-def: $vgpr1
	s_waitcnt vmcnt(0)
	v_lshlrev_b32_e32 v41, 4, v0
                                        ; implicit-def: $vgpr0
	s_branch .LBB15_6
.LBB15_5:
                                        ; implicit-def: $vgpr7
                                        ; implicit-def: $vgpr6
                                        ; implicit-def: $vgpr5
                                        ; implicit-def: $vgpr4
                                        ; implicit-def: $vgpr3
                                        ; implicit-def: $vgpr2
                                        ; implicit-def: $vgpr1
                                        ; implicit-def: $vgpr0
                                        ; implicit-def: $sgpr42
	s_branch .LBB15_8
.LBB15_6:                               ; =>This Inner Loop Header: Depth=1
	v_dual_mov_b32 v72, v0 :: v_dual_mov_b32 v73, v1
	v_dual_mov_b32 v74, v2 :: v_dual_mov_b32 v75, v3
	v_dual_mov_b32 v76, v4 :: v_dual_mov_b32 v77, v5
	v_dual_mov_b32 v78, v6 :: v_dual_mov_b32 v79, v7
	s_cmp_lt_i32 s42, 16
	s_cbranch_scc0 .LBB15_5
; %bb.7:                                ;   in Loop: Header=BB15_6 Depth=1
	ds_load_b64 v[0:1], v45
	v_dual_mov_b32 v31, v40 :: v_dual_add_nc_u32 v2, s42, v41
	s_add_u32 s8, s36, 24
	s_addc_u32 s9, s37, 0
	s_mov_b64 s[4:5], s[34:35]
	s_delay_alu instid0(VALU_DEP_1)
	v_ashrrev_i32_e32 v3, 31, v2
	s_mov_b64 s[10:11], s[38:39]
	s_mov_b32 s12, s41
	s_mov_b32 s13, s40
	s_mov_b32 s14, s33
	v_lshlrev_b64 v[2:3], 1, v[2:3]
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, _ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv@rel32@lo+4
	s_addc_u32 s1, s1, _ZNK6__halfcvT_IDF16_TnPNSt9enable_ifIXtlSt17is_floating_pointIS0_EEEvE4typeELPv0EEEv@rel32@hi+12
	s_waitcnt lgkmcnt(0)
	s_delay_alu instid0(VALU_DEP_1)
	v_add_co_u32 v0, vcc_lo, v0, v2
	v_add_co_ci_u32_e32 v1, vcc_lo, v1, v3, vcc_lo
	s_swappc_b64 s[30:31], s[0:1]
	s_cmp_eq_u32 s42, 14
	v_lshrrev_b32_e32 v1, 16, v79
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 15
	v_cndmask_b32_e32 v7, v79, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 12
	v_cndmask_b32_e32 v8, v1, v0, vcc_lo
	v_lshrrev_b32_e32 v1, 16, v78
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 13
	v_cndmask_b32_e32 v6, v78, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 10
	v_cndmask_b32_e32 v9, v1, v0, vcc_lo
	v_lshrrev_b32_e32 v1, 16, v77
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 11
	v_cndmask_b32_e32 v5, v77, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 8
	v_cndmask_b32_e32 v10, v1, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 9
	v_cndmask_b32_e32 v4, v76, v0, vcc_lo
	s_cselect_b32 s0, -1, 0
	s_cmp_eq_u32 s42, 6
	v_lshrrev_b32_e32 v1, 16, v76
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 7
	v_cndmask_b32_e32 v3, v75, v0, vcc_lo
	s_cselect_b32 s1, -1, 0
	s_cmp_eq_u32 s42, 4
	v_lshrrev_b32_e32 v2, 16, v75
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 5
	v_cndmask_b32_e32 v12, v74, v0, vcc_lo
	s_cselect_b32 s2, -1, 0
	s_cmp_eq_u32 s42, 2
	v_lshrrev_b32_e32 v11, 16, v74
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 3
	v_cndmask_b32_e32 v13, v73, v0, vcc_lo
	s_cselect_b32 vcc_lo, -1, 0
	s_cmp_eq_u32 s42, 0
	v_lshrrev_b32_e32 v14, 16, v73
	v_lshrrev_b32_e32 v15, 16, v72
	s_cselect_b32 s3, -1, 0
	s_cmp_eq_u32 s42, 1
	v_cndmask_b32_e64 v16, v72, v0, s3
	s_cselect_b32 s3, -1, 0
	v_cndmask_b32_e32 v14, v14, v0, vcc_lo
	v_cndmask_b32_e64 v15, v15, v0, s3
	v_cndmask_b32_e64 v11, v11, v0, s2
	v_cndmask_b32_e64 v17, v2, v0, s1
	v_cndmask_b32_e64 v18, v1, v0, s0
	v_perm_b32 v1, v14, v13, 0x5040100
	v_perm_b32 v0, v15, v16, 0x5040100
	v_perm_b32 v2, v11, v12, 0x5040100
	v_perm_b32 v3, v17, v3, 0x5040100
	v_perm_b32 v4, v18, v4, 0x5040100
	v_perm_b32 v5, v10, v5, 0x5040100
	v_perm_b32 v6, v9, v6, 0x5040100
	v_perm_b32 v7, v8, v7, 0x5040100
	s_add_i32 s42, s42, 1
	s_cbranch_execnz .LBB15_6
.LBB15_8:
	s_clause 0x2
	scratch_load_b32 v8, off, off offset:28
	scratch_load_b32 v9, off, off offset:32
	scratch_load_b64 v[41:42], off, off offset:16
	s_mov_b32 s42, 0
	s_waitcnt vmcnt(2)
	v_ashrrev_i32_e32 v5, 31, v8
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)
	v_lshrrev_b32_e32 v10, 28, v5
	v_add_nc_u32_e32 v8, v8, v10
	v_mov_b32_e32 v0, 0
	s_delay_alu instid0(VALU_DEP_1)
	v_mov_b32_e32 v7, v0
	v_mov_b32_e32 v1, v0
	v_mov_b32_e32 v2, v0
	v_mov_b32_e32 v3, v0
	v_mov_b32_e32 v4, v0
	v_mov_b32_e32 v5, v0
	v_mov_b32_e32 v6, v0
	v_mov_b32_e32 v95, v7
	s_delay_alu instid0(VALU_DEP_4) | instskip(NEXT) | instid1(VALU_DEP_3)
	v_dual_mov_b32 v91, v3 :: v_dual_mov_b32 v92, v4
	v_dual_mov_b32 v93, v5 :: v_dual_mov_b32 v94, v6
	v_dual_mov_b32 v90, v2 :: v_dual_mov_b32 v89, v1
	v_dual_mov_b32 v88, v0 :: v_dual_and_b32 v1, -16, v8
	v_ashrrev_i32_e32 v45, 4, v8
	scratch_store_b32 off, v0, off offset:36
	v_wmma_f32_16x16x16_f16 v[88:95], v[72:79], v[56:63], v[88:95]
	s_waitcnt vmcnt(1)
	v_add_nc_u32_e32 v43, v9, v1
	s_branch .LBB15_10
	.p2align	6
.LBB15_9:
                                        ; implicit-def: $sgpr42
                                        ; implicit-def: $vgpr43
                                        ; implicit-def: $vgpr45
	s_branch .LBB15_12
.LBB15_10:                              ; =>This Inner Loop Header: Depth=1
	s_cmp_lt_i32 s42, 8
	s_cbranch_scc0 .LBB15_9
; %bb.11:                               ;   in Loop: Header=BB15_10 Depth=1
	s_delay_alu instid0(VALU_DEP_1)
	v_ashrrev_i32_e32 v44, 31, v43
	s_mov_b32 m0, s42
	v_mov_b32_e32 v31, v40
	v_movrels_b32_e32 v2, v88
	s_add_u32 s8, s36, 24
	v_lshlrev_b64 v[0:1], 1, v[43:44]
	s_addc_u32 s9, s37, 0
	s_mov_b64 s[4:5], s[34:35]
	s_mov_b64 s[10:11], s[38:39]
	s_mov_b32 s12, s41
	s_mov_b32 s13, s40
	s_waitcnt vmcnt(0)
	v_add_co_u32 v0, vcc_lo, v41, v0
	v_add_co_ci_u32_e32 v1, vcc_lo, v42, v1, vcc_lo
	s_mov_b32 s14, s33
	scratch_store_b32 off, v45, off offset:40
	s_getpc_b64 s[0:1]
	s_add_u32 s0, s0, _ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_@rel32@lo+4
	s_addc_u32 s1, s1, _ZN6__halfaSIfTnPNSt9enable_ifIXtlSt17is_floating_pointIT_EEEvE4typeELPv0EEERS_S3_@rel32@hi+12
	s_delay_alu instid0(SALU_CYCLE_1)
	s_swappc_b64 s[30:31], s[0:1]
	v_add_nc_u32_e32 v43, 32, v43
	v_add_nc_u32_e32 v45, 2, v45
	s_add_i32 s42, s42, 1
	s_cbranch_execnz .LBB15_10
.LBB15_12:
	s_endpgm
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
	.amdhsa_kernel _Z11wmma_matmulP6__halfS0_S0_
		.amdhsa_group_segment_fixed_size 32768
		.amdhsa_private_segment_fixed_size 64
		.amdhsa_kernarg_size 280
		.amdhsa_user_sgpr_count 6
		.amdhsa_user_sgpr_dispatch_ptr 1
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_wavefront_size32 1
		.amdhsa_uses_dynamic_stack 1
		.amdhsa_enable_private_segment 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 1
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 2
		.amdhsa_next_free_vgpr 96
		.amdhsa_next_free_sgpr 43
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_workgroup_processor_mode 1
		.amdhsa_memory_ordered 1
		.amdhsa_forward_progress 0
		.amdhsa_shared_vgpr_count 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end15:
	.size	_Z11wmma_matmulP6__halfS0_S0_, .Lfunc_end15-_Z11wmma_matmulP6__halfS0_S0_
                                        ; -- End function
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 1724
; NumSgprs: 45
; NumVgprs: 96
; ScratchSize: 64
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 32768 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 11
; NumSGPRsForWavesPerEU: 45
; NumVGPRsForWavesPerEU: 96
; Occupancy: 16
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 1
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
	.text
	.p2alignl 7, 3214868480
	.fill 96, 4, 3214868480
	.protected	blockIdx
	.protected	blockDim
	.protected	threadIdx
	.type	__hip_cuid_14964d5225368b69,@object ; @__hip_cuid_14964d5225368b69
	.section	.bss,"aw",@nobits
	.globl	__hip_cuid_14964d5225368b69
__hip_cuid_14964d5225368b69:
	.byte	0                               ; 0x0
	.size	__hip_cuid_14964d5225368b69, 1

	.hidden	__oclc_ABI_version              ; @__oclc_ABI_version
	.type	__oclc_ABI_version,@object
	.section	.rodata,"a",@progbits
	.weak	__oclc_ABI_version
	.p2align	2, 0x0
__oclc_ABI_version:
	.long	500                             ; 0x1f4
	.size	__oclc_ABI_version, 4

	.weak	blockIdx
	.weak	blockDim
	.weak	threadIdx
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.ident	"AMD clang version 18.0.0git (https://github.com/RadeonOpenCompute/llvm-project roc-6.2.3 24355 77cf9ad00e298ed06e06aec0f81009510f545714)"
	.section	".note.GNU-stack","",@progbits
	.amdgpu_metadata
---
amdhsa.kernels:
  - .args:
      - .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .offset:         24
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         28
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         32
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         36
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         38
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         40
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         42
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         44
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         46
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         64
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         72
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         80
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         88
        .size:           2
        .value_kind:     hidden_grid_dims
      - .offset:         104
        .size:           8
        .value_kind:     hidden_hostcall_buffer
      - .offset:         112
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
      - .offset:         120
        .size:           8
        .value_kind:     hidden_heap_v1
      - .offset:         128
        .size:           8
        .value_kind:     hidden_default_queue
      - .offset:         224
        .size:           8
        .value_kind:     hidden_queue_ptr
    .group_segment_fixed_size: 32768
    .kernarg_segment_align: 8
    .kernarg_segment_size: 280
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z11wmma_matmulP6__halfS0_S0_
    .private_segment_fixed_size: 64
    .sgpr_count:     45
    .sgpr_spill_count: 0
    .symbol:         _Z11wmma_matmulP6__halfS0_S0_.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: true
    .vgpr_count:     96
    .vgpr_spill_count: 0
    .wavefront_size: 32
    .workgroup_processor_mode: 1
amdhsa.target:   amdgcn-amd-amdhsa--gfx1101
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
