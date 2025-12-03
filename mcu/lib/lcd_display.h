 /*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 23, 2025

Purpose: To allow all LCD-related functions to actually be used.
*/

#ifndef LCD_DISPLAY_H
#define LCD_DISPLAY_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define E  PA6
#define RS PB1
#define D0 PA12
#define D1 PA9
#define D2 PA10
#define D3 PB0
#define D4 PB6
#define D5 PA8
#define D6 PA5
#define D7 PB7

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void lcd_display_initialization(void);
void lcd_display_write(uint16_t data);
void display_message(char message[]);
void lcd_display_reset(void);
uint16_t character_converter(char* character);

int inString(char request[], char des[]);

#endif