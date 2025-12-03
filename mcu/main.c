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

  // 
  //while (1) {char* string = "!"; uint16_t number = character_converter(string); printf("%x\n", number); printf("%d\n", inString(string, "!"));}
  //char* message_test = "wtf ahh"; int message_length = strlen(message_test);
  //char* message = "You";
  //for (int i = 0; i < message_length; i++)
  //{
  //  char message_test_i = message_test[i];
  //  printf("%c\n", message_test[i]);
  //  printf("%x\n", character_converter(&message_test[i]));
  //}
  //while(1);

  //printf("test: %x\n", character_converter(&message_test[2]));
  //printf("test 2: %d\n", inString(&message_test[2], "9"));
  //printf("test 3: %d\n", inString(&message_test[2], "^"));
  //printf("test 4: %d\n", inString(&message_test[2], "%"));
  //printf("test 5: %d\n", inString(&message_test[2], &message_test[5]));
  //printf("test 6: %x\n", strchr(&message_test[2], (char)&message_test[5]));



  // char* character = "^";
  // printf("%d\n", inString(character, "9"));
  // printf("%x\n", character_converter(character));
  //while(1) {}

  // 
  //lcd_display_initialization();
  //display_message(&message);
  //lcd_test();

  // runs continuously
  // while (1) {}

  
  // uncomment this later: mayu
  while (1)
  {

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

      // MAYU: snippet
      // frequency_determiner(float_buffer);

      // float32_t float_buffer[FFT_LENGTH];
      for (int i = 0; i < FFT_LENGTH; i++) {


        if (i == 0) {printf("start: ");}
        printf("%x, ", pcm_dma_signal[i]);
        if (i == FFT_LENGTH - 1) {printf("\n");}

        float_buffer[i] = (float32_t)pcm_dma_signal[i];

        
      }

      // determines the dominant frequency of the detected audio
      note_frequency = frequency_determiner(float_buffer);       // (input_signal);
      // printf("note frequency: %d\n", note_frequency);

      // raises the FFT-completed flag
      fft_calculations_complete = 1;
      printf("finished!\n");
    }




    // 
    
    



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
  
}