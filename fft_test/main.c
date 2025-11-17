/*
Name:  Quinn Miyamoto
Email: qmiyamoto@g.hmc.edu
Date:  November 16, 2025

Purpose: 
*/

#include "lib/mcu_peripherals/STM32L432KC.h"
#include "lib/arm_math/arm_math.h"
#include "lib/frequency_determiner.h"

// 
int main(void)
{

  configureFlash();
  configureClock();




  float32_t input_fft[FFT_LENGTH];
  float32_t frequency = 500.0;


  // input sine wave test
  for(int i = 0; i < FFT_LENGTH; i++)
  {
    input_fft[i] =  arm_sin_f32(2 * PI * frequency * i / SAMPLING_RATE);
  }



  //frequency_determiner(input_fft);

  while(1);

}