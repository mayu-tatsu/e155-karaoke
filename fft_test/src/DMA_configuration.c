/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: To configure the DMA peripheral such that it may interface with SPI.
*/

#include "../lib/dma_configuration.h"

// defines global variables
volatile uint32_t fft_calculations_complete;
float32_t next_input_signal[FFT_LENGTH];
float32_t input_signal[FFT_LENGTH];

// enables the DMA peripheral to work with SPI, specifically
void dma_configuration(void)
{

  // enables DMA1
  RCC -> AHB1ENR |= RCC_AHB1ENR_DMA1EN;

  // resets DMA1, Channel 2
  DMA1_Channel2 -> CCR &= ~(0xFFFFFFFF);
  DMA1_Channel2 -> CCR |= (_VAL2FLD(DMA_CCR_PL, 0b10) | _VAL2FLD(DMA_CCR_MINC, 0b1) | _VAL2FLD(DMA_CCR_CIRC, 0b1) | _VAL2FLD(DMA_CCR_DIR, 0b1));

  // sets the DMA source address (which, in this case, should be the SPI data register)
  DMA1_Channel2 -> CMAR = _VAL2FLD(DMA_CMAR_MA, (uint32_t)&(SPI1 -> DR));

  // sets the DMA destination address (which, in this case, should be a global array)
  // TODO: double-check
  DMA1_Channel2 -> CPAR = _VAL2FLD(DMA_CPAR_PA, (uint32_t)&next_input_signal);

  // determines the DMA data transfer length (i.e. the number of samples present)
  // TODO: double-check
  DMA1_Channel2 -> CNDTR |= _VAL2FLD(DMA_CNDTR_NDT, FFT_LENGTH);
  
  // selects Channel 2
  DMA1_CSELR -> CSELR |= _VAL2FLD(DMA_CSELR_C2S, 4);

  // enables the full-transfer interrupt flag
  DMA1_Channel2 -> CCR |= DMA_CCR_TCIE;

  // fully enables DMA1, Channel 2
  DMA1_Channel2 -> CCR |= DMA_CCR_EN;

  // enables the DMA1, Channel 2 interrupt and sets it to be top priority
  NVIC_EnableIRQ(DMA1_Channel2_IRQn);
  NVIC_SetPriority(DMA1_Channel2_IRQn, 0);

}

// handles any transfer-complete interrupts from DMA1, Channel 2
// triggers on completed data transfers from the SPI data register into the next_input_signal buffer
// loads the next audio sample for the FFT to process and subsequently resets the FFT-completed flag
void DMA1_Channel2_IRQHandler(void)
{
  
  // checks to see if the Channel 2 data transfer has actually been completed
  if ((DMA1 -> ISR) & (DMA_ISR_TCIF2))
  {
    // clears the global interrupt flag in Channel 2
    DMA1 -> IFCR = DMA_IFCR_CGIF2;

    // disables DMA1
    DMA1_Channel2 -> CCR &= ~(DMA_CCR_EN);

    // returns immediately if the FFT calculations are still in progress
    if (fft_calculations_complete != 1) {return;}

    // TODO: double buffering?

    // copies the contents now stored in DMA1, Channel 2 into the input_signal buffer
    // note: this is done so that the FFT may subsequently process them
    memcpy(input_signal, next_input_signal, FFT_LENGTH);

    // resets the FFT-completed flag
    fft_calculations_complete = 0;

    // re-enables DMA1
    DMA1_Channel2 -> CCR |= DMA_CCR_EN;
  }

}