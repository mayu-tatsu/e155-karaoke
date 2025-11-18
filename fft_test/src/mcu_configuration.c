/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To set up the MCU as desired.
*/

#include "../lib/mcu_configuration.h"

// enables all basic MCU peripherals
void mcu_configuration(void)
{

  // 
  configureFlash();
  configureClock();

  // 
  RCC->AHB2ENR |= (RCC_AHB2ENR_GPIOAEN | RCC_AHB2ENR_GPIOBEN | RCC_AHB2ENR_GPIOCEN);

  // "clock divide" = master clock frequency / desired baud rate
  // the phase for the SPI clock is 1 and the polarity is 0
  initSPI(1, 0, 0);

  // Load and done pins
  pinMode(PA5, GPIO_OUTPUT);  // LOAD
  pinMode(PA6, GPIO_INPUT);   // DONE
  
  // debugging LEDs
  pinMode(PA9, GPIO_OUTPUT);
  pinMode(PA10, GPIO_OUTPUT);
  digitalWrite(PA9, 0);
  digitalWrite(PA10, 0);

  // Artificial chip select signal to allow 8-bit CE-based SPI decoding on the logic analyzers.
  pinMode(PA11, GPIO_OUTPUT);
  digitalWrite(PA11, 1);

}

