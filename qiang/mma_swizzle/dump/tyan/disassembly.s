
43929_gfx1100_code_object_id_1.out:	file format elf64-amdgpu

Disassembly of section .text:

0000000000007000 <__amd_rocclr_fillBufferAligned>:
	s_clause 0x3                                               // 000000007000: BF850003
	s_load_b32 s2, s[0:1], 0x34                                // 000000007004: F4000080 F8000034
	s_load_b256 s[4:11], s[0:1], null                          // 00000000700C: F40C0100 F8000000
	s_load_b32 s3, s[0:1], 0x50                                // 000000007014: F40000C0 F8000050
	s_load_b32 s0, s[0:1], 0x20                                // 00000000701C: F4000000 F8000020
	v_mov_b32_e32 v1, 0                                        // 000000007024: 7E020280
	s_waitcnt lgkmcnt(0)                                       // 000000007028: BF89FC07
	s_and_b32 s1, s2, 0xffff                                   // 00000000702C: 8B01FF02 0000FFFF
	s_mov_b32 s2, -1                                           // 000000007034: BE8200C1
	s_mul_i32 s15, s15, s1                                     // 000000007038: 960F010F
	s_add_i32 s1, s9, -2                                       // 00000000703C: 8101C209
	v_add3_u32 v0, s3, s15, v0                                 // 000000007040: D6550000 04001E03
	v_alignbit_b32 v2, s1, s1, 1                               // 000000007048: D6160002 02040201
	s_mov_b32 s9, 0                                            // 000000007050: BE890080
	s_mov_b32 s1, 0                                            // 000000007054: BE810080
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007058: BF870112
	v_mul_lo_u32 v0, v0, s8                                    // 00000000705C: D72C0000 00001100
	v_cmp_gt_i32_e32 vcc_lo, 3, v2                             // 000000007064: 7C880483
	v_readfirstlane_b32 s14, v2                                // 000000007068: 7E1C0502
	s_cbranch_vccnz 138                                        // 00000000706C: BFA4008A <__amd_rocclr_fillBufferAligned+0x298>
	s_delay_alu instid0(VALU_DEP_1)                            // 000000007070: BF870001
	s_cmp_gt_i32 s14, 6                                        // 000000007074: BF02860E
	s_cbranch_scc0 73                                          // 000000007078: BFA10049 <__amd_rocclr_fillBufferAligned+0x1a0>
	s_cmp_eq_u32 s14, 7                                        // 00000000707C: BF06870E
	s_mov_b32 s1, -1                                           // 000000007080: BE8100C1
	s_cbranch_scc0 69                                          // 000000007084: BFA10045 <__amd_rocclr_fillBufferAligned+0x19c>
	v_lshlrev_b64 v[2:3], 4, v[0:1]                            // 000000007088: D73C0002 00020084
	s_mov_b32 s15, exec_lo                                     // 000000007090: BE8F007E
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007094: BF870111
	v_add_co_u32 v2, vcc_lo, s4, v2                            // 000000007098: D7006A02 00020404
	v_add_co_ci_u32_e32 v3, vcc_lo, s5, v3, vcc_lo             // 0000000070A0: 40060605
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000070A4: BF870001
	v_cmpx_gt_u64_e64 s[10:11], v[2:3]                         // 0000000070A8: D4DC007E 0002040A
	s_cbranch_execz 55                                         // 0000000070B0: BFA50037 <__amd_rocclr_fillBufferAligned+0x190>
	s_cmp_lg_u32 s8, 0                                         // 0000000070B4: BF078008
	s_mov_b32 s1, 0                                            // 0000000070B8: BE810080
	s_cselect_b32 s16, -1, 0                                   // 0000000070BC: 981080C1
	s_lshl_b64 s[2:3], s[0:1], 4                               // 0000000070C0: 84828400
	s_set_inst_prefetch_distance 0x1                           // 0000000070C4: BF840001
	s_branch 21                                                // 0000000070C8: BFA00015 <__amd_rocclr_fillBufferAligned+0x120>
	s_nop 0                                                    // 0000000070CC: BF800000
	s_nop 0                                                    // 0000000070D0: BF800000
	s_nop 0                                                    // 0000000070D4: BF800000
	s_nop 0                                                    // 0000000070D8: BF800000
	s_nop 0                                                    // 0000000070DC: BF800000
	s_nop 0                                                    // 0000000070E0: BF800000
	s_nop 0                                                    // 0000000070E4: BF800000
	s_nop 0                                                    // 0000000070E8: BF800000
	s_nop 0                                                    // 0000000070EC: BF800000
	s_nop 0                                                    // 0000000070F0: BF800000
	s_nop 0                                                    // 0000000070F4: BF800000
	s_nop 0                                                    // 0000000070F8: BF800000
	s_nop 0                                                    // 0000000070FC: BF800000
	v_add_co_u32 v2, vcc_lo, v2, s2                            // 000000007100: D7006A02 00000502
	v_add_co_ci_u32_e32 v3, vcc_lo, s3, v3, vcc_lo             // 000000007108: 40060603
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000710C: BF8704A1
	v_cmp_le_u64_e32 vcc_lo, s[10:11], v[2:3]                  // 000000007110: 7CB6040A
	s_or_b32 s1, vcc_lo, s1                                    // 000000007114: 8C01016A
	s_and_not1_b32 exec_lo, exec_lo, s1                        // 000000007118: 917E017E
	s_cbranch_execz 28                                         // 00000000711C: BFA5001C <__amd_rocclr_fillBufferAligned+0x190>
	s_and_not1_b32 vcc_lo, exec_lo, s16                        // 000000007120: 916A107E
	s_cbranch_vccnz 65526                                      // 000000007124: BFA4FFF6 <__amd_rocclr_fillBufferAligned+0x100>
	s_mov_b64 s[12:13], 0                                      // 000000007128: BE8C0180
	s_mov_b32 s17, s8                                          // 00000000712C: BE910008
	s_nop 0                                                    // 000000007130: BF800000
	s_nop 0                                                    // 000000007134: BF800000
	s_nop 0                                                    // 000000007138: BF800000
	s_nop 0                                                    // 00000000713C: BF800000
	s_add_u32 s18, s6, s12                                     // 000000007140: 80120C06
	s_addc_u32 s19, s7, s13                                    // 000000007144: 82130D07
	v_add_co_u32 v8, vcc_lo, v2, s12                           // 000000007148: D7006A08 00001902
	s_load_b128 s[20:23], s[18:19], null                       // 000000007150: F4080509 F8000000
	v_add_co_ci_u32_e32 v9, vcc_lo, s13, v3, vcc_lo            // 000000007158: 4012060D
	s_add_i32 s17, s17, -1                                     // 00000000715C: 8111C111
	s_add_u32 s12, s12, 16                                     // 000000007160: 800C900C
	s_addc_u32 s13, s13, 0                                     // 000000007164: 820D800D
	s_cmp_eq_u32 s17, 0                                        // 000000007168: BF068011
	s_waitcnt lgkmcnt(0)                                       // 00000000716C: BF89FC07
	v_dual_mov_b32 v4, s20 :: v_dual_mov_b32 v5, s21           // 000000007170: CA100014 04040015
	v_dual_mov_b32 v6, s22 :: v_dual_mov_b32 v7, s23           // 000000007178: CA100016 06060017
	global_store_b128 v[8:9], v[4:7], off                      // 000000007180: DC760000 007C0408
	s_cbranch_scc0 65517                                       // 000000007188: BFA1FFED <__amd_rocclr_fillBufferAligned+0x140>
	s_branch 65500                                             // 00000000718C: BFA0FFDC <__amd_rocclr_fillBufferAligned+0x100>
	s_set_inst_prefetch_distance 0x2                           // 000000007190: BF840002
	s_or_b32 exec_lo, exec_lo, s15                             // 000000007194: 8C7E0F7E
	s_mov_b32 s1, 0                                            // 000000007198: BE810080
	s_mov_b32 s2, 0                                            // 00000000719C: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000071A0: BF870009
	s_and_b32 vcc_lo, exec_lo, s2                              // 0000000071A4: 8B6A027E
	s_cbranch_vccz 58                                          // 0000000071A8: BFA3003A <__amd_rocclr_fillBufferAligned+0x294>
	s_cmp_eq_u32 s14, 3                                        // 0000000071AC: BF06830E
	s_mov_b32 s1, -1                                           // 0000000071B0: BE8100C1
	s_cbranch_scc0 55                                          // 0000000071B4: BFA10037 <__amd_rocclr_fillBufferAligned+0x294>
	v_lshlrev_b64 v[2:3], 3, v[0:1]                            // 0000000071B8: D73C0002 00020083
	s_mov_b32 s15, exec_lo                                     // 0000000071C0: BE8F007E
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000071C4: BF870111
	v_add_co_u32 v2, vcc_lo, s4, v2                            // 0000000071C8: D7006A02 00020404
	v_add_co_ci_u32_e32 v3, vcc_lo, s5, v3, vcc_lo             // 0000000071D0: 40060605
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000071D4: BF870001
	v_cmpx_gt_u64_e64 s[10:11], v[2:3]                         // 0000000071D8: D4DC007E 0002040A
	s_cbranch_execz 41                                         // 0000000071E0: BFA50029 <__amd_rocclr_fillBufferAligned+0x288>
	s_cmp_lg_u32 s8, 0                                         // 0000000071E4: BF078008
	s_mov_b32 s1, 0                                            // 0000000071E8: BE810080
	s_cselect_b32 s16, -1, 0                                   // 0000000071EC: 981080C1
	s_lshl_b64 s[2:3], s[0:1], 3                               // 0000000071F0: 84828300
	s_set_inst_prefetch_distance 0x1                           // 0000000071F4: BF840001
	s_branch 9                                                 // 0000000071F8: BFA00009 <__amd_rocclr_fillBufferAligned+0x220>
	s_nop 0                                                    // 0000000071FC: BF800000
	v_add_co_u32 v2, vcc_lo, v2, s2                            // 000000007200: D7006A02 00000502
	v_add_co_ci_u32_e32 v3, vcc_lo, s3, v3, vcc_lo             // 000000007208: 40060603
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000720C: BF8704A1
	v_cmp_le_u64_e32 vcc_lo, s[10:11], v[2:3]                  // 000000007210: 7CB6040A
	s_or_b32 s1, vcc_lo, s1                                    // 000000007214: 8C01016A
	s_and_not1_b32 exec_lo, exec_lo, s1                        // 000000007218: 917E017E
	s_cbranch_execz 26                                         // 00000000721C: BFA5001A <__amd_rocclr_fillBufferAligned+0x288>
	s_and_not1_b32 vcc_lo, exec_lo, s16                        // 000000007220: 916A107E
	s_cbranch_vccnz 65526                                      // 000000007224: BFA4FFF6 <__amd_rocclr_fillBufferAligned+0x200>
	s_mov_b64 s[12:13], 0                                      // 000000007228: BE8C0180
	s_mov_b32 s17, s8                                          // 00000000722C: BE910008
	s_nop 0                                                    // 000000007230: BF800000
	s_nop 0                                                    // 000000007234: BF800000
	s_nop 0                                                    // 000000007238: BF800000
	s_nop 0                                                    // 00000000723C: BF800000
	s_add_u32 s18, s6, s12                                     // 000000007240: 80120C06
	s_addc_u32 s19, s7, s13                                    // 000000007244: 82130D07
	v_add_co_u32 v4, vcc_lo, v2, s12                           // 000000007248: D7006A04 00001902
	s_load_b64 s[18:19], s[18:19], null                        // 000000007250: F4040489 F8000000
	v_add_co_ci_u32_e32 v5, vcc_lo, s13, v3, vcc_lo            // 000000007258: 400A060D
	s_add_i32 s17, s17, -1                                     // 00000000725C: 8111C111
	s_add_u32 s12, s12, 8                                      // 000000007260: 800C880C
	s_addc_u32 s13, s13, 0                                     // 000000007264: 820D800D
	s_cmp_eq_u32 s17, 0                                        // 000000007268: BF068011
	s_waitcnt lgkmcnt(0)                                       // 00000000726C: BF89FC07
	v_dual_mov_b32 v6, s18 :: v_dual_mov_b32 v7, s19           // 000000007270: CA100012 06060013
	global_store_b64 v[4:5], v[6:7], off                       // 000000007278: DC6E0000 007C0604
	s_cbranch_scc0 65519                                       // 000000007280: BFA1FFEF <__amd_rocclr_fillBufferAligned+0x240>
	s_branch 65502                                             // 000000007284: BFA0FFDE <__amd_rocclr_fillBufferAligned+0x200>
	s_set_inst_prefetch_distance 0x2                           // 000000007288: BF840002
	s_or_b32 exec_lo, exec_lo, s15                             // 00000000728C: 8C7E0F7E
	s_mov_b32 s1, 0                                            // 000000007290: BE810080
	s_mov_b32 s2, 0                                            // 000000007294: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000007298: BF870009
	s_and_b32 vcc_lo, exec_lo, s2                              // 00000000729C: 8B6A027E
	s_cbranch_vccz 78                                          // 0000000072A0: BFA3004E <__amd_rocclr_fillBufferAligned+0x3dc>
	s_mov_b32 s2, -1                                           // 0000000072A4: BE8200C1
	s_cmp_gt_i32 s14, 0                                        // 0000000072A8: BF02800E
	s_mov_b32 s9, 0                                            // 0000000072AC: BE890080
	s_cbranch_scc0 68                                          // 0000000072B0: BFA10044 <__amd_rocclr_fillBufferAligned+0x3c4>
	s_cmp_eq_u32 s14, 1                                        // 0000000072B4: BF06810E
	s_mov_b32 s1, -1                                           // 0000000072B8: BE8100C1
	s_cbranch_scc0 64                                          // 0000000072BC: BFA10040 <__amd_rocclr_fillBufferAligned+0x3c0>
	v_lshlrev_b64 v[2:3], 2, v[0:1]                            // 0000000072C0: D73C0002 00020082
	s_mov_b32 s15, exec_lo                                     // 0000000072C8: BE8F007E
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000072CC: BF870111
	v_add_co_u32 v2, vcc_lo, s4, v2                            // 0000000072D0: D7006A02 00020404
	v_add_co_ci_u32_e32 v3, vcc_lo, s5, v3, vcc_lo             // 0000000072D8: 40060605
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000072DC: BF870001
	v_cmpx_gt_u64_e64 s[10:11], v[2:3]                         // 0000000072E0: D4DC007E 0002040A
	s_cbranch_execz 50                                         // 0000000072E8: BFA50032 <__amd_rocclr_fillBufferAligned+0x3b4>
	s_cmp_lg_u32 s8, 0                                         // 0000000072EC: BF078008
	s_mov_b32 s1, 0                                            // 0000000072F0: BE810080
	s_cselect_b32 s16, -1, 0                                   // 0000000072F4: 981080C1
	s_lshl_b64 s[2:3], s[0:1], 2                               // 0000000072F8: 84828200
	s_set_inst_prefetch_distance 0x1                           // 0000000072FC: BF840001
	s_branch 23                                                // 000000007300: BFA00017 <__amd_rocclr_fillBufferAligned+0x360>
	s_nop 0                                                    // 000000007304: BF800000
	s_nop 0                                                    // 000000007308: BF800000
	s_nop 0                                                    // 00000000730C: BF800000
	s_nop 0                                                    // 000000007310: BF800000
	s_nop 0                                                    // 000000007314: BF800000
	s_nop 0                                                    // 000000007318: BF800000
	s_nop 0                                                    // 00000000731C: BF800000
	s_nop 0                                                    // 000000007320: BF800000
	s_nop 0                                                    // 000000007324: BF800000
	s_nop 0                                                    // 000000007328: BF800000
	s_nop 0                                                    // 00000000732C: BF800000
	s_nop 0                                                    // 000000007330: BF800000
	s_nop 0                                                    // 000000007334: BF800000
	s_nop 0                                                    // 000000007338: BF800000
	s_nop 0                                                    // 00000000733C: BF800000
	v_add_co_u32 v2, vcc_lo, v2, s2                            // 000000007340: D7006A02 00000502
	v_add_co_ci_u32_e32 v3, vcc_lo, s3, v3, vcc_lo             // 000000007348: 40060603
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000734C: BF8704A1
	v_cmp_le_u64_e32 vcc_lo, s[10:11], v[2:3]                  // 000000007350: 7CB6040A
	s_or_b32 s1, vcc_lo, s1                                    // 000000007354: 8C01016A
	s_and_not1_b32 exec_lo, exec_lo, s1                        // 000000007358: 917E017E
	s_cbranch_execz 21                                         // 00000000735C: BFA50015 <__amd_rocclr_fillBufferAligned+0x3b4>
	s_and_not1_b32 vcc_lo, exec_lo, s16                        // 000000007360: 916A107E
	s_cbranch_vccnz 65526                                      // 000000007364: BFA4FFF6 <__amd_rocclr_fillBufferAligned+0x340>
	s_mov_b64 s[12:13], 0                                      // 000000007368: BE8C0180
	s_mov_b32 s17, s8                                          // 00000000736C: BE910008
	s_add_u32 s18, s6, s12                                     // 000000007370: 80120C06
	s_addc_u32 s19, s7, s13                                    // 000000007374: 82130D07
	v_add_co_u32 v4, vcc_lo, v2, s12                           // 000000007378: D7006A04 00001902
	s_load_b32 s18, s[18:19], null                             // 000000007380: F4000489 F8000000
	v_add_co_ci_u32_e32 v5, vcc_lo, s13, v3, vcc_lo            // 000000007388: 400A060D
	s_add_i32 s17, s17, -1                                     // 00000000738C: 8111C111
	s_add_u32 s12, s12, 4                                      // 000000007390: 800C840C
	s_addc_u32 s13, s13, 0                                     // 000000007394: 820D800D
	s_cmp_eq_u32 s17, 0                                        // 000000007398: BF068011
	s_waitcnt lgkmcnt(0)                                       // 00000000739C: BF89FC07
	v_mov_b32_e32 v6, s18                                      // 0000000073A0: 7E0C0212
	global_store_b32 v[4:5], v6, off                           // 0000000073A4: DC6A0000 007C0604
	s_cbranch_scc0 65520                                       // 0000000073AC: BFA1FFF0 <__amd_rocclr_fillBufferAligned+0x370>
	s_branch 65507                                             // 0000000073B0: BFA0FFE3 <__amd_rocclr_fillBufferAligned+0x340>
	s_set_inst_prefetch_distance 0x2                           // 0000000073B4: BF840002
	s_or_b32 exec_lo, exec_lo, s15                             // 0000000073B8: 8C7E0F7E
	s_mov_b32 s1, 0                                            // 0000000073BC: BE810080
	s_mov_b32 s2, 0                                            // 0000000073C0: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000073C4: BF870009
	s_and_b32 vcc_lo, exec_lo, s2                              // 0000000073C8: 8B6A027E
	s_cbranch_vccz 3                                           // 0000000073CC: BFA30003 <__amd_rocclr_fillBufferAligned+0x3dc>
	s_cmp_lg_u32 s14, 0                                        // 0000000073D0: BF07800E
	s_mov_b32 s9, -1                                           // 0000000073D4: BE8900C1
	s_cselect_b32 s1, -1, 0                                    // 0000000073D8: 980180C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000073DC: BF870009
	s_and_b32 vcc_lo, exec_lo, s1                              // 0000000073E0: 8B6A017E
	s_cbranch_vccz 51                                          // 0000000073E4: BFA30033 <__amd_rocclr_fillBufferAligned+0x4b4>
	v_add_co_u32 v2, s1, s4, v0                                // 0000000073E8: D7000102 00020004
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 0000000073F0: BF8700A1
	v_add_co_ci_u32_e64 v3, null, s5, 0, s1                    // 0000000073F4: D5207C03 00050005
	s_mov_b32 s1, exec_lo                                      // 0000000073FC: BE81007E
	v_cmpx_gt_u64_e64 s[10:11], v[2:3]                         // 000000007400: D4DC007E 0002040A
	s_cbranch_execz 40                                         // 000000007408: BFA50028 <__amd_rocclr_fillBufferAligned+0x4ac>
	v_mov_b32_e32 v4, 0                                        // 00000000740C: 7E080280
	s_cmp_lg_u32 s8, 0                                         // 000000007410: BF078008
	s_mov_b32 s12, 0                                           // 000000007414: BE8C0080
	s_cselect_b32 s9, -1, 0                                    // 000000007418: 980980C1
	s_branch 16                                                // 00000000741C: BFA00010 <__amd_rocclr_fillBufferAligned+0x460>
	s_nop 0                                                    // 000000007420: BF800000
	s_nop 0                                                    // 000000007424: BF800000
	s_nop 0                                                    // 000000007428: BF800000
	s_nop 0                                                    // 00000000742C: BF800000
	s_nop 0                                                    // 000000007430: BF800000
	s_nop 0                                                    // 000000007434: BF800000
	s_nop 0                                                    // 000000007438: BF800000
	s_nop 0                                                    // 00000000743C: BF800000
	v_add_co_u32 v2, vcc_lo, v2, s0                            // 000000007440: D7006A02 00000102
	v_add_co_ci_u32_e32 v3, vcc_lo, 0, v3, vcc_lo              // 000000007448: 40060680
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000744C: BF8704A1
	v_cmp_le_u64_e32 vcc_lo, s[10:11], v[2:3]                  // 000000007450: 7CB6040A
	s_or_b32 s12, vcc_lo, s12                                  // 000000007454: 8C0C0C6A
	s_and_not1_b32 exec_lo, exec_lo, s12                       // 000000007458: 917E0C7E
	s_cbranch_execz 19                                         // 00000000745C: BFA50013 <__amd_rocclr_fillBufferAligned+0x4ac>
	s_and_not1_b32 vcc_lo, exec_lo, s9                         // 000000007460: 916A097E
	s_cbranch_vccnz 65526                                      // 000000007464: BFA4FFF6 <__amd_rocclr_fillBufferAligned+0x440>
	s_mov_b64 s[2:3], 0                                        // 000000007468: BE820180
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000746C: BF870009
	s_add_u32 s14, s6, s2                                      // 000000007470: 800E0206
	s_addc_u32 s15, s7, s3                                     // 000000007474: 820F0307
	v_add_co_u32 v5, vcc_lo, v2, s2                            // 000000007478: D7006A05 00000502
	global_load_u8 v7, v4, s[14:15]                            // 000000007480: DC420000 070E0004
	v_add_co_ci_u32_e32 v6, vcc_lo, s3, v3, vcc_lo             // 000000007488: 400C0603
	s_add_u32 s2, s2, 1                                        // 00000000748C: 80028102
	s_addc_u32 s3, s3, 0                                       // 000000007490: 82038003
	s_cmp_eq_u32 s8, s2                                        // 000000007494: BF060208
	s_waitcnt vmcnt(0)                                         // 000000007498: BF8903F7
	global_store_b8 v[5:6], v7, off                            // 00000000749C: DC620000 007C0705
	s_cbranch_scc0 65521                                       // 0000000074A4: BFA1FFF1 <__amd_rocclr_fillBufferAligned+0x46c>
	s_branch 65509                                             // 0000000074A8: BFA0FFE5 <__amd_rocclr_fillBufferAligned+0x440>
	s_or_b32 exec_lo, exec_lo, s1                              // 0000000074AC: 8C7E017E
	s_mov_b32 s9, 0                                            // 0000000074B0: BE890080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000074B4: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s9                         // 0000000074B8: 916A097E
	s_cbranch_vccnz 60                                         // 0000000074BC: BFA4003C <__amd_rocclr_fillBufferAligned+0x5b0>
	v_lshlrev_b64 v[0:1], 1, v[0:1]                            // 0000000074C0: D73C0000 00020081
	s_mov_b32 s1, exec_lo                                      // 0000000074C8: BE81007E
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000074CC: BF870111
	v_add_co_u32 v0, vcc_lo, s4, v0                            // 0000000074D0: D7006A00 00020004
	v_add_co_ci_u32_e32 v1, vcc_lo, s5, v1, vcc_lo             // 0000000074D8: 40020205
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000074DC: BF870001
	v_cmpx_gt_u64_e64 s[10:11], v[0:1]                         // 0000000074E0: D4DC007E 0002000A
	s_cbranch_execz 49                                         // 0000000074E8: BFA50031 <__amd_rocclr_fillBufferAligned+0x5b0>
	v_mov_b32_e32 v2, 0                                        // 0000000074EC: 7E040280
	s_cmp_lg_u32 s8, 0                                         // 0000000074F0: BF078008
	s_mov_b32 s1, 0                                            // 0000000074F4: BE810080
	s_cselect_b32 s9, -1, 0                                    // 0000000074F8: 980980C1
	s_lshl_b64 s[2:3], s[0:1], 1                               // 0000000074FC: 84828100
	s_set_inst_prefetch_distance 0x1                           // 000000007500: BF840001
	s_branch 22                                                // 000000007504: BFA00016 <__amd_rocclr_fillBufferAligned+0x560>
	s_nop 0                                                    // 000000007508: BF800000
	s_nop 0                                                    // 00000000750C: BF800000
	s_nop 0                                                    // 000000007510: BF800000
	s_nop 0                                                    // 000000007514: BF800000
	s_nop 0                                                    // 000000007518: BF800000
	s_nop 0                                                    // 00000000751C: BF800000
	s_nop 0                                                    // 000000007520: BF800000
	s_nop 0                                                    // 000000007524: BF800000
	s_nop 0                                                    // 000000007528: BF800000
	s_nop 0                                                    // 00000000752C: BF800000
	s_nop 0                                                    // 000000007530: BF800000
	s_nop 0                                                    // 000000007534: BF800000
	s_nop 0                                                    // 000000007538: BF800000
	s_nop 0                                                    // 00000000753C: BF800000
	v_add_co_u32 v0, vcc_lo, v0, s2                            // 000000007540: D7006A00 00000500
	v_add_co_ci_u32_e32 v1, vcc_lo, s3, v1, vcc_lo             // 000000007548: 40020203
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000754C: BF8704A1
	v_cmp_le_u64_e32 vcc_lo, s[10:11], v[0:1]                  // 000000007550: 7CB6000A
	s_or_b32 s1, vcc_lo, s1                                    // 000000007554: 8C01016A
	s_and_not1_b32 exec_lo, exec_lo, s1                        // 000000007558: 917E017E
	s_cbranch_execz 20                                         // 00000000755C: BFA50014 <__amd_rocclr_fillBufferAligned+0x5b0>
	s_and_not1_b32 vcc_lo, exec_lo, s9                         // 000000007560: 916A097E
	s_cbranch_vccnz 65526                                      // 000000007564: BFA4FFF6 <__amd_rocclr_fillBufferAligned+0x540>
	s_mov_b64 s[4:5], 0                                        // 000000007568: BE840180
	s_mov_b32 s0, s8                                           // 00000000756C: BE800008
	s_add_u32 s12, s6, s4                                      // 000000007570: 800C0406
	s_addc_u32 s13, s7, s5                                     // 000000007574: 820D0507
	v_add_co_u32 v3, vcc_lo, v0, s4                            // 000000007578: D7006A03 00000900
	global_load_u16 v5, v2, s[12:13]                           // 000000007580: DC4A0000 050C0002
	v_add_co_ci_u32_e32 v4, vcc_lo, s5, v1, vcc_lo             // 000000007588: 40080205
	s_add_i32 s0, s0, -1                                       // 00000000758C: 8100C100
	s_add_u32 s4, s4, 2                                        // 000000007590: 80048204
	s_addc_u32 s5, s5, 0                                       // 000000007594: 82058005
	s_cmp_eq_u32 s0, 0                                         // 000000007598: BF068000
	s_waitcnt vmcnt(0)                                         // 00000000759C: BF8903F7
	global_store_b16 v[3:4], v5, off                           // 0000000075A0: DC660000 007C0503
	s_cbranch_scc0 65521                                       // 0000000075A8: BFA1FFF1 <__amd_rocclr_fillBufferAligned+0x570>
	s_branch 65508                                             // 0000000075AC: BFA0FFE4 <__amd_rocclr_fillBufferAligned+0x540>
	s_set_inst_prefetch_distance 0x2                           // 0000000075B0: BF840002
	s_nop 0                                                    // 0000000075B4: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 0000000075B8: BFB60003
	s_endpgm                                                   // 0000000075BC: BFB00000
	s_nop 0                                                    // 0000000075C0: BF800000
	s_nop 0                                                    // 0000000075C4: BF800000
	s_nop 0                                                    // 0000000075C8: BF800000
	s_nop 0                                                    // 0000000075CC: BF800000
	s_nop 0                                                    // 0000000075D0: BF800000
	s_nop 0                                                    // 0000000075D4: BF800000
	s_nop 0                                                    // 0000000075D8: BF800000
	s_nop 0                                                    // 0000000075DC: BF800000
	s_nop 0                                                    // 0000000075E0: BF800000
	s_nop 0                                                    // 0000000075E4: BF800000
	s_nop 0                                                    // 0000000075E8: BF800000
	s_nop 0                                                    // 0000000075EC: BF800000
	s_nop 0                                                    // 0000000075F0: BF800000
	s_nop 0                                                    // 0000000075F4: BF800000
	s_nop 0                                                    // 0000000075F8: BF800000
	s_nop 0                                                    // 0000000075FC: BF800000

