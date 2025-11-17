




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

void frequency_determiner(float32_t input_fft[FFT_LENGTH]);

#endif