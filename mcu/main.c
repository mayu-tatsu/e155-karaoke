/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: 
*/

#include "lib/mcu_peripherals/STM32L432KC.h"
#include "lib/arm_math/arm_math.h"
#include "lib/mcu_configuration.h"
#include "lib/dma_configuration.h"
#include "lib/frequency_determiner.h"
#include "lib/note_determiner.h"

// 
int main(void)
{

  // sets up the MCU with all desired functionalities
  mcu_configuration();

  // TODO: DELETE
  // TEST CODE
  // SIMULATED INPUT SINE WAVE 
  //float32_t input_signal[FFT_LENGTH];
  //float32_t frequency = 500.0;
  //for (int i = 0; i < FFT_LENGTH; i++)
  //{
  //  input_signal[i] =  arm_sin_f32(2 * PI * frequency * i / SAMPLING_RATE);
  //}
  
  // instantiates a variable to store the dominant frequency of a given audio input
  float32_t note_frequency;

  // runs continuously
  while (1)
  {
    // 
    for (int i = 0; i < FFT_LENGTH; i++)
    {
      if (i == 0) {printf("start:");}
      digitalWrite(CS, 1); input_signal[i] = spiSendReceive(0x0000); digitalWrite(CS, 0);
      printf("%x", input_signal[i]);
      //printf("%d\n", i);
    }

    // checks to see whether or not FFT calculations have already occurred
    // if not, then proceeds to do so
    if (fft_calculations_complete != 1)
    {
      // determines the dominant frequency of the detected audio
      note_frequency = frequency_determiner(input_signal);
      
      // raises the FFT-completed flag
      fft_calculations_complete = 1;
    }

    // determines what the actual note is
    const char* note = note_determiner(note_frequency);

    // TODO: DELETE
    // DEBUGGING CODE
    //printf("DMA: %d, %d, %d, %d", dma_test_receive[0], dma_test_receive[1], dma_test_receive[2], dma_test_receive[3]);
    //printf("%d, %d, %d, %d", dma_test_receive[4], dma_test_receive[5], dma_test_receive[6], dma_test_receive[7]);
    //printf("%d, %d, %d, %d", dma_test_receive[8], dma_test_receive[9], dma_test_receive[10], dma_test_receive[11]);
    //printf("%d, %d, %d, %d\n", dma_test_receive[12], dma_test_receive[13], dma_test_receive[14], dma_test_receive[15]);
    //printf("SPI DR: %x\n", SPI1->DR);
    printf("Note frequency: %f\n", note_frequency);
    printf(note); printf("\n");
  }
  
}