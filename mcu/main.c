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
#include "lib/lcd_display.h"
#include "lib/songs.h"


#define MAX_16BIT_MAGNITUDE 32768.0f

// 
int main(void)
{

  // sets up the MCU with all desired functionalities
  mcu_configuration();

  
  // instantiates a variable to store the dominant frequency of a given audio input
  float32_t note_frequency;

  /*

  // TODO: DELETE
  // TEST CODE
  // EXAMPLE MESSAGE
  char* message[] = {"fuck ", "uPs ", ":')"};

  // initializes the LCD display so that it is ready to use
  lcd_display_initialization();

  // TODO: DELETE
  // TEST CODE
  // WRITES EXAMPLE MESSAGE
  for (int i = 0; i < (sizeof(mr_brightside_lyrics) / sizeof(mr_brightside_lyrics[0])); i++)
  {
    display_message(mr_brightside_lyrics[i]);
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();
  }
  //display_message("hello world!");
  
  while (1) {}
  */

  
  // debug statements for proper config
  //printf("SPI1 CR1: %lx\n", SPI1->CR1);   // SPI looks good!
  //printf("SPI1 CR2: %lx\n", SPI1->CR2);
  //printf("SPI1 SR: %lx\n", SPI1->SR);

  //printf("GPIOB MODER: %lx\n", GPIOB->MODER);
  //printf("GPIOB PUPDR: %lx\n", GPIOB->PUPDR);
  //printf("GPIOB OTYPER: %lx\n", GPIOB->OTYPER);
  //printf("GPIOB AFR[0]: %lx\n", GPIOB->AFR[0]);


  fft_calculations_complete = 1;  // needs to start as 1 for dma interrupt to occur!!!
  
  //int16_t test_val = 1010110110000011;
  //printf("%b\n", test_val);
  //printf("%f\n", (float32_t)test_val);


  while (1)
  {

    // debugging
    if (SPI1->SR & SPI_SR_OVR) {
        printf("     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Overrun error!!!!!!!!!!!!!!!!!!\n");
        // Clear overrun by reading DR then SR
        volatile uint16_t dummy = SPI1->DR;
        volatile uint32_t dummy2 = SPI1->SR;
    }


    // TODO: DELETE
    // TEST CODE
    // SIMULATED INPUT SINE WAVE 
    //float32_t input_signal[FFT_LENGTH];
    //float32_t frequency = 440.0;
    //float32_t note_frequency_test;
    //for (int i = 0; i < FFT_LENGTH; i++)
    //{
    //  input_signal[i] =  arm_sin_f32(2 * PI * frequency * i / SAMPLING_RATE);
    //}
    //note_frequency_test = frequency_determiner(input_signal);       // (input_signal);
    //printf("test note frequency: %f\n", note_frequency_test);
  


    // printf("%x\n", SPI1->DR);
     
    //for (int i = 0; i < FFT_LENGTH; i++)
    //{
    //  if (i == 0) {printf("start:");}
    //  // digitalWrite(CS, 1); input_signal[i] = spiSendReceive(0x0000); digitalWrite(CS, 0);
    //  printf("%x, ", input_signal[i]);
    //  if (i == FFT_LENGTH - 1) {printf("\n");}
    //  // printf("%d\n", i);
    //}


    // checks to see whether or not FFT calculations have already occurred
    // if not, then proceeds to do so
    if (fft_calculations_complete != 1)
    {
      
      // debugging print
      // printf("Received %d samples!\n", FFT_LENGTH);
      // printf("Total completed buffers: %lu\n", total_dma_transfers);


      for (int i = 0; i < FFT_LENGTH; i++) {


        // if (i == 0) {printf("\nstart: ");}
        // printf("%x, ", (uint16_t)pcm_dma_signal[i]);      // currently outputting as ffffcccc, possible solution to jus take DR bits only.
        // if (i == FFT_LENGTH - 1) {printf("\n\n");}

        float_buffer[i] = (float32_t)pcm_dma_signal[i] / MAX_16BIT_MAGNITUDE;
        printf("float_buffer: %f\n", float_buffer[i]);

        
      }

      // determines the dominant frequency of the detected audio
      note_frequency = frequency_determiner(float_buffer);       // (input_signal);
      // printf("note frequency: %f\n", note_frequency);

      // raises the FFT-completed flag
      fft_calculations_complete = 1;
      // printf("finished!\n\n\n");
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
    //printf("Note frequency: %f\n", note_frequency);
    //printf(note); printf("\n");
  }
    // TODO: DELETE
    // DEBUGGING CODE
    //printf("DMA: %d, %d, %d, %d", dma_test_receive[0], dma_test_receive[1], dma_test_receive[2], dma_test_receive[3]);
    //printf("%d, %d, %d, %d", dma_test_receive[4], dma_test_receive[5], dma_test_receive[6], dma_test_receive[7]);
    //printf("%d, %d, %d, %d", dma_test_receive[8], dma_test_receive[9], dma_test_receive[10], dma_test_receive[11]);
    //printf("%d, %d, %d, %d\n", dma_test_receive[12], dma_test_receive[13], dma_test_receive[14], dma_test_receive[15]);
    //printf("SPI DR: %x\n", SPI1->DR);
    //printf("Note frequency: %f\n", note_frequency);
    //printf(note); printf("\n");
  
}