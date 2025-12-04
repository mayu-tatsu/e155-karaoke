/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To allow the MCU configuration functions to actually be used.
*/

#ifndef MCU_CONFIGURATION_H
#define MCU_CONFIGURATION_H

#include "mcu_peripherals/STM32L432KC.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define DELAY_TIM TIM15
#define PWM_TIM   TIM16

#define LOAD PA0
#define DONE PA1
#define CS   PA11

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void mcu_configuration(void);

#endif