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
    printf("%f\n", note_frequency);
    printf(note); printf("\n");
    
    // TODO: DELETE
    // MIDPOINT CHECKOFF DEMO CODE
    pinMode(PA9, GPIO_OUTPUT); pinMode(PA10, GPIO_OUTPUT);
    if      (strcmp(note, "A4") == 0) {digitalWrite(PA9,  1); digitalWrite(PA10, 0);}
    else if (strcmp(note, "F5") == 0) {digitalWrite(PA10, 1); digitalWrite(PA9,  0);}
    else                              {digitalWrite(PA9,  0); digitalWrite(PA10, 0);}
  }
  
}