0000000000007600 <__amd_rocclr_fillBufferAligned2D>:
	s_clause 0x1                                               // 000000007600: BF850001
	s_load_b32 s2, s[0:1], 0x5c                                // 000000007604: F4000080 F800005C
	s_load_b128 s[20:23], s[0:1], 0x78                         // 00000000760C: F4080500 F8000078
	v_and_b32_e32 v2, 0x3ff, v0                                // 000000007614: 360400FF 000003FF
	v_bfe_u32 v3, v0, 10, 10                                   // 00000000761C: D6100003 02291500
	s_load_b256 s[4:11], s[0:1], 0x30                          // 000000007624: F40C0100 F8000030
	s_waitcnt lgkmcnt(0)                                       // 00000000762C: BF89FC07
	s_and_b32 s3, s2, 0xffff                                   // 000000007630: 8B03FF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000007638: 85029002
	v_mad_u64_u32 v[0:1], null, s14, s3, v[2:3]                // 00000000763C: D6FE7C00 0408060E
	v_mad_u64_u32 v[1:2], null, s15, s2, v[3:4]                // 000000007644: D6FE7C01 040C040F
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)// 00000000764C: BF870092
	v_add_co_u32 v3, s2, s20, v0                               // 000000007650: D7000203 00020014
	v_add_co_ci_u32_e64 v4, null, s21, 0, s2                   // 000000007658: D5207C04 00090015
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000007660: BF870093
	v_add_co_u32 v5, s2, s22, v1                               // 000000007664: D7000205 00020216
	v_add_co_ci_u32_e64 v6, null, s23, 0, s2                   // 00000000766C: D5207C06 00090017
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007674: BF870113
	v_cmp_gt_u64_e32 vcc_lo, s[6:7], v[3:4]                    // 000000007678: 7CB80606
	v_cmp_gt_u64_e64 s2, s[8:9], v[5:6]                        // 00000000767C: D45C0002 00020A08
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)// 000000007684: BF870491
	s_and_b32 s2, vcc_lo, s2                                   // 000000007688: 8B02026A
	s_and_saveexec_b32 s3, s2                                  // 00000000768C: BE832002
	s_cbranch_execz 151                                        // 000000007690: BFA50097 <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_clause 0x2                                               // 000000007694: BF850002
	s_load_b256 s[12:19], s[0:1], null                         // 000000007698: F40C0300 F8000000
	s_load_b64 s[2:3], s[0:1], 0x20                            // 0000000076A0: F4040080 F8000020
	s_load_b32 s6, s[0:1], 0x28                                // 0000000076A8: F4000180 F8000028
	v_mul_lo_u32 v6, v6, s10                                   // 0000000076B0: D72C0006 00001506
	v_mul_lo_u32 v7, v5, s11                                   // 0000000076B8: D72C0007 00001705
	v_mad_u64_u32 v[1:2], null, v5, s10, 0                     // 0000000076C0: D6FE7C01 02001505
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000076C8: BF870111
	v_add3_u32 v2, v2, v7, v6                                  // 0000000076CC: D6550002 041A0F02
	v_add_co_u32 v3, vcc_lo, v1, v3                            // 0000000076D4: D7006A03 00020701
	s_delay_alu instid0(VALU_DEP_2)                            // 0000000076DC: BF870002
	v_add_co_ci_u32_e32 v4, vcc_lo, v2, v4, vcc_lo             // 0000000076E0: 40080902
	s_waitcnt lgkmcnt(0)                                       // 0000000076E4: BF89FC07
	s_cmp_eq_u64 s[18:19], 0                                   // 0000000076E8: BF108012
	s_cbranch_scc1 32                                          // 0000000076EC: BFA20020 <__amd_rocclr_fillBufferAligned2D+0x170>
	s_cmp_eq_u32 s6, 0                                         // 0000000076F0: BF068006
	s_mov_b32 s7, 0                                            // 0000000076F4: BE870080
	s_cbranch_scc1 26                                          // 0000000076F8: BFA2001A <__amd_rocclr_fillBufferAligned2D+0x164>
	v_lshlrev_b64 v[5:6], 3, v[3:4]                            // 0000000076FC: D73C0005 00020683
	s_lshl_b64 s[0:1], s[4:5], 3                               // 000000007704: 84808304
	s_mov_b32 s8, s6                                           // 000000007708: BE880006
	s_add_u32 s0, s18, s0                                      // 00000000770C: 80000012
	s_addc_u32 s1, s19, s1                                     // 000000007710: 82010113
	s_delay_alu instid0(VALU_DEP_1)                            // 000000007714: BF870001
	v_add_co_u32 v5, vcc_lo, s0, v5                            // 000000007718: D7006A05 00020A00
	v_add_co_ci_u32_e32 v6, vcc_lo, s1, v6, vcc_lo             // 000000007720: 400C0C01
	s_mov_b64 s[0:1], s[2:3]                                   // 000000007724: BE800102
	s_load_b64 s[10:11], s[0:1], null                          // 000000007728: F4040280 F8000000
	s_add_i32 s8, s8, -1                                       // 000000007730: 8108C108
	s_add_u32 s0, s0, 8                                        // 000000007734: 80008800
	s_addc_u32 s1, s1, 0                                       // 000000007738: 82018001
	s_cmp_eq_u32 s8, 0                                         // 00000000773C: BF068008
	s_waitcnt lgkmcnt(0)                                       // 000000007740: BF89FC07
	v_dual_mov_b32 v7, s10 :: v_dual_mov_b32 v8, s11           // 000000007744: CA10000A 0708000B
	global_store_b64 v[5:6], v[7:8], off                       // 00000000774C: DC6E0000 007C0705
	v_add_co_u32 v5, vcc_lo, v5, 8                             // 000000007754: D7006A05 00011105
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v6, vcc_lo              // 00000000775C: 400C0C80
	s_cbranch_scc0 65521                                       // 000000007760: BFA1FFF1 <__amd_rocclr_fillBufferAligned2D+0x128>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 000000007764: 916A077E
	s_cbranch_vccz 1                                           // 000000007768: BFA30001 <__amd_rocclr_fillBufferAligned2D+0x170>
	s_branch 96                                                // 00000000776C: BFA00060 <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_cmp_eq_u64 s[16:17], 0                                   // 000000007770: BF108010
	s_cbranch_scc1 31                                          // 000000007774: BFA2001F <__amd_rocclr_fillBufferAligned2D+0x1f4>
	s_cmp_eq_u32 s6, 0                                         // 000000007778: BF068006
	s_mov_b32 s7, 0                                            // 00000000777C: BE870080
	s_cbranch_scc1 25                                          // 000000007780: BFA20019 <__amd_rocclr_fillBufferAligned2D+0x1e8>
	v_lshlrev_b64 v[5:6], 2, v[3:4]                            // 000000007784: D73C0005 00020682
	s_lshl_b64 s[0:1], s[4:5], 2                               // 00000000778C: 84808204
	s_mov_b32 s8, s6                                           // 000000007790: BE880006
	s_add_u32 s0, s16, s0                                      // 000000007794: 80000010
	s_addc_u32 s1, s17, s1                                     // 000000007798: 82010111
	s_delay_alu instid0(VALU_DEP_1)                            // 00000000779C: BF870001
	v_add_co_u32 v5, vcc_lo, s0, v5                            // 0000000077A0: D7006A05 00020A00
	v_add_co_ci_u32_e32 v6, vcc_lo, s1, v6, vcc_lo             // 0000000077A8: 400C0C01
	s_mov_b64 s[0:1], s[2:3]                                   // 0000000077AC: BE800102
	s_load_b32 s9, s[0:1], null                                // 0000000077B0: F4000240 F8000000
	s_add_i32 s8, s8, -1                                       // 0000000077B8: 8108C108
	s_add_u32 s0, s0, 4                                        // 0000000077BC: 80008400
	s_addc_u32 s1, s1, 0                                       // 0000000077C0: 82018001
	s_cmp_eq_u32 s8, 0                                         // 0000000077C4: BF068008
	s_waitcnt lgkmcnt(0)                                       // 0000000077C8: BF89FC07
	v_mov_b32_e32 v7, s9                                       // 0000000077CC: 7E0E0209
	global_store_b32 v[5:6], v7, off                           // 0000000077D0: DC6A0000 007C0705
	v_add_co_u32 v5, vcc_lo, v5, 4                             // 0000000077D8: D7006A05 00010905
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v6, vcc_lo              // 0000000077E0: 400C0C80
	s_cbranch_scc0 65522                                       // 0000000077E4: BFA1FFF2 <__amd_rocclr_fillBufferAligned2D+0x1b0>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 0000000077E8: 916A077E
	s_cbranch_vccz 1                                           // 0000000077EC: BFA30001 <__amd_rocclr_fillBufferAligned2D+0x1f4>
	s_branch 63                                                // 0000000077F0: BFA0003F <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_cmp_eq_u64 s[14:15], 0                                   // 0000000077F4: BF10800E
	s_cbranch_scc1 30                                          // 0000000077F8: BFA2001E <__amd_rocclr_fillBufferAligned2D+0x274>
	s_cmp_eq_u32 s6, 0                                         // 0000000077FC: BF068006
	s_mov_b32 s7, 0                                            // 000000007800: BE870080
	s_cbranch_scc1 24                                          // 000000007804: BFA20018 <__amd_rocclr_fillBufferAligned2D+0x268>
	v_lshlrev_b64 v[3:4], 1, v[3:4]                            // 000000007808: D73C0003 00020681
	s_lshl_b64 s[0:1], s[4:5], 1                               // 000000007810: 84808104
	v_mov_b32_e32 v5, 0                                        // 000000007814: 7E0A0280
	s_add_u32 s0, s14, s0                                      // 000000007818: 8000000E
	s_addc_u32 s1, s15, s1                                     // 00000000781C: 8201010F
	s_mov_b32 s8, s6                                           // 000000007820: BE880006
	v_add_co_u32 v3, vcc_lo, s0, v3                            // 000000007824: D7006A03 00020600
	v_add_co_ci_u32_e32 v4, vcc_lo, s1, v4, vcc_lo             // 00000000782C: 40080801
	s_mov_b64 s[0:1], s[2:3]                                   // 000000007830: BE800102
	global_load_u16 v6, v5, s[0:1]                             // 000000007834: DC4A0000 06000005
	s_add_i32 s8, s8, -1                                       // 00000000783C: 8108C108
	s_add_u32 s0, s0, 2                                        // 000000007840: 80008200
	s_addc_u32 s1, s1, 0                                       // 000000007844: 82018001
	s_cmp_eq_u32 s8, 0                                         // 000000007848: BF068008
	s_waitcnt vmcnt(0)                                         // 00000000784C: BF8903F7
	global_store_b16 v[3:4], v6, off                           // 000000007850: DC660000 007C0603
	v_add_co_u32 v3, vcc_lo, v3, 2                             // 000000007858: D7006A03 00010503
	v_add_co_ci_u32_e32 v4, vcc_lo, 0, v4, vcc_lo              // 000000007860: 40080880
	s_cbranch_scc0 65523                                       // 000000007864: BFA1FFF3 <__amd_rocclr_fillBufferAligned2D+0x234>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 000000007868: 916A077E
	s_cbranch_vccz 1                                           // 00000000786C: BFA30001 <__amd_rocclr_fillBufferAligned2D+0x274>
	s_branch 31                                                // 000000007870: BFA0001F <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_cmp_eq_u64 s[12:13], 0                                   // 000000007874: BF10800C
	s_cbranch_scc1 29                                          // 000000007878: BFA2001D <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_cmp_eq_u32 s6, 0                                         // 00000000787C: BF068006
	s_cbranch_scc1 27                                          // 000000007880: BFA2001B <__amd_rocclr_fillBufferAligned2D+0x2f0>
	s_add_u32 s0, s20, s4                                      // 000000007884: 80000414
	s_addc_u32 s1, s21, s5                                     // 000000007888: 82010515
	v_add_co_u32 v1, vcc_lo, s0, v1                            // 00000000788C: D7006A01 00020200
	v_add_co_ci_u32_e32 v2, vcc_lo, s1, v2, vcc_lo             // 000000007894: 40040401
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007898: BF870112
	v_add_co_u32 v0, vcc_lo, v1, v0                            // 00000000789C: D7006A00 00020101
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v2, vcc_lo              // 0000000078A4: 40020480
	v_mov_b32_e32 v2, 0                                        // 0000000078A8: 7E040280
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 0000000078AC: BF870193
	v_add_co_u32 v0, vcc_lo, s12, v0                           // 0000000078B0: D7006A00 0002000C
	v_add_co_ci_u32_e32 v1, vcc_lo, s13, v1, vcc_lo            // 0000000078B8: 4002020D
	global_load_u8 v3, v2, s[2:3]                              // 0000000078BC: DC420000 03020002
	s_add_i32 s6, s6, -1                                       // 0000000078C4: 8106C106
	s_add_u32 s2, s2, 1                                        // 0000000078C8: 80028102
	s_addc_u32 s3, s3, 0                                       // 0000000078CC: 82038003
	s_cmp_eq_u32 s6, 0                                         // 0000000078D0: BF068006
	s_waitcnt vmcnt(0)                                         // 0000000078D4: BF8903F7
	global_store_b8 v[0:1], v3, off                            // 0000000078D8: DC620000 007C0300
	v_add_co_u32 v0, vcc_lo, v0, 1                             // 0000000078E0: D7006A00 00010300
	v_add_co_ci_u32_e32 v1, vcc_lo, 0, v1, vcc_lo              // 0000000078E8: 40020280
	s_cbranch_scc0 65523                                       // 0000000078EC: BFA1FFF3 <__amd_rocclr_fillBufferAligned2D+0x2bc>
	s_nop 0                                                    // 0000000078F0: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 0000000078F4: BFB60003
	s_endpgm                                                   // 0000000078F8: BFB00000
	s_nop 0                                                    // 0000000078FC: BF800000

0000000000007900 <__amd_rocclr_copyBuffer>:
	s_clause 0x4                                               // 000000007900: BF850004
	s_load_b32 s13, s[0:1], 0x3c                               // 000000007904: F4000340 F800003C
	s_load_b64 s[16:17], s[0:1], 0x58                          // 00000000790C: F4040400 F8000058
	s_load_b256 s[4:11], s[0:1], null                          // 000000007914: F40C0100 F8000000
	s_load_b64 s[2:3], s[0:1], 0x20                            // 00000000791C: F4040080 F8000020
	s_load_b32 s12, s[0:1], 0x28                               // 000000007924: F4000300 F8000028
	s_waitcnt lgkmcnt(0)                                       // 00000000792C: BF89FC07
	s_and_b32 s0, s13, 0xffff                                  // 000000007930: 8B00FF0D 0000FFFF
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000007938: BF8700A9
	v_mad_u64_u32 v[1:2], null, s15, s0, v[0:1]                // 00000000793C: D6FE7C01 0400000F
	s_cmp_eq_u32 s11, 16                                       // 000000007944: BF06900B
	v_add_co_u32 v0, s0, s16, v1                               // 000000007948: D7000000 00020210
	s_delay_alu instid0(VALU_DEP_1)                            // 000000007950: BF870001
	v_add_co_ci_u32_e64 v1, null, s17, 0, s0                   // 000000007954: D5207C01 00010011
	s_mov_b32 s0, -1                                           // 00000000795C: BE8000C1
	s_cbranch_scc1 54                                          // 000000007960: BFA20036 <__amd_rocclr_copyBuffer+0x13c>
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000007964: BF8700A1
	v_lshlrev_b64 v[2:3], 2, v[0:1]                            // 000000007968: D73C0002 00020082
	s_mov_b32 s1, exec_lo                                      // 000000007970: BE81007E
	v_add_co_u32 v4, vcc_lo, s6, v2                            // 000000007974: D7006A04 00020406
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_1)// 00000000797C: BF870092
	v_add_co_ci_u32_e32 v5, vcc_lo, s7, v3, vcc_lo             // 000000007980: 400A0607
	v_cmpx_gt_u64_e64 s[2:3], v[4:5]                           // 000000007984: D4DC007E 00020802
	s_cbranch_execz 41                                         // 00000000798C: BFA50029 <__amd_rocclr_copyBuffer+0x134>
	v_dual_mov_b32 v5, v1 :: v_dual_mov_b32 v4, v0             // 000000007990: CA100101 05040100
	s_mov_b32 s13, 0                                           // 000000007998: BE8D0080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000799C: BF870009
	s_lshl_b64 s[14:15], s[12:13], 2                           // 0000000079A0: 848E820C
	s_nop 0                                                    // 0000000079A4: BF800000
	s_nop 0                                                    // 0000000079A8: BF800000
	s_nop 0                                                    // 0000000079AC: BF800000
	s_nop 0                                                    // 0000000079B0: BF800000
	s_nop 0                                                    // 0000000079B4: BF800000
	s_nop 0                                                    // 0000000079B8: BF800000
	s_nop 0                                                    // 0000000079BC: BF800000
	v_add_co_u32 v6, vcc_lo, s4, v2                            // 0000000079C0: D7006A06 00020404
	v_add_co_ci_u32_e32 v7, vcc_lo, s5, v3, vcc_lo             // 0000000079C8: 400E0605
	v_add_co_u32 v4, vcc_lo, v4, s12                           // 0000000079CC: D7006A04 00001904
	v_add_co_ci_u32_e32 v5, vcc_lo, 0, v5, vcc_lo              // 0000000079D4: 400A0A80
	global_load_b32 v10, v[6:7], off                           // 0000000079D8: DC520000 0A7C0006
	v_lshlrev_b64 v[6:7], 2, v[4:5]                            // 0000000079E0: D73C0006 00020882
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000079E8: BF870111
	v_add_co_u32 v6, vcc_lo, s6, v6                            // 0000000079EC: D7006A06 00020C06
	v_add_co_ci_u32_e32 v7, vcc_lo, s7, v7, vcc_lo             // 0000000079F4: 400E0E07
	v_add_co_u32 v8, vcc_lo, s6, v2                            // 0000000079F8: D7006A08 00020406
	v_add_co_ci_u32_e32 v9, vcc_lo, s7, v3, vcc_lo             // 000000007A00: 40120607
	s_delay_alu instid0(VALU_DEP_3) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000007A04: BF8700A3
	v_cmp_le_u64_e32 vcc_lo, s[2:3], v[6:7]                    // 000000007A08: 7CB60C02
	v_add_co_u32 v2, s0, v2, s14                               // 000000007A0C: D7000002 00001D02
	v_add_co_ci_u32_e64 v3, s0, s15, v3, s0                    // 000000007A14: D5200003 0002060F
	s_or_b32 s13, vcc_lo, s13                                  // 000000007A1C: 8C0D0D6A
	s_waitcnt vmcnt(0)                                         // 000000007A20: BF8903F7
	global_store_b32 v[8:9], v10, off                          // 000000007A24: DC6A0000 007C0A08
	s_and_not1_b32 exec_lo, exec_lo, s13                       // 000000007A2C: 917E0D7E
	s_cbranch_execnz 65507                                     // 000000007A30: BFA6FFE3 <__amd_rocclr_copyBuffer+0xc0>
	s_or_b32 exec_lo, exec_lo, s1                              // 000000007A34: 8C7E017E
	s_mov_b32 s0, 0                                            // 000000007A38: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000007A3C: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 000000007A40: 916A007E
	s_cbranch_vccnz 60                                         // 000000007A44: BFA4003C <__amd_rocclr_copyBuffer+0x238>
	v_lshlrev_b64 v[2:3], 4, v[0:1]                            // 000000007A48: D73C0002 00020084
	s_mov_b32 s1, exec_lo                                      // 000000007A50: BE81007E
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007A54: BF870111
	v_add_co_u32 v4, vcc_lo, s6, v2                            // 000000007A58: D7006A04 00020406
	v_add_co_ci_u32_e32 v5, vcc_lo, s7, v3, vcc_lo             // 000000007A60: 400A0607
	s_delay_alu instid0(VALU_DEP_1)                            // 000000007A64: BF870001
	v_cmpx_gt_u64_e64 s[2:3], v[4:5]                           // 000000007A68: D4DC007E 00020802
	s_cbranch_execz 48                                         // 000000007A70: BFA50030 <__amd_rocclr_copyBuffer+0x234>
	v_dual_mov_b32 v5, v1 :: v_dual_mov_b32 v4, v0             // 000000007A74: CA100101 05040100
	s_mov_b32 s13, 0                                           // 000000007A7C: BE8D0080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000007A80: BF870009
	s_lshl_b64 s[14:15], s[12:13], 4                           // 000000007A84: 848E840C
	s_nop 0                                                    // 000000007A88: BF800000
	s_nop 0                                                    // 000000007A8C: BF800000
	s_nop 0                                                    // 000000007A90: BF800000
	s_nop 0                                                    // 000000007A94: BF800000
	s_nop 0                                                    // 000000007A98: BF800000
	s_nop 0                                                    // 000000007A9C: BF800000
	s_nop 0                                                    // 000000007AA0: BF800000
	s_nop 0                                                    // 000000007AA4: BF800000
	s_nop 0                                                    // 000000007AA8: BF800000
	s_nop 0                                                    // 000000007AAC: BF800000
	s_nop 0                                                    // 000000007AB0: BF800000
	s_nop 0                                                    // 000000007AB4: BF800000
	s_nop 0                                                    // 000000007AB8: BF800000
	s_nop 0                                                    // 000000007ABC: BF800000
	v_add_co_u32 v6, vcc_lo, s4, v2                            // 000000007AC0: D7006A06 00020404
	v_add_co_ci_u32_e32 v7, vcc_lo, s5, v3, vcc_lo             // 000000007AC8: 400E0605
	v_add_co_u32 v4, vcc_lo, v4, s12                           // 000000007ACC: D7006A04 00001904
	v_add_co_ci_u32_e32 v5, vcc_lo, 0, v5, vcc_lo              // 000000007AD4: 400A0A80
	global_load_b128 v[6:9], v[6:7], off                       // 000000007AD8: DC5E0000 067C0006
	v_lshlrev_b64 v[10:11], 4, v[4:5]                          // 000000007AE0: D73C000A 00020884
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007AE8: BF870111
	v_add_co_u32 v10, vcc_lo, s6, v10                          // 000000007AEC: D7006A0A 00021406
	v_add_co_ci_u32_e32 v11, vcc_lo, s7, v11, vcc_lo           // 000000007AF4: 40161607
	v_add_co_u32 v12, vcc_lo, s6, v2                           // 000000007AF8: D7006A0C 00020406
	v_add_co_ci_u32_e32 v13, vcc_lo, s7, v3, vcc_lo            // 000000007B00: 401A0607
	s_delay_alu instid0(VALU_DEP_3) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000007B04: BF8700A3
	v_cmp_le_u64_e32 vcc_lo, s[2:3], v[10:11]                  // 000000007B08: 7CB61402
	v_add_co_u32 v2, s0, v2, s14                               // 000000007B0C: D7000002 00001D02
	v_add_co_ci_u32_e64 v3, s0, s15, v3, s0                    // 000000007B14: D5200003 0002060F
	s_or_b32 s13, vcc_lo, s13                                  // 000000007B1C: 8C0D0D6A
	s_waitcnt vmcnt(0)                                         // 000000007B20: BF8903F7
	global_store_b128 v[12:13], v[6:9], off                    // 000000007B24: DC760000 007C060C
	s_and_not1_b32 exec_lo, exec_lo, s13                       // 000000007B2C: 917E0D7E
	s_cbranch_execnz 65507                                     // 000000007B30: BFA6FFE3 <__amd_rocclr_copyBuffer+0x1c0>
	s_or_b32 exec_lo, exec_lo, s1                              // 000000007B34: 8C7E017E
	v_cmp_eq_u64_e32 vcc_lo, 0, v[0:1]                         // 000000007B38: 7CB40080
	s_cmp_lg_u32 s10, 0                                        // 000000007B3C: BF07800A
	s_cselect_b32 s0, -1, 0                                    // 000000007B40: 980080C1
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_2) | instid1(SALU_CYCLE_1)// 000000007B44: BF8704B9
	s_and_b32 s2, s0, vcc_lo                                   // 000000007B48: 8B026A00
	s_sub_u32 s0, s8, s10                                      // 000000007B4C: 80800A08
	s_subb_u32 s1, s9, 0                                       // 000000007B50: 82818009
	v_cmp_lt_u64_e64 s0, s[0:1], s[8:9]                        // 000000007B54: D4590000 00001000
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)// 000000007B5C: BF870491
	s_and_b32 s0, s0, s2                                       // 000000007B60: 8B000200
	s_and_saveexec_b32 s1, s0                                  // 000000007B64: BE812000
	s_cbranch_execz 23                                         // 000000007B68: BFA50017 <__amd_rocclr_copyBuffer+0x2c8>
	s_sub_u32 s0, 0, s10                                       // 000000007B6C: 80800A80
	s_subb_u32 s1, 0, 0                                        // 000000007B70: 82818080
	s_add_u32 s2, s6, s8                                       // 000000007B74: 80020806
	v_mov_b32_e32 v0, 0                                        // 000000007B78: 7E000280
	s_addc_u32 s3, s7, s9                                      // 000000007B7C: 82030907
	s_add_u32 s4, s4, s8                                       // 000000007B80: 80040804
	s_addc_u32 s5, s5, s9                                      // 000000007B84: 82050905
	s_add_u32 s6, s4, s0                                       // 000000007B88: 80060004
	s_addc_u32 s7, s5, s1                                      // 000000007B8C: 82070105
	global_load_u8 v1, v0, s[6:7]                              // 000000007B90: DC420000 01060000
	s_add_u32 s6, s2, s0                                       // 000000007B98: 80060002
	s_addc_u32 s7, s3, s1                                      // 000000007B9C: 82070103
	s_add_u32 s0, s0, 1                                        // 000000007BA0: 80008100
	s_addc_u32 s1, s1, 0                                       // 000000007BA4: 82018001
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 000000007BA8: BF8704A9
	s_cmp_eq_u64 s[0:1], 0                                     // 000000007BAC: BF108000
	s_cselect_b32 s8, -1, 0                                    // 000000007BB0: 980880C1
	s_and_not1_b32 vcc_lo, exec_lo, s8                         // 000000007BB4: 916A087E
	s_waitcnt vmcnt(0)                                         // 000000007BB8: BF8903F7
	global_store_b8 v0, v1, s[6:7]                             // 000000007BBC: DC620000 00060100
	s_cbranch_vccnz 65520                                      // 000000007BC4: BFA4FFF0 <__amd_rocclr_copyBuffer+0x288>
	s_nop 0                                                    // 000000007BC8: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000007BCC: BFB60003
	s_endpgm                                                   // 000000007BD0: BFB00000
	s_nop 0                                                    // 000000007BD4: BF800000
	s_nop 0                                                    // 000000007BD8: BF800000
	s_nop 0                                                    // 000000007BDC: BF800000
	s_nop 0                                                    // 000000007BE0: BF800000
	s_nop 0                                                    // 000000007BE4: BF800000
	s_nop 0                                                    // 000000007BE8: BF800000
	s_nop 0                                                    // 000000007BEC: BF800000
	s_nop 0                                                    // 000000007BF0: BF800000
	s_nop 0                                                    // 000000007BF4: BF800000
	s_nop 0                                                    // 000000007BF8: BF800000
	s_nop 0                                                    // 000000007BFC: BF800000

