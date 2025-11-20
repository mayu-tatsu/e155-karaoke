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
	.file	"arm_atan2_q15.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_atan2_q15.c"
	.section	.rodata.atan2_coefs_q15,"a"
	.align	2
	.type	atan2_coefs_q15, %object
	.size	atan2_coefs_q15, 20
atan2_coefs_q15:
	.short	0
	.short	32767
	.short	-1
	.short	-10905
	.short	-144
	.short	7085
	.short	-680
	.short	-5719
	.short	4393
	.short	-1061
	.section	.text.arm_atan2_q15,"ax",%progbits
	.align	1
	.global	arm_atan2_q15
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_atan2_q15, %function
arm_atan2_q15:
.LFB136:
	.loc 1 151 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #188
	.cfi_def_cfa_offset 192
	mov	r3, r0
	str	r2, [sp]
	strh	r3, [sp, #6]	@ movhi
	mov	r3, r1	@ movhi
	strh	r3, [sp, #4]	@ movhi
	.loc 1 152 8
	ldrsh	r3, [sp, #4]
	cmp	r3, #0
	ble	.L2
	ldrh	r3, [sp, #6]	@ movhi
	strh	r3, [sp, #22]	@ movhi
	ldrh	r3, [sp, #4]	@ movhi
	strh	r3, [sp, #20]	@ movhi
.LBB40:
.LBB41:
	.loc 1 77 8
	movs	r3, #0
	str	r3, [sp, #180]
	.loc 1 78 10
	movs	r3, #0
	strh	r3, [sp, #18]	@ movhi
	.loc 1 80 9
	ldrsh	r3, [sp, #22]
	.loc 1 80 7
	cmp	r3, #0
	bge	.L3
	.loc 1 82 6
	add	r1, sp, #22
	add	r3, sp, #22
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
	.loc 1 83 10
	ldr	r3, [sp, #180]
	rsb	r3, r3, #1
	str	r3, [sp, #180]
.L3:
	.loc 1 86 10
	ldrsh	r3, [sp, #20]
	.loc 1 86 7
	cmp	r3, #0
	bge	.L4
	.loc 1 88 11
	ldr	r3, [sp, #180]
	rsb	r3, r3, #1
	str	r3, [sp, #180]
	.loc 1 89 7
	add	r1, sp, #20
	add	r3, sp, #20
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L4:
	.loc 1 92 10
	ldrsh	r2, [sp, #22]
	ldrsh	r3, [sp, #20]
	.loc 1 92 7
	cmp	r2, r3
	ble	.L5
.LBB42:
	.loc 1 97 5
	ldrsh	r0, [sp, #20]
	ldrsh	r1, [sp, #22]
	add	r3, sp, #14
	add	r2, sp, #16
	bl	arm_divide_q15
	.loc 1 99 5
	ldrsh	r3, [sp, #14]
	sxtb	r1, r3
	add	r2, sp, #16
	add	r0, sp, #16
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 101 20
	ldrsh	r3, [sp, #16]
	strh	r3, [sp, #178]	@ movhi
.LBB43:
.LBB44:
	.loc 1 60 37
	ldr	r3, .L47
	.loc 1 60 11
	str	r3, [sp, #172]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #168]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #168]
	.loc 1 62 5
	b	.L6
.L7:
	.loc 1 64 16
	ldrsh	r3, [sp, #178]
	.loc 1 64 26
	ldr	r2, [sp, #172]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #172]
	.loc 1 65 51
	ldr	r3, [sp, #168]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L47+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #172]
	add	r3, r3, r2
	str	r3, [sp, #172]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #168]
	adds	r3, r3, #1
	str	r3, [sp, #168]
.L6:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #168]
	cmp	r3, #9
	ble	.L7
.LBB45:
	.loc 1 68 43
	ldr	r3, [sp, #172]
	asrs	r3, r3, #2
	str	r3, [sp, #164]
	.loc 1 68 62
	ldr	r3, [sp, #164]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #160]
	.loc 1 68 146
	ldr	r3, [sp, #160]
.LBE45:
	.loc 1 68 9
	str	r3, [sp, #172]
	.loc 1 71 11
	ldr	r3, [sp, #172]
	sxth	r3, r3
.LBE44:
.LBE43:
	.loc 1 101 20 discriminator 1
	uxth	r3, r3
	.loc 1 101 18 discriminator 1
	rsb	r3, r3, #12864
	adds	r3, r3, #4
	uxth	r3, r3
	sxth	r3, r3
	.loc 1 101 9 discriminator 1
	strh	r3, [sp, #18]	@ movhi
.LBE42:
	b	.L9
.L5:
.LBB46:
	.loc 1 109 5
	ldrsh	r0, [sp, #22]
	ldrsh	r1, [sp, #20]
	add	r3, sp, #10
	add	r2, sp, #12
	bl	arm_divide_q15
	.loc 1 111 5
	ldrsh	r3, [sp, #10]
	sxtb	r1, r3
	add	r2, sp, #12
	add	r0, sp, #12
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 113 11
	ldrsh	r3, [sp, #12]
	strh	r3, [sp, #158]	@ movhi
.LBB47:
.LBB48:
	.loc 1 60 37
	ldr	r3, .L47
	.loc 1 60 11
	str	r3, [sp, #152]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #148]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #148]
	.loc 1 62 5
	b	.L10
.L11:
	.loc 1 64 16
	ldrsh	r3, [sp, #158]
	.loc 1 64 26
	ldr	r2, [sp, #152]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #152]
	.loc 1 65 51
	ldr	r3, [sp, #148]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L47+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #152]
	add	r3, r3, r2
	str	r3, [sp, #152]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #148]
	adds	r3, r3, #1
	str	r3, [sp, #148]
.L10:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #148]
	cmp	r3, #9
	ble	.L11
.LBB49:
	.loc 1 68 43
	ldr	r3, [sp, #152]
	asrs	r3, r3, #2
	str	r3, [sp, #144]
	.loc 1 68 62
	ldr	r3, [sp, #144]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #140]
	.loc 1 68 146
	ldr	r3, [sp, #140]
.LBE49:
	.loc 1 68 9
	str	r3, [sp, #152]
	.loc 1 71 11
	ldr	r3, [sp, #152]
	sxth	r3, r3
.LBE48:
.LBE47:
	.loc 1 113 9 discriminator 1
	strh	r3, [sp, #18]	@ movhi
.L9:
.LBE46:
	.loc 1 118 7
	ldr	r3, [sp, #180]
	cmp	r3, #0
	beq	.L13
	.loc 1 120 6
	add	r1, sp, #18
	add	r3, sp, #18
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L13:
	.loc 1 123 10
	ldrsh	r2, [sp, #18]
.LBE41:
.LBE40:
	.loc 1 154 16 discriminator 1
	ldr	r3, [sp]
	strh	r2, [r3]	@ movhi
	.loc 1 155 15
	movs	r3, #0
	b	.L15
.L2:
	.loc 1 157 8
	ldrsh	r3, [sp, #4]
	cmp	r3, #0
	bge	.L16
	.loc 1 159 12
	ldrsh	r3, [sp, #6]
	cmp	r3, #0
	ble	.L17
	ldrh	r3, [sp, #6]	@ movhi
	strh	r3, [sp, #36]	@ movhi
	ldrh	r3, [sp, #4]	@ movhi
	strh	r3, [sp, #34]	@ movhi
.LBB50:
.LBB51:
	.loc 1 77 8
	movs	r3, #0
	str	r3, [sp, #136]
	.loc 1 78 10
	movs	r3, #0
	strh	r3, [sp, #32]	@ movhi
	.loc 1 80 9
	ldrsh	r3, [sp, #36]
	.loc 1 80 7
	cmp	r3, #0
	bge	.L18
	.loc 1 82 6
	add	r1, sp, #36
	add	r3, sp, #36
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
	.loc 1 83 10
	ldr	r3, [sp, #136]
	rsb	r3, r3, #1
	str	r3, [sp, #136]
.L18:
	.loc 1 86 10
	ldrsh	r3, [sp, #34]
	.loc 1 86 7
	cmp	r3, #0
	bge	.L19
	.loc 1 88 11
	ldr	r3, [sp, #136]
	rsb	r3, r3, #1
	str	r3, [sp, #136]
	.loc 1 89 7
	add	r1, sp, #34
	add	r3, sp, #34
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L19:
	.loc 1 92 10
	ldrsh	r2, [sp, #36]
	ldrsh	r3, [sp, #34]
	.loc 1 92 7
	cmp	r2, r3
	ble	.L20
.LBB52:
	.loc 1 97 5
	ldrsh	r0, [sp, #34]
	ldrsh	r1, [sp, #36]
	add	r3, sp, #28
	add	r2, sp, #30
	bl	arm_divide_q15
	.loc 1 99 5
	ldrsh	r3, [sp, #28]
	sxtb	r1, r3
	add	r2, sp, #30
	add	r0, sp, #30
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 101 20
	ldrsh	r3, [sp, #30]
	strh	r3, [sp, #134]	@ movhi
.LBB53:
.LBB54:
	.loc 1 60 37
	ldr	r3, .L47
	.loc 1 60 11
	str	r3, [sp, #128]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #124]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #124]
	.loc 1 62 5
	b	.L21
.L22:
	.loc 1 64 16
	ldrsh	r3, [sp, #134]
	.loc 1 64 26
	ldr	r2, [sp, #128]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #128]
	.loc 1 65 51
	ldr	r3, [sp, #124]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L47+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #128]
	add	r3, r3, r2
	str	r3, [sp, #128]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #124]
	adds	r3, r3, #1
	str	r3, [sp, #124]
.L21:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #124]
	cmp	r3, #9
	ble	.L22
.LBB55:
	.loc 1 68 43
	ldr	r3, [sp, #128]
	asrs	r3, r3, #2
	str	r3, [sp, #120]
	.loc 1 68 62
	ldr	r3, [sp, #120]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #116]
	.loc 1 68 146
	ldr	r3, [sp, #116]
.LBE55:
	.loc 1 68 9
	str	r3, [sp, #128]
	.loc 1 71 11
	ldr	r3, [sp, #128]
	sxth	r3, r3
.LBE54:
.LBE53:
	.loc 1 101 20 discriminator 1
	uxth	r3, r3
	.loc 1 101 18 discriminator 1
	rsb	r3, r3, #12864
	adds	r3, r3, #4
	uxth	r3, r3
	sxth	r3, r3
	.loc 1 101 9 discriminator 1
	strh	r3, [sp, #32]	@ movhi
.LBE52:
	b	.L24
.L20:
.LBB56:
	.loc 1 109 5
	ldrsh	r0, [sp, #36]
	ldrsh	r1, [sp, #34]
	add	r3, sp, #24
	add	r2, sp, #26
	bl	arm_divide_q15
	.loc 1 111 5
	ldrsh	r3, [sp, #24]
	sxtb	r1, r3
	add	r2, sp, #26
	add	r0, sp, #26
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 113 11
	ldrsh	r3, [sp, #26]
	strh	r3, [sp, #114]	@ movhi
.LBB57:
.LBB58:
	.loc 1 60 37
	ldr	r3, .L47
	.loc 1 60 11
	str	r3, [sp, #108]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #104]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #104]
	.loc 1 62 5
	b	.L25
.L26:
	.loc 1 64 16
	ldrsh	r3, [sp, #114]
	.loc 1 64 26
	ldr	r2, [sp, #108]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #108]
	.loc 1 65 51
	ldr	r3, [sp, #104]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L47+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #108]
	add	r3, r3, r2
	str	r3, [sp, #108]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #104]
	adds	r3, r3, #1
	str	r3, [sp, #104]
.L25:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #104]
	cmp	r3, #9
	ble	.L26
.LBB59:
	.loc 1 68 43
	ldr	r3, [sp, #108]
	asrs	r3, r3, #2
	str	r3, [sp, #100]
	.loc 1 68 62
	ldr	r3, [sp, #100]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #96]
	.loc 1 68 146
	ldr	r3, [sp, #96]
.LBE59:
	.loc 1 68 9
	str	r3, [sp, #108]
	.loc 1 71 11
	ldr	r3, [sp, #108]
	sxth	r3, r3
.LBE58:
.LBE57:
	.loc 1 113 9 discriminator 1
	strh	r3, [sp, #32]	@ movhi
.L24:
.LBE56:
	.loc 1 118 7
	ldr	r3, [sp, #136]
	cmp	r3, #0
	beq	.L28
	.loc 1 120 6
	add	r1, sp, #32
	add	r3, sp, #32
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L28:
	.loc 1 123 10
	ldrsh	r3, [sp, #32]
.LBE51:
.LBE50:
	.loc 1 161 20 discriminator 1
	uxth	r3, r3
	.loc 1 161 38 discriminator 1
	add	r3, r3, #25728
	adds	r3, r3, #8
	uxth	r3, r3
	sxth	r2, r3
	.loc 1 161 19 discriminator 1
	ldr	r3, [sp]
	strh	r2, [r3]	@ movhi
	b	.L30
.L48:
	.align	2
.L47:
	.word	-1061
	.word	atan2_coefs_q15
.L17:
	.loc 1 163 17
	ldrsh	r3, [sp, #6]
	cmp	r3, #0
	bge	.L31
	ldrh	r3, [sp, #6]	@ movhi
	strh	r3, [sp, #50]	@ movhi
	ldrh	r3, [sp, #4]	@ movhi
	strh	r3, [sp, #48]	@ movhi
.LBB60:
.LBB61:
	.loc 1 77 8
	movs	r3, #0
	str	r3, [sp, #92]
	.loc 1 78 10
	movs	r3, #0
	strh	r3, [sp, #46]	@ movhi
	.loc 1 80 9
	ldrsh	r3, [sp, #50]
	.loc 1 80 7
	cmp	r3, #0
	bge	.L32
	.loc 1 82 6
	add	r1, sp, #50
	add	r3, sp, #50
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
	.loc 1 83 10
	ldr	r3, [sp, #92]
	rsb	r3, r3, #1
	str	r3, [sp, #92]
.L32:
	.loc 1 86 10
	ldrsh	r3, [sp, #48]
	.loc 1 86 7
	cmp	r3, #0
	bge	.L33
	.loc 1 88 11
	ldr	r3, [sp, #92]
	rsb	r3, r3, #1
	str	r3, [sp, #92]
	.loc 1 89 7
	add	r1, sp, #48
	add	r3, sp, #48
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L33:
	.loc 1 92 10
	ldrsh	r2, [sp, #50]
	ldrsh	r3, [sp, #48]
	.loc 1 92 7
	cmp	r2, r3
	ble	.L34
.LBB62:
	.loc 1 97 5
	ldrsh	r0, [sp, #48]
	ldrsh	r1, [sp, #50]
	add	r3, sp, #42
	add	r2, sp, #44
	bl	arm_divide_q15
	.loc 1 99 5
	ldrsh	r3, [sp, #42]
	sxtb	r1, r3
	add	r2, sp, #44
	add	r0, sp, #44
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 101 20
	ldrsh	r3, [sp, #44]
	strh	r3, [sp, #90]	@ movhi
.LBB63:
.LBB64:
	.loc 1 60 37
	ldr	r3, .L49
	.loc 1 60 11
	str	r3, [sp, #84]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #80]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #80]
	.loc 1 62 5
	b	.L35
.L36:
	.loc 1 64 16
	ldrsh	r3, [sp, #90]
	.loc 1 64 26
	ldr	r2, [sp, #84]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #84]
	.loc 1 65 51
	ldr	r3, [sp, #80]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L49+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #84]
	add	r3, r3, r2
	str	r3, [sp, #84]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #80]
	adds	r3, r3, #1
	str	r3, [sp, #80]
.L35:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #80]
	cmp	r3, #9
	ble	.L36
.LBB65:
	.loc 1 68 43
	ldr	r3, [sp, #84]
	asrs	r3, r3, #2
	str	r3, [sp, #76]
	.loc 1 68 62
	ldr	r3, [sp, #76]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #72]
	.loc 1 68 146
	ldr	r3, [sp, #72]
.LBE65:
	.loc 1 68 9
	str	r3, [sp, #84]
	.loc 1 71 11
	ldr	r3, [sp, #84]
	sxth	r3, r3
.LBE64:
.LBE63:
	.loc 1 101 20 discriminator 1
	uxth	r3, r3
	.loc 1 101 18 discriminator 1
	rsb	r3, r3, #12864
	adds	r3, r3, #4
	uxth	r3, r3
	sxth	r3, r3
	.loc 1 101 9 discriminator 1
	strh	r3, [sp, #46]	@ movhi
.LBE62:
	b	.L38
.L34:
.LBB66:
	.loc 1 109 5
	ldrsh	r0, [sp, #50]
	ldrsh	r1, [sp, #48]
	add	r3, sp, #38
	add	r2, sp, #40
	bl	arm_divide_q15
	.loc 1 111 5
	ldrsh	r3, [sp, #38]
	sxtb	r1, r3
	add	r2, sp, #40
	add	r0, sp, #40
	movs	r3, #1
	bl	arm_shift_q15
	.loc 1 113 11
	ldrsh	r3, [sp, #40]
	strh	r3, [sp, #70]	@ movhi
.LBB67:
.LBB68:
	.loc 1 60 37
	ldr	r3, .L49
	.loc 1 60 11
	str	r3, [sp, #64]
	.loc 1 61 9
	movs	r3, #1
	str	r3, [sp, #60]
	.loc 1 62 10
	movs	r3, #1
	str	r3, [sp, #60]
	.loc 1 62 5
	b	.L39
.L40:
	.loc 1 64 16
	ldrsh	r3, [sp, #70]
	.loc 1 64 26
	ldr	r2, [sp, #64]
	mul	r3, r2, r3
	.loc 1 64 13
	asrs	r3, r3, #15
	str	r3, [sp, #64]
	.loc 1 65 51
	ldr	r3, [sp, #60]
	rsb	r3, r3, #9
	.loc 1 65 45
	ldr	r2, .L49+4
	ldrsh	r3, [r2, r3, lsl #1]
	.loc 1 65 22
	mov	r2, r3
	.loc 1 65 13
	ldr	r3, [sp, #64]
	add	r3, r3, r2
	str	r3, [sp, #64]
	.loc 1 62 19 discriminator 3
	ldr	r3, [sp, #60]
	adds	r3, r3, #1
	str	r3, [sp, #60]
.L39:
	.loc 1 62 14 discriminator 1
	ldr	r3, [sp, #60]
	cmp	r3, #9
	ble	.L40
.LBB69:
	.loc 1 68 43
	ldr	r3, [sp, #64]
	asrs	r3, r3, #2
	str	r3, [sp, #56]
	.loc 1 68 62
	ldr	r3, [sp, #56]
	.syntax unified
@ 68 "C:\Users\peppe\OneDrive\Desktop\fft_test\v1\lib\arm_math\dsp_source\FastMathFunctions\arm_atan2_q15.c" 1
	ssat r3, #16, r3
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #52]
	.loc 1 68 146
	ldr	r3, [sp, #52]
.LBE69:
	.loc 1 68 9
	str	r3, [sp, #64]
	.loc 1 71 11
	ldr	r3, [sp, #64]
	sxth	r3, r3
.LBE68:
.LBE67:
	.loc 1 113 9 discriminator 1
	strh	r3, [sp, #46]	@ movhi
.L38:
.LBE66:
	.loc 1 118 7
	ldr	r3, [sp, #92]
	cmp	r3, #0
	beq	.L42
	.loc 1 120 6
	add	r1, sp, #46
	add	r3, sp, #46
	movs	r2, #1
	mov	r0, r3
	bl	arm_negate_q15
.L42:
	.loc 1 123 10
	ldrsh	r3, [sp, #46]
.LBE61:
.LBE60:
	.loc 1 165 20 discriminator 1
	uxth	r3, r3
	.loc 1 165 38 discriminator 1
	sub	r3, r3, #25728
	subs	r3, r3, #8
	uxth	r3, r3
	sxth	r2, r3
	.loc 1 165 19 discriminator 1
	ldr	r3, [sp]
	strh	r2, [r3]	@ movhi
	b	.L30
.L31:
	.loc 1 169 16
	ldrsh	r3, [sp, #6]
	cmp	r3, #0
	bge	.L44
	.loc 1 171 23
	ldr	r3, [sp]
	movw	r2, #39800
	strh	r2, [r3]	@ movhi
	b	.L30
.L44:
	.loc 1 175 23
	ldr	r3, [sp]
	movw	r2, #25736
	strh	r2, [r3]	@ movhi
.L30:
	.loc 1 178 15
	movs	r3, #0
	b	.L15
.L16:
	.loc 1 180 8
	ldrsh	r3, [sp, #4]
	cmp	r3, #0
	bne	.L45
	.loc 1 182 12
	ldrsh	r3, [sp, #6]
	cmp	r3, #0
	ble	.L46
	.loc 1 184 20
	ldr	r3, [sp]
	movw	r2, #12868
	strh	r2, [r3]	@ movhi
	.loc 1 185 19
	movs	r3, #0
	b	.L15
.L46:
	.loc 1 187 12
	ldrsh	r3, [sp, #6]
	cmp	r3, #0
	bge	.L45
	.loc 1 189 20
	ldr	r3, [sp]
	movw	r2, #52668
	strh	r2, [r3]	@ movhi
	.loc 1 190 19
	movs	r3, #0
	b	.L15
.L45:
	.loc 1 195 11
	mvn	r3, #3
.L15:
	.loc 1 197 1
	mov	r0, r3
	add	sp, sp, #188
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L50:
	.align	2
.L49:
	.word	-1061
	.word	atan2_coefs_q15
	.cfi_endproc
.LFE136:
	.size	arm_atan2_q15, .-arm_atan2_q15
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 3 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.file 5 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x61a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0xc
	.4byte	.LASF41
	.4byte	.LASF42
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
	.byte	0x2
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
	.byte	0x2
	.2byte	0x112
	.byte	0x13
	.4byte	0x66
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x113
	.byte	0x1c
	.4byte	0x7a
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.2byte	0x114
	.byte	0x12
	.4byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x115
	.byte	0x1b
	.4byte	0xa2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF18
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF19
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF20
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x11f
	.byte	0x13
	.4byte	0x59
	.uleb128 0x5
	.4byte	0xe1
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x124
	.byte	0x13
	.4byte	0x81
	.uleb128 0x6
	.byte	0x5
	.byte	0x1
	.4byte	0x4b
	.byte	0x3
	.2byte	0x258
	.byte	0x3
	.4byte	0x140
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0
	.uleb128 0x8
	.4byte	.LASF24
	.sleb128 -1
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 -2
	.uleb128 0x8
	.4byte	.LASF26
	.sleb128 -3
	.uleb128 0x8
	.4byte	.LASF27
	.sleb128 -4
	.uleb128 0x8
	.4byte	.LASF28
	.sleb128 -5
	.uleb128 0x8
	.4byte	.LASF29
	.sleb128 -6
	.uleb128 0x8
	.4byte	.LASF30
	.sleb128 -7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x261
	.byte	0x5
	.4byte	0x100
	.uleb128 0x9
	.4byte	0xee
	.4byte	0x15d
	.uleb128 0xa
	.4byte	0x37
	.byte	0x9
	.byte	0
	.uleb128 0x5
	.4byte	0x14d
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x1
	.byte	0x2e
	.byte	0x14
	.4byte	0x15d
	.uleb128 0x5
	.byte	0x3
	.4byte	atan2_coefs_q15
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x1ef
	.byte	0x8
	.4byte	0x196
	.uleb128 0xd
	.4byte	0x196
	.uleb128 0xd
	.4byte	0x3e
	.uleb128 0xd
	.4byte	0x19c
	.uleb128 0xd
	.4byte	0x95
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0xee
	.uleb128 0xe
	.byte	0x4
	.4byte	0xe1
	.uleb128 0xf
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x172
	.byte	0xc
	.4byte	0x140
	.4byte	0x1c8
	.uleb128 0xd
	.4byte	0xe1
	.uleb128 0xd
	.4byte	0xe1
	.uleb128 0xd
	.4byte	0x19c
	.uleb128 0xd
	.4byte	0x1c8
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x59
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x278
	.byte	0x8
	.4byte	0x1eb
	.uleb128 0xd
	.4byte	0x196
	.uleb128 0xd
	.4byte	0x19c
	.uleb128 0xd
	.4byte	0x95
	.byte	0
	.uleb128 0x10
	.4byte	.LASF45
	.byte	0x1
	.byte	0x96
	.byte	0xc
	.4byte	0x140
	.4byte	.LFB136
	.4byte	.LFE136-.LFB136
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55f
	.uleb128 0x11
	.ascii	"y\000"
	.byte	0x1
	.byte	0x96
	.byte	0x20
	.4byte	0xe1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -186
	.uleb128 0x11
	.ascii	"x\000"
	.byte	0x1
	.byte	0x96
	.byte	0x28
	.4byte	0xe1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -188
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.byte	0x96
	.byte	0x31
	.4byte	0x19c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x13
	.4byte	0x55f
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x1
	.byte	0x9a
	.byte	0x11
	.4byte	0x33b
	.uleb128 0x14
	.4byte	0x570
	.uleb128 0x3
	.byte	0x91
	.sleb128 -170
	.uleb128 0x14
	.4byte	0x57a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x15
	.4byte	0x584
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	0x590
	.uleb128 0x3
	.byte	0x91
	.sleb128 -174
	.uleb128 0x16
	.4byte	0x59c
	.4byte	.LBB42
	.4byte	.LBE42-.LBB42
	.4byte	0x2d3
	.uleb128 0x15
	.4byte	0x5a1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x15
	.4byte	0x5ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -178
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB43
	.4byte	.LBE43-.LBB43
	.byte	0x1
	.byte	0x65
	.byte	0x14
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB45
	.4byte	.LBE45-.LBB45
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ba
	.4byte	.LBB46
	.4byte	.LBE46-.LBB46
	.uleb128 0x15
	.4byte	0x5bb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x15
	.4byte	0x5c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -182
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB47
	.4byte	.LBE47-.LBB47
	.byte	0x1
	.byte	0x71
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB49
	.4byte	.LBE49-.LBB49
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	0x55f
	.4byte	.LBB50
	.4byte	.LBE50-.LBB50
	.byte	0x1
	.byte	0xa1
	.byte	0x14
	.4byte	0x44d
	.uleb128 0x14
	.4byte	0x570
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x14
	.4byte	0x57a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -158
	.uleb128 0x15
	.4byte	0x584
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x15
	.4byte	0x590
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x16
	.4byte	0x59c
	.4byte	.LBB52
	.4byte	.LBE52-.LBB52
	.4byte	0x3e0
	.uleb128 0x15
	.4byte	0x5a1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -162
	.uleb128 0x15
	.4byte	0x5ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB53
	.4byte	.LBE53-.LBB53
	.byte	0x1
	.byte	0x65
	.byte	0x14
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB55
	.4byte	.LBE55-.LBB55
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ba
	.4byte	.LBB56
	.4byte	.LBE56-.LBB56
	.uleb128 0x15
	.4byte	0x5bb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -166
	.uleb128 0x15
	.4byte	0x5c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB57
	.4byte	.LBE57-.LBB57
	.byte	0x1
	.byte	0x71
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -78
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB59
	.4byte	.LBE59-.LBB59
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	0x55f
	.4byte	.LBB60
	.4byte	.LBE60-.LBB60
	.byte	0x1
	.byte	0xa5
	.byte	0x14
	.uleb128 0x14
	.4byte	0x570
	.uleb128 0x3
	.byte	0x91
	.sleb128 -142
	.uleb128 0x14
	.4byte	0x57a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x15
	.4byte	0x584
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x15
	.4byte	0x590
	.uleb128 0x3
	.byte	0x91
	.sleb128 -146
	.uleb128 0x16
	.4byte	0x59c
	.4byte	.LBB62
	.4byte	.LBE62-.LBB62
	.4byte	0x4f1
	.uleb128 0x15
	.4byte	0x5a1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x15
	.4byte	0x5ad
	.uleb128 0x3
	.byte	0x91
	.sleb128 -150
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB63
	.4byte	.LBE63-.LBB63
	.byte	0x1
	.byte	0x65
	.byte	0x14
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -102
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB65
	.4byte	.LBE65-.LBB65
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	0x5ba
	.4byte	.LBB66
	.4byte	.LBE66-.LBB66
	.uleb128 0x15
	.4byte	0x5bb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x15
	.4byte	0x5c7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -154
	.uleb128 0x17
	.4byte	0x5d5
	.4byte	.LBB67
	.4byte	.LBE67-.LBB67
	.byte	0x1
	.byte	0x71
	.byte	0xb
	.uleb128 0x14
	.4byte	0x5e2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -122
	.uleb128 0x15
	.4byte	0x5ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x15
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x18
	.4byte	0x602
	.4byte	.LBB69
	.4byte	.LBE69-.LBB69
	.uleb128 0x15
	.4byte	0x603
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x15
	.4byte	0x60f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF46
	.byte	0x1
	.byte	0x4b
	.byte	0x34
	.4byte	0xe1
	.byte	0x3
	.4byte	0x5d5
	.uleb128 0x1a
	.ascii	"y\000"
	.byte	0x1
	.byte	0x4b
	.byte	0x47
	.4byte	0xe1
	.uleb128 0x1a
	.ascii	"x\000"
	.byte	0x1
	.byte	0x4b
	.byte	0x4f
	.4byte	0xe1
	.uleb128 0x1b
	.4byte	.LASF35
	.byte	0x1
	.byte	0x4d
	.byte	0x8
	.4byte	0x29
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.byte	0x4e
	.byte	0xa
	.4byte	0xe1
	.uleb128 0x1d
	.4byte	0x5ba
	.uleb128 0x1b
	.4byte	.LASF36
	.byte	0x1
	.byte	0x5e
	.byte	0xb
	.4byte	0xe1
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0x5f
	.byte	0xd
	.4byte	0x59
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1b
	.4byte	.LASF36
	.byte	0x1
	.byte	0x6a
	.byte	0xb
	.4byte	0xe1
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.byte	0x6b
	.byte	0xd
	.4byte	0x59
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF47
	.byte	0x1
	.byte	0x3a
	.byte	0x34
	.4byte	0xe1
	.byte	0x3
	.uleb128 0x1a
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3a
	.byte	0x4f
	.4byte	0xe1
	.uleb128 0x1c
	.ascii	"res\000"
	.byte	0x1
	.byte	0x3c
	.byte	0xb
	.4byte	0xf3
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3d
	.byte	0x9
	.4byte	0x29
	.uleb128 0x1e
	.uleb128 0x1b
	.4byte	.LASF38
	.byte	0x1
	.byte	0x44
	.byte	0x24
	.4byte	0x81
	.uleb128 0x1b
	.4byte	.LASF39
	.byte	0x1
	.byte	0x44
	.byte	0x2b
	.4byte	0x81
	.byte	0
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
	.4byte	0x163
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x61e
	.4byte	0x10f
	.ascii	"ARM_MATH_SUCCESS\000"
	.4byte	0x115
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
	.4byte	0x11b
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
	.4byte	0x121
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
	.4byte	0x127
	.ascii	"ARM_MATH_NANINF\000"
	.4byte	0x12d
	.ascii	"ARM_MATH_SINGULAR\000"
	.4byte	0x133
	.ascii	"ARM_MATH_TEST_FAILURE\000"
	.4byte	0x139
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
	.4byte	0x162
	.ascii	"atan2_coefs_q15\000"
	.4byte	0x174
	.ascii	"arm_shift_q15\000"
	.4byte	0x1a2
	.ascii	"arm_divide_q15\000"
	.4byte	0x1ce
	.ascii	"arm_negate_q15\000"
	.4byte	0x1eb
	.ascii	"arm_atan2_q15\000"
	.4byte	0x55f
	.ascii	"arm_atan_q15\000"
	.4byte	0x5d5
	.ascii	"arm_atan_limited_q15\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x189
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x61e
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
	.4byte	0xa9
	.ascii	"long long int\000"
	.4byte	0xb0
	.ascii	"long long unsigned int\000"
	.4byte	0xb7
	.ascii	"float\000"
	.4byte	0xbe
	.ascii	"complex float\000"
	.4byte	0xc5
	.ascii	"double\000"
	.4byte	0xcc
	.ascii	"complex double\000"
	.4byte	0xd3
	.ascii	"long double\000"
	.4byte	0xda
	.ascii	"complex long double\000"
	.4byte	0xe1
	.ascii	"q15_t\000"
	.4byte	0xf3
	.ascii	"q31_t\000"
	.4byte	0x140
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
	.file 13 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/math.h"
	.byte	0x3
	.uleb128 0x58
	.uleb128 0xd
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
	.file 17 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_memory.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x11
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.file 18 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/none.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x12
	.byte	0x4
	.file 19 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/utils.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x4
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
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"shift\000"
.LASF24:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF25:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF43:
	.ascii	"atan2_coefs_q15\000"
.LASF10:
	.ascii	"long int\000"
.LASF42:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF33:
	.ascii	"arm_negate_q15\000"
.LASF17:
	.ascii	"double\000"
.LASF4:
	.ascii	"int8_t\000"
.LASF9:
	.ascii	"int32_t\000"
.LASF21:
	.ascii	"q15_t\000"
.LASF15:
	.ascii	"float\000"
.LASF14:
	.ascii	"long long unsigned int\000"
.LASF22:
	.ascii	"q31_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF32:
	.ascii	"arm_shift_q15\000"
.LASF35:
	.ascii	"sign\000"
.LASF39:
	.ascii	"__ARG1\000"
.LASF29:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF46:
	.ascii	"arm_atan_q15\000"
.LASF12:
	.ascii	"long unsigned int\000"
.LASF20:
	.ascii	"complex long double\000"
.LASF44:
	.ascii	"arm_divide_q15\000"
.LASF47:
	.ascii	"arm_atan_limited_q15\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"int16_t\000"
.LASF26:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF34:
	.ascii	"result\000"
.LASF27:
	.ascii	"ARM_MATH_NANINF\000"
.LASF36:
	.ascii	"ratio\000"
.LASF16:
	.ascii	"complex float\000"
.LASF30:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF38:
	.ascii	"__RES\000"
.LASF13:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"char\000"
.LASF23:
	.ascii	"ARM_MATH_SUCCESS\000"
.LASF6:
	.ascii	"short int\000"
.LASF18:
	.ascii	"complex double\000"
.LASF7:
	.ascii	"uint16_t\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF40:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF45:
	.ascii	"arm_atan2_q15\000"
.LASF19:
	.ascii	"long double\000"
.LASF2:
	.ascii	"signed char\000"
.LASF41:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_a"
	.ascii	"tan2_q15.c\000"
.LASF31:
	.ascii	"arm_status\000"
.LASF28:
	.ascii	"ARM_MATH_SINGULAR\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
