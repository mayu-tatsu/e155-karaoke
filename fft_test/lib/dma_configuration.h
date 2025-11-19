/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: To allow the DMA configuration function to actually be used.
*/

#ifndef DMA_CONFIGURATION_H
#define DMA_CONFIGURATION_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

extern float32_t next_input_signal[FFT_LENGTH];
extern float32_t input_signal[FFT_LENGTH];

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void dma_configuration(void);
void DMA1_Channel2_IRQHandler(void);

#endif