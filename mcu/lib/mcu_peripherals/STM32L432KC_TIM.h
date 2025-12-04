// STM32F401RE_TIM.h
// Header for TIM functions

#ifndef STM32L4_TIM_H
#define STM32L4_TIM_H

#include <stdint.h> // Include stdint header
#include "STM32L432KC_GPIO.h"

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
///////////////////////////////////////////////////////////////////////////////

void initTIM(TIM_TypeDef * TIMx);
void timer_initialization(TIM_TypeDef * TIMx);
void delay_secs(TIM_TypeDef * TIMx, uint32_t s);
void delay_millis(TIM_TypeDef * TIMx, uint32_t ms);
void delay_ms(TIM_TypeDef * TIMx, int ms);
void delay_micros(TIM_TypeDef * TIMx, uint32_t us);

#endif