0000000000007c00 <__amd_rocclr_copyBufferAligned>:
	s_clause 0x2                                               // 000000007C00: BF850002
	s_load_b32 s6, s[0:1], 0x3c                                // 000000007C04: F4000180 F800003C
	s_load_b64 s[2:3], s[0:1], 0x58                            // 000000007C0C: F4040080 F8000058
	s_load_b64 s[4:5], s[0:1], 0x20                            // 000000007C14: F4040100 F8000020
	s_waitcnt lgkmcnt(0)                                       // 000000007C1C: BF89FC07
	s_and_b32 s6, s6, 0xffff                                   // 000000007C20: 8B06FF06 0000FFFF
	s_delay_alu instid0(SALU_CYCLE_1) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000007C28: BF870099
	v_mad_u64_u32 v[1:2], null, s15, s6, v[0:1]                // 000000007C2C: D6FE7C01 04000C0F
	v_add_co_u32 v0, s2, s2, v1                                // 000000007C34: D7000200 00020202
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000007C3C: BF8700A1
	v_add_co_ci_u32_e64 v1, null, s3, 0, s2                    // 000000007C40: D5207C01 00090003
	s_mov_b32 s2, exec_lo                                      // 000000007C48: BE82007E
	v_cmpx_gt_u64_e64 s[4:5], v[0:1]                           // 000000007C4C: D4DC007E 00020004
	s_cbranch_execz 52                                         // 000000007C54: BFA50034 <__amd_rocclr_copyBufferAligned+0x128>
	s_clause 0x1                                               // 000000007C58: BF850001
	s_load_b256 s[4:11], s[0:1], null                          // 000000007C5C: F40C0100 F8000000
	s_load_b32 s0, s[0:1], 0x28                                // 000000007C64: F4000000 F8000028
	s_waitcnt lgkmcnt(0)                                       // 000000007C6C: BF89FC07
	v_add_co_u32 v2, vcc_lo, v0, s8                            // 000000007C70: D7006A02 00001100
	v_add_co_ci_u32_e32 v3, vcc_lo, s9, v1, vcc_lo             // 000000007C78: 40060209
	v_add_co_u32 v0, vcc_lo, v0, s10                           // 000000007C7C: D7006A00 00001500
	v_add_co_ci_u32_e32 v1, vcc_lo, s11, v1, vcc_lo            // 000000007C84: 4002020B
	s_cmp_lg_u32 s0, 16                                        // 000000007C88: BF079000
	s_mov_b32 s0, -1                                           // 000000007C8C: BE8000C1
	s_cbranch_scc0 18                                          // 000000007C90: BFA10012 <__amd_rocclr_copyBufferAligned+0xdc>
	v_lshlrev_b64 v[4:5], 2, v[2:3]                            // 000000007C94: D73C0004 00020482
	s_mov_b32 s0, 0                                            // 000000007C9C: BE800080
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007CA0: BF870111
	v_add_co_u32 v4, vcc_lo, s4, v4                            // 000000007CA4: D7006A04 00020804
	v_add_co_ci_u32_e32 v5, vcc_lo, s5, v5, vcc_lo             // 000000007CAC: 400A0A05
	global_load_b32 v6, v[4:5], off                            // 000000007CB0: DC520000 067C0004
	v_lshlrev_b64 v[4:5], 2, v[0:1]                            // 000000007CB8: D73C0004 00020082
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000007CC0: BF870111
	v_add_co_u32 v4, vcc_lo, s6, v4                            // 000000007CC4: D7006A04 00020806
	v_add_co_ci_u32_e32 v5, vcc_lo, s7, v5, vcc_lo             // 000000007CCC: 400A0A07
	s_waitcnt vmcnt(0)                                         // 000000007CD0: BF8903F7
	global_store_b32 v[4:5], v6, off                           // 000000007CD4: DC6A0000 007C0604
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 000000007CDC: 916A007E
	s_cbranch_vccnz 17                                         // 000000007CE0: BFA40011 <__amd_rocclr_copyBufferAligned+0x128>
	v_lshlrev_b64 v[2:3], 4, v[2:3]                            // 000000007CE4: D73C0002 00020484
	v_lshlrev_b64 v[0:1], 4, v[0:1]                            // 000000007CEC: D73C0000 00020084
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000007CF4: BF870192
	v_add_co_u32 v2, vcc_lo, s4, v2                            // 000000007CF8: D7006A02 00020404
	v_add_co_ci_u32_e32 v3, vcc_lo, s5, v3, vcc_lo             // 000000007D00: 40060605
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_4)// 000000007D04: BF870213
	v_add_co_u32 v0, vcc_lo, s6, v0                            // 000000007D08: D7006A00 00020006
	v_add_co_ci_u32_e32 v1, vcc_lo, s7, v1, vcc_lo             // 000000007D10: 40020207
	global_load_b128 v[2:5], v[2:3], off                       // 000000007D14: DC5E0000 027C0002
	s_waitcnt vmcnt(0)                                         // 000000007D1C: BF8903F7
	global_store_b128 v[0:1], v[2:5], off                      // 000000007D20: DC760000 007C0200
	s_nop 0                                                    // 000000007D28: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000007D2C: BFB60003
	s_endpgm                                                   // 000000007D30: BFB00000
	s_nop 0                                                    // 000000007D34: BF800000
	s_nop 0                                                    // 000000007D38: BF800000
	s_nop 0                                                    // 000000007D3C: BF800000
	s_nop 0                                                    // 000000007D40: BF800000
	s_nop 0                                                    // 000000007D44: BF800000
	s_nop 0                                                    // 000000007D48: BF800000
	s_nop 0                                                    // 000000007D4C: BF800000
	s_nop 0                                                    // 000000007D50: BF800000
	s_nop 0                                                    // 000000007D54: BF800000
	s_nop 0                                                    // 000000007D58: BF800000
	s_nop 0                                                    // 000000007D5C: BF800000
	s_nop 0                                                    // 000000007D60: BF800000
	s_nop 0                                                    // 000000007D64: BF800000
	s_nop 0                                                    // 000000007D68: BF800000
	s_nop 0                                                    // 000000007D6C: BF800000
	s_nop 0                                                    // 000000007D70: BF800000
	s_nop 0                                                    // 000000007D74: BF800000
	s_nop 0                                                    // 000000007D78: BF800000
	s_nop 0                                                    // 000000007D7C: BF800000
	s_nop 0                                                    // 000000007D80: BF800000
	s_nop 0                                                    // 000000007D84: BF800000
	s_nop 0                                                    // 000000007D88: BF800000
	s_nop 0                                                    // 000000007D8C: BF800000
	s_nop 0                                                    // 000000007D90: BF800000
	s_nop 0                                                    // 000000007D94: BF800000
	s_nop 0                                                    // 000000007D98: BF800000
	s_nop 0                                                    // 000000007D9C: BF800000
	s_nop 0                                                    // 000000007DA0: BF800000
	s_nop 0                                                    // 000000007DA4: BF800000
	s_nop 0                                                    // 000000007DA8: BF800000
	s_nop 0                                                    // 000000007DAC: BF800000
	s_nop 0                                                    // 000000007DB0: BF800000
	s_nop 0                                                    // 000000007DB4: BF800000
	s_nop 0                                                    // 000000007DB8: BF800000
	s_nop 0                                                    // 000000007DBC: BF800000
	s_nop 0                                                    // 000000007DC0: BF800000
	s_nop 0                                                    // 000000007DC4: BF800000
	s_nop 0                                                    // 000000007DC8: BF800000
	s_nop 0                                                    // 000000007DCC: BF800000
	s_nop 0                                                    // 000000007DD0: BF800000
	s_nop 0                                                    // 000000007DD4: BF800000
	s_nop 0                                                    // 000000007DD8: BF800000
	s_nop 0                                                    // 000000007DDC: BF800000
	s_nop 0                                                    // 000000007DE0: BF800000
	s_nop 0                                                    // 000000007DE4: BF800000
	s_nop 0                                                    // 000000007DE8: BF800000
	s_nop 0                                                    // 000000007DEC: BF800000
	s_nop 0                                                    // 000000007DF0: BF800000
	s_nop 0                                                    // 000000007DF4: BF800000
	s_nop 0                                                    // 000000007DF8: BF800000
	s_nop 0                                                    // 000000007DFC: BF800000

0000000000007e00 <__amd_rocclr_copyBufferRect>:
	s_clause 0x2                                               // 000000007E00: BF850002
	s_load_b64 s[2:3], s[0:1], 0x8c                            // 000000007E04: F4040080 F800008C
	s_load_b128 s[16:19], s[0:1], 0xa8                         // 000000007E0C: F4080400 F80000A8
	s_load_b256 s[4:11], s[0:1], 0x60                          // 000000007E14: F40C0100 F8000060
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000007E1C: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 000000007E24: D6100002 02291500
	s_waitcnt lgkmcnt(0)                                       // 000000007E2C: BF89FC07
	s_load_b64 s[10:11], s[0:1], 0xb8                          // 000000007E30: F4040280 F80000B8
	v_bfe_u32 v0, v0, 20, 10                                   // 000000007E38: D6100000 02292900
	s_and_b32 s12, s2, 0xffff                                  // 000000007E40: 8B0CFF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000007E48: 85029002
	v_mad_u64_u32 v[3:4], null, s13, s12, v[1:2]               // 000000007E4C: D6FE7C03 0404180D
	s_and_b32 s3, s3, 0xffff                                   // 000000007E54: 8B03FF03 0000FFFF
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_1)// 000000007E5C: BF8700B1
	v_mad_u64_u32 v[6:7], null, s14, s2, v[2:3]                // 000000007E60: D6FE7C06 0408040E
	v_mad_u64_u32 v[1:2], null, s15, s3, v[0:1]                // 000000007E68: D6FE7C01 0400060F
	v_add_co_u32 v4, s2, s16, v3                               // 000000007E70: D7000204 00020610
	v_add_co_ci_u32_e64 v5, null, s17, 0, s2                   // 000000007E78: D5207C05 00090011
	s_delay_alu instid0(VALU_DEP_4) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000007E80: BF870094
	v_add_co_u32 v2, s2, s18, v6                               // 000000007E84: D7000202 00020C12
	v_add_co_ci_u32_e64 v3, null, s19, 0, s2                   // 000000007E8C: D5207C03 00090013
	s_waitcnt lgkmcnt(0)                                       // 000000007E94: BF89FC07
	v_add_co_u32 v0, s2, s10, v1                               // 000000007E98: D7000200 0002020A
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_3)// 000000007EA0: BF8701B1
	v_add_co_ci_u32_e64 v1, null, s11, 0, s2                   // 000000007EA4: D5207C01 0009000B
	v_cmp_gt_u64_e32 vcc_lo, s[4:5], v[4:5]                    // 000000007EAC: 7CB80804
	v_cmp_gt_u64_e64 s2, s[6:7], v[2:3]                        // 000000007EB0: D45C0002 00020406
	v_cmp_gt_u64_e64 s3, s[8:9], v[0:1]                        // 000000007EB8: D45C0003 00020008
	s_delay_alu instid0(VALU_DEP_2)                            // 000000007EC0: BF870002
	s_and_b32 s2, vcc_lo, s2                                   // 000000007EC4: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 000000007EC8: BF870481
	s_and_b32 s2, s2, s3                                       // 000000007ECC: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000007ED0: BF870009
	s_and_saveexec_b32 s3, s2                                  // 000000007ED4: BE832002
	s_cbranch_execz 57                                         // 000000007ED8: BFA50039 <__amd_rocclr_copyBufferRect+0x1c0>
	s_clause 0x1                                               // 000000007EDC: BF850001
	s_load_b128 s[16:19], s[0:1], null                         // 000000007EE0: F4080400 F8000000
	s_load_b512 s[0:15], s[0:1], 0x20                          // 000000007EE8: F4100000 F8000020
	s_waitcnt lgkmcnt(0)                                       // 000000007EF0: BF89FC07
	s_add_u32 s4, s16, s4                                      // 000000007EF4: 80040410
	s_addc_u32 s5, s17, s5                                     // 000000007EF8: 82050511
	v_add_co_u32 v6, vcc_lo, s4, v4                            // 000000007EFC: D7006A06 00020804
	v_add_co_ci_u32_e32 v7, vcc_lo, s5, v5, vcc_lo             // 000000007F04: 400E0A05
	v_mul_lo_u32 v10, v2, s1                                   // 000000007F08: D72C000A 00000302
	v_mul_lo_u32 v11, v3, s0                                   // 000000007F10: D72C000B 00000103
	v_mul_lo_u32 v3, v3, s8                                    // 000000007F18: D72C0003 00001103
	s_delay_alu instid0(VALU_DEP_4) | instskip(SKIP_4) | instid1(VALU_DEP_3)// 000000007F20: BF8701D4
	v_mad_u64_u32 v[8:9], null, v2, s0, v[6:7]                 // 000000007F24: D6FE7C08 04180102
	s_add_u32 s0, s18, s12                                     // 000000007F2C: 80000C12
	s_addc_u32 s1, s19, s13                                    // 000000007F30: 82010D13
	v_add_co_u32 v4, vcc_lo, s0, v4                            // 000000007F34: D7006A04 00020800
	v_add_co_ci_u32_e32 v5, vcc_lo, s1, v5, vcc_lo             // 000000007F3C: 400A0A01
	v_add3_u32 v9, v11, v9, v10                                // 000000007F40: D6550009 042A130B
	v_mul_lo_u32 v10, v0, s3                                   // 000000007F48: D72C000A 00000700
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_2) | instid1(VALU_DEP_2)// 000000007F50: BF870132
	v_mad_u64_u32 v[6:7], null, v0, s2, v[8:9]                 // 000000007F54: D6FE7C06 04200500
	v_mul_lo_u32 v8, v1, s2                                    // 000000007F5C: D72C0008 00000501
	v_mul_lo_u32 v1, v1, s10                                   // 000000007F64: D72C0001 00001501
	v_add3_u32 v7, v8, v7, v10                                 // 000000007F6C: D6550007 042A0F08
	global_load_u8 v8, v[6:7], off                             // 000000007F74: DC420000 087C0006
	v_mad_u64_u32 v[6:7], null, v2, s8, v[4:5]                 // 000000007F7C: D6FE7C06 04101102
	v_mul_lo_u32 v2, v2, s9                                    // 000000007F84: D72C0002 00001302
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000007F8C: BF870091
	v_add3_u32 v7, v3, v7, v2                                  // 000000007F90: D6550007 040A0F03
	v_mad_u64_u32 v[2:3], null, v0, s10, v[6:7]                // 000000007F98: D6FE7C02 04181500
	v_mul_lo_u32 v0, v0, s11                                   // 000000007FA0: D72C0000 00001700
	s_delay_alu instid0(VALU_DEP_1)                            // 000000007FA8: BF870001
	v_add3_u32 v3, v1, v3, v0                                  // 000000007FAC: D6550003 04020701
	s_waitcnt vmcnt(0)                                         // 000000007FB4: BF8903F7
	global_store_b8 v[2:3], v8, off                            // 000000007FB8: DC620000 007C0802
	s_nop 0                                                    // 000000007FC0: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000007FC4: BFB60003
	s_endpgm                                                   // 000000007FC8: BFB00000
	s_nop 0                                                    // 000000007FCC: BF800000
	s_nop 0                                                    // 000000007FD0: BF800000
	s_nop 0                                                    // 000000007FD4: BF800000
	s_nop 0                                                    // 000000007FD8: BF800000
	s_nop 0                                                    // 000000007FDC: BF800000
	s_nop 0                                                    // 000000007FE0: BF800000
	s_nop 0                                                    // 000000007FE4: BF800000
	s_nop 0                                                    // 000000007FE8: BF800000
	s_nop 0                                                    // 000000007FEC: BF800000
	s_nop 0                                                    // 000000007FF0: BF800000
	s_nop 0                                                    // 000000007FF4: BF800000
	s_nop 0                                                    // 000000007FF8: BF800000
	s_nop 0                                                    // 000000007FFC: BF800000

0000000000008000 <__amd_rocclr_copyBufferRectAligned>:
	s_clause 0x3                                               // 000000008000: BF850003
	s_load_b64 s[2:3], s[0:1], 0x8c                            // 000000008004: F4040080 F800008C
	s_load_b128 s[4:7], s[0:1], 0xa8                           // 00000000800C: F4080100 F80000A8
	s_load_b256 s[16:23], s[0:1], 0x60                         // 000000008014: F40C0400 F8000060
	s_load_b64 s[8:9], s[0:1], 0xb8                            // 00000000801C: F4040200 F80000B8
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000008024: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 00000000802C: D6100002 02291500
	v_bfe_u32 v0, v0, 20, 10                                   // 000000008034: D6100000 02292900
	s_waitcnt lgkmcnt(0)                                       // 00000000803C: BF89FC07
	s_and_b32 s10, s2, 0xffff                                  // 000000008040: 8B0AFF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000008048: 85029002
	v_mad_u64_u32 v[3:4], null, s13, s10, v[1:2]               // 00000000804C: D6FE7C03 0404140D
	s_and_b32 s3, s3, 0xffff                                   // 000000008054: 8B03FF03 0000FFFF
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_1)// 00000000805C: BF8700B1
	v_mad_u64_u32 v[6:7], null, s14, s2, v[2:3]                // 000000008060: D6FE7C06 0408040E
	v_mad_u64_u32 v[1:2], null, s15, s3, v[0:1]                // 000000008068: D6FE7C01 0400060F
	v_add_co_u32 v4, s2, s4, v3                                // 000000008070: D7000204 00020604
	v_add_co_ci_u32_e64 v5, null, s5, 0, s2                    // 000000008078: D5207C05 00090005
	s_delay_alu instid0(VALU_DEP_4) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000008080: BF870094
	v_add_co_u32 v2, s2, s6, v6                                // 000000008084: D7000202 00020C06
	v_add_co_ci_u32_e64 v3, null, s7, 0, s2                    // 00000000808C: D5207C03 00090007
	v_add_co_u32 v0, s2, s8, v1                                // 000000008094: D7000200 00020208
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_4)// 00000000809C: BF870221
	v_add_co_ci_u32_e64 v1, null, s9, 0, s2                    // 0000000080A0: D5207C01 00090009
	v_cmp_gt_u64_e32 vcc_lo, s[16:17], v[4:5]                  // 0000000080A8: 7CB80810
	v_cmp_gt_u64_e64 s2, s[18:19], v[2:3]                      // 0000000080AC: D45C0002 00020412
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000080B4: BF870113
	v_cmp_gt_u64_e64 s3, s[20:21], v[0:1]                      // 0000000080B8: D45C0003 00020014
	s_and_b32 s2, vcc_lo, s2                                   // 0000000080C0: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 0000000080C4: BF870481
	s_and_b32 s2, s2, s3                                       // 0000000080C8: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000080CC: BF870009
	s_and_saveexec_b32 s3, s2                                  // 0000000080D0: BE832002
	s_cbranch_execz 89                                         // 0000000080D4: BFA50059 <__amd_rocclr_copyBufferRectAligned+0x23c>
	s_clause 0x1                                               // 0000000080D8: BF850001
	s_load_b512 s[4:19], s[0:1], 0x20                          // 0000000080DC: F4100100 F8000020
	s_load_b128 s[0:3], s[0:1], null                           // 0000000080E4: F4080000 F8000000
	s_cmp_lg_u64 s[22:23], 16                                  // 0000000080EC: BF119016
	s_waitcnt lgkmcnt(0)                                       // 0000000080F0: BF89FC07
	v_add_co_u32 v6, vcc_lo, v4, s8                            // 0000000080F4: D7006A06 00001104
	v_add_co_ci_u32_e32 v7, vcc_lo, s9, v5, vcc_lo             // 0000000080FC: 400E0A09
	v_add_co_u32 v4, vcc_lo, v4, s16                           // 000000008100: D7006A04 00002104
	v_add_co_ci_u32_e32 v5, vcc_lo, s17, v5, vcc_lo            // 000000008108: 400A0A11
	v_mul_lo_u32 v10, v2, s5                                   // 00000000810C: D72C000A 00000B02
	v_mul_lo_u32 v11, v3, s4                                   // 000000008114: D72C000B 00000903
	v_mul_lo_u32 v12, v2, s13                                  // 00000000811C: D72C000C 00001B02
	v_mul_lo_u32 v3, v3, s12                                   // 000000008124: D72C0003 00001903
	v_mad_u64_u32 v[8:9], null, v2, s4, v[6:7]                 // 00000000812C: D6FE7C08 04180902
	v_mad_u64_u32 v[6:7], null, v2, s12, v[4:5]                // 000000008134: D6FE7C06 04101902
	v_mul_lo_u32 v5, v0, s7                                    // 00000000813C: D72C0005 00000F00
	v_mul_lo_u32 v13, v1, s6                                   // 000000008144: D72C000D 00000D01
	s_mov_b32 s4, -1                                           // 00000000814C: BE8400C1
	s_delay_alu instid0(VALU_DEP_4) | instskip(SKIP_3) | instid1(VALU_DEP_4)// 000000008150: BF870244
	v_add3_u32 v9, v11, v9, v10                                // 000000008154: D6550009 042A130B
	v_mul_lo_u32 v10, v0, s15                                  // 00000000815C: D72C000A 00001F00
	v_add3_u32 v7, v3, v7, v12                                 // 000000008164: D6550007 04320F03
	v_mul_lo_u32 v11, v1, s14                                  // 00000000816C: D72C000B 00001D01
	v_mad_u64_u32 v[3:4], null, v0, s6, v[8:9]                 // 000000008174: D6FE7C03 04200D00
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 00000000817C: BF870113
	v_mad_u64_u32 v[1:2], null, v0, s14, v[6:7]                // 000000008180: D6FE7C01 04181D00
	v_add3_u32 v4, v13, v4, v5                                 // 000000008188: D6550004 0416090D
	s_delay_alu instid0(VALU_DEP_2)                            // 000000008190: BF870002
	v_add3_u32 v2, v11, v2, v10                                // 000000008194: D6550002 042A050B
	s_cbranch_scc0 19                                          // 00000000819C: BFA10013 <__amd_rocclr_copyBufferRectAligned+0x1ec>
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 0000000081A0: BF8700A2
	v_lshlrev_b64 v[5:6], 2, v[3:4]                            // 0000000081A4: D73C0005 00020682
	s_mov_b32 s4, 0                                            // 0000000081AC: BE840080
	v_add_co_u32 v5, vcc_lo, s0, v5                            // 0000000081B0: D7006A05 00020A00
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_2) | instid1(VALU_DEP_1)// 0000000081B8: BF8700B2
	v_add_co_ci_u32_e32 v6, vcc_lo, s1, v6, vcc_lo             // 0000000081BC: 400C0C01
	global_load_b32 v0, v[5:6], off                            // 0000000081C0: DC520000 007C0005
	v_lshlrev_b64 v[5:6], 2, v[1:2]                            // 0000000081C8: D73C0005 00020282
	v_add_co_u32 v5, vcc_lo, s2, v5                            // 0000000081D0: D7006A05 00020A02
	s_delay_alu instid0(VALU_DEP_2)                            // 0000000081D8: BF870002
	v_add_co_ci_u32_e32 v6, vcc_lo, s3, v6, vcc_lo             // 0000000081DC: 400C0C03
	s_waitcnt vmcnt(0)                                         // 0000000081E0: BF8903F7
	global_store_b32 v[5:6], v0, off                           // 0000000081E4: DC6A0000 007C0005
	s_and_not1_b32 vcc_lo, exec_lo, s4                         // 0000000081EC: 916A047E
	s_cbranch_vccnz 18                                         // 0000000081F0: BFA40012 <__amd_rocclr_copyBufferRectAligned+0x23c>
	s_delay_alu instid0(VALU_DEP_4) | instskip(NEXT) | instid1(VALU_DEP_4)// 0000000081F4: BF870214
	v_lshlrev_b64 v[3:4], 4, v[3:4]                            // 0000000081F8: D73C0003 00020684
	v_lshlrev_b64 v[0:1], 4, v[1:2]                            // 000000008200: D73C0000 00020284
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000008208: BF870192
	v_add_co_u32 v3, vcc_lo, s0, v3                            // 00000000820C: D7006A03 00020600
	v_add_co_ci_u32_e32 v4, vcc_lo, s1, v4, vcc_lo             // 000000008214: 40080801
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_4)// 000000008218: BF870213
	v_add_co_u32 v0, vcc_lo, s2, v0                            // 00000000821C: D7006A00 00020002
	v_add_co_ci_u32_e32 v1, vcc_lo, s3, v1, vcc_lo             // 000000008224: 40020203
	global_load_b128 v[3:6], v[3:4], off                       // 000000008228: DC5E0000 037C0003
	s_waitcnt vmcnt(0)                                         // 000000008230: BF8903F7
	global_store_b128 v[0:1], v[3:6], off                      // 000000008234: DC760000 007C0300
	s_nop 0                                                    // 00000000823C: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000008240: BFB60003
	s_endpgm                                                   // 000000008244: BFB00000
	s_nop 0                                                    // 000000008248: BF800000
	s_nop 0                                                    // 00000000824C: BF800000
	s_nop 0                                                    // 000000008250: BF800000
	s_nop 0                                                    // 000000008254: BF800000
	s_nop 0                                                    // 000000008258: BF800000
	s_nop 0                                                    // 00000000825C: BF800000
	s_nop 0                                                    // 000000008260: BF800000
	s_nop 0                                                    // 000000008264: BF800000
	s_nop 0                                                    // 000000008268: BF800000
	s_nop 0                                                    // 00000000826C: BF800000
	s_nop 0                                                    // 000000008270: BF800000
	s_nop 0                                                    // 000000008274: BF800000
	s_nop 0                                                    // 000000008278: BF800000
	s_nop 0                                                    // 00000000827C: BF800000
	s_nop 0                                                    // 000000008280: BF800000
	s_nop 0                                                    // 000000008284: BF800000
	s_nop 0                                                    // 000000008288: BF800000
	s_nop 0                                                    // 00000000828C: BF800000
	s_nop 0                                                    // 000000008290: BF800000
	s_nop 0                                                    // 000000008294: BF800000
	s_nop 0                                                    // 000000008298: BF800000
	s_nop 0                                                    // 00000000829C: BF800000
	s_nop 0                                                    // 0000000082A0: BF800000
	s_nop 0                                                    // 0000000082A4: BF800000
	s_nop 0                                                    // 0000000082A8: BF800000
	s_nop 0                                                    // 0000000082AC: BF800000
	s_nop 0                                                    // 0000000082B0: BF800000
	s_nop 0                                                    // 0000000082B4: BF800000
	s_nop 0                                                    // 0000000082B8: BF800000
	s_nop 0                                                    // 0000000082BC: BF800000
	s_nop 0                                                    // 0000000082C0: BF800000
	s_nop 0                                                    // 0000000082C4: BF800000
	s_nop 0                                                    // 0000000082C8: BF800000
	s_nop 0                                                    // 0000000082CC: BF800000
	s_nop 0                                                    // 0000000082D0: BF800000
	s_nop 0                                                    // 0000000082D4: BF800000
	s_nop 0                                                    // 0000000082D8: BF800000
	s_nop 0                                                    // 0000000082DC: BF800000
	s_nop 0                                                    // 0000000082E0: BF800000
	s_nop 0                                                    // 0000000082E4: BF800000
	s_nop 0                                                    // 0000000082E8: BF800000
	s_nop 0                                                    // 0000000082EC: BF800000
	s_nop 0                                                    // 0000000082F0: BF800000
	s_nop 0                                                    // 0000000082F4: BF800000
	s_nop 0                                                    // 0000000082F8: BF800000
	s_nop 0                                                    // 0000000082FC: BF800000

