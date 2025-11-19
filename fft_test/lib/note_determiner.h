/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 18, 2025

Purpose: To allow the note determining function to actually be used.
*/

#ifndef NOTE_DETERMINER_H
#define NOTE_DETERMINER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define FREQUENCY_ERROR_BOUND 20

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

const char* note_determiner(float32_t note_frequency);

#endif