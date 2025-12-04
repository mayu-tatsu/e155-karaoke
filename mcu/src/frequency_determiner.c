/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To determine the dominant frequency of a given signal.
*/

#include "../lib/frequency_determiner.h"

// performs FFT calculations using the ARM math library on a given input signal
float32_t frequency_determiner(float32_t input_signal[])
{

  // initializes variables for input signal processing
  float32_t normalized_signal[FFT_LENGTH];
  float32_t hanning_window[FFT_LENGTH];
  float32_t windowed_input[FFT_LENGTH];

  // computes the standard deviation of the input signal
  float32_t input_signal_standard_deviation;
  arm_std_f32(input_signal, FFT_LENGTH, &input_signal_standard_deviation);

  // computes the mean of the input signal
  float32_t input_signal_mean;
  arm_mean_f32(input_signal, FFT_LENGTH, &input_signal_mean);

  // increments through each of the input signal samples
  for (int i = 0; i < FFT_LENGTH; i++)
  {
    // performs Z-Score normalization on the input signal to maintain amplitude measurement accuracy
    normalized_signal[i] = ((input_signal[i] - input_signal_mean) / input_signal_standard_deviation);

    // generates the Hanning function
    hanning_window[i] = pow(sinf(PI * i / (FFT_LENGTH - 1)), 2);

    // applies the Hanning window to the normalized input in order to reduce spectral leakage
    windowed_input[i] = (hanning_window[i] * normalized_signal[i]);
  }

  // defines a real FFT instance with the ARM library data type
  arm_rfft_fast_instance_f32 fft_instance;

  // initializes the FFT instance by specifying its length
  arm_rfft_fast_init_f32(&fft_instance, FFT_LENGTH);
  
  // applies the FFT to the windowed signal, such that we get an output array with real terms in even positions and complex terms in odd ones
  // note: the last argument, zero, signifies that this is not an inverse FFT
  float32_t output_fft[FFT_LENGTH];
  arm_rfft_fast_f32(&fft_instance, windowed_input, output_fft, 0);

  // takes the magnitude of the resulting frequencies
  float32_t output_fft_magnitude[FFT_LENGTH / 2];
  arm_cmplx_mag_f32(output_fft, output_fft_magnitude, (FFT_LENGTH / 2));

  // finds the dominant frequency
  float32_t maximum_magnitude;
  uint32_t  maximum_magnitude_index;
  arm_max_f32(output_fft_magnitude, (FFT_LENGTH / 2), &maximum_magnitude, &maximum_magnitude_index);

  // returns the dominant frequency
  return ((float32_t)maximum_magnitude_index * SAMPLING_RATE / FFT_LENGTH);

  // TODO: DELETE
  // DEBUGGING CODE
  //for(int i = 0; i < FFT_LENGTH / 2; i++)
  //{
  //  //printf("%f\n", input_signal[i]);
  //  printf("frequency %f: %f \n", ((float32_t)(i * SAMPLING_RATE) / FFT_LENGTH), output_fft_magnitude[i]);
  //}
  //while(1);
  
}