0000000000008300 <__amd_rocclr_batchMemOp>:
	s_clause 0x2                                               // 000000008300: BF850002
	s_load_b32 s4, s[0:1], 0x1c                                // 000000008304: F4000100 F800001C
	s_load_b64 s[2:3], s[0:1], 0x38                            // 00000000830C: F4040080 F8000038
	s_load_b64 s[0:1], s[0:1], null                            // 000000008314: F4040000 F8000000
	s_waitcnt lgkmcnt(0)                                       // 00000000831C: BF89FC07
	s_and_b32 s4, s4, 0xffff                                   // 000000008320: 8B04FF04 0000FFFF
	s_mul_i32 s3, s3, 48                                       // 000000008328: 9603B003
	v_mad_u64_u32 v[1:2], null, s15, s4, v[0:1]                // 00000000832C: D6FE7C01 0400080F
	s_mul_hi_u32 s4, s2, 48                                    // 000000008334: 9684B002
	s_mul_i32 s2, s2, 48                                       // 000000008338: 9602B002
	s_add_i32 s4, s4, s3                                       // 00000000833C: 81040304
	s_add_u32 s0, s0, s2                                       // 000000008340: 80000200
	s_addc_u32 s1, s1, s4                                      // 000000008344: 82010401
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 000000008348: BF870481
	v_mad_u64_u32 v[3:4], null, v1, 48, s[0:1]                 // 00000000834C: D6FE7C03 00016101
	s_mov_b32 s0, exec_lo                                      // 000000008354: BE80007E
	global_load_b32 v0, v[3:4], off                            // 000000008358: DC520000 007C0003
	s_waitcnt vmcnt(0)                                         // 000000008360: BF8903F7
	v_cmpx_lt_i32_e32 3, v0                                    // 000000008364: 7D820083
	s_xor_b32 s0, exec_lo, s0                                  // 000000008368: 8D00007E
	s_cbranch_execz 136                                        // 00000000836C: BFA50088 <__amd_rocclr_batchMemOp+0x290>
	s_mov_b32 s1, exec_lo                                      // 000000008370: BE81007E
	v_cmpx_lt_i32_e32 4, v0                                    // 000000008374: 7D820084
	s_xor_b32 s1, exec_lo, s1                                  // 000000008378: 8D01017E
	s_cbranch_execz 9                                          // 00000000837C: BFA50009 <__amd_rocclr_batchMemOp+0xa4>
	s_mov_b32 s2, exec_lo                                      // 000000008380: BE82007E
	v_cmpx_eq_u32_e32 5, v0                                    // 000000008384: 7D940085
	s_cbranch_execz 5                                          // 000000008388: BFA50005 <__amd_rocclr_batchMemOp+0xa0>
	global_load_b128 v[0:3], v[3:4], off offset:8              // 00000000838C: DC5E0008 007C0003
	s_waitcnt vmcnt(0)                                         // 000000008394: BF8903F7
	flat_store_b64 v[0:1], v[2:3]                              // 000000008398: DC6C0000 007C0200
	s_or_b32 exec_lo, exec_lo, s2                              // 0000000083A0: 8C7E027E
	s_and_not1_saveexec_b32 s1, s1                             // 0000000083A4: BE813001
	s_cbranch_execz 119                                        // 0000000083A8: BFA50077 <__amd_rocclr_batchMemOp+0x288>
	s_clause 0x1                                               // 0000000083AC: BF850001
	global_load_b32 v5, v[3:4], off offset:24                  // 0000000083B0: DC520018 057C0003
	global_load_b128 v[0:3], v[3:4], off offset:8              // 0000000083B8: DC5E0008 007C0003
	s_mov_b32 s2, exec_lo                                      // 0000000083C0: BE82007E
	s_waitcnt vmcnt(1)                                         // 0000000083C4: BF8907F7
	v_cmpx_lt_i32_e32 1, v5                                    // 0000000083C8: 7D820A81
	s_xor_b32 s2, exec_lo, s2                                  // 0000000083CC: 8D02027E
	s_cbranch_execz 57                                         // 0000000083D0: BFA50039 <__amd_rocclr_batchMemOp+0x1b8>
	s_mov_b32 s3, exec_lo                                      // 0000000083D4: BE83007E
	v_cmpx_lt_i32_e32 2, v5                                    // 0000000083D8: 7D820A82
	s_xor_b32 s3, exec_lo, s3                                  // 0000000083DC: 8D03037E
	s_cbranch_execz 26                                         // 0000000083E0: BFA5001A <__amd_rocclr_batchMemOp+0x14c>
	s_mov_b32 s4, exec_lo                                      // 0000000083E4: BE84007E
	v_cmpx_eq_u32_e32 3, v5                                    // 0000000083E8: 7D940A83
	s_cbranch_execz 22                                         // 0000000083EC: BFA50016 <__amd_rocclr_batchMemOp+0x148>
	s_waitcnt vmcnt(0)                                         // 0000000083F0: BF8903F7
	flat_load_b64 v[4:5], v[0:1] glc                           // 0000000083F4: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000083FC: BF890007
	v_or_b32_e32 v5, v5, v3                                    // 000000008400: 380A0705
	v_or_b32_e32 v4, v4, v2                                    // 000000008404: 38080504
	s_delay_alu instid0(VALU_DEP_1)                            // 000000008408: BF870001
	v_cmp_eq_u64_e32 vcc_lo, -1, v[4:5]                        // 00000000840C: 7CB408C1
	s_and_b32 exec_lo, exec_lo, vcc_lo                         // 000000008410: 8B7E6A7E
	s_cbranch_execz 12                                         // 000000008414: BFA5000C <__amd_rocclr_batchMemOp+0x148>
	s_mov_b32 s5, 0                                            // 000000008418: BE850080
	s_sleep 1                                                  // 00000000841C: BF830001
	flat_load_b64 v[4:5], v[0:1] glc                           // 000000008420: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008428: BF890007
	v_or_b32_e32 v5, v5, v3                                    // 00000000842C: 380A0705
	v_or_b32_e32 v4, v4, v2                                    // 000000008430: 38080504
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 000000008434: BF8704A1
	v_cmp_ne_u64_e32 vcc_lo, -1, v[4:5]                        // 000000008438: 7CBA08C1
	s_or_b32 s5, vcc_lo, s5                                    // 00000000843C: 8C05056A
	s_and_not1_b32 exec_lo, exec_lo, s5                        // 000000008440: 917E057E
	s_cbranch_execnz 65525                                     // 000000008444: BFA6FFF5 <__amd_rocclr_batchMemOp+0x11c>
	s_or_b32 exec_lo, exec_lo, s4                              // 000000008448: 8C7E047E
	s_and_not1_saveexec_b32 s3, s3                             // 00000000844C: BE833003
	s_cbranch_execz 23                                         // 000000008450: BFA50017 <__amd_rocclr_batchMemOp+0x1b0>
	s_waitcnt vmcnt(0)                                         // 000000008454: BF8903F7
	flat_load_b64 v[4:5], v[0:1] glc                           // 000000008458: DC544000 047C0000
	s_mov_b32 s4, exec_lo                                      // 000000008460: BE84007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008464: BF890007
	v_and_b32_e32 v5, v5, v3                                   // 000000008468: 360A0705
	v_and_b32_e32 v4, v4, v2                                   // 00000000846C: 36080504
	s_delay_alu instid0(VALU_DEP_1)                            // 000000008470: BF870001
	v_cmpx_eq_u64_e32 0, v[4:5]                                // 000000008474: 7DB40880
	s_cbranch_execz 12                                         // 000000008478: BFA5000C <__amd_rocclr_batchMemOp+0x1ac>
	s_mov_b32 s5, 0                                            // 00000000847C: BE850080
	s_sleep 1                                                  // 000000008480: BF830001
	flat_load_b64 v[4:5], v[0:1] glc                           // 000000008484: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000848C: BF890007
	v_and_b32_e32 v5, v5, v3                                   // 000000008490: 360A0705
	v_and_b32_e32 v4, v4, v2                                   // 000000008494: 36080504
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 000000008498: BF8704A1
	v_cmp_ne_u64_e32 vcc_lo, 0, v[4:5]                         // 00000000849C: 7CBA0880
	s_or_b32 s5, vcc_lo, s5                                    // 0000000084A0: 8C05056A
	s_and_not1_b32 exec_lo, exec_lo, s5                        // 0000000084A4: 917E057E
	s_cbranch_execnz 65525                                     // 0000000084A8: BFA6FFF5 <__amd_rocclr_batchMemOp+0x180>
	s_or_b32 exec_lo, exec_lo, s4                              // 0000000084AC: 8C7E047E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000084B0: BF870009
	s_or_b32 exec_lo, exec_lo, s3                              // 0000000084B4: 8C7E037E
	s_and_not1_saveexec_b32 s2, s2                             // 0000000084B8: BE823002
	s_cbranch_execz 48                                         // 0000000084BC: BFA50030 <__amd_rocclr_batchMemOp+0x280>
	s_mov_b32 s3, exec_lo                                      // 0000000084C0: BE83007E
	v_cmpx_lt_i32_e32 0, v5                                    // 0000000084C4: 7D820A80
	s_xor_b32 s3, exec_lo, s3                                  // 0000000084C8: 8D03037E
	s_cbranch_execz 19                                         // 0000000084CC: BFA50013 <__amd_rocclr_batchMemOp+0x21c>
	s_waitcnt vmcnt(0)                                         // 0000000084D0: BF8903F7
	flat_load_b64 v[4:5], v[0:1] glc                           // 0000000084D4: DC544000 047C0000
	s_mov_b32 s4, exec_lo                                      // 0000000084DC: BE84007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000084E0: BF890007
	v_cmpx_ne_u64_e64 v[4:5], v[2:3]                           // 0000000084E4: D4DD007E 00020504
	s_cbranch_execz 10                                         // 0000000084EC: BFA5000A <__amd_rocclr_batchMemOp+0x218>
	s_mov_b32 s5, 0                                            // 0000000084F0: BE850080
	s_sleep 1                                                  // 0000000084F4: BF830001
	flat_load_b64 v[4:5], v[0:1] glc                           // 0000000084F8: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008500: BF890007
	v_cmp_eq_u64_e32 vcc_lo, v[4:5], v[2:3]                    // 000000008504: 7CB40504
	s_or_b32 s5, vcc_lo, s5                                    // 000000008508: 8C05056A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000850C: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s5                        // 000000008510: 917E057E
	s_cbranch_execnz 65527                                     // 000000008514: BFA6FFF7 <__amd_rocclr_batchMemOp+0x1f4>
	s_or_b32 exec_lo, exec_lo, s4                              // 000000008518: 8C7E047E
	s_and_not1_saveexec_b32 s3, s3                             // 00000000851C: BE833003
	s_cbranch_execz 21                                         // 000000008520: BFA50015 <__amd_rocclr_batchMemOp+0x278>
	s_mov_b32 s4, exec_lo                                      // 000000008524: BE84007E
	v_cmpx_eq_u32_e32 0, v5                                    // 000000008528: 7D940A80
	s_cbranch_execz 17                                         // 00000000852C: BFA50011 <__amd_rocclr_batchMemOp+0x274>
	s_waitcnt vmcnt(0)                                         // 000000008530: BF8903F7
	flat_load_b64 v[4:5], v[0:1] glc                           // 000000008534: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000853C: BF890007
	v_cmp_lt_u64_e32 vcc_lo, v[4:5], v[2:3]                    // 000000008540: 7CB20504
	s_and_b32 exec_lo, exec_lo, vcc_lo                         // 000000008544: 8B7E6A7E
	s_cbranch_execz 10                                         // 000000008548: BFA5000A <__amd_rocclr_batchMemOp+0x274>
	s_mov_b32 s5, 0                                            // 00000000854C: BE850080
	s_sleep 1                                                  // 000000008550: BF830001
	flat_load_b64 v[4:5], v[0:1] glc                           // 000000008554: DC544000 047C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000855C: BF890007
	v_cmp_ge_u64_e32 vcc_lo, v[4:5], v[2:3]                    // 000000008560: 7CBC0504
	s_or_b32 s5, vcc_lo, s5                                    // 000000008564: 8C05056A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008568: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s5                        // 00000000856C: 917E057E
	s_cbranch_execnz 65527                                     // 000000008570: BFA6FFF7 <__amd_rocclr_batchMemOp+0x250>
	s_or_b32 exec_lo, exec_lo, s4                              // 000000008574: 8C7E047E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008578: BF870009
	s_or_b32 exec_lo, exec_lo, s3                              // 00000000857C: 8C7E037E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008580: BF870009
	s_or_b32 exec_lo, exec_lo, s2                              // 000000008584: 8C7E027E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008588: BF870009
	s_or_b32 exec_lo, exec_lo, s1                              // 00000000858C: 8C7E017E
	s_and_not1_saveexec_b32 s0, s0                             // 000000008590: BE803000
	s_cbranch_execz 262                                        // 000000008594: BFA50106 <__amd_rocclr_batchMemOp+0x6b0>
	s_mov_b32 s0, exec_lo                                      // 000000008598: BE80007E
	s_waitcnt vmcnt(0)                                         // 00000000859C: BF8903F7
	v_cmpx_lt_i32_e32 1, v0                                    // 0000000085A0: 7D820081
	s_xor_b32 s0, exec_lo, s0                                  // 0000000085A4: 8D00007E
	s_cbranch_execz 21                                         // 0000000085A8: BFA50015 <__amd_rocclr_batchMemOp+0x300>
	s_mov_b32 s1, exec_lo                                      // 0000000085AC: BE81007E
	v_cmpx_eq_u32_e32 2, v0                                    // 0000000085B0: 7D940082
	s_cbranch_execz 17                                         // 0000000085B4: BFA50011 <__amd_rocclr_batchMemOp+0x2fc>
	global_load_b96 v[0:2], v[3:4], off offset:8               // 0000000085B8: DC5A0008 007C0003
	s_mov_b32 s2, exec_lo                                      // 0000000085C0: BE82007E
	s_waitcnt vmcnt(0)                                         // 0000000085C4: BF8903F7
	v_cmpx_ne_u64_e32 0, v[0:1]                                // 0000000085C8: 7DBA0080
	s_xor_b32 s2, exec_lo, s2                                  // 0000000085CC: 8D02027E
	s_cbranch_execz 2                                          // 0000000085D0: BFA50002 <__amd_rocclr_batchMemOp+0x2dc>
	flat_store_b32 v[0:1], v2                                  // 0000000085D4: DC680000 007C0200
	s_and_not1_saveexec_b32 s2, s2                             // 0000000085DC: BE823002
	s_cbranch_execz 6                                          // 0000000085E0: BFA50006 <__amd_rocclr_batchMemOp+0x2fc>
	v_dual_mov_b32 v3, 0 :: v_dual_mov_b32 v0, v2              // 0000000085E4: CA100080 03000102
	v_dual_mov_b32 v1, 0 :: v_dual_mov_b32 v4, 0               // 0000000085EC: CA100080 01040080
	global_store_b64 v[3:4], v[0:1], off                       // 0000000085F4: DC6E0000 007C0003
	s_or_b32 exec_lo, exec_lo, s1                              // 0000000085FC: 8C7E017E
	s_and_not1_saveexec_b32 s0, s0                             // 000000008600: BE803000
	s_cbranch_execz 234                                        // 000000008604: BFA500EA <__amd_rocclr_batchMemOp+0x6b0>
	s_mov_b32 s0, exec_lo                                      // 000000008608: BE80007E
	v_cmpx_eq_u32_e32 1, v0                                    // 00000000860C: 7D940081
	s_cbranch_execz 231                                        // 000000008610: BFA500E7 <__amd_rocclr_batchMemOp+0x6b0>
	s_clause 0x1                                               // 000000008614: BF850001
	global_load_b96 v[0:2], v[3:4], off offset:8               // 000000008618: DC5A0008 007C0003
	global_load_b32 v4, v[3:4], off offset:24                  // 000000008620: DC520018 047C0003
	v_mov_b32_e32 v3, 0                                        // 000000008628: 7E060280
	s_mov_b32 s0, exec_lo                                      // 00000000862C: BE80007E
	s_waitcnt vmcnt(0)                                         // 000000008630: BF8903F7
	v_cmpx_lt_i32_e32 1, v4                                    // 000000008634: 7D820881
	s_xor_b32 s0, exec_lo, s0                                  // 000000008638: 8D00007E
	s_cbranch_execz 117                                        // 00000000863C: BFA50075 <__amd_rocclr_batchMemOp+0x514>
	s_mov_b32 s1, exec_lo                                      // 000000008640: BE81007E
	v_cmpx_lt_i32_e32 2, v4                                    // 000000008644: 7D820882
	s_xor_b32 s1, exec_lo, s1                                  // 000000008648: 8D01017E
	s_cbranch_execz 55                                         // 00000000864C: BFA50037 <__amd_rocclr_batchMemOp+0x42c>
	s_mov_b32 s2, exec_lo                                      // 000000008650: BE82007E
	v_cmpx_eq_u32_e32 3, v4                                    // 000000008654: 7D940883
	s_cbranch_execz 51                                         // 000000008658: BFA50033 <__amd_rocclr_batchMemOp+0x428>
	s_mov_b32 s3, exec_lo                                      // 00000000865C: BE83007E
	v_cmpx_ne_u64_e32 0, v[0:1]                                // 000000008660: 7DBA0080
	s_xor_b32 s3, exec_lo, s3                                  // 000000008664: 8D03037E
	s_cbranch_execz 20                                         // 000000008668: BFA50014 <__amd_rocclr_batchMemOp+0x3bc>
	flat_load_b32 v3, v[0:1] glc                               // 00000000866C: DC504000 037C0000
	s_mov_b32 s4, exec_lo                                      // 000000008674: BE84007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008678: BF890007
	v_or_b32_e32 v3, v3, v2                                    // 00000000867C: 38060503
	s_delay_alu instid0(VALU_DEP_1)                            // 000000008680: BF870001
	v_cmpx_eq_u32_e32 -1, v3                                   // 000000008684: 7D9406C1
	s_cbranch_execz 11                                         // 000000008688: BFA5000B <__amd_rocclr_batchMemOp+0x3b8>
	s_mov_b32 s5, 0                                            // 00000000868C: BE850080
	s_sleep 1                                                  // 000000008690: BF830001
	flat_load_b32 v3, v[0:1] glc                               // 000000008694: DC504000 037C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000869C: BF890007
	v_or_b32_e32 v3, v3, v2                                    // 0000000086A0: 38060503
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 0000000086A4: BF8704A1
	v_cmp_ne_u32_e32 vcc_lo, -1, v3                            // 0000000086A8: 7C9A06C1
	s_or_b32 s5, vcc_lo, s5                                    // 0000000086AC: 8C05056A
	s_and_not1_b32 exec_lo, exec_lo, s5                        // 0000000086B0: 917E057E
	s_cbranch_execnz 65526                                     // 0000000086B4: BFA6FFF6 <__amd_rocclr_batchMemOp+0x390>
	s_or_b32 exec_lo, exec_lo, s4                              // 0000000086B8: 8C7E047E
	s_and_not1_saveexec_b32 s3, s3                             // 0000000086BC: BE833003
	s_cbranch_execz 25                                         // 0000000086C0: BFA50019 <__amd_rocclr_batchMemOp+0x428>
	v_mov_b32_e32 v0, 0                                        // 0000000086C4: 7E000280
	v_mov_b32_e32 v1, 0                                        // 0000000086C8: 7E020280
	global_load_b64 v[0:1], v[0:1], off glc                    // 0000000086CC: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 0000000086D4: BF8903F7
	v_or_b32_e32 v1, 0, v1                                     // 0000000086D8: 38020280
	v_or_b32_e32 v0, v0, v2                                    // 0000000086DC: 38000500
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000086E0: BF870001
	v_cmp_eq_u64_e32 vcc_lo, -1, v[0:1]                        // 0000000086E4: 7CB400C1
	s_and_b32 exec_lo, exec_lo, vcc_lo                         // 0000000086E8: 8B7E6A7E
	s_cbranch_execz 14                                         // 0000000086EC: BFA5000E <__amd_rocclr_batchMemOp+0x428>
	s_mov_b32 s3, 0                                            // 0000000086F0: BE830080
	v_mov_b32_e32 v0, 0                                        // 0000000086F4: 7E000280
	v_mov_b32_e32 v1, 0                                        // 0000000086F8: 7E020280
	s_sleep 1                                                  // 0000000086FC: BF830001
	global_load_b64 v[0:1], v[0:1], off glc                    // 000000008700: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 000000008708: BF8903F7
	v_or_b32_e32 v1, 0, v1                                     // 00000000870C: 38020280
	v_or_b32_e32 v0, v0, v2                                    // 000000008710: 38000500
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 000000008714: BF8704A1
	v_cmp_ne_u64_e32 vcc_lo, -1, v[0:1]                        // 000000008718: 7CBA00C1
	s_or_b32 s3, vcc_lo, s3                                    // 00000000871C: 8C03036A
	s_and_not1_b32 exec_lo, exec_lo, s3                        // 000000008720: 917E037E
	s_cbranch_execnz 65523                                     // 000000008724: BFA6FFF3 <__amd_rocclr_batchMemOp+0x3f4>
	s_or_b32 exec_lo, exec_lo, s2                              // 000000008728: 8C7E027E
	s_and_not1_saveexec_b32 s1, s1                             // 00000000872C: BE813001
	s_cbranch_execz 54                                         // 000000008730: BFA50036 <__amd_rocclr_batchMemOp+0x50c>
	s_mov_b32 s2, exec_lo                                      // 000000008734: BE82007E
	v_cmpx_ne_u64_e32 0, v[0:1]                                // 000000008738: 7DBA0080
	s_xor_b32 s2, exec_lo, s2                                  // 00000000873C: 8D02027E
	s_cbranch_execz 20                                         // 000000008740: BFA50014 <__amd_rocclr_batchMemOp+0x494>
	flat_load_b32 v3, v[0:1] glc                               // 000000008744: DC504000 037C0000
	s_mov_b32 s4, 0                                            // 00000000874C: BE840080
	s_mov_b32 s3, exec_lo                                      // 000000008750: BE83007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008754: BF890007
	v_and_b32_e32 v3, v3, v2                                   // 000000008758: 36060503
	s_delay_alu instid0(VALU_DEP_1)                            // 00000000875C: BF870001
	v_cmpx_eq_u32_e32 0, v3                                    // 000000008760: 7D940680
	s_cbranch_execz 10                                         // 000000008764: BFA5000A <__amd_rocclr_batchMemOp+0x490>
	s_sleep 1                                                  // 000000008768: BF830001
	flat_load_b32 v3, v[0:1] glc                               // 00000000876C: DC504000 037C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008774: BF890007
	v_and_b32_e32 v3, v3, v2                                   // 000000008778: 36060503
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 00000000877C: BF8704A1
	v_cmp_ne_u32_e32 vcc_lo, 0, v3                             // 000000008780: 7C9A0680
	s_or_b32 s4, vcc_lo, s4                                    // 000000008784: 8C04046A
	s_and_not1_b32 exec_lo, exec_lo, s4                        // 000000008788: 917E047E
	s_cbranch_execnz 65526                                     // 00000000878C: BFA6FFF6 <__amd_rocclr_batchMemOp+0x468>
	s_or_b32 exec_lo, exec_lo, s3                              // 000000008790: 8C7E037E
	s_and_not1_saveexec_b32 s2, s2                             // 000000008794: BE823002
	s_cbranch_execz 26                                         // 000000008798: BFA5001A <__amd_rocclr_batchMemOp+0x504>
	v_mov_b32_e32 v0, 0                                        // 00000000879C: 7E000280
	v_mov_b32_e32 v1, 0                                        // 0000000087A0: 7E020280
	s_mov_b32 s3, exec_lo                                      // 0000000087A4: BE83007E
	global_load_b64 v[0:1], v[0:1], off glc                    // 0000000087A8: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 0000000087B0: BF8903F7
	v_and_b32_e32 v1, 0, v1                                    // 0000000087B4: 36020280
	v_and_b32_e32 v0, v0, v2                                   // 0000000087B8: 36000500
	s_delay_alu instid0(VALU_DEP_1)                            // 0000000087BC: BF870001
	v_cmpx_eq_u64_e32 0, v[0:1]                                // 0000000087C0: 7DB40080
	s_cbranch_execz 14                                         // 0000000087C4: BFA5000E <__amd_rocclr_batchMemOp+0x500>
	s_mov_b32 s4, 0                                            // 0000000087C8: BE840080
	v_mov_b32_e32 v0, 0                                        // 0000000087CC: 7E000280
	v_mov_b32_e32 v1, 0                                        // 0000000087D0: 7E020280
	s_sleep 1                                                  // 0000000087D4: BF830001
	global_load_b64 v[0:1], v[0:1], off glc                    // 0000000087D8: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 0000000087E0: BF8903F7
	v_and_b32_e32 v1, 0, v1                                    // 0000000087E4: 36020280
	v_and_b32_e32 v0, v0, v2                                   // 0000000087E8: 36000500
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 0000000087EC: BF8704A1
	v_cmp_ne_u64_e32 vcc_lo, 0, v[0:1]                         // 0000000087F0: 7CBA0080
	s_or_b32 s4, vcc_lo, s4                                    // 0000000087F4: 8C04046A
	s_and_not1_b32 exec_lo, exec_lo, s4                        // 0000000087F8: 917E047E
	s_cbranch_execnz 65523                                     // 0000000087FC: BFA6FFF3 <__amd_rocclr_batchMemOp+0x4cc>
	s_or_b32 exec_lo, exec_lo, s3                              // 000000008800: 8C7E037E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008804: BF870009
	s_or_b32 exec_lo, exec_lo, s2                              // 000000008808: 8C7E027E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000880C: BF870009
	s_or_b32 exec_lo, exec_lo, s1                              // 000000008810: 8C7E017E
	s_and_not1_saveexec_b32 s0, s0                             // 000000008814: BE803000
	s_cbranch_execz 101                                        // 000000008818: BFA50065 <__amd_rocclr_batchMemOp+0x6b0>
	s_mov_b32 s0, exec_lo                                      // 00000000881C: BE80007E
	v_cmpx_lt_i32_e32 0, v4                                    // 000000008820: 7D820880
	s_xor_b32 s0, exec_lo, s0                                  // 000000008824: 8D00007E
	s_cbranch_execz 48                                         // 000000008828: BFA50030 <__amd_rocclr_batchMemOp+0x5ec>
	s_mov_b32 s1, exec_lo                                      // 00000000882C: BE81007E
	v_cmpx_ne_u64_e32 0, v[0:1]                                // 000000008830: 7DBA0080
	s_xor_b32 s1, exec_lo, s1                                  // 000000008834: 8D01017E
	s_cbranch_execz 18                                         // 000000008838: BFA50012 <__amd_rocclr_batchMemOp+0x584>
	flat_load_b32 v3, v[0:1] glc                               // 00000000883C: DC504000 037C0000
	s_mov_b32 s2, exec_lo                                      // 000000008844: BE82007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008848: BF890007
	v_cmpx_ne_u32_e64 v3, v2                                   // 00000000884C: D4CD007E 00020503
	s_cbranch_execz 10                                         // 000000008854: BFA5000A <__amd_rocclr_batchMemOp+0x580>
	s_mov_b32 s3, 0                                            // 000000008858: BE830080
	s_sleep 1                                                  // 00000000885C: BF830001
	flat_load_b32 v3, v[0:1] glc                               // 000000008860: DC504000 037C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008868: BF890007
	v_cmp_eq_u32_e32 vcc_lo, v3, v2                            // 00000000886C: 7C940503
	s_or_b32 s3, vcc_lo, s3                                    // 000000008870: 8C03036A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008874: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s3                        // 000000008878: 917E037E
	s_cbranch_execnz 65527                                     // 00000000887C: BFA6FFF7 <__amd_rocclr_batchMemOp+0x55c>
	s_or_b32 exec_lo, exec_lo, s2                              // 000000008880: 8C7E027E
	s_and_not1_saveexec_b32 s1, s1                             // 000000008884: BE813001
	s_cbranch_execz 22                                         // 000000008888: BFA50016 <__amd_rocclr_batchMemOp+0x5e4>
	v_mov_b32_e32 v0, 0                                        // 00000000888C: 7E000280
	v_mov_b32_e32 v1, 0                                        // 000000008890: 7E020280
	s_mov_b32 s2, exec_lo                                      // 000000008894: BE82007E
	global_load_b64 v[0:1], v[0:1], off glc                    // 000000008898: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 0000000088A0: BF8903F7
	v_cmpx_ne_u64_e64 v[0:1], v[2:3]                           // 0000000088A4: D4DD007E 00020500
	s_cbranch_execz 12                                         // 0000000088AC: BFA5000C <__amd_rocclr_batchMemOp+0x5e0>
	s_mov_b32 s3, 0                                            // 0000000088B0: BE830080
	v_mov_b32_e32 v0, 0                                        // 0000000088B4: 7E000280
	v_mov_b32_e32 v1, 0                                        // 0000000088B8: 7E020280
	s_sleep 1                                                  // 0000000088BC: BF830001
	global_load_b64 v[0:1], v[0:1], off glc                    // 0000000088C0: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 0000000088C8: BF8903F7
	v_cmp_eq_u64_e32 vcc_lo, v[0:1], v[2:3]                    // 0000000088CC: 7CB40500
	s_or_b32 s3, vcc_lo, s3                                    // 0000000088D0: 8C03036A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000088D4: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s3                        // 0000000088D8: 917E037E
	s_cbranch_execnz 65525                                     // 0000000088DC: BFA6FFF5 <__amd_rocclr_batchMemOp+0x5b4>
	s_or_b32 exec_lo, exec_lo, s2                              // 0000000088E0: 8C7E027E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000088E4: BF870009
	s_or_b32 exec_lo, exec_lo, s1                              // 0000000088E8: 8C7E017E
	s_and_not1_saveexec_b32 s0, s0                             // 0000000088EC: BE803000
	s_cbranch_execz 47                                         // 0000000088F0: BFA5002F <__amd_rocclr_batchMemOp+0x6b0>
	v_cmp_eq_u32_e32 vcc_lo, 0, v4                             // 0000000088F4: 7C940880
	s_and_b32 exec_lo, exec_lo, vcc_lo                         // 0000000088F8: 8B7E6A7E
	s_cbranch_execz 44                                         // 0000000088FC: BFA5002C <__amd_rocclr_batchMemOp+0x6b0>
	s_mov_b32 s0, exec_lo                                      // 000000008900: BE80007E
	v_cmpx_ne_u64_e32 0, v[0:1]                                // 000000008904: 7DBA0080
	s_xor_b32 s0, exec_lo, s0                                  // 000000008908: 8D00007E
	s_cbranch_execz 18                                         // 00000000890C: BFA50012 <__amd_rocclr_batchMemOp+0x658>
	flat_load_b32 v3, v[0:1] glc                               // 000000008910: DC504000 037C0000
	s_mov_b32 s1, exec_lo                                      // 000000008918: BE81007E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000891C: BF890007
	v_cmpx_lt_u32_e64 v3, v2                                   // 000000008920: D4C9007E 00020503
	s_cbranch_execz 10                                         // 000000008928: BFA5000A <__amd_rocclr_batchMemOp+0x654>
	s_mov_b32 s2, 0                                            // 00000000892C: BE820080
	s_sleep 1                                                  // 000000008930: BF830001
	flat_load_b32 v3, v[0:1] glc                               // 000000008934: DC504000 037C0000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000893C: BF890007
	v_cmp_ge_u32_e32 vcc_lo, v3, v2                            // 000000008940: 7C9C0503
	s_or_b32 s2, vcc_lo, s2                                    // 000000008944: 8C02026A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008948: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s2                        // 00000000894C: 917E027E
	s_cbranch_execnz 65527                                     // 000000008950: BFA6FFF7 <__amd_rocclr_batchMemOp+0x630>
	s_or_b32 exec_lo, exec_lo, s1                              // 000000008954: 8C7E017E
	s_and_not1_saveexec_b32 s0, s0                             // 000000008958: BE803000
	s_cbranch_execz 20                                         // 00000000895C: BFA50014 <__amd_rocclr_batchMemOp+0x6b0>
	v_mov_b32_e32 v0, 0                                        // 000000008960: 7E000280
	v_mov_b32_e32 v1, 0                                        // 000000008964: 7E020280
	global_load_b64 v[0:1], v[0:1], off glc                    // 000000008968: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 000000008970: BF8903F7
	v_cmp_lt_u64_e32 vcc_lo, v[0:1], v[2:3]                    // 000000008974: 7CB20500
	s_and_b32 exec_lo, exec_lo, vcc_lo                         // 000000008978: 8B7E6A7E
	s_cbranch_execz 12                                         // 00000000897C: BFA5000C <__amd_rocclr_batchMemOp+0x6b0>
	s_mov_b32 s0, 0                                            // 000000008980: BE800080
	v_mov_b32_e32 v0, 0                                        // 000000008984: 7E000280
	v_mov_b32_e32 v1, 0                                        // 000000008988: 7E020280
	s_sleep 1                                                  // 00000000898C: BF830001
	global_load_b64 v[0:1], v[0:1], off glc                    // 000000008990: DC564000 007C0000
	s_waitcnt vmcnt(0)                                         // 000000008998: BF8903F7
	v_cmp_ge_u64_e32 vcc_lo, v[0:1], v[2:3]                    // 00000000899C: 7CBC0500
	s_or_b32 s0, vcc_lo, s0                                    // 0000000089A0: 8C00006A
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000089A4: BF870009
	s_and_not1_b32 exec_lo, exec_lo, s0                        // 0000000089A8: 917E007E
	s_cbranch_execnz 65525                                     // 0000000089AC: BFA6FFF5 <__amd_rocclr_batchMemOp+0x684>
	s_endpgm                                                   // 0000000089B0: BFB00000
	s_nop 0                                                    // 0000000089B4: BF800000
	s_nop 0                                                    // 0000000089B8: BF800000
	s_nop 0                                                    // 0000000089BC: BF800000
	s_nop 0                                                    // 0000000089C0: BF800000
	s_nop 0                                                    // 0000000089C4: BF800000
	s_nop 0                                                    // 0000000089C8: BF800000
	s_nop 0                                                    // 0000000089CC: BF800000
	s_nop 0                                                    // 0000000089D0: BF800000
	s_nop 0                                                    // 0000000089D4: BF800000
	s_nop 0                                                    // 0000000089D8: BF800000
	s_nop 0                                                    // 0000000089DC: BF800000
	s_nop 0                                                    // 0000000089E0: BF800000
	s_nop 0                                                    // 0000000089E4: BF800000
	s_nop 0                                                    // 0000000089E8: BF800000
	s_nop 0                                                    // 0000000089EC: BF800000
	s_nop 0                                                    // 0000000089F0: BF800000
	s_nop 0                                                    // 0000000089F4: BF800000
	s_nop 0                                                    // 0000000089F8: BF800000
	s_nop 0                                                    // 0000000089FC: BF800000

