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
	.file	"arm_cos_q31.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_cos_q31.c"
	.section	.text.arm_cos_q31,"ax",%progbits
	.align	1
	.global	arm_cos_q31
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_cos_q31, %function
arm_cos_q31:
.LFB134:
	.loc 1 51 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, r10, fp}
	.cfi_def_cfa_offset 32
	.cfi_offset 4, -32
	.cfi_offset 5, -28
	.cfi_offset 6, -24
	.cfi_offset 7, -20
	.cfi_offset 8, -16
	.cfi_offset 9, -12
	.cfi_offset 10, -8
	.cfi_offset 11, -4
	sub	sp, sp, #64
	.cfi_def_cfa_offset 96
	str	r0, [sp, #36]
	.loc 1 58 7
	ldr	r3, [sp, #36]
	.loc 1 58 19
	add	r3, r3, #536870912
	.loc 1 58 5
	str	r3, [sp, #36]
	.loc 1 59 6
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bge	.L2
	.loc 1 61 9
	ldr	r3, [sp, #36]
	.loc 1 61 21
	add	r3, r3, #-2147483648
	.loc 1 61 7
	str	r3, [sp, #36]
.L2:
	.loc 1 65 11
	ldr	r3, [sp, #36]
	.loc 1 65 23
	lsrs	r3, r3, #22
	.loc 1 65 9
	str	r3, [sp, #60]
	.loc 1 68 23
	ldr	r3, [sp, #60]
	lsls	r2, r3, #22
	.loc 1 68 14
	ldr	r3, [sp, #36]
	subs	r3, r3, r2
	.loc 1 68 9
	lsls	r3, r3, #9
	str	r3, [sp, #56]
	.loc 1 71 5
	ldr	r2, .L4
	ldr	r3, [sp, #60]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [sp, #52]
	.loc 1 72 25
	ldr	r3, [sp, #60]
	adds	r2, r3, #1
	.loc 1 72 5
	ldr	r3, .L4
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [sp, #48]
	.loc 1 75 32
	ldr	r3, [sp, #56]
	rsb	r3, r3, #-2147483648
	.loc 1 75 12
	movs	r2, #0
	str	r3, [sp]
	str	r2, [sp, #4]
	.loc 1 75 41
	ldr	r3, [sp, #52]
	asrs	r2, r3, #31
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	ldrd	r0, [sp]
	mov	r3, r1
	ldr	r2, [sp, #8]
	mul	r2, r2, r3
	ldr	r3, [sp, #12]
	strd	r0, [sp]
	ldr	r1, [sp]
	mul	r3, r1, r3
	add	r3, r3, r2
	ldr	r2, [sp]
	ldr	r1, [sp, #8]
	umull	r6, r7, r2, r1
	add	r3, r3, r7
	mov	r7, r3
	.loc 1 75 45
	mov	r2, #0
	mov	r3, #0
	movs	r2, r7
	asrs	r3, r7, #31
	.loc 1 75 10
	mov	r3, r2
	str	r3, [sp, #44]
	.loc 1 76 23
	ldr	r3, [sp, #44]
	asrs	r2, r3, #31
	str	r3, [sp, #16]
	str	r2, [sp, #20]
	.loc 1 76 38
	mov	r2, #0
	mov	r3, #0
	ldr	r1, [sp, #16]
	movs	r3, r1
	movs	r2, #0
	.loc 1 76 48
	ldr	r1, [sp, #56]
	asrs	r0, r1, #31
	str	r1, [sp, #24]
	str	r0, [sp, #28]
	.loc 1 76 62
	ldr	r1, [sp, #48]
	asrs	r0, r1, #31
	mov	r10, r1
	mov	fp, r0
	ldrd	r6, [sp, #24]
	mov	r1, r7
	mul	r0, r10, r1
	mov	r1, r6
	mul	r1, r1, fp
	add	r1, r1, r0
	mov	r0, r6
	umull	r4, r5, r0, r10
	add	r1, r1, r5
	mov	r5, r1
	.loc 1 76 45
	adds	r8, r2, r4
	adc	r9, r3, r5
	.loc 1 76 68
	mov	r2, #0
	mov	r3, #0
	mov	r2, r9
	asr	r3, r9, #31
	.loc 1 76 10
	mov	r3, r2
	str	r3, [sp, #44]
	.loc 1 79 18
	ldr	r3, [sp, #44]
	lsls	r3, r3, #1
	.loc 1 80 1
	mov	r0, r3
	add	sp, sp, #64
	.cfi_def_cfa_offset 32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp}
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L5:
	.align	2
.L4:
	.word	sinTable_q31
	.cfi_endproc
.LFE134:
	.size	arm_cos_q31, .-arm_cos_q31
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 3 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x171
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
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
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x114
	.byte	0x12
	.4byte	0x67
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.2byte	0x115
	.byte	0x1b
	.4byte	0x7b
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x116
	.byte	0x17
	.4byte	0x8f
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x10
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
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x124
	.byte	0x13
	.4byte	0x5a
	.uleb128 0x5
	.4byte	0xc7
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x129
	.byte	0x13
	.4byte	0x82
	.uleb128 0x6
	.4byte	0xd4
	.4byte	0xf7
	.uleb128 0x7
	.4byte	0x37
	.2byte	0x200
	.byte	0
	.uleb128 0x5
	.4byte	0xe6
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1ee
	.byte	0x18
	.4byte	0xf7
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x1
	.byte	0x31
	.byte	0x7
	.4byte	0xc7
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x32
	.byte	0x9
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x34
	.byte	0x9
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0x35
	.byte	0xb
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii	"a\000"
	.byte	0x1
	.byte	0x36
	.byte	0x9
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.ascii	"b\000"
	.byte	0x1
	.byte	0x36
	.byte	0xc
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x1e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x175
	.4byte	0x109
	.ascii	"arm_cos_q31\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x162
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x175
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
	.4byte	0x53
	.ascii	"short unsigned int\000"
	.4byte	0x67
	.ascii	"long int\000"
	.4byte	0x5a
	.ascii	"int32_t\000"
	.4byte	0x7b
	.ascii	"long unsigned int\000"
	.4byte	0x6e
	.ascii	"uint32_t\000"
	.4byte	0x8f
	.ascii	"long long int\000"
	.4byte	0x82
	.ascii	"int64_t\000"
	.4byte	0x96
	.ascii	"long long unsigned int\000"
	.4byte	0x9d
	.ascii	"float\000"
	.4byte	0xa4
	.ascii	"complex float\000"
	.4byte	0xab
	.ascii	"double\000"
	.4byte	0xb2
	.ascii	"complex double\000"
	.4byte	0xb9
	.ascii	"long double\000"
	.4byte	0xc0
	.ascii	"complex long double\000"
	.4byte	0xc7
	.ascii	"q31_t\000"
	.4byte	0xd9
	.ascii	"q63_t\000"
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
	.file 20 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/dsp/basic_math_functions.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x14
	.byte	0x4
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF10:
	.ascii	"int64_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF26:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF25:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_c"
	.ascii	"os_q31.c\000"
.LASF28:
	.ascii	"arm_cos_q31\000"
.LASF13:
	.ascii	"float\000"
.LASF19:
	.ascii	"q31_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"double\000"
.LASF18:
	.ascii	"complex long double\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF20:
	.ascii	"q63_t\000"
.LASF14:
	.ascii	"complex float\000"
.LASF7:
	.ascii	"int32_t\000"
.LASF11:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"char\000"
.LASF23:
	.ascii	"fract\000"
.LASF22:
	.ascii	"index\000"
.LASF21:
	.ascii	"cosVal\000"
.LASF4:
	.ascii	"short int\000"
.LASF16:
	.ascii	"complex double\000"
.LASF27:
	.ascii	"sinTable_q31\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF24:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF17:
	.ascii	"long double\000"
.LASF2:
	.ascii	"signed char\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
