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

// 
int main(void)
{

  // sets up the MCU with all basic functionalities
  mcu_configuration();
  dma_configuration();

  // TODO: DELETE
  // TEST CODE
  // SIMULATED INPUT SINE WAVE 
  float32_t input_signal[FFT_LENGTH];
  float32_t frequency = 500.0;
  for(int i = 0; i < FFT_LENGTH; i++)
  {
    input_signal[i] =  arm_sin_f32(2 * PI * frequency * i / SAMPLING_RATE);
  }

  // determines the frequency of the detected audio
  float32_t note_frequency;
  note_frequency = frequency_determiner(input_signal);

  // TODO: DELETE
  // DEBUGGING CODE
  //printf("%f", note_frequency);

}