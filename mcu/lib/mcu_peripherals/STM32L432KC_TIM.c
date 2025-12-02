// STM32F401RE_TIM.c
// TIM functions

#include "STM32L432KC_TIM.h"
#include "STM32L432KC_RCC.h"

void initTIM(TIM_TypeDef * TIMx){
  // Set prescaler to give 1 ms time base
  uint32_t psc_div = 3000; //(uint32_t) ((SystemCoreClock/1e3));
  // Set prescaler division factor
  TIMx->PSC = (psc_div - 1);
  // sets the clock input to be the system clock (as opposed to another timer)
  // (SMS[3:0] = 0000)
  TIMx -> SMCR &= ~((1 << 16) | (1 << 2) | (1 << 1) | (1 << 0)); // disables sl*ve mode
  // Generate an update event to update prescaler value
  TIMx->EGR |= 1;
  // Enable counter
  TIMx -> CR1 &= ~(1 << 11);
  TIMx->CR1 |= 1; // Set CEN = 1
}

void delay_millis(TIM_TypeDef * TIMx, uint32_t ms){
  TIMx->ARR = ((SystemCoreClock/(3000-1))/1000) * ms;// Set timer max count
  TIMx->EGR |= 1;     // Force update
  TIMx->SR &= ~(0x1); // Clear UIF
  TIMx->CNT = 0;      // Reset count

  while(!(TIMx->SR & 1)); // Wait for UIF to go high
}

void delay_micros(TIM_TypeDef * TIMx, uint32_t us){
  TIMx->PSC = (uint32_t) ((SystemCoreClock/1e6)) - 1;
  TIMx->ARR = us;// Set timer max count
  TIMx->EGR |= 1;     // Force update
  TIMx->SR &= ~(0x1); // Clear UIF
  TIMx->CNT = 0;      // Reset count

  while(!(TIMx->SR & 1)); // Wait for UIF to go high
}