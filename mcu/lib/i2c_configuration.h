/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 22, 2025

Purpose: To allow the LCD configuration functions to actually be used.
*/

#ifndef I2C_CONFIGURATION_H
#define I2C_CONFIGURATION_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void i2c_configuration(void);
void i2c_write(char address, uint32_t message);

#endif