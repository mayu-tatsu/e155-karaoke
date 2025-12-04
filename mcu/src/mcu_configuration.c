/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To set up the MCU as desired.
*/

#include "../lib/mcu_configuration.h"
#include "../lib/dma_configuration.h"
#include "../lib/music_player.h"
#include "../lib/singing_grader.h"

// enables all basic MCU peripherals
void mcu_configuration(void)
{

  // configures the system clock
  configureFlash();
  configureClock();

  // enables the system configuration controller
  RCC -> APB2ENR |= RCC_APB2ENR_SYSCFGEN;

  // enables clocks for each timer being used
  RCC -> APB2ENR |= RCC_APB2ENR_TIM15EN;
  RCC -> APB2ENR |= RCC_APB2ENR_TIM16EN;

  // initializes timers for delay and PWM generation, respectively
  initTIM(DELAY_TIM);
  initTIM(PWM_TIM);

  // enables all GPIO ports
  RCC -> AHB2ENR |= (RCC_AHB2ENR_GPIOAEN | RCC_AHB2ENR_GPIOBEN | RCC_AHB2ENR_GPIOCEN);

  // configures song selectors
  pinMode(MR_BRIGHTSIDE_SELECTOR, GPIO_INPUT);
  pinMode(GOLDEN_SELECTOR,        GPIO_INPUT);

  // configures a GPIO pin to flag when a note has finished playing
  pinMode(NOTE_DONE, GPIO_OUTPUT);

  // enables global interrupts
  __enable_irq();

  // 
  error_calculator_configuration();
  
  // configures the DMA peripheral as desired
  dma_configuration();

  // configures the SPI peripheral
  // most notably, sets the clock phase to one and the clock polarity to zero
  initSPI(1, 0, 0);

}