0000000000008a00 <__amd_rocclr_fillImage>:
	s_clause 0x1                                               // 000000008A00: BF850001
	s_load_b64 s[2:3], s[0:1], 0x74                            // 000000008A04: F4040080 F8000074
	s_load_b128 s[4:7], s[0:1], 0x90                           // 000000008A0C: F4080100 F8000090
	s_waitcnt lgkmcnt(0)                                       // 000000008A14: BF89FC07
	s_clause 0x1                                               // 000000008A18: BF850001
	s_load_b32 s5, s[0:1], 0xa0                                // 000000008A1C: F4000140 F80000A0
	s_load_b128 s[20:23], s[0:1], 0x50                         // 000000008A24: F4080500 F8000050
	s_add_u32 s24, s0, 0x68                                    // 000000008A2C: 8018FF00 00000068
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000008A34: 360200FF 000003FF
	v_bfe_u32 v3, v0, 10, 10                                   // 000000008A3C: D6100003 02291500
	s_addc_u32 s25, s1, 0                                      // 000000008A44: 82198001
	v_bfe_u32 v0, v0, 20, 10                                   // 000000008A48: D6100000 02292900
	s_waitcnt lgkmcnt(0)                                       // 000000008A50: BF89FC07
	s_and_b32 s23, s2, 0xffff                                  // 000000008A54: 8B17FF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000008A5C: 85029002
	s_and_b32 s3, s3, 0xffff                                   // 000000008A60: 8B03FF03 0000FFFF
	s_mul_i32 s13, s13, s23                                    // 000000008A68: 960D170D
	s_mul_i32 s14, s14, s2                                     // 000000008A6C: 960E020E
	s_mul_i32 s15, s15, s3                                     // 000000008A70: 960F030F
	v_add3_u32 v2, s4, s13, v1                                 // 000000008A74: D6550002 04041A04
	v_add3_u32 v1, s6, s14, v3                                 // 000000008A7C: D6550001 040C1C06
	v_add3_u32 v0, s5, s15, v0                                 // 000000008A84: D6550000 04001E05
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000008A8C: BF870193
	v_cmp_gt_i32_e32 vcc_lo, s20, v2                           // 000000008A90: 7C880414
	v_cmp_gt_i32_e64 s2, s21, v1                               // 000000008A94: D4440002 00020215
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000008A9C: BF870113
	v_cmp_gt_i32_e64 s3, s22, v0                               // 000000008AA0: D4440003 00020016
	s_and_b32 s2, vcc_lo, s2                                   // 000000008AA8: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 000000008AAC: BF870481
	s_and_b32 s2, s2, s3                                       // 000000008AB0: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008AB4: BF870009
	s_and_saveexec_b32 s3, s2                                  // 000000008AB8: BE832002
	s_cbranch_execz 87                                         // 000000008ABC: BFA50057 <__amd_rocclr_fillImage+0x21c>
	s_load_b512 s[4:19], s[0:1], 0x10                          // 000000008AC0: F4100100 F8000010
	s_load_b32 s3, s[24:25], null                              // 000000008AC8: F40000CC F8000000
	s_clause 0x1                                               // 000000008AD0: BF850001
	s_load_b32 s2, s[0:1], 0x60                                // 000000008AD4: F4000080 F8000060
	s_load_b64 s[0:1], s[0:1], null                            // 000000008ADC: F4040000 F8000000
	s_waitcnt lgkmcnt(0)                                       // 000000008AE4: BF89FC07
	v_add_nc_u32_e32 v9, s18, v0                               // 000000008AE8: 4A120012
	v_add_nc_u32_e32 v8, s17, v1                               // 000000008AEC: 4A100211
	v_add_nc_u32_e32 v7, s16, v2                               // 000000008AF0: 4A0E0410
	s_mul_i32 s3, s3, s23                                      // 000000008AF4: 96031703
	s_add_i32 s16, s20, s16                                    // 000000008AF8: 81101014
	s_mov_b32 s17, 0                                           // 000000008AFC: BE910080
	s_mov_b32 s18, 0                                           // 000000008B00: BE920080
	s_branch 13                                                // 000000008B04: BFA0000D <__amd_rocclr_fillImage+0x13c>
	v_add_nc_u32_e32 v7, s3, v7                                // 000000008B08: 4A0E0E03
	s_add_i32 s19, s18, 1                                      // 000000008B0C: 81138112
	s_cmp_gt_u32 s18, 1                                        // 000000008B10: BF088112
	s_cselect_b32 s18, -1, 0                                   // 000000008B14: 981280C1
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(SALU_CYCLE_1)// 000000008B18: BF8704A1
	v_cmp_le_i32_e32 vcc_lo, s16, v7                           // 000000008B1C: 7C860E10
	s_or_b32 s18, vcc_lo, s18                                  // 000000008B20: 8C12126A
	s_and_b32 s18, exec_lo, s18                                // 000000008B24: 8B12127E
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008B28: BF870009
	s_or_b32 s17, s18, s17                                     // 000000008B2C: 8C111112
	s_mov_b32 s18, s19                                         // 000000008B30: BE920013
	s_and_not1_b32 exec_lo, exec_lo, s17                       // 000000008B34: 917E117E
	s_cbranch_execz 56                                         // 000000008B38: BFA50038 <__amd_rocclr_fillImage+0x21c>
	s_cmp_lt_i32 s2, 1                                         // 000000008B3C: BF048102
	s_mov_b32 s19, 0                                           // 000000008B40: BE930080
	s_cbranch_scc1 15                                          // 000000008B44: BFA2000F <__amd_rocclr_fillImage+0x184>
	s_cmp_gt_i32 s2, 1                                         // 000000008B48: BF028102
	s_cbranch_scc0 16                                          // 000000008B4C: BFA10010 <__amd_rocclr_fillImage+0x190>
	s_cmp_eq_u32 s2, 2                                         // 000000008B50: BF068202
	s_cbranch_scc0 17                                          // 000000008B54: BFA10011 <__amd_rocclr_fillImage+0x19c>
	s_load_b256 s[24:31], s[0:1], null                         // 000000008B58: F40C0600 F8000000
	v_dual_mov_b32 v3, s12 :: v_dual_mov_b32 v4, s13           // 000000008B60: CA10000C 0304000D
	v_dual_mov_b32 v5, s14 :: v_dual_mov_b32 v6, s15           // 000000008B68: CA10000E 0506000F
	s_mov_b32 s20, 0                                           // 000000008B70: BE940080
	s_waitcnt lgkmcnt(0)                                       // 000000008B74: BF89FC07
	image_store v[3:6], v[7:9], s[24:31] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000008B78: F0180F94 00060307
	s_branch 7                                                 // 000000008B80: BFA00007 <__amd_rocclr_fillImage+0x1a0>
	s_mov_b32 s20, 0                                           // 000000008B84: BE940080
	s_cbranch_execnz 16                                        // 000000008B88: BFA60010 <__amd_rocclr_fillImage+0x1cc>
	s_branch 18                                                // 000000008B8C: BFA00012 <__amd_rocclr_fillImage+0x1d8>
	s_mov_b32 s20, 0                                           // 000000008B90: BE940080
	s_cbranch_execnz 3                                         // 000000008B94: BFA60003 <__amd_rocclr_fillImage+0x1a4>
	s_branch 11                                                // 000000008B98: BFA0000B <__amd_rocclr_fillImage+0x1c8>
	s_mov_b32 s20, -1                                          // 000000008B9C: BE9400C1
	s_branch 9                                                 // 000000008BA0: BFA00009 <__amd_rocclr_fillImage+0x1c8>
	s_load_b256 s[24:31], s[0:1], null                         // 000000008BA4: F40C0600 F8000000
	v_dual_mov_b32 v3, s8 :: v_dual_mov_b32 v4, s9             // 000000008BAC: CA100008 03040009
	v_dual_mov_b32 v5, s10 :: v_dual_mov_b32 v6, s11           // 000000008BB4: CA10000A 0506000B
	s_waitcnt lgkmcnt(0)                                       // 000000008BBC: BF89FC07
	image_store v[3:6], v[7:9], s[24:31] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000008BC0: F0180F94 00060307
	s_branch 3                                                 // 000000008BC8: BFA00003 <__amd_rocclr_fillImage+0x1d8>
	s_cmp_lg_u32 s2, 0                                         // 000000008BCC: BF078002
	s_mov_b32 s19, -1                                          // 000000008BD0: BE9300C1
	s_cselect_b32 s20, -1, 0                                   // 000000008BD4: 981480C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008BD8: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s20                        // 000000008BDC: 916A147E
	s_cbranch_vccz 3                                           // 000000008BE0: BFA30003 <__amd_rocclr_fillImage+0x1f0>
	s_and_not1_b32 vcc_lo, exec_lo, s19                        // 000000008BE4: 916A137E
	s_cbranch_vccnz 65479                                      // 000000008BE8: BFA4FFC7 <__amd_rocclr_fillImage+0x108>
	s_branch 1                                                 // 000000008BEC: BFA00001 <__amd_rocclr_fillImage+0x1f4>
	s_cbranch_execnz 65477                                     // 000000008BF0: BFA6FFC5 <__amd_rocclr_fillImage+0x108>
	s_load_b256 s[20:27], s[0:1], null                         // 000000008BF4: F40C0500 F8000000
	v_dual_mov_b32 v3, s4 :: v_dual_mov_b32 v4, s5             // 000000008BFC: CA100004 03040005
	v_dual_mov_b32 v5, s6 :: v_dual_mov_b32 v6, s7             // 000000008C04: CA100006 05060007
	s_waitcnt lgkmcnt(0)                                       // 000000008C0C: BF89FC07
	image_store v[3:6], v[7:9], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000008C10: F0180F94 00050307
	s_branch 65467                                             // 000000008C18: BFA0FFBB <__amd_rocclr_fillImage+0x108>
	s_nop 0                                                    // 000000008C1C: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000008C20: BFB60003
	s_endpgm                                                   // 000000008C24: BFB00000
	s_nop 0                                                    // 000000008C28: BF800000
	s_nop 0                                                    // 000000008C2C: BF800000
	s_nop 0                                                    // 000000008C30: BF800000
	s_nop 0                                                    // 000000008C34: BF800000
	s_nop 0                                                    // 000000008C38: BF800000
	s_nop 0                                                    // 000000008C3C: BF800000
	s_nop 0                                                    // 000000008C40: BF800000
	s_nop 0                                                    // 000000008C44: BF800000
	s_nop 0                                                    // 000000008C48: BF800000
	s_nop 0                                                    // 000000008C4C: BF800000
	s_nop 0                                                    // 000000008C50: BF800000
	s_nop 0                                                    // 000000008C54: BF800000
	s_nop 0                                                    // 000000008C58: BF800000
	s_nop 0                                                    // 000000008C5C: BF800000
	s_nop 0                                                    // 000000008C60: BF800000
	s_nop 0                                                    // 000000008C64: BF800000
	s_nop 0                                                    // 000000008C68: BF800000
	s_nop 0                                                    // 000000008C6C: BF800000
	s_nop 0                                                    // 000000008C70: BF800000
	s_nop 0                                                    // 000000008C74: BF800000
	s_nop 0                                                    // 000000008C78: BF800000
	s_nop 0                                                    // 000000008C7C: BF800000
	s_nop 0                                                    // 000000008C80: BF800000
	s_nop 0                                                    // 000000008C84: BF800000
	s_nop 0                                                    // 000000008C88: BF800000
	s_nop 0                                                    // 000000008C8C: BF800000
	s_nop 0                                                    // 000000008C90: BF800000
	s_nop 0                                                    // 000000008C94: BF800000
	s_nop 0                                                    // 000000008C98: BF800000
	s_nop 0                                                    // 000000008C9C: BF800000
	s_nop 0                                                    // 000000008CA0: BF800000
	s_nop 0                                                    // 000000008CA4: BF800000
	s_nop 0                                                    // 000000008CA8: BF800000
	s_nop 0                                                    // 000000008CAC: BF800000
	s_nop 0                                                    // 000000008CB0: BF800000
	s_nop 0                                                    // 000000008CB4: BF800000
	s_nop 0                                                    // 000000008CB8: BF800000
	s_nop 0                                                    // 000000008CBC: BF800000
	s_nop 0                                                    // 000000008CC0: BF800000
	s_nop 0                                                    // 000000008CC4: BF800000
	s_nop 0                                                    // 000000008CC8: BF800000
	s_nop 0                                                    // 000000008CCC: BF800000
	s_nop 0                                                    // 000000008CD0: BF800000
	s_nop 0                                                    // 000000008CD4: BF800000
	s_nop 0                                                    // 000000008CD8: BF800000
	s_nop 0                                                    // 000000008CDC: BF800000
	s_nop 0                                                    // 000000008CE0: BF800000
	s_nop 0                                                    // 000000008CE4: BF800000
	s_nop 0                                                    // 000000008CE8: BF800000
	s_nop 0                                                    // 000000008CEC: BF800000
	s_nop 0                                                    // 000000008CF0: BF800000
	s_nop 0                                                    // 000000008CF4: BF800000
	s_nop 0                                                    // 000000008CF8: BF800000
	s_nop 0                                                    // 000000008CFC: BF800000

0000000000008d00 <__amd_rocclr_copyImage>:
	s_clause 0x1                                               // 000000008D00: BF850001
	s_load_b64 s[2:3], s[0:1], 0x4c                            // 000000008D04: F4040080 F800004C
	s_load_b128 s[4:7], s[0:1], 0x68                           // 000000008D0C: F4080100 F8000068
	s_waitcnt lgkmcnt(0)                                       // 000000008D14: BF89FC07
	s_clause 0x1                                               // 000000008D18: BF850001
	s_load_b32 s5, s[0:1], 0x78                                // 000000008D1C: F4000140 F8000078
	s_load_b128 s[8:11], s[0:1], 0x30                          // 000000008D24: F4080200 F8000030
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000008D2C: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 000000008D34: D6100002 02291500
	v_bfe_u32 v3, v0, 20, 10                                   // 000000008D3C: D6100003 02292900
	s_and_b32 s7, s2, 0xffff                                   // 000000008D44: 8B07FF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000008D4C: 85029002
	s_and_b32 s3, s3, 0xffff                                   // 000000008D50: 8B03FF03 0000FFFF
	s_mul_i32 s13, s13, s7                                     // 000000008D58: 960D070D
	s_mul_i32 s14, s14, s2                                     // 000000008D5C: 960E020E
	s_mul_i32 s15, s15, s3                                     // 000000008D60: 960F030F
	v_add3_u32 v0, s4, s13, v1                                 // 000000008D64: D6550000 04041A04
	v_add3_u32 v1, s6, s14, v2                                 // 000000008D6C: D6550001 04081C06
	s_waitcnt lgkmcnt(0)                                       // 000000008D74: BF89FC07
	v_add3_u32 v2, s5, s15, v3                                 // 000000008D78: D6550002 040C1E05
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000008D80: BF870193
	v_cmp_gt_i32_e32 vcc_lo, s8, v0                            // 000000008D84: 7C880008
	v_cmp_gt_i32_e64 s2, s9, v1                                // 000000008D88: D4440002 00020209
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000008D90: BF870113
	v_cmp_gt_i32_e64 s3, s10, v2                               // 000000008D94: D4440003 0002040A
	s_and_b32 s2, vcc_lo, s2                                   // 000000008D9C: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 000000008DA0: BF870481
	s_and_b32 s2, s2, s3                                       // 000000008DA4: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008DA8: BF870009
	s_and_saveexec_b32 s3, s2                                  // 000000008DAC: BE832002
	s_cbranch_execz 22                                         // 000000008DB0: BFA50016 <__amd_rocclr_copyImage+0x10c>
	s_clause 0x1                                               // 000000008DB4: BF850001
	s_load_b128 s[16:19], s[0:1], null                         // 000000008DB8: F4080400 F8000000
	s_load_b256 s[0:7], s[0:1], 0x10                           // 000000008DC0: F40C0000 F8000010
	s_waitcnt lgkmcnt(0)                                       // 000000008DC8: BF89FC07
	s_load_b256 s[8:15], s[16:17], null                        // 000000008DCC: F40C0208 F8000000
	v_add_nc_u32_e32 v5, s2, v2                                // 000000008DD4: 4A0A0402
	v_add_nc_u32_e32 v4, s1, v1                                // 000000008DD8: 4A080201
	v_add_nc_u32_e32 v3, s0, v0                                // 000000008DDC: 4A060000
	v_add_nc_u32_e32 v2, s6, v2                                // 000000008DE0: 4A040406
	v_add_nc_u32_e32 v1, s5, v1                                // 000000008DE4: 4A020205
	v_add_nc_u32_e32 v0, s4, v0                                // 000000008DE8: 4A000004
	s_waitcnt lgkmcnt(0)                                       // 000000008DEC: BF89FC07
	image_load v[3:6], v[3:5], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000008DF0: F0000F94 00020303
	s_load_b256 s[8:15], s[18:19], null                        // 000000008DF8: F40C0209 F8000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008E00: BF890007
	image_store v[3:6], v[0:2], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000008E04: F0180F94 00020300
	s_nop 0                                                    // 000000008E0C: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000008E10: BFB60003
	s_endpgm                                                   // 000000008E14: BFB00000
	s_nop 0                                                    // 000000008E18: BF800000
	s_nop 0                                                    // 000000008E1C: BF800000
	s_nop 0                                                    // 000000008E20: BF800000
	s_nop 0                                                    // 000000008E24: BF800000
	s_nop 0                                                    // 000000008E28: BF800000
	s_nop 0                                                    // 000000008E2C: BF800000
	s_nop 0                                                    // 000000008E30: BF800000
	s_nop 0                                                    // 000000008E34: BF800000
	s_nop 0                                                    // 000000008E38: BF800000
	s_nop 0                                                    // 000000008E3C: BF800000
	s_nop 0                                                    // 000000008E40: BF800000
	s_nop 0                                                    // 000000008E44: BF800000
	s_nop 0                                                    // 000000008E48: BF800000
	s_nop 0                                                    // 000000008E4C: BF800000
	s_nop 0                                                    // 000000008E50: BF800000
	s_nop 0                                                    // 000000008E54: BF800000
	s_nop 0                                                    // 000000008E58: BF800000
	s_nop 0                                                    // 000000008E5C: BF800000
	s_nop 0                                                    // 000000008E60: BF800000
	s_nop 0                                                    // 000000008E64: BF800000
	s_nop 0                                                    // 000000008E68: BF800000
	s_nop 0                                                    // 000000008E6C: BF800000
	s_nop 0                                                    // 000000008E70: BF800000
	s_nop 0                                                    // 000000008E74: BF800000
	s_nop 0                                                    // 000000008E78: BF800000
	s_nop 0                                                    // 000000008E7C: BF800000
	s_nop 0                                                    // 000000008E80: BF800000
	s_nop 0                                                    // 000000008E84: BF800000
	s_nop 0                                                    // 000000008E88: BF800000
	s_nop 0                                                    // 000000008E8C: BF800000
	s_nop 0                                                    // 000000008E90: BF800000
	s_nop 0                                                    // 000000008E94: BF800000
	s_nop 0                                                    // 000000008E98: BF800000
	s_nop 0                                                    // 000000008E9C: BF800000
	s_nop 0                                                    // 000000008EA0: BF800000
	s_nop 0                                                    // 000000008EA4: BF800000
	s_nop 0                                                    // 000000008EA8: BF800000
	s_nop 0                                                    // 000000008EAC: BF800000
	s_nop 0                                                    // 000000008EB0: BF800000
	s_nop 0                                                    // 000000008EB4: BF800000
	s_nop 0                                                    // 000000008EB8: BF800000
	s_nop 0                                                    // 000000008EBC: BF800000
	s_nop 0                                                    // 000000008EC0: BF800000
	s_nop 0                                                    // 000000008EC4: BF800000
	s_nop 0                                                    // 000000008EC8: BF800000
	s_nop 0                                                    // 000000008ECC: BF800000
	s_nop 0                                                    // 000000008ED0: BF800000
	s_nop 0                                                    // 000000008ED4: BF800000
	s_nop 0                                                    // 000000008ED8: BF800000
	s_nop 0                                                    // 000000008EDC: BF800000
	s_nop 0                                                    // 000000008EE0: BF800000
	s_nop 0                                                    // 000000008EE4: BF800000
	s_nop 0                                                    // 000000008EE8: BF800000
	s_nop 0                                                    // 000000008EEC: BF800000
	s_nop 0                                                    // 000000008EF0: BF800000
	s_nop 0                                                    // 000000008EF4: BF800000
	s_nop 0                                                    // 000000008EF8: BF800000
	s_nop 0                                                    // 000000008EFC: BF800000

