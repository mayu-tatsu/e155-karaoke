/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 4, 2025

Purpose: To keep a running total of the user's errors when singing and grade them accordingly.
*/

#include "../lib/singing_grader.h"
#include "../lib/mcu_configuration.h"
#include "../lib/dma_configuration.h"
#include "../lib/frequency_determiner.h"
#include "../lib/lcd_display.h"
#include "../lib/music_player.h"

// defines global variables
volatile uint32_t  expected_frequency;
volatile float32_t singing_error;
volatile float     interrupt_triggered_counter;
volatile int       enable_test;

// initializes the interrupt to be used for error calculations
void error_calculator_configuration(void)
{

  // selects desired GPIO pin as a source input for an external interrupt
  SYSCFG -> EXTICR[0] |= _VAL2FLD(SYSCFG_EXTICR1_EXTI0, 0b000);
  
  // unmasks interrupt requests from line 0
  EXTI -> IMR1 |= _VAL2FLD(EXTI_IMR1_IM0,  1);

  // configures the external interrupt to trigger on a pulse's rising edge
  EXTI -> RTSR1 |= _VAL2FLD(EXTI_RTSR1_RT0,  1);

  // enables the GPIO interrupt and sets it to be a second-tier priority
  __NVIC_EnableIRQ(EXTI0_IRQn);
  __NVIC_SetPriority(EXTI0_IRQn, 2);

}

// handles any interrupts from PA0
// triggers on every rising edge
// performs FFT calculations on the input signal (i.e. the user's singing)
// keeps a running total of the singing error
// if in test-mode, prints the frequency detected
void EXTI0_IRQHandler(void)
{

  // checks if there is an interrupt pending
  if ((EXTI -> PR1) & (1 << 0))
  {
    // clears the pending status
    EXTI -> PR1 |= _VAL2FLD(EXTI_PR1_PIF0, 1);

    // instantiates a variable to store the dominant frequency of a given audio input
    float32_t note_frequency;

    // checks to see whether or not FFT calculations have already occurred
    // if not, then proceeds to do so
    if (fft_calculations_complete != 1)
    {
      // casts the information stored in DMA into a float (as opposed to an integer)
      for (int i = 0; i < FFT_LENGTH; i++) {float_buffer[i] = (float32_t)pcm_dma_signal[i] / MAX_16BIT_MAGNITUDE;}

      // determines the dominant frequency of the detected audio
      note_frequency = frequency_determiner(float_buffer);

      // raises the FFT-completed flag
      fft_calculations_complete = 1;
    }

    // keeps a running total of how many times the interrupt has been triggered
    interrupt_triggered_counter += 1;
    
    // keeps a running total of the error
    singing_error += (fabs(expected_frequency - note_frequency) / expected_frequency);
    
    // if the user enables test-mode, allows them full frequency-detection visibility
    if (enable_test == 1)
    {
      // resets the LCD screen
      lcd_display_reset();

      // initializes an array to hold the below string
      char test_print[6];

      // turns the registered note into a string, such that it may be subsequently printed with the LCD
      sprintf(test_print, "%f", note_frequency); 
      display_message(test_print);
    }
  }

}

// provides the user with both a letter grade and percent error for their singing's accuracy, displayed on the LCD
void singing_grader(void)
{

  // resets the LCD screen
  lcd_display_reset();
  
  // calculates the user's average error over the length of the entire song
  float32_t average_error = (singing_error / interrupt_triggered_counter);

  // gives the user a letter grade based on their percent error
  if      (average_error < 0.1)  {display_message("Grade: A++");}
  else if (average_error < 0.25) {display_message("Grade: A");}
  else if (average_error < 0.4)  {display_message("Grade: B");}
  else if (average_error < 0.55) {display_message("Grade: C");}
  else if (average_error < 0.75) {display_message("Grade: D");}
  else if (average_error < 0.85) {display_message("Grade: E");}
  else                           {display_message("Grade: F");}

  // waits 5 seconds before resetting the LCD screen
  delay_secs(DELAY_TIM, 5); lcd_display_reset();

  // initializes an array to hold the below string
  char error_print[6];

  // turns the average error calculated into a string, such that it may be subsequently printed with the LCD
  sprintf(error_print, "%.1f", (average_error * 100)); 
  display_message("Percent error: "); display_message(error_print);

  // waits another 5 seconds before clearing the LCD screen
  delay_secs(DELAY_TIM, 5); lcd_display_reset();

  // resets the errors calculated
  singing_error = 0; average_error = 0;

}