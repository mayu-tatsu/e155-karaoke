/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 18, 2025

Purpose: 
*/

#ifndef MIC_AUDIO_RECEIVER_H
#define MIC_AUDIO_RECEIVER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void mic_audio_receiver(void);

#endif