0000000000008f00 <__amd_rocclr_copyImage1DA>:
	s_clause 0x1                                               // 000000008F00: BF850001
	s_load_b64 s[2:3], s[0:1], 0x4c                            // 000000008F04: F4040080 F800004C
	s_load_b128 s[4:7], s[0:1], 0x68                           // 000000008F0C: F4080100 F8000068
	s_waitcnt lgkmcnt(0)                                       // 000000008F14: BF89FC07
	s_clause 0x1                                               // 000000008F18: BF850001
	s_load_b32 s5, s[0:1], 0x78                                // 000000008F1C: F4000140 F8000078
	s_load_b128 s[8:11], s[0:1], 0x30                          // 000000008F24: F4080200 F8000030
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000008F2C: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 000000008F34: D6100002 02291500
	v_bfe_u32 v3, v0, 20, 10                                   // 000000008F3C: D6100003 02292900
	s_and_b32 s7, s2, 0xffff                                   // 000000008F44: 8B07FF02 0000FFFF
	s_lshr_b32 s2, s2, 16                                      // 000000008F4C: 85029002
	s_and_b32 s3, s3, 0xffff                                   // 000000008F50: 8B03FF03 0000FFFF
	s_mul_i32 s13, s13, s7                                     // 000000008F58: 960D070D
	s_mul_i32 s14, s14, s2                                     // 000000008F5C: 960E020E
	s_mul_i32 s15, s15, s3                                     // 000000008F60: 960F030F
	v_add3_u32 v0, s4, s13, v1                                 // 000000008F64: D6550000 04041A04
	v_add3_u32 v1, s6, s14, v2                                 // 000000008F6C: D6550001 04081C06
	s_waitcnt lgkmcnt(0)                                       // 000000008F74: BF89FC07
	v_add3_u32 v2, s5, s15, v3                                 // 000000008F78: D6550002 040C1E05
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000008F80: BF870193
	v_cmp_gt_i32_e32 vcc_lo, s8, v0                            // 000000008F84: 7C880008
	v_cmp_gt_i32_e64 s2, s9, v1                                // 000000008F88: D4440002 00020209
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000008F90: BF870113
	v_cmp_gt_i32_e64 s3, s10, v2                               // 000000008F94: D4440003 0002040A
	s_and_b32 s2, vcc_lo, s2                                   // 000000008F9C: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 000000008FA0: BF870481
	s_and_b32 s2, s2, s3                                       // 000000008FA4: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000008FA8: BF870009
	s_and_saveexec_b32 s3, s2                                  // 000000008FAC: BE832002
	s_cbranch_execz 32                                         // 000000008FB0: BFA50020 <__amd_rocclr_copyImage1DA+0x134>
	s_clause 0x1                                               // 000000008FB4: BF850001
	s_load_b128 s[16:19], s[0:1], null                         // 000000008FB8: F4080400 F8000000
	s_load_b256 s[0:7], s[0:1], 0x10                           // 000000008FC0: F40C0000 F8000010
	s_waitcnt lgkmcnt(0)                                       // 000000008FC8: BF89FC07
	s_load_b256 s[8:15], s[16:17], null                        // 000000008FCC: F40C0208 F8000000
	s_cmp_eq_u32 s3, 0                                         // 000000008FD4: BF068003
	v_add_nc_u32_e32 v4, s1, v1                                // 000000008FD8: 4A080201
	s_cselect_b32 vcc_lo, -1, 0                                // 000000008FDC: 986A80C1
	v_add_nc_u32_e32 v3, s2, v2                                // 000000008FE0: 4A060402
	s_cmp_eq_u32 s7, 0                                         // 000000008FE4: BF068007
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000008FE8: BF870112
	v_dual_cndmask_b32 v6, 0, v4 :: v_dual_add_nc_u32 v1, s5, v1// 000000008FEC: CA600880 06000205
	v_dual_cndmask_b32 v7, v4, v3 :: v_dual_add_nc_u32 v2, s6, v2// 000000008FF4: CA600704 07020406
	s_cselect_b32 vcc_lo, -1, 0                                // 000000008FFC: 986A80C1
	v_add_nc_u32_e32 v5, s0, v0                                // 000000009000: 4A0A0000
	v_add_nc_u32_e32 v0, s4, v0                                // 000000009004: 4A000004
	s_delay_alu instid0(VALU_DEP_3)                            // 000000009008: BF870003
	v_dual_cndmask_b32 v2, v1, v2 :: v_dual_cndmask_b32 v1, 0, v1// 00000000900C: CA520501 02000280
	s_waitcnt lgkmcnt(0)                                       // 000000009014: BF89FC07
	image_load v[3:6], v[5:7], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 000000009018: F0000F94 00020305
	s_load_b256 s[8:15], s[18:19], null                        // 000000009020: F40C0209 F8000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000009028: BF890007
	image_store v[3:6], v[0:2], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 00000000902C: F0180F94 00020300
	s_nop 0                                                    // 000000009034: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000009038: BFB60003
	s_endpgm                                                   // 00000000903C: BFB00000
	s_nop 0                                                    // 000000009040: BF800000
	s_nop 0                                                    // 000000009044: BF800000
	s_nop 0                                                    // 000000009048: BF800000
	s_nop 0                                                    // 00000000904C: BF800000
	s_nop 0                                                    // 000000009050: BF800000
	s_nop 0                                                    // 000000009054: BF800000
	s_nop 0                                                    // 000000009058: BF800000
	s_nop 0                                                    // 00000000905C: BF800000
	s_nop 0                                                    // 000000009060: BF800000
	s_nop 0                                                    // 000000009064: BF800000
	s_nop 0                                                    // 000000009068: BF800000
	s_nop 0                                                    // 00000000906C: BF800000
	s_nop 0                                                    // 000000009070: BF800000
	s_nop 0                                                    // 000000009074: BF800000
	s_nop 0                                                    // 000000009078: BF800000
	s_nop 0                                                    // 00000000907C: BF800000
	s_nop 0                                                    // 000000009080: BF800000
	s_nop 0                                                    // 000000009084: BF800000
	s_nop 0                                                    // 000000009088: BF800000
	s_nop 0                                                    // 00000000908C: BF800000
	s_nop 0                                                    // 000000009090: BF800000
	s_nop 0                                                    // 000000009094: BF800000
	s_nop 0                                                    // 000000009098: BF800000
	s_nop 0                                                    // 00000000909C: BF800000
	s_nop 0                                                    // 0000000090A0: BF800000
	s_nop 0                                                    // 0000000090A4: BF800000
	s_nop 0                                                    // 0000000090A8: BF800000
	s_nop 0                                                    // 0000000090AC: BF800000
	s_nop 0                                                    // 0000000090B0: BF800000
	s_nop 0                                                    // 0000000090B4: BF800000
	s_nop 0                                                    // 0000000090B8: BF800000
	s_nop 0                                                    // 0000000090BC: BF800000
	s_nop 0                                                    // 0000000090C0: BF800000
	s_nop 0                                                    // 0000000090C4: BF800000
	s_nop 0                                                    // 0000000090C8: BF800000
	s_nop 0                                                    // 0000000090CC: BF800000
	s_nop 0                                                    // 0000000090D0: BF800000
	s_nop 0                                                    // 0000000090D4: BF800000
	s_nop 0                                                    // 0000000090D8: BF800000
	s_nop 0                                                    // 0000000090DC: BF800000
	s_nop 0                                                    // 0000000090E0: BF800000
	s_nop 0                                                    // 0000000090E4: BF800000
	s_nop 0                                                    // 0000000090E8: BF800000
	s_nop 0                                                    // 0000000090EC: BF800000
	s_nop 0                                                    // 0000000090F0: BF800000
	s_nop 0                                                    // 0000000090F4: BF800000
	s_nop 0                                                    // 0000000090F8: BF800000
	s_nop 0                                                    // 0000000090FC: BF800000

0000000000009100 <__amd_rocclr_copyBufferToImage>:
	s_clause 0x3                                               // 000000009100: BF850003
	s_load_b64 s[2:3], s[0:1], 0xac                            // 000000009104: F4040080 F80000AC
	s_load_b128 s[16:19], s[0:1], 0xc8                         // 00000000910C: F4080400 F80000C8
	s_load_b256 s[4:11], s[0:1], 0x40                          // 000000009114: F40C0100 F8000040
	s_load_b64 s[20:21], s[0:1], 0xd8                          // 00000000911C: F4040500 F80000D8
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000009124: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 00000000912C: D6100002 02291500
	v_bfe_u32 v0, v0, 20, 10                                   // 000000009134: D6100000 02292900
	s_waitcnt lgkmcnt(0)                                       // 00000000913C: BF89FC07
	s_lshr_b32 s7, s2, 16                                      // 000000009140: 85079002
	s_and_b32 s2, s2, 0xffff                                   // 000000009144: 8B02FF02 0000FFFF
	s_and_b32 s3, s3, 0xffff                                   // 00000000914C: 8B03FF03 0000FFFF
	v_mad_u64_u32 v[3:4], null, s13, s2, v[1:2]                // 000000009154: D6FE7C03 0404040D
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_3)// 00000000915C: BF8701B1
	v_mad_u64_u32 v[5:6], null, s14, s7, v[2:3]                // 000000009160: D6FE7C05 04080E0E
	v_mad_u64_u32 v[1:2], null, s15, s3, v[0:1]                // 000000009168: D6FE7C01 0400060F
	v_add_co_u32 v4, null, s16, v3                             // 000000009170: D7007C04 00020610
	v_add_co_u32 v9, null, s18, v5                             // 000000009178: D7007C09 00020A12
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009180: BF870193
	v_add_co_u32 v10, null, s20, v1                            // 000000009184: D7007C0A 00020214
	v_cmp_gt_i32_e32 vcc_lo, s8, v4                            // 00000000918C: 7C880808
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009190: BF870193
	v_cmp_gt_i32_e64 s2, s9, v9                                // 000000009194: D4440002 00021209
	v_cmp_gt_i32_e64 s3, s10, v10                              // 00000000919C: D4440003 0002140A
	s_delay_alu instid0(VALU_DEP_2)                            // 0000000091A4: BF870002
	s_and_b32 s2, vcc_lo, s2                                   // 0000000091A8: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 0000000091AC: BF870481
	s_and_b32 s2, s2, s3                                       // 0000000091B0: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000091B4: BF870009
	s_and_saveexec_b32 s3, s2                                  // 0000000091B8: BE832002
	s_cbranch_execz 204                                        // 0000000091BC: BFA500CC <__amd_rocclr_copyBufferToImage+0x3f0>
	s_clause 0x1                                               // 0000000091C0: BF850001
	s_load_b128 s[8:11], s[0:1], 0x60                          // 0000000091C4: F4080200 F8000060
	s_load_b256 s[12:19], s[0:1], 0x80                         // 0000000091CC: F40C0300 F8000080
	v_ashrrev_i32_e32 v0, 31, v9                               // 0000000091D4: 3400129F
	v_ashrrev_i32_e32 v5, 31, v4                               // 0000000091D8: 340A089F
	s_waitcnt lgkmcnt(0)                                       // 0000000091DC: BF89FC07
	s_clause 0x1                                               // 0000000091E0: BF850001
	s_load_b256 s[16:23], s[0:1], 0x20                         // 0000000091E4: F40C0400 F8000020
	s_load_b128 s[0:3], s[0:1], null                           // 0000000091EC: F4080000 F8000000
	s_cmp_gt_i32 s8, 3                                         // 0000000091F4: BF028308
	v_mul_lo_u32 v2, v9, s13                                   // 0000000091F8: D72C0002 00001B09
	v_mul_lo_u32 v3, v0, s12                                   // 000000009200: D72C0003 00001900
	v_mad_u64_u32 v[0:1], null, v9, s12, v[4:5]                // 000000009208: D6FE7C00 04101909
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000009210: BF870091
	v_add3_u32 v1, v3, v1, v2                                  // 000000009214: D6550001 040A0303
	v_mad_u64_u32 v[2:3], null, v10, s14, v[0:1]               // 00000000921C: D6FE7C02 04001D0A
	v_ashrrev_i32_e32 v0, 31, v10                              // 000000009224: 3400149F
	v_mul_lo_u32 v1, v10, s15                                  // 000000009228: D72C0001 00001F0A
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_1) | instid1(VALU_DEP_4)// 000000009230: BF870222
	v_mul_lo_u32 v0, v0, s14                                   // 000000009234: D72C0000 00001D00
	s_waitcnt lgkmcnt(0)                                       // 00000000923C: BF89FC07
	v_mad_u64_u32 v[5:6], null, v2, s10, s[16:17]              // 000000009240: D6FE7C05 00401502
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009248: BF870112
	v_add3_u32 v3, v0, v3, v1                                  // 00000000924C: D6550003 04060700
	v_mov_b32_e32 v0, v6                                       // 000000009254: 7E000306
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000009258: BF870091
	v_mad_u64_u32 v[1:2], null, v3, s10, v[0:1]                // 00000000925C: D6FE7C01 04001503
	v_mov_b32_e32 v6, v1                                       // 000000009264: 7E0C0301
	s_cbranch_scc0 26                                          // 000000009268: BFA1001A <__amd_rocclr_copyBufferToImage+0x1d4>
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_1)// 00000000926C: BF8700B1
	v_lshlrev_b64 v[0:1], 2, v[5:6]                            // 000000009270: D73C0000 00020A82
	s_cmp_lt_i32 s9, 2                                         // 000000009278: BF048209
	s_mov_b32 s7, 0                                            // 00000000927C: BE870080
	v_add_co_u32 v7, vcc_lo, s0, v0                            // 000000009280: D7006A07 00020000
	s_delay_alu instid0(VALU_DEP_2)                            // 000000009288: BF870002
	v_add_co_ci_u32_e32 v8, vcc_lo, s1, v1, vcc_lo             // 00000000928C: 40100201
	global_load_b32 v11, v[7:8], off                           // 000000009290: DC520000 0B7C0007
	s_cbranch_scc1 16                                          // 000000009298: BFA20010 <__amd_rocclr_copyBufferToImage+0x1dc>
	s_cmp_eq_u32 s9, 2                                         // 00000000929C: BF068209
	s_cbranch_scc0 17                                          // 0000000092A0: BFA10011 <__amd_rocclr_copyBufferToImage+0x1e8>
	global_load_b32 v3, v[7:8], off offset:4                   // 0000000092A4: DC520004 037C0007
	s_waitcnt vmcnt(1)                                         // 0000000092AC: BF8907F7
	v_and_b32_e32 v0, 0xffff, v11                              // 0000000092B0: 360016FF 0000FFFF
	v_lshrrev_b32_e32 v1, 16, v11                              // 0000000092B8: 32021690
	s_mov_b32 s10, 0                                           // 0000000092BC: BE8A0080
	s_waitcnt vmcnt(0)                                         // 0000000092C0: BF8903F7
	v_and_b32_e32 v2, 0xffff, v3                               // 0000000092C4: 360406FF 0000FFFF
	v_lshrrev_b32_e32 v3, 16, v3                               // 0000000092CC: 32060690
	s_branch 6                                                 // 0000000092D0: BFA00006 <__amd_rocclr_copyBufferToImage+0x1ec>
	s_cbranch_execnz 23                                        // 0000000092D4: BFA60017 <__amd_rocclr_copyBufferToImage+0x234>
	s_branch 125                                               // 0000000092D8: BFA0007D <__amd_rocclr_copyBufferToImage+0x3d0>
	s_mov_b32 s10, 0                                           // 0000000092DC: BE8A0080
	s_cbranch_execnz 3                                         // 0000000092E0: BFA60003 <__amd_rocclr_copyBufferToImage+0x1f0>
	s_branch 5                                                 // 0000000092E4: BFA00005 <__amd_rocclr_copyBufferToImage+0x1fc>
	s_mov_b32 s10, -1                                          // 0000000092E8: BE8A00C1
	s_branch 3                                                 // 0000000092EC: BFA00003 <__amd_rocclr_copyBufferToImage+0x1fc>
	s_cmp_lg_u32 s9, 1                                         // 0000000092F0: BF078109
	s_mov_b32 s7, -1                                           // 0000000092F4: BE8700C1
	s_cselect_b32 s10, -1, 0                                   // 0000000092F8: 980A80C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000092FC: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s10                        // 000000009300: 916A0A7E
	s_cbranch_vccz 29                                          // 000000009304: BFA3001D <__amd_rocclr_copyBufferToImage+0x27c>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 000000009308: 916A077E
	s_cbranch_vccnz 8                                          // 00000000930C: BFA40008 <__amd_rocclr_copyBufferToImage+0x230>
	s_waitcnt vmcnt(0)                                         // 000000009310: BF8903F7
	v_and_b32_e32 v0, 0xff, v11                                // 000000009314: 360016FF 000000FF
	v_bfe_u32 v1, v11, 8, 8                                    // 00000000931C: D6100001 0221110B
	v_bfe_u32 v2, v11, 16, 8                                   // 000000009324: D6100002 0221210B
	v_lshrrev_b32_e32 v3, 24, v11                              // 00000000932C: 32061698
	s_branch 103                                               // 000000009330: BFA00067 <__amd_rocclr_copyBufferToImage+0x3d0>
	s_cmp_eq_u32 s8, 2                                         // 000000009334: BF068208
	s_cbranch_scc1 22                                          // 000000009338: BFA20016 <__amd_rocclr_copyBufferToImage+0x294>
	s_cmp_lt_i32 s9, 2                                         // 00000000933C: BF048209
	s_mov_b32 s7, 0                                            // 000000009340: BE870080
	s_cbranch_scc1 21                                          // 000000009344: BFA20015 <__amd_rocclr_copyBufferToImage+0x29c>
	s_cmp_eq_u32 s9, 2                                         // 000000009348: BF068209
	s_cbranch_scc0 22                                          // 00000000934C: BFA10016 <__amd_rocclr_copyBufferToImage+0x2a8>
	s_waitcnt vmcnt(0)                                         // 000000009350: BF8903F7
	v_lshlrev_b64 v[0:1], 1, v[5:6]                            // 000000009354: D73C0000 00020A81
	s_mov_b32 s8, 0                                            // 00000000935C: BE880080
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009360: BF870111
	v_add_co_u32 v0, vcc_lo, s0, v0                            // 000000009364: D7006A00 00020000
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v1, vcc_lo             // 00000000936C: 40020201
	global_load_u16 v0, v[0:1], off                            // 000000009370: DC4A0000 007C0000
	s_branch 12                                                // 000000009378: BFA0000C <__amd_rocclr_copyBufferToImage+0x2ac>
	global_load_b96 v[1:3], v[7:8], off offset:4               // 00000000937C: DC5A0004 017C0007
	s_waitcnt vmcnt(1)                                         // 000000009384: BF8907F7
	v_mov_b32_e32 v0, v11                                      // 000000009388: 7E00030B
	s_cbranch_execz 65504                                      // 00000000938C: BFA5FFE0 <__amd_rocclr_copyBufferToImage+0x210>
	s_branch 65511                                             // 000000009390: BFA0FFE7 <__amd_rocclr_copyBufferToImage+0x230>
	s_cbranch_execnz 21                                        // 000000009394: BFA60015 <__amd_rocclr_copyBufferToImage+0x2ec>
	s_branch 77                                                // 000000009398: BFA0004D <__amd_rocclr_copyBufferToImage+0x3d0>
	s_mov_b32 s8, 0                                            // 00000000939C: BE880080
	s_cbranch_execnz 3                                         // 0000000093A0: BFA60003 <__amd_rocclr_copyBufferToImage+0x2b0>
	s_branch 5                                                 // 0000000093A4: BFA00005 <__amd_rocclr_copyBufferToImage+0x2bc>
	s_mov_b32 s8, -1                                           // 0000000093A8: BE8800C1
	s_branch 3                                                 // 0000000093AC: BFA00003 <__amd_rocclr_copyBufferToImage+0x2bc>
	s_cmp_lg_u32 s9, 1                                         // 0000000093B0: BF078109
	s_mov_b32 s7, -1                                           // 0000000093B4: BE8700C1
	s_cselect_b32 s8, -1, 0                                    // 0000000093B8: 980880C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000093BC: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s8                         // 0000000093C0: 916A087E
	s_cbranch_vccz 29                                          // 0000000093C4: BFA3001D <__amd_rocclr_copyBufferToImage+0x33c>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 0000000093C8: 916A077E
	s_cbranch_vccnz 6                                          // 0000000093CC: BFA40006 <__amd_rocclr_copyBufferToImage+0x2e8>
	s_waitcnt vmcnt(0)                                         // 0000000093D0: BF8903F7
	v_add_co_u32 v0, vcc_lo, s0, v5                            // 0000000093D4: D7006A00 00020A00
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v6, vcc_lo             // 0000000093DC: 40020C01
	global_load_u8 v0, v[0:1], off                             // 0000000093E0: DC420000 007C0000
	s_branch 57                                                // 0000000093E8: BFA00039 <__amd_rocclr_copyBufferToImage+0x3d0>
	s_cmp_lt_i32 s9, 2                                         // 0000000093EC: BF048209
	s_mov_b32 s7, 0                                            // 0000000093F0: BE870080
	s_cbranch_scc1 28                                          // 0000000093F4: BFA2001C <__amd_rocclr_copyBufferToImage+0x368>
	s_cmp_eq_u32 s9, 2                                         // 0000000093F8: BF068209
	s_cbranch_scc0 29                                          // 0000000093FC: BFA1001D <__amd_rocclr_copyBufferToImage+0x374>
	s_waitcnt vmcnt(0)                                         // 000000009400: BF8903F7
	v_lshlrev_b64 v[0:1], 2, v[5:6]                            // 000000009404: D73C0000 00020A82
	s_mov_b32 s8, 0                                            // 00000000940C: BE880080
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009410: BF870111
	v_add_co_u32 v0, vcc_lo, s0, v0                            // 000000009414: D7006A00 00020000
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v1, vcc_lo             // 00000000941C: 40020201
	global_load_b32 v1, v[0:1], off                            // 000000009420: DC520000 017C0000
	s_waitcnt vmcnt(0)                                         // 000000009428: BF8903F7
	v_and_b32_e32 v0, 0xffff, v1                               // 00000000942C: 360002FF 0000FFFF
	v_lshrrev_b32_e32 v1, 16, v1                               // 000000009434: 32020290
	s_branch 15                                                // 000000009438: BFA0000F <__amd_rocclr_copyBufferToImage+0x378>
	s_waitcnt vmcnt(0)                                         // 00000000943C: BF8903F7
	v_lshlrev_b64 v[0:1], 2, v[5:6]                            // 000000009440: D73C0000 00020A82
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009448: BF870111
	v_add_co_u32 v0, vcc_lo, s0, v0                            // 00000000944C: D7006A00 00020000
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v1, vcc_lo             // 000000009454: 40020201
	global_load_b32 v0, v[0:1], off                            // 000000009458: DC520000 007C0000
	s_cbranch_execz 65499                                      // 000000009460: BFA5FFDB <__amd_rocclr_copyBufferToImage+0x2d0>
	s_branch 65504                                             // 000000009464: BFA0FFE0 <__amd_rocclr_copyBufferToImage+0x2e8>
	s_mov_b32 s8, 0                                            // 000000009468: BE880080
	s_cbranch_execnz 3                                         // 00000000946C: BFA60003 <__amd_rocclr_copyBufferToImage+0x37c>
	s_branch 5                                                 // 000000009470: BFA00005 <__amd_rocclr_copyBufferToImage+0x388>
	s_mov_b32 s8, -1                                           // 000000009474: BE8800C1
	s_branch 3                                                 // 000000009478: BFA00003 <__amd_rocclr_copyBufferToImage+0x388>
	s_cmp_lg_u32 s9, 1                                         // 00000000947C: BF078109
	s_mov_b32 s7, -1                                           // 000000009480: BE8700C1
	s_cselect_b32 s8, -1, 0                                    // 000000009484: 980880C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009488: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s8                         // 00000000948C: 916A087E
	s_cbranch_vccz 26                                          // 000000009490: BFA3001A <__amd_rocclr_copyBufferToImage+0x3fc>
	s_and_not1_b32 vcc_lo, exec_lo, s7                         // 000000009494: 916A077E
	s_cbranch_vccnz 13                                         // 000000009498: BFA4000D <__amd_rocclr_copyBufferToImage+0x3d0>
	s_waitcnt vmcnt(0)                                         // 00000000949C: BF8903F7
	v_lshlrev_b64 v[0:1], 1, v[5:6]                            // 0000000094A0: D73C0000 00020A81
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000094A8: BF870111
	v_add_co_u32 v0, vcc_lo, s0, v0                            // 0000000094AC: D7006A00 00020000
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v1, vcc_lo             // 0000000094B4: 40020201
	global_load_u16 v1, v[0:1], off                            // 0000000094B8: DC4A0000 017C0000
	s_waitcnt vmcnt(0)                                         // 0000000094C0: BF8903F7
	v_and_b32_e32 v0, 0xff, v1                                 // 0000000094C4: 360002FF 000000FF
	v_lshrrev_b32_e32 v1, 8, v1                                // 0000000094CC: 32020288
	s_load_b256 s[8:15], s[2:3], null                          // 0000000094D0: F40C0201 F8000000
	v_add_nc_u32_e32 v4, s4, v4                                // 0000000094D8: 4A080804
	v_add_nc_u32_e32 v5, s5, v9                                // 0000000094DC: 4A0A1205
	v_add_nc_u32_e32 v6, s6, v10                               // 0000000094E0: 4A0C1406
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000094E4: BF890007
	image_store v[0:3], v[4:6], s[8:15] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 0000000094E8: F0180F94 00020004
	s_nop 0                                                    // 0000000094F0: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 0000000094F4: BFB60003
	s_endpgm                                                   // 0000000094F8: BFB00000
	s_waitcnt vmcnt(0)                                         // 0000000094FC: BF8903F7
	v_lshlrev_b64 v[0:1], 2, v[5:6]                            // 000000009500: D73C0000 00020A82
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009508: BF870111
	v_add_co_u32 v0, vcc_lo, s0, v0                            // 00000000950C: D7006A00 00020000
	v_add_co_ci_u32_e32 v1, vcc_lo, s1, v1, vcc_lo             // 000000009514: 40020201
	global_load_b64 v[0:1], v[0:1], off                        // 000000009518: DC560000 007C0000
	s_cbranch_execz 65502                                      // 000000009520: BFA5FFDE <__amd_rocclr_copyBufferToImage+0x39c>
	s_branch 65514                                             // 000000009524: BFA0FFEA <__amd_rocclr_copyBufferToImage+0x3d0>
	s_nop 0                                                    // 000000009528: BF800000
	s_nop 0                                                    // 00000000952C: BF800000
	s_nop 0                                                    // 000000009530: BF800000
	s_nop 0                                                    // 000000009534: BF800000
	s_nop 0                                                    // 000000009538: BF800000
	s_nop 0                                                    // 00000000953C: BF800000
	s_nop 0                                                    // 000000009540: BF800000
	s_nop 0                                                    // 000000009544: BF800000
	s_nop 0                                                    // 000000009548: BF800000
	s_nop 0                                                    // 00000000954C: BF800000
	s_nop 0                                                    // 000000009550: BF800000
	s_nop 0                                                    // 000000009554: BF800000
	s_nop 0                                                    // 000000009558: BF800000
	s_nop 0                                                    // 00000000955C: BF800000
	s_nop 0                                                    // 000000009560: BF800000
	s_nop 0                                                    // 000000009564: BF800000
	s_nop 0                                                    // 000000009568: BF800000
	s_nop 0                                                    // 00000000956C: BF800000
	s_nop 0                                                    // 000000009570: BF800000
	s_nop 0                                                    // 000000009574: BF800000
	s_nop 0                                                    // 000000009578: BF800000
	s_nop 0                                                    // 00000000957C: BF800000
	s_nop 0                                                    // 000000009580: BF800000
	s_nop 0                                                    // 000000009584: BF800000
	s_nop 0                                                    // 000000009588: BF800000
	s_nop 0                                                    // 00000000958C: BF800000
	s_nop 0                                                    // 000000009590: BF800000
	s_nop 0                                                    // 000000009594: BF800000
	s_nop 0                                                    // 000000009598: BF800000
	s_nop 0                                                    // 00000000959C: BF800000
	s_nop 0                                                    // 0000000095A0: BF800000
	s_nop 0                                                    // 0000000095A4: BF800000
	s_nop 0                                                    // 0000000095A8: BF800000
	s_nop 0                                                    // 0000000095AC: BF800000
	s_nop 0                                                    // 0000000095B0: BF800000
	s_nop 0                                                    // 0000000095B4: BF800000
	s_nop 0                                                    // 0000000095B8: BF800000
	s_nop 0                                                    // 0000000095BC: BF800000
	s_nop 0                                                    // 0000000095C0: BF800000
	s_nop 0                                                    // 0000000095C4: BF800000
	s_nop 0                                                    // 0000000095C8: BF800000
	s_nop 0                                                    // 0000000095CC: BF800000
	s_nop 0                                                    // 0000000095D0: BF800000
	s_nop 0                                                    // 0000000095D4: BF800000
	s_nop 0                                                    // 0000000095D8: BF800000
	s_nop 0                                                    // 0000000095DC: BF800000
	s_nop 0                                                    // 0000000095E0: BF800000
	s_nop 0                                                    // 0000000095E4: BF800000
	s_nop 0                                                    // 0000000095E8: BF800000
	s_nop 0                                                    // 0000000095EC: BF800000
	s_nop 0                                                    // 0000000095F0: BF800000
	s_nop 0                                                    // 0000000095F4: BF800000
	s_nop 0                                                    // 0000000095F8: BF800000
	s_nop 0                                                    // 0000000095FC: BF800000

