/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 3, 2025

Purpose: 
*/

#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define PWM PA6

#define PLAY_MR_BRIGHTSIDE 1
#define PLAY_GOLDEN        2

extern volatile int note_done;

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void music_player(int song);

void pwm_initialization(TIM_TypeDef * TIMx);
void pwm_generation(TIM_TypeDef * TIMx, int frequency);

#endif