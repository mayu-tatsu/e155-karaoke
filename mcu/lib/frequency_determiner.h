/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To allow the frequency determining function to actually be used.
*/

#ifndef FREQUENCY_DETERMINER_H
#define FREQUENCY_DETERMINER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define CIC_GAIN      33176
#define FFT_LENGTH    256
#define SAMPLING_RATE 16000

extern volatile uint32_t fft_calculations_complete;

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

float32_t frequency_determiner(float32_t input_signal[]);

#endif