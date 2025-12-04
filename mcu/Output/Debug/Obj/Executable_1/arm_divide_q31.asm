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
	.file	"arm_divide_q31.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_divide_q31.c"
	.section	.text.arm_divide_q31,"ax",%progbits
	.align	1
	.global	arm_divide_q31
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_divide_q31, %function
arm_divide_q31:
.LFB134:
	.loc 1 64 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 40
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
	sub	sp, sp, #44
	.cfi_def_cfa_offset 80
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	.loc 1 65 11
	movs	r3, #0
	strh	r3, [sp, #30]	@ movhi
	.loc 1 69 10
	ldr	r3, [sp, #8]
	movs	r2, #0
	strh	r2, [r3]	@ movhi
	.loc 1 71 26
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	eors	r3, r3, r2
	asrs	r3, r3, #31
	.loc 1 71 8
	strh	r3, [sp, #30]	@ movhi
	.loc 1 73 19
	ldr	r3, [sp, #16]
	.loc 1 73 6
	cmp	r3, #0
	bne	.L2
	.loc 1 75 9
	ldrsh	r3, [sp, #30]
	cmp	r3, #0
	beq	.L3
	.loc 1 77 19
	ldr	r3, [sp, #12]
	mov	r2, #-2147483648
	str	r2, [r3]
	b	.L4
.L3:
	.loc 1 81 19
	ldr	r3, [sp, #12]
	mvn	r2, #-2147483648
	str	r2, [r3]
.L4:
	.loc 1 83 12
	mvn	r3, #3
	b	.L5
.L2:
	.loc 1 86 3
	add	r1, sp, #20
	add	r3, sp, #20
	movs	r2, #1
	mov	r0, r3
	bl	arm_abs_q31
	.loc 1 87 3
	add	r1, sp, #16
	add	r3, sp, #16
	movs	r2, #1
	mov	r0, r3
	bl	arm_abs_q31
	.loc 1 89 11
	ldr	r3, [sp, #20]
	asrs	r2, r3, #31
	mov	r6, r3
	mov	r7, r2
	.loc 1 89 28
	asr	fp, r6, #1
	lsl	r10, r6, #31
	.loc 1 89 38
	ldr	r3, [sp, #16]
	asrs	r2, r3, #31
	str	r3, [sp]
	str	r2, [sp, #4]
	.loc 1 89 8
	ldrd	r2, [sp]
	mov	r0, r10
	mov	r1, fp
	bl	__aeabi_ldivmod
	mov	r2, r0
	mov	r3, r1
	strd	r2, [sp, #32]
	.loc 1 91 40
	ldrd	r0, [sp, #32]
	mov	r2, #0
	mov	r3, #0
	lsrs	r2, r0, #31
	orr	r2, r2, r1, lsl #1
	asrs	r3, r1, #31
	.loc 1 91 29
	mov	r3, r2
	str	r3, [sp, #24]
.LBB4:
.LBB5:
	.file 2 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
	.loc 2 414 6
	ldr	r3, [sp, #24]
	cmp	r3, #0
	bne	.L6
	.loc 2 416 12
	movs	r3, #32
	b	.L7
.L6:
	.loc 2 418 10
	ldr	r3, [sp, #24]
	clz	r3, r3
	.loc 2 418 10 is_stmt 0 discriminator 1
	uxtb	r3, r3
.L7:
.LBE5:
.LBE4:
	.loc 1 91 27 is_stmt 1 discriminator 1
	rsb	r3, r3, #32
	uxth	r3, r3
	.loc 1 91 22 discriminator 1
	strh	r3, [sp, #28]	@ movhi
	.loc 1 92 6
	ldrsh	r3, [sp, #28]
	cmp	r3, #0
	ble	.L8
	.loc 1 94 13
	ldr	r3, [sp, #8]
	ldrh	r2, [sp, #28]	@ movhi
	strh	r2, [r3]	@ movhi
	.loc 1 95 18
	ldrsh	r1, [sp, #28]
	.loc 1 95 11
	ldrd	r2, [sp, #32]
	rsb	r6, r1, #32
	subs	r0, r1, #32
	lsr	r4, r2, r1
	lsl	r6, r3, r6
	orr	r4, r4, r6
	bmi	.L9
	asr	r0, r3, r0
	orrs	r4, r4, r0
.L9:
	asr	r5, r3, r1
	strd	r4, [sp, #32]
.L8:
	.loc 1 98 6
	ldrsh	r3, [sp, #30]
	cmp	r3, #0
	beq	.L10
	.loc 1 100 10
	ldrd	r2, [sp, #32]
	movs	r1, #0
	rsbs	r8, r2, #0
	sbc	r9, r1, r3
	strd	r8, [sp, #32]
.L10:
	.loc 1 103 13
	ldr	r2, [sp, #32]
	.loc 1 103 12
	ldr	r3, [sp, #12]
	str	r2, [r3]
	.loc 1 105 9
	movs	r3, #0
.L5:
	.loc 1 106 1
	mov	r0, r3
	add	sp, sp, #44
	.cfi_def_cfa_offset 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.cfi_endproc
.LFE134:
	.size	arm_divide_q31, .-arm_divide_q31
	.text
.Letext0:
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 5 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x234
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0xc
	.4byte	.LASF40
	.4byte	.LASF41
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
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x111
	.byte	0x17
	.4byte	0x52
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
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x3
	.2byte	0x114
	.byte	0x12
	.4byte	0x81
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.2byte	0x115
	.byte	0x1b
	.4byte	0x95
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x116
	.byte	0x17
	.4byte	0xa9
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
	.byte	0x4
	.2byte	0x124
	.byte	0x13
	.4byte	0x74
	.uleb128 0x5
	.4byte	0xe1
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x129
	.byte	0x13
	.4byte	0x9c
	.uleb128 0x6
	.byte	0x5
	.byte	0x1
	.4byte	0x3e
	.byte	0x4
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
	.byte	0x4
	.2byte	0x261
	.byte	0x5
	.4byte	0x100
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x18c
	.byte	0x8
	.4byte	0x16a
	.uleb128 0xa
	.4byte	0x16a
	.uleb128 0xa
	.4byte	0x170
	.uleb128 0xa
	.4byte	0x88
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xee
	.uleb128 0xb
	.byte	0x4
	.4byte	0xe1
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x1
	.byte	0x3c
	.byte	0xc
	.4byte	0x140
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x215
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x1
	.byte	0x3c
	.byte	0x21
	.4byte	0xe1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x1
	.byte	0x3d
	.byte	0x9
	.4byte	0xe1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x1
	.byte	0x3e
	.byte	0xa
	.4byte	0x170
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.4byte	0x215
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x1
	.byte	0x41
	.byte	0xb
	.4byte	0x59
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x1
	.byte	0x42
	.byte	0x9
	.4byte	0xf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x43
	.byte	0xb
	.4byte	0x59
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xf
	.4byte	0x21b
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x5b
	.byte	0x1d
	.uleb128 0x10
	.4byte	0x229
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x59
	.uleb128 0x11
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x193
	.byte	0x36
	.4byte	0x45
	.byte	0x3
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x193
	.byte	0x45
	.4byte	0x88
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
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x108
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x238
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
	.4byte	0x14d
	.ascii	"arm_abs_q31\000"
	.4byte	0x176
	.ascii	"arm_divide_q31\000"
	.4byte	0x21b
	.ascii	"__CLZ\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x189
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x238
	.4byte	0x29
	.ascii	"int\000"
	.4byte	0x30
	.ascii	"char\000"
	.4byte	0x37
	.ascii	"unsigned int\000"
	.4byte	0x3e
	.ascii	"signed char\000"
	.4byte	0x52
	.ascii	"unsigned char\000"
	.4byte	0x45
	.ascii	"uint8_t\000"
	.4byte	0x66
	.ascii	"short int\000"
	.4byte	0x59
	.ascii	"int16_t\000"
	.4byte	0x6d
	.ascii	"short unsigned int\000"
	.4byte	0x81
	.ascii	"long int\000"
	.4byte	0x74
	.ascii	"int32_t\000"
	.4byte	0x95
	.ascii	"long unsigned int\000"
	.4byte	0x88
	.ascii	"uint32_t\000"
	.4byte	0xa9
	.ascii	"long long int\000"
	.4byte	0x9c
	.ascii	"int64_t\000"
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
	.ascii	"q31_t\000"
	.4byte	0xf3
	.ascii	"q63_t\000"
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
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB134
	.4byte	.LFE134
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
	.file 6 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/fast_math_functions.h"
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
	.byte	0x3
	.uleb128 0x36
	.uleb128 0x2
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
	.uleb128 0x4
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
	.uleb128 0x14
	.byte	0x4
	.file 21 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdlib.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x15
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF12:
	.ascii	"int64_t\000"
.LASF35:
	.ascii	"shift\000"
.LASF24:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF25:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF45:
	.ascii	"value\000"
.LASF34:
	.ascii	"quotient\000"
.LASF9:
	.ascii	"long int\000"
.LASF41:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF17:
	.ascii	"double\000"
.LASF33:
	.ascii	"denominator\000"
.LASF26:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF15:
	.ascii	"float\000"
.LASF2:
	.ascii	"signed char\000"
.LASF21:
	.ascii	"q31_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF36:
	.ascii	"sign\000"
.LASF37:
	.ascii	"temp\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF44:
	.ascii	"__CLZ\000"
.LASF29:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF20:
	.ascii	"complex long double\000"
.LASF40:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_d"
	.ascii	"ivide_q31.c\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF27:
	.ascii	"ARM_MATH_NANINF\000"
.LASF5:
	.ascii	"int16_t\000"
.LASF16:
	.ascii	"complex float\000"
.LASF30:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF8:
	.ascii	"int32_t\000"
.LASF22:
	.ascii	"q63_t\000"
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
.LASF38:
	.ascii	"shiftForNormalizing\000"
.LASF32:
	.ascii	"numerator\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF39:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF19:
	.ascii	"long double\000"
.LASF31:
	.ascii	"arm_status\000"
.LASF42:
	.ascii	"arm_abs_q31\000"
.LASF43:
	.ascii	"arm_divide_q31\000"
.LASF28:
	.ascii	"ARM_MATH_SINGULAR\000"
	.global	__aeabi_ldivmod
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
