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
	.file	"arm_atan2_f16.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_atan2_f16.c"
	.section	.rodata.atan2_coefs_f16,"a"
	.align	2
	.type	atan2_coefs_f16, %object
	.size	atan2_coefs_f16, 10
atan2_coefs_f16:
	.short	0
	.short	15360
	.short	0
	.short	-18977
	.short	12509
	.section	.text.arm_atan2_f16,"ax",%progbits
	.align	1
	.global	arm_atan2_f16
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_atan2_f16, %function
arm_atan2_f16:
.LFB137:
	.loc 1 120 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #100
	.cfi_def_cfa_offset 104
	vmov	r3, s0
	strh	r3, [sp, #6]	@ __fp16
	vmov	r3, s1
	strh	r3, [sp, #4]	@ __fp16
	str	r0, [sp]
	.loc 1 121 9
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 121 8
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L68
	.loc 1 123 17
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s13, s15
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	vdiv.f32	s15, s13, s14
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #94]	@ __fp16
.LBB24:
.LBB25:
	.loc 1 69 8
	movs	r3, #0
	str	r3, [sp, #88]
	.loc 1 70 14
	movw	r3, #0
	strh	r3, [sp, #86]	@ __fp16
	.loc 1 72 8
	ldrh	r3, [sp, #94]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 72 7
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L4
	.loc 1 74 11
	movs	r3, #1
	str	r3, [sp, #88]
	.loc 1 75 8
	ldrh	r3, [sp, #94]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #94]	@ __fp16
.L4:
	.loc 1 78 8
	ldrh	r3, [sp, #94]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 78 7
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L69
	.loc 1 80 20
	ldrh	r3, [sp, #94]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 80 18
	vmov.f32	s13, #1.0e+0
	vdiv.f32	s15, s13, s14
	.loc 1 80 9
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #94]	@ __fp16
	ldrh	r3, [sp, #94]	@ __fp16
	strh	r3, [sp, #84]	@ __fp16
.LBB26:
.LBB27:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #82]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #76]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #76]
	.loc 1 58 5
	b	.L8
.L9:
	.loc 1 60 15
	ldrh	r3, [sp, #84]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #82]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #76]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L76
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #82]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #76]
	adds	r3, r3, #1
	str	r3, [sp, #76]
.L8:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #76]
	cmp	r3, #4
	ble	.L9
	.loc 1 64 11
	ldrh	r3, [sp, #82]	@ __fp16
	vmov	s15, r3
.LBE27:
.LBE26:
	.loc 1 81 34 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 81 32 discriminator 1
	vldr.32	s14, .L76+4
	vsub.f32	s15, s14, s15
	.loc 1 81 11 discriminator 1
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #86]	@ __fp16
	b	.L11
.L69:
	ldrh	r3, [sp, #94]	@ __fp16
	strh	r3, [sp, #74]	@ __fp16
.LBB28:
.LBB29:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #72]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #68]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #68]
	.loc 1 58 5
	b	.L12
.L13:
	.loc 1 60 15
	ldrh	r3, [sp, #74]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #72]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #68]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L76
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #72]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #68]
	adds	r3, r3, #1
	str	r3, [sp, #68]
.L12:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #68]
	cmp	r3, #4
	ble	.L13
	.loc 1 64 11
	ldrh	r3, [sp, #72]	@ __fp16
	vmov	s15, r3
.LBE29:
.LBE28:
	.loc 1 85 10 discriminator 1
	ldrh	r3, [sp, #86]	@ __fp16
	vmov	s14, r3
	vcvtb.f32.f16	s14, s14
	.loc 1 85 13 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 85 10 discriminator 1
	vadd.f32	s15, s14, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #86]	@ __fp16
.L11:
	.loc 1 89 7
	ldr	r3, [sp, #88]
	cmp	r3, #0
	beq	.L15
	.loc 1 91 10
	ldrh	r3, [sp, #86]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #86]	@ __fp16
.L15:
	.loc 1 94 10
	ldrh	r2, [sp, #86]	@ __fp16
.LBE25:
.LBE24:
	.loc 1 123 16 discriminator 1
	ldr	r3, [sp]
	strh	r2, [r3]	@ __fp16
	.loc 1 124 15
	movs	r3, #0
	b	.L17
.L68:
	.loc 1 126 9
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 126 8
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L70
	.loc 1 128 13
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 128 12
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L71
	.loc 1 130 30
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s13, s15
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	vdiv.f32	s15, s13, s14
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #66]	@ __fp16
.LBB30:
.LBB31:
	.loc 1 69 8
	movs	r3, #0
	str	r3, [sp, #60]
	.loc 1 70 14
	movw	r3, #0
	strh	r3, [sp, #58]	@ __fp16
	.loc 1 72 8
	ldrh	r3, [sp, #66]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 72 7
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L22
	.loc 1 74 11
	movs	r3, #1
	str	r3, [sp, #60]
	.loc 1 75 8
	ldrh	r3, [sp, #66]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #66]	@ __fp16
.L22:
	.loc 1 78 8
	ldrh	r3, [sp, #66]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 78 7
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L72
	.loc 1 80 20
	ldrh	r3, [sp, #66]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 80 18
	vmov.f32	s13, #1.0e+0
	vdiv.f32	s15, s13, s14
	.loc 1 80 9
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #66]	@ __fp16
	ldrh	r3, [sp, #66]	@ __fp16
	strh	r3, [sp, #56]	@ __fp16
.LBB32:
.LBB33:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #54]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #48]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #48]
	.loc 1 58 5
	b	.L26
.L27:
	.loc 1 60 15
	ldrh	r3, [sp, #56]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #54]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #48]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L76
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #54]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #48]
	adds	r3, r3, #1
	str	r3, [sp, #48]
.L26:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #48]
	cmp	r3, #4
	ble	.L27
	.loc 1 64 11
	ldrh	r3, [sp, #54]	@ __fp16
	vmov	s15, r3
.LBE33:
.LBE32:
	.loc 1 81 34 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 81 32 discriminator 1
	vldr.32	s14, .L76+4
	vsub.f32	s15, s14, s15
	.loc 1 81 11 discriminator 1
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #58]	@ __fp16
	b	.L29
.L72:
	ldrh	r3, [sp, #66]	@ __fp16
	strh	r3, [sp, #46]	@ __fp16
.LBB34:
.LBB35:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #44]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #40]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #40]
	.loc 1 58 5
	b	.L30
.L31:
	.loc 1 60 15
	ldrh	r3, [sp, #46]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #44]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #40]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L76
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #44]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #40]
	adds	r3, r3, #1
	str	r3, [sp, #40]
.L30:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #40]
	cmp	r3, #4
	ble	.L31
	.loc 1 64 11
	ldrh	r3, [sp, #44]	@ __fp16
	vmov	s15, r3
.LBE35:
.LBE34:
	.loc 1 85 10 discriminator 1
	ldrh	r3, [sp, #58]	@ __fp16
	vmov	s14, r3
	vcvtb.f32.f16	s14, s14
	.loc 1 85 13 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 85 10 discriminator 1
	vadd.f32	s15, s14, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #58]	@ __fp16
.L29:
	.loc 1 89 7
	ldr	r3, [sp, #60]
	cmp	r3, #0
	beq	.L33
	.loc 1 91 10
	ldrh	r3, [sp, #58]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #58]	@ __fp16
.L33:
	.loc 1 94 10
	ldrh	r3, [sp, #58]	@ __fp16
	vmov	s15, r3
.LBE31:
.LBE30:
	.loc 1 130 20 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 130 68 discriminator 1
	vldr.32	s14, .L76+8
	vadd.f32	s15, s15, s14
	vcvtb.f16.f32	s15, s15
	.loc 1 130 19 discriminator 1
	ldr	r3, [sp]
	vmov	r2, s15
	strh	r2, [r3]	@ __fp16
	b	.L35
.L77:
	.align	2
.L76:
	.word	atan2_coefs_f16
	.word	1070145536
	.word	1078525952
.L71:
	.loc 1 132 18
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 132 17
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L73
	.loc 1 134 30
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s13, s15
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	vdiv.f32	s15, s13, s14
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #38]	@ __fp16
.LBB36:
.LBB37:
	.loc 1 69 8
	movs	r3, #0
	str	r3, [sp, #32]
	.loc 1 70 14
	movw	r3, #0
	strh	r3, [sp, #30]	@ __fp16
	.loc 1 72 8
	ldrh	r3, [sp, #38]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 72 7
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L38
	.loc 1 74 11
	movs	r3, #1
	str	r3, [sp, #32]
	.loc 1 75 8
	ldrh	r3, [sp, #38]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #38]	@ __fp16
.L38:
	.loc 1 78 8
	ldrh	r3, [sp, #38]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 78 7
	vmov.f32	s14, #1.0e+0
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ble	.L74
	.loc 1 80 20
	ldrh	r3, [sp, #38]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 80 18
	vmov.f32	s13, #1.0e+0
	vdiv.f32	s15, s13, s14
	.loc 1 80 9
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #38]	@ __fp16
	ldrh	r3, [sp, #38]	@ __fp16
	strh	r3, [sp, #28]	@ __fp16
.LBB38:
.LBB39:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #26]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #20]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #20]
	.loc 1 58 5
	b	.L42
.L43:
	.loc 1 60 15
	ldrh	r3, [sp, #28]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #26]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #20]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L78
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #26]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L42:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #4
	ble	.L43
	.loc 1 64 11
	ldrh	r3, [sp, #26]	@ __fp16
	vmov	s15, r3
.LBE39:
.LBE38:
	.loc 1 81 34 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 81 32 discriminator 1
	vldr.32	s14, .L78+4
	vsub.f32	s15, s14, s15
	.loc 1 81 11 discriminator 1
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #30]	@ __fp16
	b	.L45
.L74:
	ldrh	r3, [sp, #38]	@ __fp16
	strh	r3, [sp, #18]	@ __fp16
.LBB40:
.LBB41:
	.loc 1 56 15
	movw	r3, #12509
	strh	r3, [sp, #16]	@ __fp16
	.loc 1 57 9
	movs	r3, #1
	str	r3, [sp, #12]
	.loc 1 58 10
	movs	r3, #1
	str	r3, [sp, #12]
	.loc 1 58 5
	b	.L46
.L47:
	.loc 1 60 15
	ldrh	r3, [sp, #18]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s14, s15
	.loc 1 60 27
	ldrh	r3, [sp, #16]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 60 26
	vmul.f32	s14, s14, s15
	.loc 1 60 73
	ldr	r3, [sp, #12]
	rsb	r3, r3, #4
	.loc 1 60 68
	ldr	r2, .L78
	ldrh	r3, [r2, r3, lsl #1]	@ __fp16
	vmov	s15, r3
	.loc 1 60 43
	vcvtb.f32.f16	s15, s15
	.loc 1 60 41
	vadd.f32	s15, s14, s15
	.loc 1 60 13
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #16]	@ __fp16
	.loc 1 58 18 discriminator 3
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L46:
	.loc 1 58 14 discriminator 1
	ldr	r3, [sp, #12]
	cmp	r3, #4
	ble	.L47
	.loc 1 64 11
	ldrh	r3, [sp, #16]	@ __fp16
	vmov	s15, r3
.LBE41:
.LBE40:
	.loc 1 85 10 discriminator 1
	ldrh	r3, [sp, #30]	@ __fp16
	vmov	s14, r3
	vcvtb.f32.f16	s14, s14
	.loc 1 85 13 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 85 10 discriminator 1
	vadd.f32	s15, s14, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #30]	@ __fp16
.L45:
	.loc 1 89 7
	ldr	r3, [sp, #32]
	cmp	r3, #0
	beq	.L49
	.loc 1 91 10
	ldrh	r3, [sp, #30]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vneg.f32	s15, s15
	vcvtb.f16.f32	s15, s15
	vmov	r3, s15
	strh	r3, [sp, #30]	@ __fp16
.L49:
	.loc 1 94 10
	ldrh	r3, [sp, #30]	@ __fp16
	vmov	s15, r3
.LBE37:
.LBE36:
	.loc 1 134 20 discriminator 1
	vcvtb.f32.f16	s15, s15
	.loc 1 134 68 discriminator 1
	vldr.32	s14, .L78+8
	vsub.f32	s15, s15, s14
	vcvtb.f16.f32	s15, s15
	.loc 1 134 19 discriminator 1
	ldr	r3, [sp]
	vmov	r2, s15
	strh	r2, [r3]	@ __fp16
	b	.L35
.L73:
	.loc 1 138 20
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	vmov	r0, s15
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	vmov	d7, r2, r3
	vmov.f32	s0, s14
	vmov.f32	s1, s15
	bl	__SEGGER_RTL_float64_signbit
	mov	r3, r0
	.loc 1 138 16 discriminator 1
	cmp	r3, #0
	beq	.L51
	.loc 1 140 23
	ldr	r3, [sp]
	movw	r2, #49736
	strh	r2, [r3]	@ __fp16
	b	.L35
.L51:
	.loc 1 144 23
	ldr	r3, [sp]
	movw	r2, #16968
	strh	r2, [r3]	@ __fp16
.L35:
	.loc 1 147 15
	movs	r3, #0
	b	.L17
.L70:
	.loc 1 149 9
	ldrh	r3, [sp, #4]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 149 8
	vcmp.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bne	.L52
	.loc 1 151 13
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 151 12
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L75
	.loc 1 153 20
	ldr	r3, [sp]
	movw	r2, #15945
	strh	r2, [r3]	@ __fp16
	.loc 1 154 19
	movs	r3, #0
	b	.L17
.L75:
	.loc 1 156 13
	ldrh	r3, [sp, #6]	@ __fp16
	vmov	s15, r3
	vcvtb.f32.f16	s15, s15
	.loc 1 156 12
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L52
	.loc 1 158 20
	ldr	r3, [sp]
	movw	r2, #48713
	strh	r2, [r3]	@ __fp16
	.loc 1 159 19
	movs	r3, #0
	b	.L17
.L52:
	.loc 1 164 11
	mvn	r3, #3
.L17:
	.loc 1 166 1
	mov	r0, r3
	add	sp, sp, #100
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L79:
	.align	2
.L78:
	.word	atan2_coefs_f16
	.word	1070145536
	.word	1078525952
	.cfi_endproc
.LFE137:
	.size	arm_atan2_f16, .-arm_atan2_f16
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 3 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types_f16.h"
	.file 5 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x389
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0xc
	.4byte	.LASF31
	.4byte	.LASF32
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
	.4byte	.LASF24
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
	.uleb128 0x5
	.byte	0x5
	.byte	0x1
	.4byte	0x3e
	.byte	0x3
	.2byte	0x258
	.byte	0x3
	.4byte	0xed
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0
	.uleb128 0x7
	.4byte	.LASF17
	.sleb128 -1
	.uleb128 0x7
	.4byte	.LASF18
	.sleb128 -2
	.uleb128 0x7
	.4byte	.LASF19
	.sleb128 -3
	.uleb128 0x7
	.4byte	.LASF20
	.sleb128 -4
	.uleb128 0x7
	.4byte	.LASF21
	.sleb128 -5
	.uleb128 0x7
	.4byte	.LASF22
	.sleb128 -6
	.uleb128 0x7
	.4byte	.LASF23
	.sleb128 -7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x261
	.byte	0x5
	.4byte	0xad
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.byte	0x37
	.byte	0x16
	.4byte	0x10b
	.uleb128 0x9
	.4byte	0xfa
	.uleb128 0x3
	.byte	0x2
	.byte	0x4
	.4byte	.LASF27
	.uleb128 0xa
	.4byte	0x106
	.4byte	0x122
	.uleb128 0xb
	.4byte	0x37
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.4byte	0x112
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2f
	.byte	0x18
	.4byte	0x122
	.uleb128 0x5
	.byte	0x3
	.4byte	atan2_coefs_f16
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x5
	.byte	0x6b
	.byte	0x5
	.4byte	0x29
	.4byte	0x14f
	.uleb128 0xe
	.4byte	0x91
	.byte	0
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0x77
	.byte	0xc
	.4byte	0xed
	.4byte	.LFB137
	.4byte	.LFE137-.LFB137
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x324
	.uleb128 0x10
	.ascii	"y\000"
	.byte	0x1
	.byte	0x77
	.byte	0x24
	.4byte	0xfa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -98
	.uleb128 0x10
	.ascii	"x\000"
	.byte	0x1
	.byte	0x77
	.byte	0x30
	.4byte	0xfa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x77
	.byte	0x3d
	.4byte	0x324
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x12
	.4byte	0x32a
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.byte	0x1
	.byte	0x7b
	.byte	0x11
	.4byte	0x218
	.uleb128 0x13
	.4byte	0x33b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x14
	.4byte	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x12
	.4byte	0x35e
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.byte	0x51
	.byte	0x2c
	.4byte	0x1ee
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x15
	.4byte	0x35e
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x32a
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.byte	0x1
	.byte	0x82
	.byte	0x1e
	.4byte	0x29b
	.uleb128 0x13
	.4byte	0x33b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x14
	.4byte	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -46
	.uleb128 0x12
	.4byte	0x35e
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.byte	0x1
	.byte	0x51
	.byte	0x2c
	.4byte	0x271
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x15
	.4byte	0x35e
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	0x32a
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0x86
	.byte	0x1e
	.uleb128 0x13
	.4byte	0x33b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -66
	.uleb128 0x14
	.4byte	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.4byte	0x351
	.uleb128 0x3
	.byte	0x91
	.sleb128 -74
	.uleb128 0x12
	.4byte	0x35e
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x1
	.byte	0x51
	.byte	0x2c
	.4byte	0x2f6
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x3
	.byte	0x91
	.sleb128 -78
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x15
	.4byte	0x35e
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.uleb128 0x13
	.4byte	0x36b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -86
	.uleb128 0x14
	.4byte	0x375
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.4byte	0x381
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0xfa
	.uleb128 0x17
	.4byte	.LASF36
	.byte	0x1
	.byte	0x43
	.byte	0x38
	.4byte	0xfa
	.byte	0x3
	.4byte	0x35e
	.uleb128 0x18
	.ascii	"x\000"
	.byte	0x1
	.byte	0x43
	.byte	0x4f
	.4byte	0xfa
	.uleb128 0x19
	.4byte	.LASF29
	.byte	0x1
	.byte	0x45
	.byte	0x8
	.4byte	0x29
	.uleb128 0x1a
	.ascii	"res\000"
	.byte	0x1
	.byte	0x46
	.byte	0xe
	.4byte	0xfa
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0x36
	.byte	0x38
	.4byte	0xfa
	.byte	0x3
	.uleb128 0x18
	.ascii	"x\000"
	.byte	0x1
	.byte	0x36
	.byte	0x57
	.4byte	0xfa
	.uleb128 0x1a
	.ascii	"res\000"
	.byte	0x1
	.byte	0x38
	.byte	0xf
	.4byte	0xfa
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0x39
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
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
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.4byte	0x38d
	.4byte	0xbc
	.ascii	"ARM_MATH_SUCCESS\000"
	.4byte	0xc2
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
	.4byte	0xc8
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
	.4byte	0xce
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
	.4byte	0xd4
	.ascii	"ARM_MATH_NANINF\000"
	.4byte	0xda
	.ascii	"ARM_MATH_SINGULAR\000"
	.4byte	0xe0
	.ascii	"ARM_MATH_TEST_FAILURE\000"
	.4byte	0xe6
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
	.4byte	0x127
	.ascii	"atan2_coefs_f16\000"
	.4byte	0x139
	.ascii	"__SEGGER_RTL_float64_signbit\000"
	.4byte	0x14f
	.ascii	"arm_atan2_f16\000"
	.4byte	0x32a
	.ascii	"arm_atan_f16\000"
	.4byte	0x35e
	.ascii	"arm_atan_limited_f16\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x15e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x38d
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
	.4byte	0xed
	.ascii	"arm_status\000"
	.4byte	0x10b
	.ascii	"__fp16\000"
	.4byte	0xfa
	.ascii	"float16_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB137
	.4byte	.LFE137-.LFB137
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB137
	.4byte	.LFE137
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
	.file 6 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions_f16.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x3
	.file 7 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h"
	.byte	0x3
	.uleb128 0x52
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x2
	.file 8 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x8
	.file 9 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_ConfDefaults.h"
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x9
	.file 10 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Conf.h"
	.byte	0x3
	.uleb128 0x43
	.uleb128 0xa
	.file 11 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_Arm_Conf.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 12 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
	.byte	0x3
	.uleb128 0x36
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.file 13 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/string.h"
	.byte	0x3
	.uleb128 0x57
	.uleb128 0xd
	.byte	0x4
	.byte	0x3
	.uleb128 0x58
	.uleb128 0x5
	.file 14 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xe
	.byte	0x4
	.byte	0x4
	.file 15 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/float.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0xf
	.byte	0x4
	.file 16 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/limits.h"
	.byte	0x3
	.uleb128 0x5a
	.uleb128 0x10
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 17 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_memory.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x11
	.byte	0x4
	.file 18 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/none.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x12
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.file 19 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/utils.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x4
	.file 20 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x14
	.file 21 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x15
	.byte	0x4
	.file 22 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x16
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x14
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF17:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF18:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF34:
	.ascii	"__SEGGER_RTL_float64_signbit\000"
.LASF27:
	.ascii	"__fp16\000"
.LASF35:
	.ascii	"arm_atan2_f16\000"
.LASF6:
	.ascii	"long int\000"
.LASF32:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"double\000"
.LASF19:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF36:
	.ascii	"arm_atan_f16\000"
.LASF10:
	.ascii	"float\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"atan2_coefs_f16\000"
.LASF29:
	.ascii	"sign\000"
.LASF22:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF15:
	.ascii	"complex long double\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF31:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_a"
	.ascii	"tan2_f16.c\000"
.LASF28:
	.ascii	"result\000"
.LASF20:
	.ascii	"ARM_MATH_NANINF\000"
.LASF11:
	.ascii	"complex float\000"
.LASF23:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF8:
	.ascii	"long long int\000"
.LASF37:
	.ascii	"arm_atan_limited_f16\000"
.LASF26:
	.ascii	"float16_t\000"
.LASF0:
	.ascii	"char\000"
.LASF16:
	.ascii	"ARM_MATH_SUCCESS\000"
.LASF4:
	.ascii	"short int\000"
.LASF13:
	.ascii	"complex double\000"
.LASF24:
	.ascii	"uint16_t\000"
.LASF30:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF14:
	.ascii	"long double\000"
.LASF2:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"arm_status\000"
.LASF21:
	.ascii	"ARM_MATH_SINGULAR\000"
	.global	__aeabi_f2d
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
