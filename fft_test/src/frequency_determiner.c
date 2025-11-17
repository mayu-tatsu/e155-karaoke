/*
Name:  Quinn Miyamoto
Email: qmiyamoto@g.hmc.edu
Date:  November 16, 2025

Purpose: 
*/

#include "../lib/frequency_determiner.h"

// 
void frequency_determiner(float32_t input_fft[FFT_LENGTH])
{

  // buffer
  float32_t output_fft[FFT_LENGTH];
  float32_t output_fft_magnitude[FFT_LENGTH / 2];

  // Define an FFT instance using the data type:
  arm_rfft_fast_instance_f32 fft_instance;

  // Initialize the instance by specifying the length:
  arm_rfft_fast_init_f32(&fft_instance, FFT_LENGTH);

  // Apply the FFT using the following function:
  // Arguments of this function are the instance pointer, input array, and output array
  // The last argument (0) signifies that it is not an inverse FFT
  // Once, you apply this function, the output function holds the complex numbers including the phase information (even positions are real terms while odd positions are imaginary terms)
  arm_rfft_fast_f32(&fft_instance, input_fft, output_fft, 0);

  // However, in most of the cases, we want to obtain the absolute values of the frequencies; fortunately, there is another function to obtain it:
  // Once you apply this function, output_fft_mag holds the absolute values
  arm_cmplx_mag_f32(output_fft, output_fft_magnitude, FFT_LENGTH / 2);



  for(int i = 0; i < FFT_LENGTH / 2; i++)
  {
    printf("frequency %f: %f \n", ((float32_t)(i * SAMPLING_RATE) / FFT_LENGTH), output_fft_magnitude);
  }

}