0000000000009600 <__amd_rocclr_copyImageToBuffer>:
	s_clause 0x3                                               // 000000009600: BF850003
	s_load_b64 s[2:3], s[0:1], 0xac                            // 000000009604: F4040080 F80000AC
	s_load_b128 s[16:19], s[0:1], 0xc8                         // 00000000960C: F4080400 F80000C8
	s_load_b256 s[4:11], s[0:1], 0x60                          // 000000009614: F40C0100 F8000060
	s_load_b64 s[20:21], s[0:1], 0xd8                          // 00000000961C: F4040500 F80000D8
	v_and_b32_e32 v1, 0x3ff, v0                                // 000000009624: 360200FF 000003FF
	v_bfe_u32 v2, v0, 10, 10                                   // 00000000962C: D6100002 02291500
	v_bfe_u32 v0, v0, 20, 10                                   // 000000009634: D6100000 02292900
	s_waitcnt lgkmcnt(0)                                       // 00000000963C: BF89FC07
	s_lshr_b32 s7, s2, 16                                      // 000000009640: 85079002
	s_and_b32 s2, s2, 0xffff                                   // 000000009644: 8B02FF02 0000FFFF
	s_and_b32 s3, s3, 0xffff                                   // 00000000964C: 8B03FF03 0000FFFF
	v_mad_u64_u32 v[3:4], null, s13, s2, v[1:2]                // 000000009654: D6FE7C03 0404040D
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_2) | instid1(VALU_DEP_3)// 00000000965C: BF8701B1
	v_mad_u64_u32 v[5:6], null, s14, s7, v[2:3]                // 000000009660: D6FE7C05 04080E0E
	v_mad_u64_u32 v[1:2], null, s15, s3, v[0:1]                // 000000009668: D6FE7C01 0400060F
	v_add_co_u32 v4, null, s16, v3                             // 000000009670: D7007C04 00020610
	v_add_co_u32 v7, null, s18, v5                             // 000000009678: D7007C07 00020A12
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009680: BF870193
	v_add_co_u32 v6, null, s20, v1                             // 000000009684: D7007C06 00020214
	v_cmp_gt_i32_e32 vcc_lo, s4, v4                            // 00000000968C: 7C880804
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009690: BF870193
	v_cmp_gt_i32_e64 s2, s5, v7                                // 000000009694: D4440002 00020E05
	v_cmp_gt_i32_e64 s3, s6, v6                                // 00000000969C: D4440003 00020C06
	s_delay_alu instid0(VALU_DEP_2)                            // 0000000096A4: BF870002
	s_and_b32 s2, vcc_lo, s2                                   // 0000000096A8: 8B02026A
	s_delay_alu instid0(VALU_DEP_1) | instid1(SALU_CYCLE_1)    // 0000000096AC: BF870481
	s_and_b32 s2, s2, s3                                       // 0000000096B0: 8B020302
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000096B4: BF870009
	s_and_saveexec_b32 s3, s2                                  // 0000000096B8: BE832002
	s_cbranch_execz 218                                        // 0000000096BC: BFA500DA <__amd_rocclr_copyImageToBuffer+0x428>
	s_clause 0x1                                               // 0000000096C0: BF850001
	s_load_b256 s[12:19], s[0:1], null                         // 0000000096C4: F40C0300 F8000000
	s_load_b128 s[4:7], s[0:1], 0x20                           // 0000000096CC: F4080100 F8000020
	v_ashrrev_i32_e32 v8, 31, v7                               // 0000000096D4: 34100E9F
	v_ashrrev_i32_e32 v5, 31, v4                               // 0000000096D8: 340A089F
	s_cmp_lt_i32 s8, 2                                         // 0000000096DC: BF048208
	s_waitcnt lgkmcnt(0)                                       // 0000000096E0: BF89FC07
	s_load_b256 s[20:27], s[12:13], null                       // 0000000096E4: F40C0506 F8000000
	v_add_nc_u32_e32 v0, s4, v4                                // 0000000096EC: 4A000804
	v_add_nc_u32_e32 v1, s5, v7                                // 0000000096F0: 4A020E05
	v_add_nc_u32_e32 v2, s6, v6                                // 0000000096F4: 4A040C06
	s_waitcnt lgkmcnt(0)                                       // 0000000096F8: BF89FC07
	image_load v[0:3], v[0:2], s[20:27] dmask:0xf dim:SQ_RSRC_IMG_2D_ARRAY unorm// 0000000096FC: F0000F94 00050000
	s_clause 0x1                                               // 000000009704: BF850001
	s_load_b256 s[20:27], s[0:1], 0x80                         // 000000009708: F40C0500 F8000080
	s_load_b256 s[0:7], s[0:1], 0x40                           // 000000009710: F40C0000 F8000040
	s_waitcnt lgkmcnt(0)                                       // 000000009718: BF89FC07
	v_mul_lo_u32 v10, v7, s21                                  // 00000000971C: D72C000A 00002B07
	v_mul_lo_u32 v11, v8, s20                                  // 000000009724: D72C000B 00002908
	v_mad_u64_u32 v[8:9], null, v7, s20, v[4:5]                // 00000000972C: D6FE7C08 04102907
	v_ashrrev_i32_e32 v4, 31, v6                               // 000000009734: 34080C9F
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009738: BF870191
	v_mul_lo_u32 v7, v4, s22                                   // 00000000973C: D72C0007 00002D04
	v_add3_u32 v9, v11, v9, v10                                // 000000009744: D6550009 042A130B
	s_delay_alu instid0(VALU_DEP_1) | instskip(SKIP_1) | instid1(VALU_DEP_2)// 00000000974C: BF870121
	v_mad_u64_u32 v[10:11], null, v6, s22, v[8:9]              // 000000009750: D6FE7C0A 04202D06
	v_mul_lo_u32 v6, v6, s23                                   // 000000009758: D72C0006 00002F06
	v_mad_u64_u32 v[4:5], null, v10, s10, s[0:1]               // 000000009760: D6FE7C04 0000150A
	s_delay_alu instid0(VALU_DEP_2) | instskip(SKIP_1) | instid1(VALU_DEP_1)// 000000009768: BF8700A2
	v_add3_u32 v8, v7, v11, v6                                 // 00000000976C: D6550008 041A1707
	s_mov_b32 s0, -1                                           // 000000009774: BE8000C1
	v_mad_u64_u32 v[6:7], null, v8, s10, v[5:6]                // 000000009778: D6FE7C06 04141508
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009780: BF870001
	v_mov_b32_e32 v5, v6                                       // 000000009784: 7E0A0306
	s_cbranch_scc1 119                                         // 000000009788: BFA20077 <__amd_rocclr_copyImageToBuffer+0x368>
	s_cmp_lt_i32 s8, 4                                         // 00000000978C: BF048408
	s_cbranch_scc1 59                                          // 000000009790: BFA2003B <__amd_rocclr_copyImageToBuffer+0x280>
	s_cmp_eq_u32 s8, 4                                         // 000000009794: BF068408
	s_cbranch_scc0 56                                          // 000000009798: BFA10038 <__amd_rocclr_copyImageToBuffer+0x27c>
	s_cmp_lt_i32 s9, 2                                         // 00000000979C: BF048209
	s_cbranch_scc1 33                                          // 0000000097A0: BFA20021 <__amd_rocclr_copyImageToBuffer+0x228>
	s_cmp_lt_i32 s9, 4                                         // 0000000097A4: BF048409
	s_cbranch_scc1 12                                          // 0000000097A8: BFA2000C <__amd_rocclr_copyImageToBuffer+0x1dc>
	s_cmp_eq_u32 s9, 4                                         // 0000000097AC: BF068409
	s_cbranch_scc0 9                                           // 0000000097B0: BFA10009 <__amd_rocclr_copyImageToBuffer+0x1d8>
	v_lshlrev_b64 v[6:7], 2, v[4:5]                            // 0000000097B4: D73C0006 00020882
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000097BC: BF870111
	v_add_co_u32 v6, vcc_lo, s14, v6                           // 0000000097C0: D7006A06 00020C0E
	v_add_co_ci_u32_e32 v7, vcc_lo, s15, v7, vcc_lo            // 0000000097C8: 400E0E0F
	s_waitcnt vmcnt(0)                                         // 0000000097CC: BF8903F7
	global_store_b128 v[6:7], v[0:3], off                      // 0000000097D0: DC760000 007C0006
	s_mov_b32 s0, 0                                            // 0000000097D8: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000097DC: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 0000000097E0: 916A007E
	s_cbranch_vccnz 15                                         // 0000000097E4: BFA4000F <__amd_rocclr_copyImageToBuffer+0x224>
	s_cmp_eq_u32 s9, 2                                         // 0000000097E8: BF068209
	s_cbranch_scc0 13                                          // 0000000097EC: BFA1000D <__amd_rocclr_copyImageToBuffer+0x224>
	v_lshlrev_b64 v[6:7], 2, v[4:5]                            // 0000000097F0: D73C0006 00020882
	s_waitcnt vmcnt(0)                                         // 0000000097F8: BF8903F7
	v_lshl_or_b32 v8, v1, 16, v0                               // 0000000097FC: D6560008 04012101
	v_lshl_or_b32 v9, v3, 16, v2                               // 000000009804: D6560009 04092103
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_4)// 00000000980C: BF870213
	v_add_co_u32 v6, vcc_lo, s14, v6                           // 000000009810: D7006A06 00020C0E
	v_add_co_ci_u32_e32 v7, vcc_lo, s15, v7, vcc_lo            // 000000009818: 400E0E0F
	global_store_b64 v[6:7], v[8:9], off                       // 00000000981C: DC6E0000 007C0806
	s_mov_b32 s0, 0                                            // 000000009824: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009828: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 00000000982C: 916A007E
	s_cbranch_vccnz 18                                         // 000000009830: BFA40012 <__amd_rocclr_copyImageToBuffer+0x27c>
	s_cmp_lg_u32 s9, 1                                         // 000000009834: BF078109
	s_cbranch_scc1 16                                          // 000000009838: BFA20010 <__amd_rocclr_copyImageToBuffer+0x27c>
	s_waitcnt vmcnt(0)                                         // 00000000983C: BF8903F7
	v_lshlrev_b32_e32 v7, 16, v2                               // 000000009840: 300E0490
	v_lshlrev_b32_e32 v8, 24, v3                               // 000000009844: 30100698
	v_lshlrev_b64 v[2:3], 2, v[4:5]                            // 000000009848: D73C0002 00020882
	v_lshl_or_b32 v6, v1, 8, v0                                // 000000009850: D6560006 04011101
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009858: BF870191
	v_or3_b32 v6, v6, v7, v8                                   // 00000000985C: D6580006 04220F06
	v_add_co_u32 v2, vcc_lo, s14, v2                           // 000000009864: D7006A02 0002040E
	s_delay_alu instid0(VALU_DEP_4)                            // 00000000986C: BF870004
	v_add_co_ci_u32_e32 v3, vcc_lo, s15, v3, vcc_lo            // 000000009870: 4006060F
	global_store_b32 v[2:3], v6, off                           // 000000009874: DC6A0000 007C0602
	s_mov_b32 s0, 0                                            // 00000000987C: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009880: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 000000009884: 916A007E
	s_cbranch_vccnz 54                                         // 000000009888: BFA40036 <__amd_rocclr_copyImageToBuffer+0x364>
	s_cmp_eq_u32 s8, 2                                         // 00000000988C: BF068208
	s_cbranch_scc0 52                                          // 000000009890: BFA10034 <__amd_rocclr_copyImageToBuffer+0x364>
	s_cmp_lt_i32 s9, 2                                         // 000000009894: BF048209
	s_mov_b32 s0, -1                                           // 000000009898: BE8000C1
	s_cbranch_scc1 31                                          // 00000000989C: BFA2001F <__amd_rocclr_copyImageToBuffer+0x31c>
	s_cmp_lt_i32 s9, 4                                         // 0000000098A0: BF048409
	s_cbranch_scc1 12                                          // 0000000098A4: BFA2000C <__amd_rocclr_copyImageToBuffer+0x2d8>
	s_cmp_eq_u32 s9, 4                                         // 0000000098A8: BF068409
	s_cbranch_scc0 9                                           // 0000000098AC: BFA10009 <__amd_rocclr_copyImageToBuffer+0x2d4>
	s_waitcnt vmcnt(0)                                         // 0000000098B0: BF8903F7
	v_lshlrev_b64 v[2:3], 2, v[4:5]                            // 0000000098B4: D73C0002 00020882
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000098BC: BF870111
	v_add_co_u32 v2, vcc_lo, s14, v2                           // 0000000098C0: D7006A02 0002040E
	v_add_co_ci_u32_e32 v3, vcc_lo, s15, v3, vcc_lo            // 0000000098C8: 4006060F
	global_store_b64 v[2:3], v[0:1], off                       // 0000000098CC: DC6E0000 007C0002
	s_mov_b32 s0, 0                                            // 0000000098D4: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000098D8: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 0000000098DC: 916A007E
	s_cbranch_vccnz 13                                         // 0000000098E0: BFA4000D <__amd_rocclr_copyImageToBuffer+0x318>
	s_cmp_eq_u32 s9, 2                                         // 0000000098E4: BF068209
	s_cbranch_scc0 11                                          // 0000000098E8: BFA1000B <__amd_rocclr_copyImageToBuffer+0x318>
	s_waitcnt vmcnt(0)                                         // 0000000098EC: BF8903F7
	v_lshlrev_b64 v[2:3], 2, v[4:5]                            // 0000000098F0: D73C0002 00020882
	v_lshl_or_b32 v6, v1, 16, v0                               // 0000000098F8: D6560006 04012101
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_3)// 000000009900: BF870192
	v_add_co_u32 v2, vcc_lo, s14, v2                           // 000000009904: D7006A02 0002040E
	v_add_co_ci_u32_e32 v3, vcc_lo, s15, v3, vcc_lo            // 00000000990C: 4006060F
	global_store_b32 v[2:3], v6, off                           // 000000009910: DC6A0000 007C0602
	s_mov_b32 s0, 0                                            // 000000009918: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000991C: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 000000009920: 916A007E
	s_cbranch_vccnz 15                                         // 000000009924: BFA4000F <__amd_rocclr_copyImageToBuffer+0x364>
	s_cmp_lg_u32 s9, 1                                         // 000000009928: BF078109
	s_cbranch_scc1 13                                          // 00000000992C: BFA2000D <__amd_rocclr_copyImageToBuffer+0x364>
	s_waitcnt vmcnt(0)                                         // 000000009930: BF8903F7
	v_lshlrev_b16 v3, 8, v1                                    // 000000009934: D7380003 00020288
	v_lshlrev_b64 v[1:2], 1, v[4:5]                            // 00000000993C: D73C0001 00020881
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009944: BF870112
	v_or_b32_e32 v3, v3, v0                                    // 000000009948: 38060103
	v_add_co_u32 v1, vcc_lo, s16, v1                           // 00000000994C: D7006A01 00020210
	s_delay_alu instid0(VALU_DEP_3)                            // 000000009954: BF870003
	v_add_co_ci_u32_e32 v2, vcc_lo, s17, v2, vcc_lo            // 000000009958: 40040411
	global_store_b16 v[1:2], v3, off                           // 00000000995C: DC660000 007C0301
	s_mov_b32 s0, 0                                            // 000000009964: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009968: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 00000000996C: 916A007E
	s_cbranch_vccnz 45                                         // 000000009970: BFA4002D <__amd_rocclr_copyImageToBuffer+0x428>
	s_cmp_lg_u32 s8, 1                                         // 000000009974: BF078108
	s_cbranch_scc1 43                                          // 000000009978: BFA2002B <__amd_rocclr_copyImageToBuffer+0x428>
	s_cmp_lt_i32 s9, 2                                         // 00000000997C: BF048209
	s_mov_b32 s0, -1                                           // 000000009980: BE8000C1
	s_cbranch_scc1 29                                          // 000000009984: BFA2001D <__amd_rocclr_copyImageToBuffer+0x3fc>
	s_cmp_lt_i32 s9, 4                                         // 000000009988: BF048409
	s_cbranch_scc1 12                                          // 00000000998C: BFA2000C <__amd_rocclr_copyImageToBuffer+0x3c0>
	s_cmp_eq_u32 s9, 4                                         // 000000009990: BF068409
	s_cbranch_scc0 9                                           // 000000009994: BFA10009 <__amd_rocclr_copyImageToBuffer+0x3bc>
	s_waitcnt vmcnt(0)                                         // 000000009998: BF8903F7
	v_lshlrev_b64 v[1:2], 2, v[4:5]                            // 00000000999C: D73C0001 00020882
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000099A4: BF870111
	v_add_co_u32 v1, vcc_lo, s14, v1                           // 0000000099A8: D7006A01 0002020E
	v_add_co_ci_u32_e32 v2, vcc_lo, s15, v2, vcc_lo            // 0000000099B0: 4004040F
	global_store_b32 v[1:2], v0, off                           // 0000000099B4: DC6A0000 007C0001
	s_mov_b32 s0, 0                                            // 0000000099BC: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000099C0: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 0000000099C4: 916A007E
	s_cbranch_vccnz 11                                         // 0000000099C8: BFA4000B <__amd_rocclr_copyImageToBuffer+0x3f8>
	s_cmp_eq_u32 s9, 2                                         // 0000000099CC: BF068209
	s_cbranch_scc0 9                                           // 0000000099D0: BFA10009 <__amd_rocclr_copyImageToBuffer+0x3f8>
	s_waitcnt vmcnt(0)                                         // 0000000099D4: BF8903F7
	v_lshlrev_b64 v[1:2], 1, v[4:5]                            // 0000000099D8: D73C0001 00020881
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(VALU_DEP_2)// 0000000099E0: BF870111
	v_add_co_u32 v1, vcc_lo, s16, v1                           // 0000000099E4: D7006A01 00020210
	v_add_co_ci_u32_e32 v2, vcc_lo, s17, v2, vcc_lo            // 0000000099EC: 40040411
	global_store_b16 v[1:2], v0, off                           // 0000000099F0: DC660000 007C0001
	s_mov_b32 s0, 0                                            // 0000000099F8: BE800080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 0000000099FC: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s0                         // 000000009A00: 916A007E
	s_cbranch_vccnz 8                                          // 000000009A04: BFA40008 <__amd_rocclr_copyImageToBuffer+0x428>
	s_cmp_lg_u32 s9, 1                                         // 000000009A08: BF078109
	s_cbranch_scc1 6                                           // 000000009A0C: BFA20006 <__amd_rocclr_copyImageToBuffer+0x428>
	s_waitcnt vmcnt(0)                                         // 000000009A10: BF8903F7
	v_add_co_u32 v1, vcc_lo, s18, v4                           // 000000009A14: D7006A01 00020812
	v_add_co_ci_u32_e32 v2, vcc_lo, s19, v5, vcc_lo            // 000000009A1C: 40040A13
	global_store_b8 v[1:2], v0, off                            // 000000009A20: DC620000 007C0001
	s_nop 0                                                    // 000000009A28: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000009A2C: BFB60003
	s_endpgm                                                   // 000000009A30: BFB00000
	s_nop 0                                                    // 000000009A34: BF800000
	s_nop 0                                                    // 000000009A38: BF800000
	s_nop 0                                                    // 000000009A3C: BF800000
	s_nop 0                                                    // 000000009A40: BF800000
	s_nop 0                                                    // 000000009A44: BF800000
	s_nop 0                                                    // 000000009A48: BF800000
	s_nop 0                                                    // 000000009A4C: BF800000
	s_nop 0                                                    // 000000009A50: BF800000
	s_nop 0                                                    // 000000009A54: BF800000
	s_nop 0                                                    // 000000009A58: BF800000
	s_nop 0                                                    // 000000009A5C: BF800000
	s_nop 0                                                    // 000000009A60: BF800000
	s_nop 0                                                    // 000000009A64: BF800000
	s_nop 0                                                    // 000000009A68: BF800000
	s_nop 0                                                    // 000000009A6C: BF800000
	s_nop 0                                                    // 000000009A70: BF800000
	s_nop 0                                                    // 000000009A74: BF800000
	s_nop 0                                                    // 000000009A78: BF800000
	s_nop 0                                                    // 000000009A7C: BF800000
	s_nop 0                                                    // 000000009A80: BF800000
	s_nop 0                                                    // 000000009A84: BF800000
	s_nop 0                                                    // 000000009A88: BF800000
	s_nop 0                                                    // 000000009A8C: BF800000
	s_nop 0                                                    // 000000009A90: BF800000
	s_nop 0                                                    // 000000009A94: BF800000
	s_nop 0                                                    // 000000009A98: BF800000
	s_nop 0                                                    // 000000009A9C: BF800000
	s_nop 0                                                    // 000000009AA0: BF800000
	s_nop 0                                                    // 000000009AA4: BF800000
	s_nop 0                                                    // 000000009AA8: BF800000
	s_nop 0                                                    // 000000009AAC: BF800000
	s_nop 0                                                    // 000000009AB0: BF800000
	s_nop 0                                                    // 000000009AB4: BF800000
	s_nop 0                                                    // 000000009AB8: BF800000
	s_nop 0                                                    // 000000009ABC: BF800000
	s_nop 0                                                    // 000000009AC0: BF800000
	s_nop 0                                                    // 000000009AC4: BF800000
	s_nop 0                                                    // 000000009AC8: BF800000
	s_nop 0                                                    // 000000009ACC: BF800000
	s_nop 0                                                    // 000000009AD0: BF800000
	s_nop 0                                                    // 000000009AD4: BF800000
	s_nop 0                                                    // 000000009AD8: BF800000
	s_nop 0                                                    // 000000009ADC: BF800000
	s_nop 0                                                    // 000000009AE0: BF800000
	s_nop 0                                                    // 000000009AE4: BF800000
	s_nop 0                                                    // 000000009AE8: BF800000
	s_nop 0                                                    // 000000009AEC: BF800000
	s_nop 0                                                    // 000000009AF0: BF800000
	s_nop 0                                                    // 000000009AF4: BF800000
	s_nop 0                                                    // 000000009AF8: BF800000
	s_nop 0                                                    // 000000009AFC: BF800000

0000000000009b00 <__amd_rocclr_streamOpsWrite>:
	s_clause 0x1                                               // 000000009B00: BF850001
	s_load_b128 s[4:7], s[0:1], null                           // 000000009B04: F4080100 F8000000
	s_load_b64 s[0:1], s[0:1], 0x10                            // 000000009B0C: F4040000 F8000010
	s_waitcnt lgkmcnt(0)                                       // 000000009B14: BF89FC07
	s_cmp_eq_u64 s[4:5], 0                                     // 000000009B18: BF108004
	s_cbranch_scc1 13                                          // 000000009B1C: BFA2000D <__amd_rocclr_streamOpsWrite+0x54>
	v_dual_mov_b32 v0, 0 :: v_dual_mov_b32 v1, s0              // 000000009B20: CA100080 00000000
	global_store_b32 v0, v1, s[4:5]                            // 000000009B28: DC6A0000 00040100
	s_cbranch_execnz 5                                         // 000000009B30: BFA60005 <__amd_rocclr_streamOpsWrite+0x48>
	v_mov_b32_e32 v0, s0                                       // 000000009B34: 7E000200
	v_dual_mov_b32 v2, 0 :: v_dual_mov_b32 v1, s1              // 000000009B38: CA100080 02000001
	global_store_b64 v2, v[0:1], s[6:7]                        // 000000009B40: DC6E0000 00060002
	s_nop 0                                                    // 000000009B48: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 000000009B4C: BFB60003
	s_endpgm                                                   // 000000009B50: BFB00000
	s_branch 65527                                             // 000000009B54: BFA0FFF7 <__amd_rocclr_streamOpsWrite+0x34>
	s_nop 0                                                    // 000000009B58: BF800000
	s_nop 0                                                    // 000000009B5C: BF800000
	s_nop 0                                                    // 000000009B60: BF800000
	s_nop 0                                                    // 000000009B64: BF800000
	s_nop 0                                                    // 000000009B68: BF800000
	s_nop 0                                                    // 000000009B6C: BF800000
	s_nop 0                                                    // 000000009B70: BF800000
	s_nop 0                                                    // 000000009B74: BF800000
	s_nop 0                                                    // 000000009B78: BF800000
	s_nop 0                                                    // 000000009B7C: BF800000
	s_nop 0                                                    // 000000009B80: BF800000
	s_nop 0                                                    // 000000009B84: BF800000
	s_nop 0                                                    // 000000009B88: BF800000
	s_nop 0                                                    // 000000009B8C: BF800000
	s_nop 0                                                    // 000000009B90: BF800000
	s_nop 0                                                    // 000000009B94: BF800000
	s_nop 0                                                    // 000000009B98: BF800000
	s_nop 0                                                    // 000000009B9C: BF800000
	s_nop 0                                                    // 000000009BA0: BF800000
	s_nop 0                                                    // 000000009BA4: BF800000
	s_nop 0                                                    // 000000009BA8: BF800000
	s_nop 0                                                    // 000000009BAC: BF800000
	s_nop 0                                                    // 000000009BB0: BF800000
	s_nop 0                                                    // 000000009BB4: BF800000
	s_nop 0                                                    // 000000009BB8: BF800000
	s_nop 0                                                    // 000000009BBC: BF800000
	s_nop 0                                                    // 000000009BC0: BF800000
	s_nop 0                                                    // 000000009BC4: BF800000
	s_nop 0                                                    // 000000009BC8: BF800000
	s_nop 0                                                    // 000000009BCC: BF800000
	s_nop 0                                                    // 000000009BD0: BF800000
	s_nop 0                                                    // 000000009BD4: BF800000
	s_nop 0                                                    // 000000009BD8: BF800000
	s_nop 0                                                    // 000000009BDC: BF800000
	s_nop 0                                                    // 000000009BE0: BF800000
	s_nop 0                                                    // 000000009BE4: BF800000
	s_nop 0                                                    // 000000009BE8: BF800000
	s_nop 0                                                    // 000000009BEC: BF800000
	s_nop 0                                                    // 000000009BF0: BF800000
	s_nop 0                                                    // 000000009BF4: BF800000
	s_nop 0                                                    // 000000009BF8: BF800000
	s_nop 0                                                    // 000000009BFC: BF800000

