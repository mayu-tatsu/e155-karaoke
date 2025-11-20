/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To set up the MCU as desired.
*/

#include "../lib/mcu_configuration.h"
#include "../lib/dma_configuration.h"

// enables all basic MCU peripherals
void mcu_configuration(void)
{

  // configures the system clock
  configureFlash();
  configureClock();

  // enables all GPIO ports
  RCC->AHB2ENR |= (RCC_AHB2ENR_GPIOAEN | RCC_AHB2ENR_GPIOBEN | RCC_AHB2ENR_GPIOCEN);

  // assigns two GPIO pins to act as the Load and Done signals
  pinMode(LOAD, GPIO_OUTPUT);
  pinMode(DONE, GPIO_INPUT);
  
  // TODO: DELETE
  // DEBUGGING CODE
  //pinMode(PA9, GPIO_OUTPUT);
  //pinMode(PA10, GPIO_OUTPUT);
  //digitalWrite(PA9, 0);
  //digitalWrite(PA10, 0);

  // assigns a GPIO pin to act as the Chip Select signal
  pinMode(CS, GPIO_OUTPUT);
  digitalWrite(CS, 1);

  // enables the system configuration controller
  RCC -> APB2ENR |= RCC_APB2ENR_SYSCFGEN;

  // enables global interrupts
  __enable_irq();
  
  // configures the DMA peripheral as desired
  dma_configuration();

  // configures the SPI peripheral
  // most notably, sets the clock phase to one and the clock polarity to zero
  initSPI(1, 0, 0);

}

