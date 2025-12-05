/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 4, 2025

Purpose: To allow the error-calculation functions to actually be used.
*/

#ifndef SINGING_GRADER_H
#define SINGING_GRADER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define MAX_16BIT_MAGNITUDE 32768.0f

extern volatile uint32_t  expected_frequency;
extern volatile float64_t singing_error;
extern volatile float     interrupt_triggered_counter;
extern volatile int       enable_test;

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void error_calculator_configuration(void);
void EXTI0_IRQHandler(void);

void singing_grader(void);

#endif