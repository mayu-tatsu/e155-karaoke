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
	.file	"arm_atan2_q31.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_atan2_q31.c"
	.section	.rodata.atan2_coefs_q31,"a"
	.align	2
	.type	atan2_coefs_q31, %object
	.size	atan2_coefs_q31, 52
atan2_coefs_q31:
	.word	0
	.word	2147483646
	.word	438
	.word	-715844210
	.word	222307
	.word	428209687
	.word	1675950
	.word	-288015745
	.word	-118402491
	.word	571843492
	.word	-520441852
	.word	215828517
	.word	-35930028
	.section	.text.arm_atan2_q31,"ax",%progbits
	.align	1
	.global	arm_atan2_q31
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_atan2_q31, %function
arm_atan2_q31:
.LFB136:
	.loc 1 152 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 504
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	sub	sp, sp, #508
	.cfi_def_cfa_offset 544
	add	r3, sp, #504
	sub	r3, r3, #284
	str	r0, [r3]
	add	r3, sp, #504
	sub	r3, r3, #288
	str	r1, [r3]
	add	r3, sp, #504
	sub	r3, r3, #292
	str	r2, [r3]
	.loc 1 153 8
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L2
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	str	r3, [sp, #252]
	add	r3, sp, #504
	sub	r2, r3, #256
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	str	r3, [r2]
.LBB50:
.LBB51:
	.loc 1 78 8
	movs	r3, #0
	str	r3, [sp, #500]
	.loc 1 79 10
	add	r3, sp, #504
	sub	r2, r3, #260
	movs	r3, #0
	str	r3, [r2]
	.loc 1 81 9
	ldr	r3, [sp, #252]
	.loc 1 81 7
	cmp	r3, #0
	bge	.L3
	.loc 1 83 6
	add	r1, sp, #252
	add	r3, sp, #252
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
	.loc 1 84 10
	ldr	r3, [sp, #500]
	rsb	r3, r3, #1
	str	r3, [sp, #500]
.L3:
	.loc 1 87 10
	add	r3, sp, #504
	sub	r3, r3, #256
	ldr	r3, [r3]
	.loc 1 87 7
	cmp	r3, #0
	bge	.L4
	.loc 1 89 11
	ldr	r3, [sp, #500]
	rsb	r3, r3, #1
	str	r3, [sp, #500]
	.loc 1 90 7
	add	r1, sp, #248
	add	r3, sp, #248
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L4:
	.loc 1 93 10
	ldr	r2, [sp, #252]
	add	r3, sp, #504
	sub	r3, r3, #256
	ldr	r3, [r3]
	.loc 1 93 7
	cmp	r2, r3
	ble	.L5
.LBB52:
	.loc 1 98 5
	add	r3, sp, #504
	sub	r3, r3, #256
	ldr	r0, [r3]
	ldr	r1, [sp, #252]
	add	r3, sp, #238
	add	r2, sp, #240
	bl	arm_divide_q31
	.loc 1 100 5
	add	r3, sp, #504
	sub	r3, r3, #266
	ldrsh	r3, [r3]
	sxtb	r1, r3
	add	r2, sp, #240
	add	r0, sp, #240
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 102 24
	add	r3, sp, #504
	sub	r3, r3, #264
	ldr	r3, [r3]
	str	r3, [sp, #496]
.LBB53:
.LBB54:
	.loc 1 64 37
	ldr	r3, .L71
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #112]
	str	r2, [sp, #116]
	ldrd	r3, [sp, #112]
	strd	r3, [sp, #488]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #484]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #484]
	.loc 1 66 5
	b	.L6
.L7:
	.loc 1 68 16
	ldr	r3, [sp, #496]
	asrs	r2, r3, #31
	str	r3, [sp, #16]
	str	r2, [sp, #20]
	.loc 1 68 26
	ldr	r3, [sp, #488]
	ldrd	r4, [sp, #16]
	mov	r2, r5
	mul	r2, r2, r3
	ldr	r3, [sp, #492]
	mov	r1, r4
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #488]
	mov	r1, r4
	umull	r6, r7, r2, r1
	add	r3, r3, r7
	mov	r7, r3
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r6, #31
	orr	r2, r2, r7, lsl #1
	asrs	r3, r7, #31
	strd	r2, [sp, #488]
	.loc 1 69 51
	ldr	r3, [sp, #484]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L71+4
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #24]
	str	r2, [sp, #28]
	.loc 1 69 13
	ldrd	r2, [sp, #488]
	ldrd	r4, [sp, #24]
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [sp, #120]
	mov	r1, r5
	adcs	r3, r3, r1
	str	r3, [sp, #124]
	ldrd	r3, [sp, #120]
	strd	r3, [sp, #488]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #484]
	adds	r3, r3, #1
	str	r3, [sp, #484]
.L6:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #484]
	cmp	r3, #12
	ble	.L7
	.loc 1 72 12
	ldrd	r0, [sp, #488]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #472]
.LBB55:
.LBB56:
	.file 2 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/none.h"
	.loc 2 139 24
	ldrd	r0, [sp, #472]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #472]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L8
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #472]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L65
.L8:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #472]
.L65:
.LBE56:
.LBE55:
	.loc 1 72 12 is_stmt 1
	nop
.LBE54:
.LBE53:
	.loc 1 102 22 discriminator 1
	ldr	r2, .L71+8
	subs	r2, r2, r3
	.loc 1 102 9 discriminator 1
	add	r3, sp, #504
	sub	r3, r3, #260
	str	r2, [r3]
.LBE52:
	b	.L12
.L5:
.LBB57:
	.loc 1 110 5
	ldr	r0, [sp, #252]
	add	r3, sp, #504
	sub	r3, r3, #256
	ldr	r1, [r3]
	add	r3, sp, #230
	add	r2, sp, #232
	bl	arm_divide_q31
	.loc 1 112 5
	add	r3, sp, #504
	sub	r3, r3, #274
	ldrsh	r3, [r3]
	sxtb	r1, r3
	add	r2, sp, #232
	add	r0, sp, #232
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 114 11
	add	r3, sp, #504
	sub	r3, r3, #272
	ldr	r3, [r3]
	str	r3, [sp, #468]
.LBB58:
.LBB59:
	.loc 1 64 37
	ldr	r3, .L71
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #128]
	str	r2, [sp, #132]
	ldrd	r2, [sp, #128]
	strd	r2, [sp, #456]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #452]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #452]
	.loc 1 66 5
	b	.L13
.L14:
	.loc 1 68 16
	ldr	r3, [sp, #468]
	asrs	r2, r3, #31
	str	r3, [sp, #32]
	str	r2, [sp, #36]
	.loc 1 68 26
	ldr	r3, [sp, #456]
	ldrd	r6, [sp, #32]
	mov	r2, r7
	mul	r2, r2, r3
	ldr	r3, [sp, #460]
	mov	r1, r6
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #456]
	mov	r1, r6
	umull	r4, r5, r2, r1
	add	r3, r3, r5
	mov	r5, r3
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r4, #31
	orr	r2, r2, r5, lsl #1
	asrs	r3, r5, #31
	strd	r2, [sp, #456]
	.loc 1 69 51
	ldr	r3, [sp, #452]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L71+4
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #40]
	str	r2, [sp, #44]
	.loc 1 69 13
	ldrd	r2, [sp, #456]
	ldrd	r6, [sp, #40]
	mov	r1, r6
	adds	r1, r2, r1
	str	r1, [sp, #136]
	mov	r1, r7
	adcs	r3, r3, r1
	str	r3, [sp, #140]
	ldrd	r2, [sp, #136]
	strd	r2, [sp, #456]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #452]
	adds	r3, r3, #1
	str	r3, [sp, #452]
.L13:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #452]
	cmp	r3, #12
	ble	.L14
	.loc 1 72 12
	ldrd	r0, [sp, #456]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #440]
.LBB60:
.LBB61:
	.loc 2 139 24
	ldrd	r0, [sp, #440]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #440]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L15
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #440]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L66
.L15:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #440]
.L66:
.LBE61:
.LBE60:
	.loc 1 72 12 is_stmt 1
	nop
.LBE59:
.LBE58:
	.loc 1 114 9 discriminator 1
	add	r2, sp, #504
	sub	r2, r2, #260
	str	r3, [r2]
.L12:
.LBE57:
	.loc 1 119 7
	ldr	r3, [sp, #500]
	cmp	r3, #0
	beq	.L19
	.loc 1 121 6
	add	r1, sp, #244
	add	r3, sp, #244
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L19:
	.loc 1 124 10
	add	r3, sp, #504
	sub	r3, r3, #260
	ldr	r2, [r3]
.LBE51:
.LBE50:
	.loc 1 155 16 discriminator 1
	add	r3, sp, #504
	sub	r3, r3, #292
	ldr	r3, [r3]
	str	r2, [r3]
	.loc 1 156 15
	movs	r3, #0
	b	.L21
.L2:
	.loc 1 158 8
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L22
	.loc 1 160 12
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L23
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	str	r3, [sp, #280]
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	str	r3, [sp, #276]
.LBB62:
.LBB63:
	.loc 1 78 8
	movs	r3, #0
	str	r3, [sp, #436]
	.loc 1 79 10
	movs	r3, #0
	str	r3, [sp, #272]
	.loc 1 81 9
	ldr	r3, [sp, #280]
	.loc 1 81 7
	cmp	r3, #0
	bge	.L24
	.loc 1 83 6
	add	r1, sp, #280
	add	r3, sp, #280
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
	.loc 1 84 10
	ldr	r3, [sp, #436]
	rsb	r3, r3, #1
	str	r3, [sp, #436]
.L24:
	.loc 1 87 10
	ldr	r3, [sp, #276]
	.loc 1 87 7
	cmp	r3, #0
	bge	.L25
	.loc 1 89 11
	ldr	r3, [sp, #436]
	rsb	r3, r3, #1
	str	r3, [sp, #436]
	.loc 1 90 7
	add	r1, sp, #276
	add	r3, sp, #276
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L25:
	.loc 1 93 10
	ldr	r2, [sp, #280]
	ldr	r3, [sp, #276]
	.loc 1 93 7
	cmp	r2, r3
	ble	.L26
.LBB64:
	.loc 1 98 5
	ldr	r0, [sp, #276]
	ldr	r1, [sp, #280]
	add	r3, sp, #266
	add	r2, sp, #268
	bl	arm_divide_q31
	.loc 1 100 5
	ldrsh	r3, [sp, #266]
	sxtb	r1, r3
	add	r2, sp, #268
	add	r0, sp, #268
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 102 24
	ldr	r3, [sp, #268]
	str	r3, [sp, #432]
.LBB65:
.LBB66:
	.loc 1 64 37
	ldr	r3, .L71
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #144]
	str	r2, [sp, #148]
	ldrd	r3, [sp, #144]
	strd	r3, [sp, #424]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #420]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #420]
	.loc 1 66 5
	b	.L27
.L72:
	.align	2
.L71:
	.word	-35930028
	.word	atan2_coefs_q31
	.word	843314857
.L28:
	.loc 1 68 16
	ldr	r3, [sp, #432]
	asrs	r2, r3, #31
	str	r3, [sp, #48]
	str	r2, [sp, #52]
	.loc 1 68 26
	ldr	r3, [sp, #424]
	ldrd	r4, [sp, #48]
	mov	r2, r5
	mul	r2, r2, r3
	ldr	r3, [sp, #428]
	mov	r1, r4
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #424]
	mov	r1, r4
	umull	r10, fp, r2, r1
	add	r3, r3, fp
	mov	fp, r3
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r10, #31
	orr	r2, r2, fp, lsl #1
	asr	r3, fp, #31
	strd	r2, [sp, #424]
	.loc 1 69 51
	ldr	r3, [sp, #420]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L73
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #56]
	str	r2, [sp, #60]
	.loc 1 69 13
	ldrd	r2, [sp, #424]
	ldrd	r4, [sp, #56]
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [sp, #152]
	mov	r1, r5
	adcs	r3, r3, r1
	str	r3, [sp, #156]
	ldrd	r3, [sp, #152]
	strd	r3, [sp, #424]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #420]
	adds	r3, r3, #1
	str	r3, [sp, #420]
.L27:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #420]
	cmp	r3, #12
	ble	.L28
	.loc 1 72 12
	ldrd	r0, [sp, #424]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #408]
.LBB67:
.LBB68:
	.loc 2 139 24
	ldrd	r0, [sp, #408]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #408]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L29
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #408]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L67
.L29:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #408]
.L67:
.LBE68:
.LBE67:
	.loc 1 72 12 is_stmt 1
	nop
.LBE66:
.LBE65:
	.loc 1 102 22 discriminator 1
	ldr	r2, .L73+4
	subs	r2, r2, r3
	.loc 1 102 9 discriminator 1
	str	r2, [sp, #272]
.LBE64:
	b	.L33
.L26:
.LBB69:
	.loc 1 110 5
	ldr	r0, [sp, #280]
	ldr	r1, [sp, #276]
	add	r3, sp, #258
	add	r2, sp, #260
	bl	arm_divide_q31
	.loc 1 112 5
	ldrsh	r3, [sp, #258]
	sxtb	r1, r3
	add	r2, sp, #260
	add	r0, sp, #260
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 114 11
	ldr	r3, [sp, #260]
	str	r3, [sp, #404]
.LBB70:
.LBB71:
	.loc 1 64 37
	ldr	r3, .L73+8
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #160]
	str	r2, [sp, #164]
	ldrd	r3, [sp, #160]
	strd	r3, [sp, #392]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #388]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #388]
	.loc 1 66 5
	b	.L34
.L35:
	.loc 1 68 16
	ldr	r3, [sp, #404]
	asrs	r2, r3, #31
	str	r3, [sp, #64]
	str	r2, [sp, #68]
	.loc 1 68 26
	ldr	r3, [sp, #392]
	ldrd	r4, [sp, #64]
	mov	r2, r5
	mul	r2, r2, r3
	ldr	r3, [sp, #396]
	mov	r1, r4
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #392]
	mov	r1, r4
	umull	r8, r9, r2, r1
	add	r3, r3, r9
	mov	r9, r3
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r8, #31
	orr	r2, r2, r9, lsl #1
	asr	r3, r9, #31
	strd	r2, [sp, #392]
	.loc 1 69 51
	ldr	r3, [sp, #388]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L73
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #72]
	str	r2, [sp, #76]
	.loc 1 69 13
	ldrd	r2, [sp, #392]
	ldrd	r4, [sp, #72]
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [sp, #168]
	mov	r1, r5
	adcs	r3, r3, r1
	str	r3, [sp, #172]
	ldrd	r3, [sp, #168]
	strd	r3, [sp, #392]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #388]
	adds	r3, r3, #1
	str	r3, [sp, #388]
.L34:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #388]
	cmp	r3, #12
	ble	.L35
	.loc 1 72 12
	ldrd	r0, [sp, #392]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #376]
.LBB72:
.LBB73:
	.loc 2 139 24
	ldrd	r0, [sp, #376]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #376]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L36
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #376]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L68
.L36:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #376]
.L68:
.LBE73:
.LBE72:
	.loc 1 72 12 is_stmt 1
	nop
.LBE71:
.LBE70:
	.loc 1 114 9 discriminator 1
	str	r3, [sp, #272]
.L33:
.LBE69:
	.loc 1 119 7
	ldr	r3, [sp, #436]
	cmp	r3, #0
	beq	.L40
	.loc 1 121 6
	add	r1, sp, #272
	add	r3, sp, #272
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L40:
	.loc 1 124 10
	ldr	r2, [sp, #272]
.LBE63:
.LBE62:
	.loc 1 162 38 discriminator 1
	ldr	r3, .L73+12
	add	r3, r3, r2
	.loc 1 162 19 discriminator 1
	add	r2, sp, #504
	sub	r2, r2, #292
	ldr	r2, [r2]
	str	r3, [r2]
	b	.L42
.L23:
	.loc 1 164 17
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L43
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	str	r3, [sp, #308]
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	str	r3, [sp, #304]
.LBB74:
.LBB75:
	.loc 1 78 8
	movs	r3, #0
	str	r3, [sp, #372]
	.loc 1 79 10
	movs	r3, #0
	str	r3, [sp, #300]
	.loc 1 81 9
	ldr	r3, [sp, #308]
	.loc 1 81 7
	cmp	r3, #0
	bge	.L44
	.loc 1 83 6
	add	r1, sp, #308
	add	r3, sp, #308
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
	.loc 1 84 10
	ldr	r3, [sp, #372]
	rsb	r3, r3, #1
	str	r3, [sp, #372]
.L44:
	.loc 1 87 10
	ldr	r3, [sp, #304]
	.loc 1 87 7
	cmp	r3, #0
	bge	.L45
	.loc 1 89 11
	ldr	r3, [sp, #372]
	rsb	r3, r3, #1
	str	r3, [sp, #372]
	.loc 1 90 7
	add	r1, sp, #304
	add	r3, sp, #304
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L45:
	.loc 1 93 10
	ldr	r2, [sp, #308]
	ldr	r3, [sp, #304]
	.loc 1 93 7
	cmp	r2, r3
	ble	.L46
.LBB76:
	.loc 1 98 5
	ldr	r0, [sp, #304]
	ldr	r1, [sp, #308]
	add	r3, sp, #294
	add	r2, sp, #296
	bl	arm_divide_q31
	.loc 1 100 5
	ldrsh	r3, [sp, #294]
	sxtb	r1, r3
	add	r2, sp, #296
	add	r0, sp, #296
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 102 24
	ldr	r3, [sp, #296]
	str	r3, [sp, #368]
.LBB77:
.LBB78:
	.loc 1 64 37
	ldr	r3, .L73+8
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #176]
	str	r2, [sp, #180]
	ldrd	r3, [sp, #176]
	strd	r3, [sp, #360]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #356]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #356]
	.loc 1 66 5
	b	.L47
.L74:
	.align	2
.L73:
	.word	atan2_coefs_q31
	.word	843314857
	.word	-35930028
	.word	1686629713
.L48:
	.loc 1 68 16
	ldr	r3, [sp, #368]
	asrs	r2, r3, #31
	str	r3, [sp, #80]
	str	r2, [sp, #84]
	.loc 1 68 26
	ldr	r3, [sp, #360]
	ldrd	r4, [sp, #80]
	mov	r2, r5
	mul	r2, r2, r3
	ldr	r3, [sp, #364]
	mov	r1, r4
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #360]
	mov	r1, r4
	umull	r2, r1, r2, r1
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r2, [sp, #4]
	add	r3, r3, r2
	str	r3, [sp, #4]
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	ldrd	r4, [sp]
	mov	r1, r4
	lsrs	r2, r1, #31
	mov	r1, r5
	orr	r2, r2, r1, lsl #1
	mov	r1, r5
	asrs	r3, r1, #31
	strd	r2, [sp, #360]
	.loc 1 69 51
	ldr	r3, [sp, #356]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L75
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #88]
	str	r2, [sp, #92]
	.loc 1 69 13
	ldrd	r2, [sp, #360]
	ldrd	r4, [sp, #88]
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [sp, #184]
	mov	r1, r5
	adcs	r3, r3, r1
	str	r3, [sp, #188]
	ldrd	r3, [sp, #184]
	strd	r3, [sp, #360]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #356]
	adds	r3, r3, #1
	str	r3, [sp, #356]
.L47:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #356]
	cmp	r3, #12
	ble	.L48
	.loc 1 72 12
	ldrd	r0, [sp, #360]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #344]
.LBB79:
.LBB80:
	.loc 2 139 24
	ldrd	r0, [sp, #344]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #344]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L49
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #344]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L69
.L49:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #344]
.L69:
.LBE80:
.LBE79:
	.loc 1 72 12 is_stmt 1
	nop
.LBE78:
.LBE77:
	.loc 1 102 22 discriminator 1
	ldr	r2, .L75+4
	subs	r2, r2, r3
	.loc 1 102 9 discriminator 1
	str	r2, [sp, #300]
.LBE76:
	b	.L53
.L46:
.LBB81:
	.loc 1 110 5
	ldr	r0, [sp, #308]
	ldr	r1, [sp, #304]
	add	r3, sp, #286
	add	r2, sp, #288
	bl	arm_divide_q31
	.loc 1 112 5
	ldrsh	r3, [sp, #286]
	sxtb	r1, r3
	add	r2, sp, #288
	add	r0, sp, #288
	movs	r3, #1
	bl	arm_shift_q31
	.loc 1 114 11
	ldr	r3, [sp, #288]
	str	r3, [sp, #340]
.LBB82:
.LBB83:
	.loc 1 64 37
	ldr	r3, .L75+8
	.loc 1 64 11
	asrs	r2, r3, #31
	str	r3, [sp, #192]
	str	r2, [sp, #196]
	ldrd	r3, [sp, #192]
	strd	r3, [sp, #328]
	.loc 1 65 9
	movs	r3, #1
	str	r3, [sp, #324]
	.loc 1 66 10
	movs	r3, #1
	str	r3, [sp, #324]
	.loc 1 66 5
	b	.L54
.L55:
	.loc 1 68 16
	ldr	r3, [sp, #340]
	asrs	r2, r3, #31
	str	r3, [sp, #96]
	str	r2, [sp, #100]
	.loc 1 68 26
	ldr	r3, [sp, #328]
	ldrd	r4, [sp, #96]
	mov	r2, r5
	mul	r2, r2, r3
	ldr	r3, [sp, #332]
	mov	r1, r4
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp, #328]
	mov	r1, r4
	umull	r2, r1, r2, r1
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 68 13
	mov	r2, #0
	mov	r3, #0
	ldrd	r4, [sp, #8]
	mov	r1, r4
	lsrs	r2, r1, #31
	mov	r1, r5
	orr	r2, r2, r1, lsl #1
	mov	r1, r5
	asrs	r3, r1, #31
	strd	r2, [sp, #328]
	.loc 1 69 51
	ldr	r3, [sp, #324]
	rsb	r3, r3, #12
	.loc 1 69 45
	ldr	r2, .L75
	ldr	r3, [r2, r3, lsl #2]
	.loc 1 69 22
	asrs	r2, r3, #31
	str	r3, [sp, #104]
	str	r2, [sp, #108]
	.loc 1 69 13
	ldrd	r2, [sp, #328]
	ldrd	r4, [sp, #104]
	mov	r1, r4
	adds	r1, r2, r1
	str	r1, [sp, #200]
	mov	r1, r5
	adcs	r3, r3, r1
	str	r3, [sp, #204]
	ldrd	r3, [sp, #200]
	strd	r3, [sp, #328]
	.loc 1 66 19 discriminator 3
	ldr	r3, [sp, #324]
	adds	r3, r3, #1
	str	r3, [sp, #324]
.L54:
	.loc 1 66 14 discriminator 1
	ldr	r3, [sp, #324]
	cmp	r3, #12
	ble	.L55
	.loc 1 72 12
	ldrd	r0, [sp, #328]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #2
	orr	r2, r2, r1, lsl #30
	asrs	r3, r1, #2
	strd	r2, [sp, #312]
.LBB84:
.LBB85:
	.loc 2 139 24
	ldrd	r0, [sp, #312]
	mov	r2, #0
	mov	r3, #0
	movs	r2, r1
	asrs	r3, r1, #31
	.loc 2 139 35
	ldr	r3, [sp, #312]
	.loc 2 139 45
	asrs	r3, r3, #31
	.loc 2 140 44
	cmp	r2, r3
	beq	.L56
	.loc 2 140 34 discriminator 1
	ldrd	r0, [sp, #312]
	mov	r2, #0
	mov	r3, #0
	asrs	r2, r1, #31
	asrs	r3, r1, #31
	.loc 2 140 23 discriminator 1
	mov	r3, r2
	.loc 2 140 44 discriminator 1
	eor	r3, r3, #-2147483648
	mvns	r3, r3
	.loc 2 140 44 is_stmt 0
	b	.L70
.L56:
	.loc 2 140 44 discriminator 2
	ldr	r3, [sp, #312]
.L70:
.LBE85:
.LBE84:
	.loc 1 72 12 is_stmt 1
	nop
.LBE83:
.LBE82:
	.loc 1 114 9 discriminator 1
	str	r3, [sp, #300]
.L53:
.LBE81:
	.loc 1 119 7
	ldr	r3, [sp, #372]
	cmp	r3, #0
	beq	.L60
	.loc 1 121 6
	add	r1, sp, #300
	add	r3, sp, #300
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q31
.L60:
	.loc 1 124 10
	ldr	r2, [sp, #300]
.LBE75:
.LBE74:
	.loc 1 166 38 discriminator 1
	ldr	r3, .L75+12
	add	r3, r3, r2
	.loc 1 166 19 discriminator 1
	add	r2, sp, #504
	sub	r2, r2, #292
	ldr	r2, [r2]
	str	r3, [r2]
	b	.L42
.L43:
	.loc 1 170 16
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L62
	.loc 1 172 23
	add	r3, sp, #504
	sub	r3, r3, #292
	ldr	r3, [r3]
	ldr	r2, .L75+12
	str	r2, [r3]
	b	.L42
.L62:
	.loc 1 176 23
	add	r3, sp, #504
	sub	r3, r3, #292
	ldr	r3, [r3]
	ldr	r2, .L75+16
	str	r2, [r3]
.L42:
	.loc 1 179 15
	movs	r3, #0
	b	.L21
.L22:
	.loc 1 181 8
	add	r3, sp, #504
	sub	r3, r3, #288
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L63
	.loc 1 183 12
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L64
	.loc 1 185 20
	add	r3, sp, #504
	sub	r3, r3, #292
	ldr	r3, [r3]
	ldr	r2, .L75+4
	str	r2, [r3]
	.loc 1 186 19
	movs	r3, #0
	b	.L21
.L64:
	.loc 1 188 12
	add	r3, sp, #504
	sub	r3, r3, #284
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L63
	.loc 1 190 20
	add	r3, sp, #504
	sub	r3, r3, #292
	ldr	r3, [r3]
	ldr	r2, .L75+20
	str	r2, [r3]
	.loc 1 191 19
	movs	r3, #0
	b	.L21
.L63:
	.loc 1 196 11
	mvn	r3, #3
.L21:
	.loc 1 198 1
	mov	r0, r3
	add	sp, sp, #508
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L76:
	.align	2
.L75:
	.word	atan2_coefs_q31
	.word	843314857
	.word	-35930028
	.word	-1686629713
	.word	1686629713
	.word	-843314857
	.cfi_endproc
.LFE136:
	.size	arm_atan2_q31, .-arm_atan2_q31
	.text
.Letext0:
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 5 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.file 6 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x60f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0xc
	.4byte	.LASF42
	.4byte	.LASF43
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
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x110
	.byte	0x15
	.4byte	0x4b
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x3
	.2byte	0x112
	.byte	0x13
	.4byte	0x66
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x3
	.2byte	0x113
	.byte	0x1c
	.4byte	0x7a
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x3
	.2byte	0x114
	.byte	0x12
	.4byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x115
	.byte	0x1b
	.4byte	0xa2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x116
	.byte	0x17
	.4byte	0xb6
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF17
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF19
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF20
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF21
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x124
	.byte	0x13
	.4byte	0x81
	.uleb128 0x5
	.4byte	0xee
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x129
	.byte	0x13
	.4byte	0xa9
	.uleb128 0x6
	.byte	0x5
	.byte	0x1
	.4byte	0x4b
	.byte	0x4
	.2byte	0x258
	.byte	0x3
	.4byte	0x14d
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 -1
	.uleb128 0x8
	.4byte	.LASF26
	.sleb128 -2
	.uleb128 0x8
	.4byte	.LASF27
	.sleb128 -3
	.uleb128 0x8
	.4byte	.LASF28
	.sleb128 -4
	.uleb128 0x8
	.4byte	.LASF29
	.sleb128 -5
	.uleb128 0x8
	.4byte	.LASF30
	.sleb128 -6
	.uleb128 0x8
	.4byte	.LASF31
	.sleb128 -7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x261
	.byte	0x5
	.4byte	0x10d
	.uleb128 0x9
	.4byte	0xfb
	.4byte	0x16a
	.uleb128 0xa
	.4byte	0x37
	.byte	0xc
	.byte	0
	.uleb128 0x5
	.4byte	0x15a
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x1
	.byte	0x2e
	.byte	0x14
	.4byte	0x16a
	.uleb128 0x5
	.byte	0x3
	.4byte	atan2_coefs_q31
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x1fd
	.byte	0x8
	.4byte	0x1a3
	.uleb128 0xd
	.4byte	0x1a3
	.uleb128 0xd
	.4byte	0x3e
	.uleb128 0xd
	.4byte	0x1a9
	.uleb128 0xd
	.4byte	0x95
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0xfb
	.uleb128 0xe
	.byte	0x4
	.4byte	0xee
	.uleb128 0xf
	.4byte	.LASF45
	.byte	0x6
	.2byte	0x183
	.byte	0xc
	.4byte	0x14d
	.4byte	0x1d5
	.uleb128 0xd
	.4byte	0xee
	.uleb128 0xd
	.4byte	0xee
	.uleb128 0xd
	.4byte	0x1a9
	.uleb128 0xd
	.4byte	0x1d5
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x59
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x284
	.byte	0x8
	.4byte	0x1f8
	.uleb128 0xd
	.4byte	0x1a3
	.uleb128 0xd
	.4byte	0x1a9
	.uleb128 0xd
	.4byte	0x95
	.byte	0
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.byte	0x97
	.byte	0xc
	.4byte	0x14d
	.4byte	.LFB136
	.4byte	.LFE136-.LFB136
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x552
	.uleb128 0x11
	.ascii	"y\000"
	.byte	0x1
	.byte	0x97
	.byte	0x20
	.4byte	0xee
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.uleb128 0x11
	.ascii	"x\000"
	.byte	0x1
	.byte	0x97
	.byte	0x28
	.4byte	0xee
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x1
	.byte	0x97
	.byte	0x31
	.4byte	0x1a9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -332
	.uleb128 0x13
	.4byte	0x552
	.4byte	.LBB50
	.4byte	.LBE50-.LBB50
	.byte	0x1
	.byte	0x9b
	.byte	0x11
	.4byte	0x343
	.uleb128 0x14
	.4byte	0x563
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x14
	.4byte	0x56d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x15
	.4byte	0x577
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x15
	.4byte	0x583
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.uleb128 0x16
	.4byte	0x58f
	.4byte	.LBB52
	.4byte	.LBE52-.LBB52
	.4byte	0x2dc
	.uleb128 0x15
	.4byte	0x594
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x15
	.4byte	0x5a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -306
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB53
	.4byte	.LBE53-.LBB53
	.byte	0x1
	.byte	0x66
	.byte	0x18
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB55
	.4byte	.LBE55-.LBB55
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ad
	.4byte	.LBB57
	.4byte	.LBE57-.LBB57
	.uleb128 0x15
	.4byte	0x5ae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x15
	.4byte	0x5ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -314
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB58
	.4byte	.LBE58-.LBB58
	.byte	0x1
	.byte	0x72
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB60
	.4byte	.LBE60-.LBB60
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	0x552
	.4byte	.LBB62
	.4byte	.LBE62-.LBB62
	.byte	0x1
	.byte	0xa2
	.byte	0x14
	.4byte	0x44c
	.uleb128 0x14
	.4byte	0x563
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x14
	.4byte	0x56d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -268
	.uleb128 0x15
	.4byte	0x577
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x15
	.4byte	0x583
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x16
	.4byte	0x58f
	.4byte	.LBB64
	.4byte	.LBE64-.LBB64
	.4byte	0x3e5
	.uleb128 0x15
	.4byte	0x594
	.uleb128 0x3
	.byte	0x91
	.sleb128 -276
	.uleb128 0x15
	.4byte	0x5a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -278
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB65
	.4byte	.LBE65-.LBB65
	.byte	0x1
	.byte	0x66
	.byte	0x18
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB67
	.4byte	.LBE67-.LBB67
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ad
	.4byte	.LBB69
	.4byte	.LBE69-.LBB69
	.uleb128 0x15
	.4byte	0x5ae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x15
	.4byte	0x5ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -286
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB70
	.4byte	.LBE70-.LBB70
	.byte	0x1
	.byte	0x72
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB72
	.4byte	.LBE72-.LBB72
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	0x552
	.4byte	.LBB74
	.4byte	.LBE74-.LBB74
	.byte	0x1
	.byte	0xa6
	.byte	0x14
	.uleb128 0x14
	.4byte	0x563
	.uleb128 0x3
	.byte	0x91
	.sleb128 -236
	.uleb128 0x14
	.4byte	0x56d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x15
	.4byte	0x577
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x15
	.4byte	0x583
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x16
	.4byte	0x58f
	.4byte	.LBB76
	.4byte	.LBE76-.LBB76
	.4byte	0x4ea
	.uleb128 0x15
	.4byte	0x594
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x15
	.4byte	0x5a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -250
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB77
	.4byte	.LBE77-.LBB77
	.byte	0x1
	.byte	0x66
	.byte	0x18
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB79
	.4byte	.LBE79-.LBB79
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ad
	.4byte	.LBB81
	.4byte	.LBE81-.LBB81
	.uleb128 0x15
	.4byte	0x5ae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x15
	.4byte	0x5ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -258
	.uleb128 0x17
	.4byte	0x5c8
	.4byte	.LBB82
	.4byte	.LBE82-.LBB82
	.byte	0x1
	.byte	0x72
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -204
	.uleb128 0x15
	.4byte	0x5e3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x15
	.4byte	0x5ef
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.uleb128 0x17
	.4byte	0x5fa
	.4byte	.LBB84
	.4byte	.LBE84-.LBB84
	.byte	0x1
	.byte	0x48
	.byte	0xc
	.uleb128 0x14
	.4byte	0x607
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.byte	0x4c
	.byte	0x34
	.4byte	0xee
	.byte	0x3
	.4byte	0x5c8
	.uleb128 0x1a
	.ascii	"y\000"
	.byte	0x1
	.byte	0x4c
	.byte	0x47
	.4byte	0xee
	.uleb128 0x1a
	.ascii	"x\000"
	.byte	0x1
	.byte	0x4c
	.byte	0x4f
	.4byte	0xee
	.uleb128 0x1b
	.4byte	.LASF36
	.byte	0x1
	.byte	0x4e
	.byte	0x8
	.4byte	0x29
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.byte	0x4f
	.byte	0xa
	.4byte	0xee
	.uleb128 0x1d
	.4byte	0x5ad
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0x5f
	.byte	0xb
	.4byte	0xee
	.uleb128 0x1b
	.4byte	.LASF38
	.byte	0x1
	.byte	0x60
	.byte	0xd
	.4byte	0x59
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0x6b
	.byte	0xb
	.4byte	0xee
	.uleb128 0x1b
	.4byte	.LASF38
	.byte	0x1
	.byte	0x6c
	.byte	0xd
	.4byte	0x59
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x1
	.byte	0x3e
	.byte	0x34
	.4byte	0xee
	.byte	0x3
	.4byte	0x5fa
	.uleb128 0x1a
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3e
	.byte	0x4f
	.4byte	0xee
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.byte	0x40
	.byte	0xb
	.4byte	0x100
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0x41
	.byte	0x9
	.4byte	0x29
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF47
	.byte	0x2
	.byte	0x88
	.byte	0x36
	.4byte	0xee
	.byte	0x3
	.uleb128 0x1a
	.ascii	"x\000"
	.byte	0x2
	.byte	0x89
	.byte	0x9
	.4byte	0x100
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x5
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.4byte	0x177
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x613
	.4byte	0x11c
	.ascii	"ARM_MATH_SUCCESS\000"
	.4byte	0x122
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
	.4byte	0x128
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
	.4byte	0x12e
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
	.4byte	0x134
	.ascii	"ARM_MATH_NANINF\000"
	.4byte	0x13a
	.ascii	"ARM_MATH_SINGULAR\000"
	.4byte	0x140
	.ascii	"ARM_MATH_TEST_FAILURE\000"
	.4byte	0x146
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
	.4byte	0x16f
	.ascii	"atan2_coefs_q31\000"
	.4byte	0x181
	.ascii	"arm_shift_q31\000"
	.4byte	0x1af
	.ascii	"arm_divide_q31\000"
	.4byte	0x1db
	.ascii	"arm_negate_q31\000"
	.4byte	0x1f8
	.ascii	"arm_atan2_q31\000"
	.4byte	0x552
	.ascii	"arm_atan_q31\000"
	.4byte	0x5c8
	.ascii	"arm_atan_limited_q31\000"
	.4byte	0x5fa
	.ascii	"clip_q63_to_q31\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x195
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x613
	.4byte	0x29
	.ascii	"int\000"
	.4byte	0x30
	.ascii	"char\000"
	.4byte	0x37
	.ascii	"unsigned int\000"
	.4byte	0x4b
	.ascii	"signed char\000"
	.4byte	0x3e
	.ascii	"int8_t\000"
	.4byte	0x52
	.ascii	"unsigned char\000"
	.4byte	0x66
	.ascii	"short int\000"
	.4byte	0x59
	.ascii	"int16_t\000"
	.4byte	0x7a
	.ascii	"short unsigned int\000"
	.4byte	0x6d
	.ascii	"uint16_t\000"
	.4byte	0x8e
	.ascii	"long int\000"
	.4byte	0x81
	.ascii	"int32_t\000"
	.4byte	0xa2
	.ascii	"long unsigned int\000"
	.4byte	0x95
	.ascii	"uint32_t\000"
	.4byte	0xb6
	.ascii	"long long int\000"
	.4byte	0xa9
	.ascii	"int64_t\000"
	.4byte	0xbd
	.ascii	"long long unsigned int\000"
	.4byte	0xc4
	.ascii	"float\000"
	.4byte	0xcb
	.ascii	"complex float\000"
	.4byte	0xd2
	.ascii	"double\000"
	.4byte	0xd9
	.ascii	"complex double\000"
	.4byte	0xe0
	.ascii	"long double\000"
	.4byte	0xe7
	.ascii	"complex long double\000"
	.4byte	0xee
	.ascii	"q31_t\000"
	.4byte	0x100
	.ascii	"q63_t\000"
	.4byte	0x14d
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
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x4
	.file 7 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_compiler.h"
	.byte	0x3
	.uleb128 0x52
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x3
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
	.file 14 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h"
	.byte	0x3
	.uleb128 0x58
	.uleb128 0xe
	.file 15 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/__SEGGER_RTL_FP.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x4
	.byte	0x4
	.file 16 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/float.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x10
	.byte	0x4
	.file 17 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/limits.h"
	.byte	0x3
	.uleb128 0x5a
	.uleb128 0x11
	.byte	0x4
	.byte	0x4
	.file 18 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_memory.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x12
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x4
	.file 19 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/utils.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x4
	.file 20 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x14
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF13:
	.ascii	"int64_t\000"
.LASF38:
	.ascii	"shift\000"
.LASF25:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF26:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF39:
	.ascii	"arm_atan_q31\000"
.LASF10:
	.ascii	"long int\000"
.LASF44:
	.ascii	"atan2_coefs_q31\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF43:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF18:
	.ascii	"double\000"
.LASF34:
	.ascii	"arm_negate_q31\000"
.LASF4:
	.ascii	"int8_t\000"
.LASF16:
	.ascii	"float\000"
.LASF15:
	.ascii	"long long unsigned int\000"
.LASF22:
	.ascii	"q31_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF40:
	.ascii	"arm_atan_limited_q31\000"
.LASF33:
	.ascii	"arm_shift_q31\000"
.LASF36:
	.ascii	"sign\000"
.LASF2:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF42:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_a"
	.ascii	"tan2_q31.c\000"
.LASF12:
	.ascii	"long unsigned int\000"
.LASF21:
	.ascii	"complex long double\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"int16_t\000"
.LASF27:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF35:
	.ascii	"result\000"
.LASF28:
	.ascii	"ARM_MATH_NANINF\000"
.LASF37:
	.ascii	"ratio\000"
.LASF17:
	.ascii	"complex float\000"
.LASF31:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF9:
	.ascii	"int32_t\000"
.LASF23:
	.ascii	"q63_t\000"
.LASF14:
	.ascii	"long long int\000"
.LASF47:
	.ascii	"clip_q63_to_q31\000"
.LASF0:
	.ascii	"char\000"
.LASF24:
	.ascii	"ARM_MATH_SUCCESS\000"
.LASF6:
	.ascii	"short int\000"
.LASF19:
	.ascii	"complex double\000"
.LASF7:
	.ascii	"uint16_t\000"
.LASF32:
	.ascii	"arm_status\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF41:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF20:
	.ascii	"long double\000"
.LASF46:
	.ascii	"arm_atan2_q31\000"
.LASF45:
	.ascii	"arm_divide_q31\000"
.LASF29:
	.ascii	"ARM_MATH_SINGULAR\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
