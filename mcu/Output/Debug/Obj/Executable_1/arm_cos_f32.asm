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
	.file	"arm_cos_f32.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_cos_f32.c"
	.section	.text.arm_cos_f32,"ax",%progbits
	.align	1
	.global	arm_cos_f32
	.syntax unified
	.thumb
	.thumb_func
	.type	arm_cos_f32, %function
arm_cos_f32:
.LFB134:
	.loc 1 72 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #40
	.cfi_def_cfa_offset 40
	vstr.32	s0, [sp, #4]
	.loc 1 81 10
	vldr.32	s15, [sp, #4]
	vldr.32	s14, .L7
	vmul.f32	s15, s15, s14
	.loc 1 81 6
	vmov.f32	s14, #2.5e-1
	vadd.f32	s15, s15, s14
	vstr.32	s15, [sp, #24]
	.loc 1 84 5
	vldr.32	s15, [sp, #24]
	vcvt.s32.f32	s15, s15
	vmov	r3, s15	@ int
	str	r3, [sp, #32]
	.loc 1 87 6
	vldr.32	s15, [sp, #24]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L2
	.loc 1 89 6
	ldr	r3, [sp, #32]
	subs	r3, r3, #1
	str	r3, [sp, #32]
.L2:
	.loc 1 93 13
	ldr	r3, [sp, #32]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	.loc 1 93 6
	vldr.32	s14, [sp, #24]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [sp, #24]
	.loc 1 96 10
	vldr.32	s15, [sp, #24]
	vldr.32	s14, .L7+4
	vmul.f32	s15, s15, s14
	vstr.32	s15, [sp, #28]
	.loc 1 97 9
	vldr.32	s15, [sp, #28]
	vcvt.u32.f32	s15, s15
	vmov	r3, s15	@ int
	strh	r3, [sp, #38]	@ movhi
	.loc 1 100 6
	ldrh	r3, [sp, #38]
	cmp	r3, #512
	bcc	.L4
	.loc 1 101 11
	movs	r3, #0
	strh	r3, [sp, #38]	@ movhi
	.loc 1 102 12
	vldr.32	s15, [sp, #28]
	vldr.32	s14, .L7+4
	vsub.f32	s15, s15, s14
	vstr.32	s15, [sp, #28]
.L4:
	.loc 1 106 20
	ldrh	r3, [sp, #38]
	vmov	s15, r3	@ int
	vcvt.f32.u32	s15, s15
	.loc 1 106 9
	vldr.32	s14, [sp, #28]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [sp, #20]
	.loc 1 109 19
	ldrh	r3, [sp, #38]
	.loc 1 109 5
	ldr	r2, .L7+8
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r3, [r3]	@ float
	str	r3, [sp, #16]	@ float
	.loc 1 110 25
	ldrh	r3, [sp, #38]
	adds	r3, r3, #1
	.loc 1 110 5
	ldr	r2, .L7+8
	lsls	r3, r3, #2
	add	r3, r3, r2
	ldr	r3, [r3]	@ float
	str	r3, [sp, #12]	@ float
	.loc 1 113 18
	vmov.f32	s14, #1.0e+0
	vldr.32	s15, [sp, #20]
	vsub.f32	s14, s14, s15
	.loc 1 113 27
	vldr.32	s15, [sp, #16]
	vmul.f32	s14, s14, s15
	.loc 1 113 39
	vldr.32	s13, [sp, #20]
	vldr.32	s15, [sp, #12]
	vmul.f32	s15, s13, s15
	.loc 1 113 10
	vadd.f32	s15, s14, s15
	vstr.32	s15, [sp, #8]
	.loc 1 116 10
	ldr	r3, [sp, #8]	@ float
	.loc 1 116 10 is_stmt 0 discriminator 1
	vmov	s15, r3
	.loc 1 117 1 is_stmt 1
	vmov.f32	s0, s15
	add	sp, sp, #40
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	1042479491
	.word	1140850688
	.word	sinTable_f32
	.cfi_endproc
.LFE134:
	.size	arm_cos_f32, .-arm_cos_f32
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio 8.24/include/stdint.h"
	.file 3 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_math_types.h"
	.file 4 "C:/Users/peppe/OneDrive/Desktop/fft_test/v1/lib/arm_math/arm_common_tables.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x181
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
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
	.4byte	.LASF6
	.byte	0x2
	.2byte	0x113
	.byte	0x1c
	.4byte	0x60
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x114
	.byte	0x12
	.4byte	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x3
	.byte	0x8
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
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF17
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x12f
	.byte	0x11
	.4byte	0x90
	.uleb128 0x5
	.4byte	0xba
	.uleb128 0x6
	.4byte	0xc7
	.4byte	0xdd
	.uleb128 0x7
	.4byte	0x37
	.2byte	0x200
	.byte	0
	.uleb128 0x5
	.4byte	0xcc
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1ea
	.byte	0x1c
	.4byte	0xdd
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0x46
	.byte	0xb
	.4byte	0xba
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x47
	.byte	0xd
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x49
	.byte	0xd
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x49
	.byte	0x15
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.ascii	"in\000"
	.byte	0x1
	.byte	0x49
	.byte	0x1c
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x4a
	.byte	0xc
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xc
	.ascii	"a\000"
	.byte	0x1
	.byte	0x4b
	.byte	0xd
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"b\000"
	.byte	0x1
	.byte	0x4b
	.byte	0x10
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.ascii	"n\000"
	.byte	0x1
	.byte	0x4c
	.byte	0xb
	.4byte	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0x4d
	.byte	0xd
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.4byte	0x185
	.4byte	0xef
	.ascii	"arm_cos_f32\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x150
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x185
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
	.4byte	0x74
	.ascii	"long int\000"
	.4byte	0x67
	.ascii	"int32_t\000"
	.4byte	0x7b
	.ascii	"long unsigned int\000"
	.4byte	0x82
	.ascii	"long long int\000"
	.4byte	0x89
	.ascii	"long long unsigned int\000"
	.4byte	0x90
	.ascii	"float\000"
	.4byte	0x97
	.ascii	"complex float\000"
	.4byte	0x9e
	.ascii	"double\000"
	.4byte	0xa5
	.ascii	"complex double\000"
	.4byte	0xac
	.ascii	"long double\000"
	.4byte	0xb3
	.ascii	"complex long double\000"
	.4byte	0xba
	.ascii	"float32_t\000"
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
.LASF8:
	.ascii	"long int\000"
.LASF25:
	.ascii	"C:\\\\Users\\\\peppe\\\\OneDrive\\\\Desktop\\\\fft_"
	.ascii	"test\\\\v1\000"
.LASF14:
	.ascii	"double\000"
.LASF22:
	.ascii	"findex\000"
.LASF12:
	.ascii	"float\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF27:
	.ascii	"arm_cos_f32\000"
.LASF17:
	.ascii	"complex long double\000"
.LASF19:
	.ascii	"cosVal\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF26:
	.ascii	"sinTable_f32\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"complex float\000"
.LASF7:
	.ascii	"int32_t\000"
.LASF10:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"char\000"
.LASF20:
	.ascii	"fract\000"
.LASF21:
	.ascii	"index\000"
.LASF18:
	.ascii	"float32_t\000"
.LASF4:
	.ascii	"short int\000"
.LASF15:
	.ascii	"complex double\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF24:
	.ascii	"C:\\Users\\peppe\\OneDrive\\Desktop\\fft_test\\v1\\"
	.ascii	"lib\\arm_math\\dsp_source\\FastMathFunctions\\arm_c"
	.ascii	"os_f32.c\000"
.LASF23:
	.ascii	"GNU C99 14.2.1 20241119 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mabi=aapcs -mfpu=fpv4-sp-d16 -mthumb -munaligned-"
	.ascii	"access -mtp=soft -mfp16-format=ieee -gdwarf-4 -g3 -"
	.ascii	"gpubnames -fomit-frame-pointer -ffunction-sections "
	.ascii	"-fdata-sections -fshort-enums -fno-common\000"
.LASF16:
	.ascii	"long double\000"
.LASF2:
	.ascii	"signed char\000"
	.ident	"GCC: (based on arm-14.2.Rel1 source release) 14.2.1 20241119"
