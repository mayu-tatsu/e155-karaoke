	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 38, 1
	.eabi_attribute 18, 4
	.file	"arm_atan2_f32.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_atan2_f32.c"
	.section	.rodata.atan2_coefs_f32,"a"
	.align	2
	.type	atan2_coefs_f32, %object
	.size	atan2_coefs_f32, 40
atan2_coefs_f32:
	.word	0
	.word	1065353217
	.word	-1212150583
	.word	-1096129051
	.word	-1148168637
	.word	1046309180
	.word	-1129710357
	.word	-1103972600
	.word	1040795111
	.word	-1123773787
	.section	.text.arm_atan2_f32,"ax",%progbits
	.align	1
	.global	arm_atan2_f32
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_atan2_f32, %function
arm_atan2_f32:
.LFB136:
	.loc 1 133 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #132
	.cfi_def_cfa_offset 136
	vstr.32	s0, [sp, #12]
	vstr.32	s1, [sp, #8]
	str	r0, [sp, #4]
	.loc 1 134 8
	vldr.32	s15, [sp, #8]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L68
	.loc 1 136 17
	vldr.32	s13, [sp, #12]
	vldr.32	s14, [sp, #8]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #124]
.LBB24:
.LBB25:
	.loc 1 70 8
	movs	r3, #0
	str	r3, [sp, #120]
	.loc 1 71 14
	mov	r3, #0
	str	r3, [sp, #116]	@ float
	.loc 1 73 7
	vldr.32	s15, [sp, #124]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L4
	.loc 1 75 11
	movs	r3, #1
	str	r3, [sp, #120]
	.loc 1 76 8
	vldr.32	s15, [sp, #124]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #124]
.L4:
	.loc 1 79 7
	vldr.32	s15, [sp, #124]
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L69
	.loc 1 81 9
	vmov.f32	s13, #1.0e+0
	vldr.32	s14, [sp, #124]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #124]
	ldr	r3, [sp, #124]	@ float
	str	r3, [sp, #112]	@ float
.LBB26:
.LBB27:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #108]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #104]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #104]
	.loc 1 59 5
	b	.L8
.L9:
	.loc 1 61 16
	vldr.32	s14, [sp, #112]
	vldr.32	s15, [sp, #108]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #104]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L76+4
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #108]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #104]
	adds	r3, r3, #1
	str	r3, [sp, #104]
.L8:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #104]
	cmp	r3, #9
	ble	.L9
	.loc 1 65 11
	vldr.32	s15, [sp, #108]
.LBE27:
.LBE26:
	.loc 1 82 11 discriminator 1
	vldr.32	s14, .L76+8
	vsub.f32	s15, s14, s15
	vstr.32	s15, [sp, #116]
	b	.L11
.L69:
	ldr	r3, [sp, #124]	@ float
	str	r3, [sp, #100]	@ float
.LBB28:
.LBB29:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #96]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #92]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #92]
	.loc 1 59 5
	b	.L12
.L13:
	.loc 1 61 16
	vldr.32	s14, [sp, #100]
	vldr.32	s15, [sp, #96]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #92]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L76+4
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #96]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #92]
	adds	r3, r3, #1
	str	r3, [sp, #92]
.L12:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #92]
	cmp	r3, #9
	ble	.L13
	.loc 1 65 11
	vldr.32	s15, [sp, #96]
.LBE29:
.LBE28:
	.loc 1 86 10 discriminator 1
	vldr.32	s14, [sp, #116]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #116]
.L11:
	.loc 1 90 7
	ldr	r3, [sp, #120]
	cmp	r3, #0
	beq	.L15
	.loc 1 92 10
	vldr.32	s15, [sp, #116]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #116]
.L15:
	.loc 1 95 10
	ldr	r2, [sp, #116]	@ float
.LBE25:
.LBE24:
	.loc 1 136 16 discriminator 1
	ldr	r3, [sp, #4]
	str	r2, [r3]	@ float
	.loc 1 137 15
	movs	r3, #0
	b	.L17
.L68:
	.loc 1 139 8
	vldr.32	s15, [sp, #8]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L70
	.loc 1 141 12
	vldr.32	s15, [sp, #12]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L71
	.loc 1 143 20
	vldr.32	s13, [sp, #12]
	vldr.32	s14, [sp, #8]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #88]
.LBB30:
.LBB31:
	.loc 1 70 8
	movs	r3, #0
	str	r3, [sp, #84]
	.loc 1 71 14
	mov	r3, #0
	str	r3, [sp, #80]	@ float
	.loc 1 73 7
	vldr.32	s15, [sp, #88]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L22
	.loc 1 75 11
	movs	r3, #1
	str	r3, [sp, #84]
	.loc 1 76 8
	vldr.32	s15, [sp, #88]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #88]
.L22:
	.loc 1 79 7
	vldr.32	s15, [sp, #88]
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L72
	.loc 1 81 9
	vmov.f32	s13, #1.0e+0
	vldr.32	s14, [sp, #88]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #88]
	ldr	r3, [sp, #88]	@ float
	str	r3, [sp, #76]	@ float
.LBB32:
.LBB33:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #72]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #68]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #68]
	.loc 1 59 5
	b	.L26
.L27:
	.loc 1 61 16
	vldr.32	s14, [sp, #76]
	vldr.32	s15, [sp, #72]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #68]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L76+4
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #72]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #68]
	adds	r3, r3, #1
	str	r3, [sp, #68]
.L26:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #68]
	cmp	r3, #9
	ble	.L27
	.loc 1 65 11
	vldr.32	s15, [sp, #72]
.LBE33:
.LBE32:
	.loc 1 82 11 discriminator 1
	vldr.32	s14, .L76+8
	vsub.f32	s15, s14, s15
	vstr.32	s15, [sp, #80]
	b	.L29
.L72:
	ldr	r3, [sp, #88]	@ float
	str	r3, [sp, #64]	@ float
.LBB34:
.LBB35:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #60]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #56]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #56]
	.loc 1 59 5
	b	.L30
.L31:
	.loc 1 61 16
	vldr.32	s14, [sp, #64]
	vldr.32	s15, [sp, #60]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #56]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L76+4
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #60]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #56]
	adds	r3, r3, #1
	str	r3, [sp, #56]
.L30:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #56]
	cmp	r3, #9
	ble	.L31
	.loc 1 65 11
	vldr.32	s15, [sp, #60]
.LBE35:
.LBE34:
	.loc 1 86 10 discriminator 1
	vldr.32	s14, [sp, #80]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #80]
.L29:
	.loc 1 90 7
	ldr	r3, [sp, #84]
	cmp	r3, #0
	beq	.L33
	.loc 1 92 10
	vldr.32	s15, [sp, #80]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #80]
.L33:
	.loc 1 95 10
	vldr.32	s15, [sp, #80]
.LBE31:
.LBE30:
	.loc 1 143 38 discriminator 1
	vldr.32	s14, .L76+12
	vadd.f32	s15, s15, s14
	.loc 1 143 19 discriminator 1
	ldr	r3, [sp, #4]
	vstr.32	s15, [r3]
	b	.L35
.L71:
	.loc 1 145 17
	vldr.32	s15, [sp, #12]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L73
	.loc 1 147 20
	vldr.32	s13, [sp, #12]
	vldr.32	s14, [sp, #8]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #52]
.LBB36:
.LBB37:
	.loc 1 70 8
	movs	r3, #0
	str	r3, [sp, #48]
	.loc 1 71 14
	mov	r3, #0
	str	r3, [sp, #44]	@ float
	.loc 1 73 7
	vldr.32	s15, [sp, #52]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L38
	.loc 1 75 11
	movs	r3, #1
	str	r3, [sp, #48]
	.loc 1 76 8
	vldr.32	s15, [sp, #52]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #52]
.L38:
	.loc 1 79 7
	vldr.32	s15, [sp, #52]
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L74
	.loc 1 81 9
	vmov.f32	s13, #1.0e+0
	vldr.32	s14, [sp, #52]
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [sp, #52]
	ldr	r3, [sp, #52]	@ float
	str	r3, [sp, #40]	@ float
.LBB38:
.LBB39:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #36]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #32]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #32]
	.loc 1 59 5
	b	.L42
.L43:
	.loc 1 61 16
	vldr.32	s14, [sp, #40]
	vldr.32	s15, [sp, #36]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #32]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L76+4
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #36]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #32]
	adds	r3, r3, #1
	str	r3, [sp, #32]
.L42:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #32]
	cmp	r3, #9
	ble	.L43
	.loc 1 65 11
	vldr.32	s15, [sp, #36]
.LBE39:
.LBE38:
	.loc 1 82 11 discriminator 1
	vldr.32	s14, .L76+8
	vsub.f32	s15, s14, s15
	vstr.32	s15, [sp, #44]
	b	.L45
.L74:
	ldr	r3, [sp, #52]	@ float
	str	r3, [sp, #28]	@ float
.LBB40:
.LBB41:
	.loc 1 57 15
	ldr	r3, .L76
	str	r3, [sp, #24]	@ float
	.loc 1 58 9
	movs	r3, #1
	str	r3, [sp, #20]
	.loc 1 59 10
	movs	r3, #1
	str	r3, [sp, #20]
	.loc 1 59 5
	b	.L46
.L77:
	.align	2
.L76:
	.word	-1123773787
	.word	atan2_coefs_f32
	.word	1070141403
	.word	1078530011
.L47:
	.loc 1 61 16
	vldr.32	s14, [sp, #28]
	vldr.32	s15, [sp, #24]
	vmul.f32	s14, s14, s15
	.loc 1 61 44
	ldr	r3, [sp, #20]
	rsb	r3, r3, #9
	.loc 1 61 38
	ldr	r2, .L78
	lsls	r3, r3, #2
	add	r3, r3, r2
	vldr.32	s15, [r3]
	.loc 1 61 13
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #24]
	.loc 1 59 19 discriminator 3
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L46:
	.loc 1 59 14 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #9
	ble	.L47
	.loc 1 65 11
	vldr.32	s15, [sp, #24]
.LBE41:
.LBE40:
	.loc 1 86 10 discriminator 1
	vldr.32	s14, [sp, #44]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #44]
.L45:
	.loc 1 90 7
	ldr	r3, [sp, #48]
	cmp	r3, #0
	beq	.L49
	.loc 1 92 10
	vldr.32	s15, [sp, #44]
	vneg.f32	s15, s15
	vstr.32	s15, [sp, #44]
.L49:
	.loc 1 95 10
	vldr.32	s15, [sp, #44]
.LBE37:
.LBE36:
	.loc 1 147 38 discriminator 1
	vldr.32	s14, .L78+4
	vsub.f32	s15, s15, s14
	.loc 1 147 19 discriminator 1
	ldr	r3, [sp, #4]
	vstr.32	s15, [r3]
	b	.L35
.L73:
	.loc 1 151 37
	vldr.32	s0, [sp, #12]
	bl	__SEGGER_RTL_float32_signbit
	mov	r3, r0
	.loc 1 151 16 discriminator 1
	cmp	r3, #0
	beq	.L51
	.loc 1 153 23
	ldr	r3, [sp, #4]
	ldr	r2, .L78+8
	str	r2, [r3]	@ float
	b	.L35
.L51:
	.loc 1 157 23
	ldr	r3, [sp, #4]
	ldr	r2, .L78+12
	str	r2, [r3]	@ float
.L35:
	.loc 1 160 15
	movs	r3, #0
	b	.L17
.L70:
	.loc 1 162 8
	vldr.32	s15, [sp, #8]
	vcmp.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bne	.L52
	.loc 1 164 12
	vldr.32	s15, [sp, #12]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L75
	.loc 1 166 20
	ldr	r3, [sp, #4]
	ldr	r2, .L78+16
	str	r2, [r3]	@ float
	.loc 1 167 19
	movs	r3, #0
	b	.L17
.L75:
	.loc 1 169 12
	vldr.32	s15, [sp, #12]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L52
	.loc 1 171 20
	ldr	r3, [sp, #4]
	ldr	r2, .L78+20
	str	r2, [r3]	@ float
	.loc 1 172 19
	movs	r3, #0
	b	.L17
.L52:
	.loc 1 177 11
	mvn	r3, #3
.L17:
	.loc 1 179 1
	mov	r0, r3
	add	sp, sp, #132
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L79:
	.align	2
.L78:
	.word	atan2_coefs_f32
	.word	1078530011
	.word	-1068953637
	.word	1078530011
	.word	1070141403
	.word	-1077342245
	.cfi_endproc
.LFE136:
	.size	arm_atan2_f32, .-arm_atan2_f32
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 3 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 4 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x387
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0xc
	.4byte	.LASF30
	.4byte	.LASF31
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x113
	.byte	0x1c
	.4byte	0x60
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF15
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x12f
	.byte	0x11
	.4byte	0x83
	.uleb128 0x5
	.4byte	0xad
	.uleb128 0x6
	.byte	0x5
	.byte	0x1
	.4byte	0x3e
	.byte	0x3
	.2byte	0x258
	.byte	0x3
	.4byte	0xff
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.sleb128 -1
	.uleb128 0x8
	.4byte	.LASF20
	.sleb128 -2
	.uleb128 0x8
	.4byte	.LASF21
	.sleb128 -3
	.uleb128 0x8
	.4byte	.LASF22
	.sleb128 -4
	.uleb128 0x8
	.4byte	.LASF23
	.sleb128 -5
	.uleb128 0x8
	.4byte	.LASF24
	.sleb128 -6
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 -7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x261
	.byte	0x5
	.4byte	0xbf
	.uleb128 0x9
	.4byte	0xba
	.4byte	0x11c
	.uleb128 0xa
	.4byte	0x37
	.byte	0x9
	.byte	0
	.uleb128 0x5
	.4byte	0x10c
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x1
	.byte	0x2b
	.byte	0x18
	.4byte	0x11c
	.uleb128 0x5
	.byte	0x3
	.4byte	atan2_coefs_f32
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x4
	.byte	0x6a
	.byte	0x5
	.4byte	0x29
	.4byte	0x149
	.uleb128 0xd
	.4byte	0x83
	.byte	0
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x1
	.byte	0x84
	.byte	0xc
	.4byte	0xff
	.4byte	.LFB136
	.4byte	.LFE136-.LFB136
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x322
	.uleb128 0xf
	.ascii	"y\000"
	.byte	0x1
	.byte	0x84
	.byte	0x24
	.4byte	0xad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0xf
	.ascii	"x\000"
	.byte	0x1
	.byte	0x84
	.byte	0x30
	.4byte	0xad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0x84
	.byte	0x3d
	.4byte	0x322
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x11
	.4byte	0x328
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.byte	0x1
	.byte	0x88
	.byte	0x11
	.4byte	0x212
	.uleb128 0x12
	.4byte	0x339
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.4byte	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	0x35c
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.byte	0x52
	.byte	0x29
	.4byte	0x1e8
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x14
	.4byte	0x35c
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x1
	.byte	0x56
	.byte	0xd
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0x328
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.byte	0x1
	.byte	0x8f
	.byte	0x14
	.4byte	0x299
	.uleb128 0x12
	.4byte	0x339
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x13
	.4byte	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x11
	.4byte	0x35c
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.byte	0x1
	.byte	0x52
	.byte	0x29
	.4byte	0x26c
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x14
	.4byte	0x35c
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0x1
	.byte	0x56
	.byte	0xd
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	0x328
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0x93
	.byte	0x14
	.uleb128 0x12
	.4byte	0x339
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x13
	.4byte	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x13
	.4byte	0x34f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x11
	.4byte	0x35c
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x1
	.byte	0x52
	.byte	0x29
	.4byte	0x2f4
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0x14
	.4byte	0x35c
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x1
	.byte	0x56
	.byte	0xd
	.uleb128 0x12
	.4byte	0x369
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x13
	.4byte	0x373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x13
	.4byte	0x37f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0xad
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0x44
	.byte	0x38
	.4byte	0xad
	.byte	0x3
	.4byte	0x35c
	.uleb128 0x17
	.ascii	"x\000"
	.byte	0x1
	.byte	0x44
	.byte	0x4f
	.4byte	0xad
	.uleb128 0x18
	.4byte	.LASF28
	.byte	0x1
	.byte	0x46
	.byte	0x8
	.4byte	0x29
	.uleb128 0x19
	.ascii	"res\000"
	.byte	0x1
	.byte	0x47
	.byte	0xe
	.4byte	0xad
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF36
	.byte	0x1
	.byte	0x37
	.byte	0x38
	.4byte	0xad
	.byte	0x3
	.uleb128 0x17
	.ascii	"x\000"
	.byte	0x1
	.byte	0x37
	.byte	0x57
	.4byte	0xad
	.uleb128 0x19
	.ascii	"res\000"
	.byte	0x1
	.byte	0x39
	.byte	0xf
	.4byte	0xad
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3a
	.byte	0x9
	.4byte	0x29
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x14c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x38b
	.4byte	0xce
	.ascii	"ARM_MATH_SUCCESS\000"
	.4byte	0xd4
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
	.4byte	0xda
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
	.4byte	0xe0
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
	.4byte	0xe6
	.ascii	"ARM_MATH_NANINF\000"
	.4byte	0xec
	.ascii	"ARM_MATH_SINGULAR\000"
	.4byte	0xf2
	.ascii	"ARM_MATH_TEST_FAILURE\000"
	.4byte	0xf8
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
	.4byte	0x121
	.ascii	"atan2_coefs_f32\000"
	.4byte	0x133
	.ascii	"__SEGGER_RTL_float32_signbit\000"
	.4byte	0x149
	.ascii	"arm_atan2_f32\000"
	.4byte	0x328
	.ascii	"arm_atan_f32\000"
	.4byte	0x35c
	.ascii	"arm_atan_limited_f32\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x153
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x38b
	.4byte	0x29
	.ascii	"int\000"
	.4byte	0x30
	.ascii	"char\000"
	.4byte	0x37
	.ascii	"unsigned int\000"
	.4byte	0x3e
	.ascii	"signed char\000"
	.4byte	0x45
	.ascii	"unsigned char\000"
	.4byte	0x4c
	.ascii	"short int\000"
	.4byte	0x60
	.ascii	"short unsigned int\000"
	.4byte	0x53
	.ascii	"uint16_t\000"
	.4byte	0x67
	.ascii	"long int\000"
	.4byte	0x6e
	.ascii	"long unsigned int\000"
	.4byte	0x75
	.ascii	"long long int\000"
	.4byte	0x7c
	.ascii	"long long unsigned int\000"
	.4byte	0x83
	.ascii	"float\000"
	.4byte	0x8a
	.ascii	"complex float\000"
	.4byte	0x91
	.ascii	"double\000"
	.4byte	0x98
	.ascii	"complex double\000"
	.4byte	0x9f
	.ascii	"long double\000"
	.4byte	0xa6
	.ascii	"complex long double\000"
	.4byte	0xad
	.ascii	"float32_t\000"
	.4byte	0xff
	.ascii	"arm_status\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB136
	.4byte	.LFE136-.LFB136
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB136
	.4byte	.LFE136
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.file 5 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x3
	.file 6 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h"
	.byte	0x3
	.uleb128 0x52
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x2
	.file 7 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x7
	.file 8 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_ConfDefaults.h"
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x8
	.file 9 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Conf.h"
	.byte	0x3
	.uleb128 0x43
	.uleb128 0x9
	.file 10 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0xa
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 11 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
	.byte	0x3
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x4
	.byte	0x4
	.file 12 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h"
	.byte	0x3
	.uleb128 0x57
	.uleb128 0xc
	.byte	0x4
	.byte	0x3
	.uleb128 0x58
	.uleb128 0x4
	.file 13 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.file 14 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/float.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0xe
	.byte	0x4
	.file 15 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/limits.h"
	.byte	0x3
	.uleb128 0x5a
	.uleb128 0xf
	.byte	0x4
	.byte	0x4
	.file 16 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_memory.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x10
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.file 17 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/none.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x11
	.byte	0x4
	.file 18 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/utils.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x12
	.byte	0x4
	.file 19 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x13
	.byte	0x4
	.file 20 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x14
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF19:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF20:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF34:
	.ascii	"arm_atan2_f32\000"
.LASF6:
	.ascii	"long int\000"
.LASF31:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"double\000"
.LASF21:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF10:
	.ascii	"float\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF32:
	.ascii	"atan2_coefs_f32\000"
.LASF28:
	.ascii	"sign\000"
.LASF24:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF36:
	.ascii	"arm_atan_limited_f32\000"
.LASF15:
	.ascii	"complex long double\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF27:
	.ascii	"result\000"
.LASF22:
	.ascii	"ARM_MATH_NANINF\000"
.LASF11:
	.ascii	"complex float\000"
.LASF25:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF14:
	.ascii	"long double\000"
.LASF8:
	.ascii	"long long int\000"
.LASF33:
	.ascii	"__SEGGER_RTL_float32_signbit\000"
.LASF0:
	.ascii	"char\000"
.LASF30:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_a"
	.ascii	"tan2_f32.c\000"
.LASF17:
	.ascii	"float32_t\000"
.LASF18:
	.ascii	"ARM_MATH_SUCCESS\000"
.LASF4:
	.ascii	"short int\000"
.LASF13:
	.ascii	"complex double\000"
.LASF16:
	.ascii	"uint16_t\000"
.LASF29:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF35:
	.ascii	"arm_atan_f32\000"
.LASF2:
	.ascii	"signed char\000"
.LASF26:
	.ascii	"arm_status\000"
.LASF23:
	.ascii	"ARM_MATH_SINGULAR\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
