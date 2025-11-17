/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: 
*/

#ifndef FREQUENCY_DETERMINER_H
#define FREQUENCY_DETERMINER_H

#include "../lib/mcu_peripherals/STM32L432KC.h"
#include "../lib/arm_math/arm_math.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define FFT_LENGTH    256
#define SAMPLING_RATE 16000

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

float32_t frequency_determiner(float32_t input_fft[]);

#endif