 /*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 23, 2025

Purpose: 
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
#define D4 PB3 // TODO: CHANGE!!
#define D5 PA8
#define D6 PA5
#define D7 PB7

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void lcd_display_initialization(void);
void lcd_display_write(uint16_t data);
void display_message(char* message[]);
uint16_t character_converter(char* character);

int inString(char request[], char des[]);

void lcd_init(void);
void lcd_write_bus(uint8_t data);
void lcd_cmd_raw(uint8_t cmd);
void lcd_data(uint8_t data);
void lcd_set_cursor(uint8_t line, uint8_t col);
void lcd_test(void);

#endif