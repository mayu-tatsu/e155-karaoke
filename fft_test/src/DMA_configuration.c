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


uint32_t dma_test_send[4] = {0, 1, 2, 3};
uint32_t dma_test_receive[32];

// enables the DMA peripheral to work with SPI, specifically
void dma_configuration(void)
{


RCC -> AHB1ENR |= RCC_AHB1ENR_DMA1EN;
 DMA1_Channel2->CCR &= ~DMA_CCR_EN;           // ensure disabled
 SPI1->CR2 |= SPI_CR2_RXDMAEN;
 SPI1->DR = 24;
  DMA1_Channel2->CCR  &= ~(0xFFFFFFFF);
    DMA1_Channel2->CCR  |= (_VAL2FLD(DMA_CCR_PL,0b10) |   // Priority is set to medium
                            _VAL2FLD(DMA_CCR_MINC, 0b1) | // memory address updates after every reception
                            _VAL2FLD(DMA_CCR_CIRC, 0b1) | // DMA NBYTE count will update to declared value
                            _VAL2FLD(DMA_CCR_DIR, 0b0) |  // **FIXED: Peripheral-to-Memory (0b0) for RX**
    _VAL2FLD(DMA_CCR_PSIZE, 0b10) |  // **FIXED: Peripheral size = 32-bit (Word)**
    _VAL2FLD(DMA_CCR_MSIZE, 0b10)    // **FIXED: Memory size = 32-bit (Word)**
                            );
    
    // Select the 1st option for mux to channel 2
    DMA1_CSELR->CSELR |= _VAL2FLD(DMA_CSELR_C2S, 0b0001); // SPI1_RX

  // Enable interrupt bit for channel 2
  DMA1_Channel2->CCR |= _VAL2FLD(DMA_CCR_TCIE, 1);

  // Enable the interrupt for DMA1 Channel2
  NVIC_EnableIRQ(DMA1_Channel2_IRQn);
  // DEST: Address of the data from peripheral
    DMA1_Channel2->CPAR = _VAL2FLD(DMA_CPAR_PA, (uint32_t) &(SPI1 -> DR));

  // SOURCE.: Address of the current buffer in use in memory
  DMA1_Channel2->CMAR = _VAL2FLD(DMA_CMAR_MA, (uint32_t)&dma_test_receive);

  // Set DMA data transfer length (# of samples)
  DMA1_Channel2->CNDTR |= _VAL2FLD(
      DMA_CNDTR_NDT,
      32); // # pix per row * pixel width * # rows : 640 * 2 * 3 = 3840

  // Enable DMA1 channel.
  DMA1_Channel2->CCR |= DMA_CCR_EN;




  //// enables DMA1
  //RCC -> AHB1ENR |= RCC_AHB1ENR_DMA1EN;

  //// resets DMA1, Channel 2
  //DMA1_Channel2 -> CCR &= ~(0xFFFFFFFF);
  //DMA1_Channel2 -> CCR |= (_VAL2FLD(DMA_CCR_PL, 0b10) | _VAL2FLD(DMA_CCR_MINC, 0b1) | _VAL2FLD(DMA_CCR_CIRC, 0b1) | _VAL2FLD(DMA_CCR_DIR, 0b1));

  //// TODO: consider streams?

  //// sets the DMA source address (which, in this case, should be the SPI data register)
  ////DMA1_Channel2 -> CMAR = _VAL2FLD(DMA_CMAR_MA, (uint32_t)&(SPI1 -> DR));
  //DMA1_Channel2 -> CMAR = _VAL2FLD(DMA_CMAR_MA, (uint32_t)&dma_test_send);

  //// sets the DMA destination address (which, in this case, should be a global array)
  //// TODO: double-check
  ////DMA1_Channel2 -> CPAR = _VAL2FLD(DMA_CPAR_PA, (uint32_t)&next_input_signal);
  //DMA1_Channel2 -> CPAR = _VAL2FLD(DMA_CPAR_PA, (uint32_t)&dma_test_receive);

  //// determines the DMA data transfer length (i.e. the number of samples present)
  //// TODO: double-check
  //DMA1_Channel2 -> CNDTR |= _VAL2FLD(DMA_CNDTR_NDT, 4);
  
  //// selects Channel 2
  //DMA1_CSELR -> CSELR |= _VAL2FLD(DMA_CSELR_C2S, 4);

  //// enables the full-transfer interrupt flag
  //DMA1_Channel2 -> CCR |= DMA_CCR_TCIE;

  //// fully enables DMA1, Channel 2
  //DMA1_Channel2 -> CCR |= DMA_CCR_EN;

  //// enables the DMA1, Channel 2 interrupt and sets it to be top priority
  //NVIC_EnableIRQ(DMA1_Channel2_IRQn);
  //NVIC_SetPriority(DMA1_Channel2_IRQn, 0);

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

    
    printf("Interrupt activated 1!!\n");


    // disables DMA1
    DMA1_Channel2 -> CCR &= ~(DMA_CCR_EN);

    // returns immediately if the FFT calculations are still in progress
    if (fft_calculations_complete != 1) {return;}


    printf("Interrupt activated 2!!\n");



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