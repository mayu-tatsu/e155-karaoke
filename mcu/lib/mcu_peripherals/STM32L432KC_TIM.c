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

void timer_initialization(TIM_TypeDef * TIMx)
{

  // divides the system clock input by a prescaler to generate a new clock signal for the timer's internal counter
  // (PSC[15:0] = PRESCALER_VALUE)
  TIMx -> PSC = 3000; // f_cnt_clk = f_psc_clk / (PSC[15:0] + 1)

  // sets the clock input to be the system clock (as opposed to another timer)
  // (SMS[3:0] = 0000)
  TIMx -> SMCR &= ~((1 << 16) | (1 << 2) | (1 << 1) | (1 << 0));  // disables sl*ve mode
  
  // pushes the register updates
  // (UG = 1)
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers

  // enables the counter
  // (CEN = 1, UIFREMAP = 0)
  TIMx -> CR1 |= (1 << 0); TIMx -> CR1 &= ~(1 << 11); // doesn't allow UIF status bit remapping when counting	

  // resets the counter
  // (CNT[15:0] = 0)
  TIMx -> CNT = 0;  // manually forces CNT to zero
  
}

void delay_secs(TIM_TypeDef * TIMx, uint32_t s){
  for (int i = 0; i < s; i++)
  {
    delay_ms(TIMx, 1000);
  }
}

void delay_millis(TIM_TypeDef * TIMx, uint32_t ms){
  TIMx->ARR = ((80000000/(3000-1))/1000) * ms;// Set timer max count
  TIMx->EGR |= 1;     // Force update
  TIMx->SR &= ~(0x1); // Clear UIF
  TIMx->CNT = 0;      // Reset count

  while(!(TIMx->SR & 1)); // Wait for UIF to go high
}

void delay_ms(TIM_TypeDef * TIMx, int ms)
{

  timer_initialization(TIMx);
  
  // calculates the counter clock frequency when given an 80 MHz system clock as input
  int counter_clock_frequency = 80000000 / (3000 + 1);
  
  // sets the maximum counter value as appropriate
  // (ARR[15:0] = (ms / 1000) * counter_clock_frequency)
  TIMx -> ARR = ms * (counter_clock_frequency / 1000); // converts ms and Hz into an actual counter value

  // pushes the register updates
  // (UG = 1)
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers

  // updates the counter
  // (UIF = 0)
  TIMx -> SR &= ~(1 << 0);  // clears the Update flag

  // resets the counter
  // (CNT[15:0] = 0)
  TIMx -> CNT = 0;  // manually forces CNT to zero

  // waits until the Update flag goes high and signals that the counter has hit the maximum value
  while (!((TIMx -> SR) & 1));
	
}

void delay_micros(TIM_TypeDef * TIMx, uint32_t us){
  TIMx->PSC = (uint32_t) ((80000000/1e6)) - 1;
  TIMx->ARR = us;// Set timer max count
  TIMx->EGR |= 1;     // Force update
  TIMx->SR &= ~(0x1); // Clear UIF
  TIMx->CNT = 0;      // Reset count

  while(!(TIMx->SR & 1)); // Wait for UIF to go high
}