/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: 
*/

#include "../lib/dma_configuration.h"



#define MYSTERY_ARRAY

#ifndef MYSTERY_ARRAY
  #define CHAR_ARRAY_SIZE 20
  const char CHAR_ARRAY[CHAR_ARRAY_SIZE] = "This is a DMA Test!\n";
  #define CHAR_PER_SECOND 20
#else
  #define CHAR_ARRAY_SIZE 232
  const char CHAR_ARRAY[CHAR_ARRAY_SIZE] = "\n  __  __  _                    ____        _  \n |  \\/  |(_)  ___  _ __  ___  |  _ \\  ___ | |\n | |\\/| || | / __|| '__|/ _ \\ | |_) |/ __|| |\n | |  | || || (__ | |  | (_) ||  __/ \\__ \\|_|\n |_|  |_||_| \\___||_|   \\___/ |_|    |___/(_)\n";
  #define CHAR_PER_SECOND 100
#endif



// 
void dma_configuration(void)
{
  // TODO: DMA
  // 
  
  
  ////////////////////////////////
  // DMA configuration
  ////////////////////////////////

  // Configure DMA1 to excecute a transaction based on an event from TIM2 update event
  // So, find TIM2_UP which gets muxed into channel 2 of DMA1
  // Need to set C2S[3:0] to 0b0100 to choose TIM2_UP as the DMA trigger

  // DMA1 configuration (channel 2 / selection 4).
  // SxCR register:
  // - Memory-to-peripheral
  // - Circular mode enabled.
  // - Increment memory ptr, don't increment periph ptr.
  // - 8-bit data size for both source and destination.
  // - High priority (2/3).

  RCC -> AHB1ENR |= (RCC_AHB1ENR_DMA1EN);

  // Reset DMA1 Channel 2
  // SPI1_RX?????
  // 0001 CxS[3:0]
  DMA1_Channel2 -> CCR &= ~(0xFFFFFFFF);
  DMA1_Channel2 -> CCR |= (_VAL2FLD(DMA_CCR_PL, 0b10) | _VAL2FLD(DMA_CCR_MINC, 0b1) | _VAL2FLD(DMA_CCR_CIRC, 0b1) | _VAL2FLD(DMA_CCR_DIR, 0b1));
  
  // Set DMA source and destination addresses.
  // Source: Address of the character array buffer in memory.
  DMA1_Channel2 -> CMAR = _VAL2FLD(DMA_CMAR_MA, (uint32_t)&CHAR_ARRAY);

  // Dest.: USART data register
  DMA1_Channel2 -> CPAR = _VAL2FLD(DMA_CPAR_PA, (uint32_t)&(SPI1 -> DR));

  // Set DMA data transfer length (# of samples).
  DMA1_Channel2 -> CNDTR |= _VAL2FLD(DMA_CNDTR_NDT, CHAR_ARRAY_SIZE);
    
  // Select 4th option for mux to channel 2
  DMA1_CSELR -> CSELR |= _VAL2FLD(DMA_CSELR_C2S, 4);

  // Enable DMA1 channel.
  DMA1_Channel2 -> CCR |= DMA_CCR_EN;

  ////////////////////////////////
  // TIM2 Configuration
  ////////////////////////////////
 
  //// Set prescaler and autoreload to issue DMA request at 10 Hz
  //TIM->PSC  =  0x0000;
  //TIM->ARR  =  SystemCoreClock/CHAR_PER_SECOND;
    
  //// Enable trigger output on timer update events.
  //TIM->CR2 |= (TIM_CR2_CCDS); // Set DMA request when update event occurs
    
  //// Setup DMA request on update event for timer
  //TIM->DIER |= (TIM_DIER_UDE);

  //// Start the timer.
  //TIM->CR1 |=  (TIM_CR1_CEN);
}