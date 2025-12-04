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
	.file	"arm_sqrt_q15.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_sqrt_q15.c"
	.section	.text.arm_sqrt_q15,"ax",%progbits
	.align	1
	.global	arm_sqrt_q15
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_sqrt_q15, %function
arm_sqrt_q15:
.LFB134:
	.loc 1 54 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
	.cfi_def_cfa_offset 24
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	.loc 1 57 10
	ldrh	r3, [sp, #6]	@ movhi
	strh	r3, [sp, #22]	@ movhi
	.loc 1 60 6
	ldrsh	r3, [sp, #22]
	cmp	r3, #0
	ble	.L2
	.loc 1 62 17
	ldrsh	r3, [sp, #22]
	str	r3, [sp, #12]
.LBB4:
.LBB5:
	.file 2 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/CMSIS_5/CMSIS/Core/Include/cmsis_gcc.h"
	.loc 2 414 6
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L3
	.loc 2 416 12
	movs	r3, #32
	b	.L4
.L3:
	.loc 2 418 10
	ldr	r3, [sp, #12]
	clz	r3, r3
	.loc 2 418 10 is_stmt 0 discriminator 1
	uxtb	r3, r3
.L4:
.LBE5:
.LBE4:
	.loc 1 62 31 is_stmt 1 discriminator 1
	subs	r3, r3, #17
	uxth	r3, r3
	.loc 1 62 15 discriminator 1
	strh	r3, [sp, #18]	@ movhi
	.loc 1 65 25
	ldrh	r3, [sp, #18]
	and	r3, r3, #1
	uxth	r3, r3
	.loc 1 65 8
	cmp	r3, #0
	bne	.L5
	.loc 1 67 23
	ldrsh	r2, [sp, #22]
	ldrsh	r3, [sp, #18]
	lsl	r3, r2, r3
	.loc 1 67 14
	strh	r3, [sp, #22]	@ movhi
	b	.L6
.L5:
	.loc 1 71 23
	ldrsh	r2, [sp, #22]
	.loc 1 71 37
	ldrsh	r3, [sp, #18]
	subs	r3, r3, #1
	.loc 1 71 23
	lsl	r3, r2, r3
	.loc 1 71 14
	strh	r3, [sp, #22]	@ movhi
.L6:
	.loc 1 74 40
	ldrsh	r3, [sp, #22]
	asrs	r3, r3, #11
	sxth	r3, r3
	.loc 1 74 47
	subs	r3, r3, #4
	.loc 1 74 10
	ldr	r2, .L10
	ldrh	r3, [r2, r3, lsl #1]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	.loc 1 79 12
	ldrsh	r3, [sp, #20]
	.loc 1 79 25
	ldrsh	r2, [sp, #20]
	mul	r3, r2, r3
	.loc 1 79 33
	asrs	r3, r3, #12
	.loc 1 79 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 80 12
	ldrsh	r3, [sp, #22]
	.loc 1 80 27
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 80 35
	asrs	r3, r3, #15
	.loc 1 80 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 81 18
	ldrh	r3, [sp, #16]
	rsb	r3, r3, #12288
	uxth	r3, r3
	.loc 1 81 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 82 12
	ldrsh	r3, [sp, #20]
	.loc 1 82 25
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 82 33
	asrs	r3, r3, #13
	.loc 1 82 9
	strh	r3, [sp, #20]	@ movhi
	.loc 1 84 12
	ldrsh	r3, [sp, #20]
	.loc 1 84 25
	ldrsh	r2, [sp, #20]
	mul	r3, r2, r3
	.loc 1 84 33
	asrs	r3, r3, #12
	.loc 1 84 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 85 12
	ldrsh	r3, [sp, #22]
	.loc 1 85 27
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 85 35
	asrs	r3, r3, #15
	.loc 1 85 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 86 18
	ldrh	r3, [sp, #16]
	rsb	r3, r3, #12288
	uxth	r3, r3
	.loc 1 86 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 87 12
	ldrsh	r3, [sp, #20]
	.loc 1 87 25
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 87 33
	asrs	r3, r3, #13
	.loc 1 87 9
	strh	r3, [sp, #20]	@ movhi
	.loc 1 89 12
	ldrsh	r3, [sp, #20]
	.loc 1 89 25
	ldrsh	r2, [sp, #20]
	mul	r3, r2, r3
	.loc 1 89 33
	asrs	r3, r3, #12
	.loc 1 89 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 90 12
	ldrsh	r3, [sp, #22]
	.loc 1 90 27
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 90 35
	asrs	r3, r3, #15
	.loc 1 90 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 91 18
	ldrh	r3, [sp, #16]
	rsb	r3, r3, #12288
	uxth	r3, r3
	.loc 1 91 9
	strh	r3, [sp, #16]	@ movhi
	.loc 1 92 12
	ldrsh	r3, [sp, #20]
	.loc 1 92 25
	ldrsh	r2, [sp, #16]
	mul	r3, r2, r3
	.loc 1 92 33
	asrs	r3, r3, #13
	.loc 1 92 9
	strh	r3, [sp, #20]	@ movhi
	.loc 1 96 23
	ldrsh	r3, [sp, #22]
	.loc 1 96 38
	ldrsh	r2, [sp, #20]
	mul	r3, r2, r3
	.loc 1 96 46
	asrs	r3, r3, #12
	.loc 1 96 10
	strh	r3, [sp, #20]	@ movhi
	.loc 1 99 25
	ldrh	r3, [sp, #18]
	and	r3, r3, #1
	uxth	r3, r3
	.loc 1 99 8
	cmp	r3, #0
	bne	.L7
	.loc 1 101 19
	ldrsh	r2, [sp, #20]
	.loc 1 101 33
	ldrsh	r3, [sp, #18]
	lsrs	r1, r3, #31
	add	r3, r3, r1
	asrs	r3, r3, #1
	sxth	r3, r3
	.loc 1 101 19
	asr	r3, r2, r3
	.loc 1 101 12
	strh	r3, [sp, #20]	@ movhi
	b	.L8
.L7:
	.loc 1 105 19
	ldrsh	r2, [sp, #20]
	.loc 1 105 34
	ldrsh	r3, [sp, #18]
	subs	r3, r3, #1
	.loc 1 105 39
	lsrs	r1, r3, #31
	add	r3, r3, r1
	asrs	r3, r3, #1
	.loc 1 105 19
	asr	r3, r2, r3
	.loc 1 105 12
	strh	r3, [sp, #20]	@ movhi
.L8:
	.loc 1 107 11
	ldr	r3, [sp]
	ldrh	r2, [sp, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	.loc 1 110 12
	movs	r3, #0
	b	.L9
.L2:
	.loc 1 115 11
	ldr	r3, [sp]
	movs	r2, #0
	strh	r2, [r3]	@ movhi
	.loc 1 117 12
	mov	r3, #-1
.L9:
	.loc 1 119 1
	mov	r0, r3
	add	sp, sp, #24
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	sqrt_initial_lut_q15
	.cfi_endproc
.LFE134:
	.size	arm_sqrt_q15, .-arm_sqrt_q15
	.text
.Letext0:
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 5 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x20e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0xc
	.4byte	.LASF37
	.4byte	.LASF38
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x10
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
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x11f
	.byte	0x13
	.4byte	0x59
	.uleb128 0x5
	.4byte	0xd4
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x124
	.byte	0x13
	.4byte	0x74
	.uleb128 0x6
	.byte	0x5
	.byte	0x1
	.4byte	0x3e
	.byte	0x4
	.2byte	0x258
	.byte	0x3
	.4byte	0x133
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0
	.uleb128 0x8
	.4byte	.LASF23
	.sleb128 -1
	.uleb128 0x8
	.4byte	.LASF24
	.sleb128 -2
	.uleb128 0x8
	.4byte	.LASF25
	.sleb128 -3
	.uleb128 0x8
	.4byte	.LASF26
	.sleb128 -4
	.uleb128 0x8
	.4byte	.LASF27
	.sleb128 -5
	.uleb128 0x8
	.4byte	.LASF28
	.sleb128 -6
	.uleb128 0x8
	.4byte	.LASF29
	.sleb128 -7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x261
	.byte	0x5
	.4byte	0xf3
	.uleb128 0x9
	.4byte	0xe1
	.4byte	0x150
	.uleb128 0xa
	.4byte	0x37
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.4byte	0x140
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x202
	.byte	0x1b
	.4byte	0x150
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x1
	.byte	0x33
	.byte	0xc
	.4byte	0x133
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ef
	.uleb128 0xd
	.ascii	"in\000"
	.byte	0x1
	.byte	0x34
	.byte	0x9
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x1
	.byte	0x35
	.byte	0xb
	.4byte	0x1ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF32
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0x37
	.byte	0x11
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x37
	.byte	0x17
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0x37
	.byte	0x21
	.4byte	0xd4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x10
	.4byte	0x1f5
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x3e
	.byte	0x11
	.uleb128 0x11
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0xd4
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x193
	.byte	0x36
	.4byte	0x45
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF42
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.4byte	0xf6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x212
	.4byte	0x102
	.ascii	"ARM_MATH_SUCCESS\000"
	.4byte	0x108
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
	.4byte	0x10e
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
	.4byte	0x114
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
	.4byte	0x11a
	.ascii	"ARM_MATH_NANINF\000"
	.4byte	0x120
	.ascii	"ARM_MATH_SINGULAR\000"
	.4byte	0x126
	.ascii	"ARM_MATH_TEST_FAILURE\000"
	.4byte	0x12c
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
	.4byte	0x162
	.ascii	"arm_sqrt_q15\000"
	.4byte	0x1f5
	.ascii	"__CLZ\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x17d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x212
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
	.4byte	0x9c
	.ascii	"long long int\000"
	.4byte	0xa3
	.ascii	"long long unsigned int\000"
	.4byte	0xaa
	.ascii	"float\000"
	.4byte	0xb1
	.ascii	"complex float\000"
	.4byte	0xb8
	.ascii	"double\000"
	.4byte	0xbf
	.ascii	"complex double\000"
	.4byte	0xc6
	.ascii	"long double\000"
	.4byte	0xcd
	.ascii	"complex long double\000"
	.4byte	0xd4
	.ascii	"q15_t\000"
	.4byte	0xe6
	.ascii	"q31_t\000"
	.4byte	0x133
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
	.file 20 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x14
	.byte	0x4
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x5
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_s"
	.ascii	"qrt_q15.c\000"
.LASF23:
	.ascii	"ARM_MATH_ARGUMENT_ERROR\000"
.LASF24:
	.ascii	"ARM_MATH_LENGTH_ERROR\000"
.LASF42:
	.ascii	"value\000"
.LASF9:
	.ascii	"long int\000"
.LASF38:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF16:
	.ascii	"double\000"
.LASF25:
	.ascii	"ARM_MATH_SIZE_MISMATCH\000"
.LASF20:
	.ascii	"q15_t\000"
.LASF14:
	.ascii	"float\000"
.LASF21:
	.ascii	"q31_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF27:
	.ascii	"ARM_MATH_SINGULAR\000"
.LASF35:
	.ascii	"temp\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"__CLZ\000"
.LASF28:
	.ascii	"ARM_MATH_TEST_FAILURE\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF19:
	.ascii	"complex long double\000"
.LASF33:
	.ascii	"var1\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF40:
	.ascii	"arm_sqrt_q15\000"
.LASF13:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF26:
	.ascii	"ARM_MATH_NANINF\000"
.LASF5:
	.ascii	"int16_t\000"
.LASF15:
	.ascii	"complex float\000"
.LASF32:
	.ascii	"number\000"
.LASF29:
	.ascii	"ARM_MATH_DECOMPOSITION_FAILURE\000"
.LASF8:
	.ascii	"int32_t\000"
.LASF31:
	.ascii	"pOut\000"
.LASF12:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"char\000"
.LASF22:
	.ascii	"ARM_MATH_SUCCESS\000"
.LASF6:
	.ascii	"short int\000"
.LASF17:
	.ascii	"complex double\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF36:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF18:
	.ascii	"long double\000"
.LASF2:
	.ascii	"signed char\000"
.LASF39:
	.ascii	"sqrt_initial_lut_q15\000"
.LASF34:
	.ascii	"signBits1\000"
.LASF30:
	.ascii	"arm_status\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
