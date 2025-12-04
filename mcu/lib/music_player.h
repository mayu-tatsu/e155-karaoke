/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 3, 2025

Purpose: To actually allow the music-playing functions to be used.
*/

#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include "mcu_peripherals/STM32L432KC.h"
#include "arm_math/arm_math.h"
#include "frequency_determiner.h"
#include "stdio.h"
#include <stdint.h>
#include <stm32l432xx.h>

#define PWM                    PA6
#define MR_BRIGHTSIDE_SELECTOR PA4
#define GOLDEN_SELECTOR        PA7
#define NOTE_DONE              PA0

#define PLAY_MR_BRIGHTSIDE 0
#define PLAY_GOLDEN        1
#define PLAY_TEST          5

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void music_player(int song);

void pwm_initialization(TIM_TypeDef * TIMx);
void pwm_generation(TIM_TypeDef * TIMx, int frequency);

#endif