0000000000009c00 <__amd_rocclr_streamOpsWait>:
	s_clause 0x1                                               // 000000009C00: BF850001
	s_load_b256 s[4:11], s[0:1], null                          // 000000009C04: F40C0100 F8000000
	s_load_b64 s[0:1], s[0:1], 0x20                            // 000000009C0C: F4040000 F8000020
	s_waitcnt lgkmcnt(0)                                       // 000000009C14: BF89FC07
	v_cmp_lt_i64_e64 s2, s[10:11], 2                           // 000000009C18: D4510002 0001040A
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009C20: BF870001
	s_and_b32 vcc_lo, exec_lo, s2                              // 000000009C24: 8B6A027E
	s_mov_b32 s2, -1                                           // 000000009C28: BE8200C1
	s_cbranch_vccnz 82                                         // 000000009C2C: BFA40052 <__amd_rocclr_streamOpsWait+0x178>
	v_cmp_lt_i64_e64 s2, s[10:11], 3                           // 000000009C30: D4510002 0001060A
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009C38: BF870001
	s_and_b32 vcc_lo, exec_lo, s2                              // 000000009C3C: 8B6A027E
	s_mov_b32 s2, -1                                           // 000000009C40: BE8200C1
	s_cbranch_vccnz 36                                         // 000000009C44: BFA40024 <__amd_rocclr_streamOpsWait+0xd8>
	s_cmp_eq_u64 s[10:11], 3                                   // 000000009C48: BF10830A
	s_cbranch_scc0 33                                          // 000000009C4C: BFA10021 <__amd_rocclr_streamOpsWait+0xd4>
	s_cmp_lg_u64 s[4:5], 0                                     // 000000009C50: BF118004
	s_cbranch_scc0 14                                          // 000000009C54: BFA1000E <__amd_rocclr_streamOpsWait+0x90>
	v_mov_b32_e32 v0, 0                                        // 000000009C58: 7E000280
	global_load_b32 v1, v0, s[4:5] glc                         // 000000009C5C: DC524000 01040000
	s_waitcnt vmcnt(0)                                         // 000000009C64: BF8903F7
	v_readfirstlane_b32 s2, v1                                 // 000000009C68: 7E040501
	s_delay_alu instid0(VALU_DEP_1) | instskip(NEXT) | instid1(SALU_CYCLE_1)// 000000009C6C: BF870491
	s_or_b32 s2, s2, s8                                        // 000000009C70: 8C020802
	s_and_b32 s2, s2, s0                                       // 000000009C74: 8B020002
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009C78: BF870009
	s_cmp_lg_u32 s2, s0                                        // 000000009C7C: BF070002
	s_cbranch_scc1 2                                           // 000000009C80: BFA20002 <__amd_rocclr_streamOpsWait+0x8c>
	s_sleep 1                                                  // 000000009C84: BF830001
	s_branch 65524                                             // 000000009C88: BFA0FFF4 <__amd_rocclr_streamOpsWait+0x5c>
	s_mov_b32 s2, 0                                            // 000000009C8C: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009C90: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s2                         // 000000009C94: 916A027E
	s_cbranch_vccnz 14                                         // 000000009C98: BFA4000E <__amd_rocclr_streamOpsWait+0xd4>
	v_mov_b32_e32 v0, 0                                        // 000000009C9C: 7E000280
	global_load_b64 v[1:2], v0, s[6:7] glc                     // 000000009CA0: DC564000 01060000
	s_waitcnt vmcnt(0)                                         // 000000009CA8: BF8903F7
	v_or_b32_e32 v1, s8, v1                                    // 000000009CAC: 38020208
	v_or_b32_e32 v2, s9, v2                                    // 000000009CB0: 38040409
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009CB4: BF870112
	v_and_b32_e32 v1, s0, v1                                   // 000000009CB8: 36020200
	v_and_b32_e32 v2, s1, v2                                   // 000000009CBC: 36040401
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009CC0: BF870001
	v_cmp_ne_u64_e32 vcc_lo, s[0:1], v[1:2]                    // 000000009CC4: 7CBA0200
	s_cbranch_vccnz 2                                          // 000000009CC8: BFA40002 <__amd_rocclr_streamOpsWait+0xd4>
	s_sleep 1                                                  // 000000009CCC: BF830001
	s_branch 65523                                             // 000000009CD0: BFA0FFF3 <__amd_rocclr_streamOpsWait+0xa0>
	s_mov_b32 s2, 0                                            // 000000009CD4: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009CD8: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s2                         // 000000009CDC: 916A027E
	s_cbranch_vccnz 36                                         // 000000009CE0: BFA40024 <__amd_rocclr_streamOpsWait+0x174>
	s_and_b64 s[2:3], s[0:1], s[8:9]                           // 000000009CE4: 8B820800
	s_cmp_lg_u64 s[4:5], 0                                     // 000000009CE8: BF118004
	s_cbranch_scc0 18                                          // 000000009CEC: BFA10012 <__amd_rocclr_streamOpsWait+0x138>
	v_mov_b32_e32 v0, 0                                        // 000000009CF0: 7E000280
	s_mov_b32 s12, 0                                           // 000000009CF4: BE8C0080
	global_load_b32 v1, v0, s[4:5] glc                         // 000000009CF8: DC524000 01040000
	s_waitcnt vmcnt(0)                                         // 000000009D00: BF8903F7
	v_and_b32_e32 v1, s2, v1                                   // 000000009D04: 36020202
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009D08: BF870001
	v_cmp_ne_u32_e32 vcc_lo, 0, v1                             // 000000009D0C: 7C9A0280
	s_cbranch_vccnz 10                                         // 000000009D10: BFA4000A <__amd_rocclr_streamOpsWait+0x13c>
	s_sleep 1                                                  // 000000009D14: BF830001
	global_load_b32 v1, v0, s[4:5] glc                         // 000000009D18: DC524000 01040000
	s_waitcnt vmcnt(0)                                         // 000000009D20: BF8903F7
	v_and_b32_e32 v1, s2, v1                                   // 000000009D24: 36020202
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009D28: BF870001
	v_cmp_ne_u32_e32 vcc_lo, 0, v1                             // 000000009D2C: 7C9A0280
	s_cbranch_vccz 65528                                       // 000000009D30: BFA3FFF8 <__amd_rocclr_streamOpsWait+0x114>
	s_branch 1                                                 // 000000009D34: BFA00001 <__amd_rocclr_streamOpsWait+0x13c>
	s_mov_b32 s12, -1                                          // 000000009D38: BE8C00C1
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009D3C: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s12                        // 000000009D40: 916A0C7E
	s_cbranch_vccnz 11                                         // 000000009D44: BFA4000B <__amd_rocclr_streamOpsWait+0x174>
	v_mov_b32_e32 v0, 0                                        // 000000009D48: 7E000280
	global_load_b64 v[1:2], v0, s[6:7] glc                     // 000000009D4C: DC564000 01060000
	s_waitcnt vmcnt(0)                                         // 000000009D54: BF8903F7
	v_and_b32_e32 v1, s2, v1                                   // 000000009D58: 36020202
	v_and_b32_e32 v2, s3, v2                                   // 000000009D5C: 36040403
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009D60: BF870001
	v_cmp_ne_u64_e32 vcc_lo, 0, v[1:2]                         // 000000009D64: 7CBA0280
	s_cbranch_vccnz 2                                          // 000000009D68: BFA40002 <__amd_rocclr_streamOpsWait+0x174>
	s_sleep 1                                                  // 000000009D6C: BF830001
	s_branch 65526                                             // 000000009D70: BFA0FFF6 <__amd_rocclr_streamOpsWait+0x14c>
	s_mov_b32 s2, 0                                            // 000000009D74: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009D78: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s2                         // 000000009D7C: 916A027E
	s_cbranch_vccnz 64                                         // 000000009D80: BFA40040 <__amd_rocclr_streamOpsWait+0x284>
	v_cmp_gt_i64_e64 s2, s[10:11], 0                           // 000000009D84: D4540002 0001000A
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009D8C: BF870001
	s_and_b32 vcc_lo, exec_lo, s2                              // 000000009D90: 8B6A027E
	s_mov_b32 s2, -1                                           // 000000009D94: BE8200C1
	s_cbranch_vccz 28                                          // 000000009D98: BFA3001C <__amd_rocclr_streamOpsWait+0x20c>
	s_cmp_lg_u64 s[4:5], 0                                     // 000000009D9C: BF118004
	s_cbranch_scc0 11                                          // 000000009DA0: BFA1000B <__amd_rocclr_streamOpsWait+0x1d0>
	v_mov_b32_e32 v0, 0                                        // 000000009DA4: 7E000280
	global_load_b32 v1, v0, s[4:5] glc                         // 000000009DA8: DC524000 01040000
	s_waitcnt vmcnt(0)                                         // 000000009DB0: BF8903F7
	v_and_b32_e32 v1, s0, v1                                   // 000000009DB4: 36020200
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009DB8: BF870001
	v_cmp_eq_u32_e32 vcc_lo, s8, v1                            // 000000009DBC: 7C940208
	s_cbranch_vccnz 2                                          // 000000009DC0: BFA40002 <__amd_rocclr_streamOpsWait+0x1cc>
	s_sleep 1                                                  // 000000009DC4: BF830001
	s_branch 65527                                             // 000000009DC8: BFA0FFF7 <__amd_rocclr_streamOpsWait+0x1a8>
	s_mov_b32 s2, 0                                            // 000000009DCC: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009DD0: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s2                         // 000000009DD4: 916A027E
	s_cbranch_vccnz 11                                         // 000000009DD8: BFA4000B <__amd_rocclr_streamOpsWait+0x208>
	v_mov_b32_e32 v0, 0                                        // 000000009DDC: 7E000280
	global_load_b64 v[1:2], v0, s[6:7] glc                     // 000000009DE0: DC564000 01060000
	s_waitcnt vmcnt(0)                                         // 000000009DE8: BF8903F7
	v_and_b32_e32 v1, s0, v1                                   // 000000009DEC: 36020200
	v_and_b32_e32 v2, s1, v2                                   // 000000009DF0: 36040401
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009DF4: BF870001
	v_cmp_eq_u64_e32 vcc_lo, s[8:9], v[1:2]                    // 000000009DF8: 7CB40208
	s_cbranch_vccnz 2                                          // 000000009DFC: BFA40002 <__amd_rocclr_streamOpsWait+0x208>
	s_sleep 1                                                  // 000000009E00: BF830001
	s_branch 65526                                             // 000000009E04: BFA0FFF6 <__amd_rocclr_streamOpsWait+0x1e0>
	s_mov_b32 s2, 0                                            // 000000009E08: BE820080
	s_delay_alu instid0(SALU_CYCLE_1)                          // 000000009E0C: BF870009
	s_and_not1_b32 vcc_lo, exec_lo, s2                         // 000000009E10: 916A027E
	s_cbranch_vccnz 27                                         // 000000009E14: BFA4001B <__amd_rocclr_streamOpsWait+0x284>
	s_cmp_lg_u64 s[10:11], 0                                   // 000000009E18: BF11800A
	s_cbranch_scc1 25                                          // 000000009E1C: BFA20019 <__amd_rocclr_streamOpsWait+0x284>
	s_cmp_lg_u64 s[4:5], 0                                     // 000000009E20: BF118004
	s_cbranch_scc0 12                                          // 000000009E24: BFA1000C <__amd_rocclr_streamOpsWait+0x258>
	v_mov_b32_e32 v0, 0                                        // 000000009E28: 7E000280
	global_load_b32 v1, v0, s[4:5] glc                         // 000000009E2C: DC524000 01040000
	s_waitcnt vmcnt(0)                                         // 000000009E34: BF8903F7
	v_and_b32_e32 v1, s0, v1                                   // 000000009E38: 36020200
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009E3C: BF870001
	v_cmp_le_u32_e32 vcc_lo, s8, v1                            // 000000009E40: 7C960208
	s_cbranch_vccnz 2                                          // 000000009E44: BFA40002 <__amd_rocclr_streamOpsWait+0x250>
	s_sleep 1                                                  // 000000009E48: BF830001
	s_branch 65527                                             // 000000009E4C: BFA0FFF7 <__amd_rocclr_streamOpsWait+0x22c>
	s_cbranch_execz 1                                          // 000000009E50: BFA50001 <__amd_rocclr_streamOpsWait+0x258>
	s_branch 11                                                // 000000009E54: BFA0000B <__amd_rocclr_streamOpsWait+0x284>
	v_mov_b32_e32 v0, 0                                        // 000000009E58: 7E000280
	global_load_b64 v[1:2], v0, s[6:7] glc                     // 000000009E5C: DC564000 01060000
	s_waitcnt vmcnt(0)                                         // 000000009E64: BF8903F7
	v_and_b32_e32 v1, s0, v1                                   // 000000009E68: 36020200
	v_and_b32_e32 v2, s1, v2                                   // 000000009E6C: 36040401
	s_delay_alu instid0(VALU_DEP_1)                            // 000000009E70: BF870001
	v_cmp_le_u64_e32 vcc_lo, s[8:9], v[1:2]                    // 000000009E74: 7CB60208
	s_cbranch_vccnz 2                                          // 000000009E78: BFA40002 <__amd_rocclr_streamOpsWait+0x284>
	s_sleep 1                                                  // 000000009E7C: BF830001
	s_branch 65526                                             // 000000009E80: BFA0FFF6 <__amd_rocclr_streamOpsWait+0x25c>
	s_endpgm                                                   // 000000009E84: BFB00000
	s_nop 0                                                    // 000000009E88: BF800000
	s_nop 0                                                    // 000000009E8C: BF800000
	s_nop 0                                                    // 000000009E90: BF800000
	s_nop 0                                                    // 000000009E94: BF800000
	s_nop 0                                                    // 000000009E98: BF800000
	s_nop 0                                                    // 000000009E9C: BF800000
	s_nop 0                                                    // 000000009EA0: BF800000
	s_nop 0                                                    // 000000009EA4: BF800000
	s_nop 0                                                    // 000000009EA8: BF800000
	s_nop 0                                                    // 000000009EAC: BF800000
	s_nop 0                                                    // 000000009EB0: BF800000
	s_nop 0                                                    // 000000009EB4: BF800000
	s_nop 0                                                    // 000000009EB8: BF800000
	s_nop 0                                                    // 000000009EBC: BF800000
	s_nop 0                                                    // 000000009EC0: BF800000
	s_nop 0                                                    // 000000009EC4: BF800000
	s_nop 0                                                    // 000000009EC8: BF800000
	s_nop 0                                                    // 000000009ECC: BF800000
	s_nop 0                                                    // 000000009ED0: BF800000
	s_nop 0                                                    // 000000009ED4: BF800000
	s_nop 0                                                    // 000000009ED8: BF800000
	s_nop 0                                                    // 000000009EDC: BF800000
	s_nop 0                                                    // 000000009EE0: BF800000
	s_nop 0                                                    // 000000009EE4: BF800000
	s_nop 0                                                    // 000000009EE8: BF800000
	s_nop 0                                                    // 000000009EEC: BF800000
	s_nop 0                                                    // 000000009EF0: BF800000
	s_nop 0                                                    // 000000009EF4: BF800000
	s_nop 0                                                    // 000000009EF8: BF800000
	s_nop 0                                                    // 000000009EFC: BF800000

0000000000009f00 <__amd_rocclr_initHeap>:
	s_clause 0x1                                               // 000000009F00: BF850001
	s_load_b64 s[8:9], s[0:1], 0x10                            // 000000009F04: F4040200 F8000010
	s_load_b128 s[0:3], s[0:1], null                           // 000000009F0C: F4080000 F8000000
	s_mov_b32 s4, 0                                            // 000000009F14: BE840080
	s_waitcnt lgkmcnt(0)                                       // 000000009F18: BF89FC07
	s_cmp_eq_u32 s8, 0                                         // 000000009F1C: BF068008
	s_cbranch_scc1 148                                         // 000000009F20: BFA20094 <__amd_rocclr_initHeap+0x274>
	s_mov_b32 s5, s4                                           // 000000009F24: BE850004
	s_mov_b32 s6, s4                                           // 000000009F28: BE860004
	s_mov_b32 s7, s4                                           // 000000009F2C: BE870004
	v_lshlrev_b32_e32 v11, 4, v0                               // 000000009F30: 30160084
	v_dual_mov_b32 v1, s4 :: v_dual_mov_b32 v4, s7             // 000000009F34: CA100004 01040007
	v_dual_mov_b32 v2, s5 :: v_dual_mov_b32 v3, s6             // 000000009F3C: CA100005 02020006
	s_delay_alu instid0(VALU_DEP_3) | instskip(NEXT) | instid1(VALU_DEP_1)// 000000009F44: BF870093
	v_add_co_u32 v12, s8, v11, s0                              // 000000009F48: D700080C 0000010B
	v_add_co_ci_u32_e64 v13, null, 0, s1, s8                   // 000000009F50: D5207C0D 00200280
	s_delay_alu instid0(VALU_DEP_2) | instskip(NEXT) | instid1(VALU_DEP_2)// 000000009F58: BF870112
	v_add_co_u32 v5, vcc_lo, v12, 0x2000                       // 000000009F5C: D7006A05 0001FF0C 00002000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 000000009F68: 400C1A80
	s_clause 0x1                                               // 000000009F6C: BF850001
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 000000009F70: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 000000009F78: DC760000 007C0105
	v_add_co_u32 v5, vcc_lo, v12, 0x4000                       // 000000009F80: D7006A05 0001FF0C 00004000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 000000009F8C: 400C1A80
	v_add_co_u32 v7, vcc_lo, v12, 0x6000                       // 000000009F90: D7006A07 0001FF0C 00006000
	v_add_co_ci_u32_e32 v8, vcc_lo, 0, v13, vcc_lo             // 000000009F9C: 40101A80
	v_add_co_u32 v9, vcc_lo, v12, 0x8000                       // 000000009FA0: D7006A09 0001FF0C 00008000
	v_add_co_ci_u32_e32 v10, vcc_lo, 0, v13, vcc_lo            // 000000009FAC: 40141A80
	s_clause 0x5                                               // 000000009FB0: BF850005
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 000000009FB4: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 000000009FBC: DC760000 007C0105
	global_store_b128 v[7:8], v[1:4], off offset:-4096         // 000000009FC4: DC761000 007C0107
	global_store_b128 v[7:8], v[1:4], off                      // 000000009FCC: DC760000 007C0107
	global_store_b128 v[9:10], v[1:4], off offset:-4096        // 000000009FD4: DC761000 007C0109
	global_store_b128 v[9:10], v[1:4], off                     // 000000009FDC: DC760000 007C0109
	v_add_co_u32 v5, vcc_lo, v12, 0xa000                       // 000000009FE4: D7006A05 0001FF0C 0000A000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 000000009FF0: 400C1A80
	v_add_co_u32 v7, vcc_lo, v12, 0xc000                       // 000000009FF4: D7006A07 0001FF0C 0000C000
	v_add_co_ci_u32_e32 v8, vcc_lo, 0, v13, vcc_lo             // 00000000A000: 40101A80
	v_add_co_u32 v9, vcc_lo, v12, 0xe000                       // 00000000A004: D7006A09 0001FF0C 0000E000
	v_add_co_ci_u32_e32 v10, vcc_lo, 0, v13, vcc_lo            // 00000000A010: 40141A80
	s_clause 0x5                                               // 00000000A014: BF850005
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 00000000A018: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 00000000A020: DC760000 007C0105
	global_store_b128 v[7:8], v[1:4], off offset:-4096         // 00000000A028: DC761000 007C0107
	global_store_b128 v[7:8], v[1:4], off                      // 00000000A030: DC760000 007C0107
	global_store_b128 v[9:10], v[1:4], off offset:-4096        // 00000000A038: DC761000 007C0109
	global_store_b128 v[9:10], v[1:4], off                     // 00000000A040: DC760000 007C0109
	v_add_co_u32 v5, vcc_lo, v12, 0x10000                      // 00000000A048: D7006A05 0001FF0C 00010000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 00000000A054: 400C1A80
	v_add_co_u32 v7, vcc_lo, v12, 0x12000                      // 00000000A058: D7006A07 0001FF0C 00012000
	v_add_co_ci_u32_e32 v8, vcc_lo, 0, v13, vcc_lo             // 00000000A064: 40101A80
	v_add_co_u32 v9, vcc_lo, v12, 0x14000                      // 00000000A068: D7006A09 0001FF0C 00014000
	v_add_co_ci_u32_e32 v10, vcc_lo, 0, v13, vcc_lo            // 00000000A074: 40141A80
	s_clause 0x5                                               // 00000000A078: BF850005
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 00000000A07C: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 00000000A084: DC760000 007C0105
	global_store_b128 v[7:8], v[1:4], off offset:-4096         // 00000000A08C: DC761000 007C0107
	global_store_b128 v[7:8], v[1:4], off                      // 00000000A094: DC760000 007C0107
	global_store_b128 v[9:10], v[1:4], off offset:-4096        // 00000000A09C: DC761000 007C0109
	global_store_b128 v[9:10], v[1:4], off                     // 00000000A0A4: DC760000 007C0109
	v_add_co_u32 v5, vcc_lo, v12, 0x16000                      // 00000000A0AC: D7006A05 0001FF0C 00016000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 00000000A0B8: 400C1A80
	v_add_co_u32 v7, vcc_lo, v12, 0x18000                      // 00000000A0BC: D7006A07 0001FF0C 00018000
	v_add_co_ci_u32_e32 v8, vcc_lo, 0, v13, vcc_lo             // 00000000A0C8: 40101A80
	v_add_co_u32 v9, vcc_lo, v12, 0x1a000                      // 00000000A0CC: D7006A09 0001FF0C 0001A000
	v_add_co_ci_u32_e32 v10, vcc_lo, 0, v13, vcc_lo            // 00000000A0D8: 40141A80
	s_clause 0x5                                               // 00000000A0DC: BF850005
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 00000000A0E0: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 00000000A0E8: DC760000 007C0105
	global_store_b128 v[7:8], v[1:4], off offset:-4096         // 00000000A0F0: DC761000 007C0107
	global_store_b128 v[7:8], v[1:4], off                      // 00000000A0F8: DC760000 007C0107
	global_store_b128 v[9:10], v[1:4], off offset:-4096        // 00000000A100: DC761000 007C0109
	global_store_b128 v[9:10], v[1:4], off                     // 00000000A108: DC760000 007C0109
	v_add_co_u32 v5, vcc_lo, v12, 0x1c000                      // 00000000A110: D7006A05 0001FF0C 0001C000
	v_add_co_ci_u32_e32 v6, vcc_lo, 0, v13, vcc_lo             // 00000000A11C: 400C1A80
	v_add_co_u32 v7, vcc_lo, v12, 0x1e000                      // 00000000A120: D7006A07 0001FF0C 0001E000
	v_add_co_ci_u32_e32 v8, vcc_lo, 0, v13, vcc_lo             // 00000000A12C: 40101A80
	v_add_co_u32 v9, vcc_lo, 0x1f000, v12                      // 00000000A130: D7006A09 000218FF 0001F000
	v_add_co_ci_u32_e32 v10, vcc_lo, 0, v13, vcc_lo            // 00000000A13C: 40141A80
	s_clause 0x5                                               // 00000000A140: BF850005
	global_store_b128 v[5:6], v[1:4], off offset:-4096         // 00000000A144: DC761000 007C0105
	global_store_b128 v[5:6], v[1:4], off                      // 00000000A14C: DC760000 007C0105
	global_store_b128 v[7:8], v[1:4], off offset:-4096         // 00000000A154: DC761000 007C0107
	global_store_b128 v[7:8], v[1:4], off                      // 00000000A15C: DC760000 007C0107
	global_store_b128 v11, v[1:4], s[0:1]                      // 00000000A164: DC760000 0000010B
	global_store_b128 v[9:10], v[1:4], off                     // 00000000A16C: DC760000 007C0109
	s_waitcnt_vscnt null, 0x0                                  // 00000000A174: BC7C0000
	s_barrier                                                  // 00000000A178: BFBD0000
	s_mov_b32 s4, exec_lo                                      // 00000000A17C: BE84007E
	v_cmpx_eq_u32_e32 0, v0                                    // 00000000A180: 7D940080
	s_cbranch_execz 19                                         // 00000000A184: BFA50013 <__amd_rocclr_initHeap+0x2d4>
	s_mov_b32 s5, 0                                            // 00000000A188: BE850080
	s_mov_b32 s4, s9                                           // 00000000A18C: BE840009
	v_dual_mov_b32 v6, 0x1a000 :: v_dual_mov_b32 v5, s3        // 00000000A190: CA1000FF 06040003 0001A000
	s_lshl_b64 s[4:5], s[4:5], 21                              // 00000000A19C: 84849504
	v_mov_b32_e32 v2, s2                                       // 00000000A1A0: 7E040202
	s_add_u32 s4, s4, s2                                       // 00000000A1A4: 80040204
	s_addc_u32 s5, s5, s3                                      // 00000000A1A8: 82050305
	s_delay_alu instid0(SALU_CYCLE_1)                          // 00000000A1AC: BF870009
	v_dual_mov_b32 v4, s2 :: v_dual_mov_b32 v1, s5             // 00000000A1B0: CA100002 04000005
	v_dual_mov_b32 v0, s4 :: v_dual_mov_b32 v3, s3             // 00000000A1B8: CA100004 00020003
	s_clause 0x1                                               // 00000000A1C0: BF850001
	global_store_b64 v6, v[4:5], s[0:1] offset:2048            // 00000000A1C4: DC6E0800 00000406
	global_store_b128 v6, v[0:3], s[0:1] offset:2056           // 00000000A1CC: DC760808 00000006
	s_nop 0                                                    // 00000000A1D4: BF800000
	s_sendmsg sendmsg(MSG_DEALLOC_VGPRS)                       // 00000000A1D8: BFB60003
	s_endpgm                                                   // 00000000A1DC: BFB00000
	s_code_end                                                 // 00000000A1E0: BF9F0000
	s_code_end                                                 // 00000000A1E4: BF9F0000
	s_code_end                                                 // 00000000A1E8: BF9F0000
	s_code_end                                                 // 00000000A1EC: BF9F0000
	s_code_end                                                 // 00000000A1F0: BF9F0000
	s_code_end                                                 // 00000000A1F4: BF9F0000
	s_code_end                                                 // 00000000A1F8: BF9F0000
	s_code_end                                                 // 00000000A1FC: BF9F0000
	s_code_end                                                 // 00000000A200: BF9F0000
	s_code_end                                                 // 00000000A204: BF9F0000
	s_code_end                                                 // 00000000A208: BF9F0000
	s_code_end                                                 // 00000000A20C: BF9F0000
	s_code_end                                                 // 00000000A210: BF9F0000
	s_code_end                                                 // 00000000A214: BF9F0000
	s_code_end                                                 // 00000000A218: BF9F0000
	s_code_end                                                 // 00000000A21C: BF9F0000
	s_code_end                                                 // 00000000A220: BF9F0000
	s_code_end                                                 // 00000000A224: BF9F0000
	s_code_end                                                 // 00000000A228: BF9F0000
	s_code_end                                                 // 00000000A22C: BF9F0000
	s_code_end                                                 // 00000000A230: BF9F0000
	s_code_end                                                 // 00000000A234: BF9F0000
	s_code_end                                                 // 00000000A238: BF9F0000
	s_code_end                                                 // 00000000A23C: BF9F0000
	s_code_end                                                 // 00000000A240: BF9F0000
	s_code_end                                                 // 00000000A244: BF9F0000
	s_code_end                                                 // 00000000A248: BF9F0000
	s_code_end                                                 // 00000000A24C: BF9F0000
	s_code_end                                                 // 00000000A250: BF9F0000
	s_code_end                                                 // 00000000A254: BF9F0000
	s_code_end                                                 // 00000000A258: BF9F0000
	s_code_end                                                 // 00000000A25C: BF9F0000
	s_code_end                                                 // 00000000A260: BF9F0000
	s_code_end                                                 // 00000000A264: BF9F0000
	s_code_end                                                 // 00000000A268: BF9F0000
	s_code_end                                                 // 00000000A26C: BF9F0000
	s_code_end                                                 // 00000000A270: BF9F0000
	s_code_end                                                 // 00000000A274: BF9F0000
	s_code_end                                                 // 00000000A278: BF9F0000
	s_code_end                                                 // 00000000A27C: BF9F0000
	s_code_end                                                 // 00000000A280: BF9F0000
	s_code_end                                                 // 00000000A284: BF9F0000
	s_code_end                                                 // 00000000A288: BF9F0000
	s_code_end                                                 // 00000000A28C: BF9F0000
	s_code_end                                                 // 00000000A290: BF9F0000
	s_code_end                                                 // 00000000A294: BF9F0000
	s_code_end                                                 // 00000000A298: BF9F0000
	s_code_end                                                 // 00000000A29C: BF9F0000
	s_code_end                                                 // 00000000A2A0: BF9F0000
	s_code_end                                                 // 00000000A2A4: BF9F0000
	s_code_end                                                 // 00000000A2A8: BF9F0000
	s_code_end                                                 // 00000000A2AC: BF9F0000
	s_code_end                                                 // 00000000A2B0: BF9F0000
	s_code_end                                                 // 00000000A2B4: BF9F0000
	s_code_end                                                 // 00000000A2B8: BF9F0000
	s_code_end                                                 // 00000000A2BC: BF9F0000
	s_code_end                                                 // 00000000A2C0: BF9F0000
	s_code_end                                                 // 00000000A2C4: BF9F0000
	s_code_end                                                 // 00000000A2C8: BF9F0000
	s_code_end                                                 // 00000000A2CC: BF9F0000
	s_code_end                                                 // 00000000A2D0: BF9F0000
	s_code_end                                                 // 00000000A2D4: BF9F0000
	s_code_end                                                 // 00000000A2D8: BF9F0000
	s_code_end                                                 // 00000000A2DC: BF9F0000
	s_code_end                                                 // 00000000A2E0: BF9F0000
	s_code_end                                                 // 00000000A2E4: BF9F0000
	s_code_end                                                 // 00000000A2E8: BF9F0000
	s_code_end                                                 // 00000000A2EC: BF9F0000
	s_code_end                                                 // 00000000A2F0: BF9F0000
	s_code_end                                                 // 00000000A2F4: BF9F0000
	s_code_end                                                 // 00000000A2F8: BF9F0000
	s_code_end                                                 // 00000000A2FC: BF9F0000
	s_code_end                                                 // 00000000A300: BF9F0000
	s_code_end                                                 // 00000000A304: BF9F0000
	s_code_end                                                 // 00000000A308: BF9F0000
	s_code_end                                                 // 00000000A30C: BF9F0000
	s_code_end                                                 // 00000000A310: BF9F0000
	s_code_end                                                 // 00000000A314: BF9F0000
	s_code_end                                                 // 00000000A318: BF9F0000
	s_code_end                                                 // 00000000A31C: BF9F0000
	s_code_end                                                 // 00000000A320: BF9F0000
	s_code_end                                                 // 00000000A324: BF9F0000
	s_code_end                                                 // 00000000A328: BF9F0000
	s_code_end                                                 // 00000000A32C: BF9F0000
	s_code_end                                                 // 00000000A330: BF9F0000
	s_code_end                                                 // 00000000A334: BF9F0000
	s_code_end                                                 // 00000000A338: BF9F0000
	s_code_end                                                 // 00000000A33C: BF9F0000
	s_code_end                                                 // 00000000A340: BF9F0000
	s_code_end                                                 // 00000000A344: BF9F0000
	s_code_end                                                 // 00000000A348: BF9F0000
	s_code_end                                                 // 00000000A34C: BF9F0000
	s_code_end                                                 // 00000000A350: BF9F0000
	s_code_end                                                 // 00000000A354: BF9F0000
	s_code_end                                                 // 00000000A358: BF9F0000
	s_code_end                                                 // 00000000A35C: BF9F0000
	s_code_end                                                 // 00000000A360: BF9F0000
	s_code_end                                                 // 00000000A364: BF9F0000
	s_code_end                                                 // 00000000A368: BF9F0000
	s_code_end                                                 // 00000000A36C: BF9F0000
	s_code_end                                                 // 00000000A370: BF9F0000
	s_code_end                                                 // 00000000A374: BF9F0000
	s_code_end                                                 // 00000000A378: BF9F0000
	s_code_end                                                 // 00000000A37C: BF9F0000
