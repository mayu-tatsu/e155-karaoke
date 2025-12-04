/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 4, 2025

Purpose: 
*/

#include "../lib/singing_grader.h"
#include "../lib/mcu_configuration.h"
#include "../lib/dma_configuration.h"
#include "../lib/frequency_determiner.h"
#include "../lib/lcd_display.h"

// defines global variables
volatile uint32_t expected_frequency;
volatile float32_t singing_error;
volatile float interrupt_triggered_counter;

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
// 
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
      // 
      for (int i = 0; i < FFT_LENGTH; i++) {float_buffer[i] = (float32_t)pcm_dma_signal[i] / MAX_16BIT_MAGNITUDE;}

      // determines the dominant frequency of the detected audio
      note_frequency = frequency_determiner(float_buffer);
      printf("frequency: %f", note_frequency);

      // raises the FFT-completed flag
      fft_calculations_complete = 1;
    }

    // keeps a running total of how many times the interrupt has been triggered
    interrupt_triggered_counter += 1;
    
    // 
    singing_error += (fabs(expected_frequency - note_frequency) / expected_frequency);

    char test[6];
    lcd_display_reset(); sprintf(test, "%f", note_frequency); display_message(test);


    printf("note frequency: %f\n", note_frequency);
    printf("singing error: %f\n", singing_error);
  }

}

// 
void singing_grader(void)
{

  // resets the LCD screen
  lcd_display_reset();
  
  // 
  float32_t average_error = singing_error / interrupt_triggered_counter;

  // 
  if      (average_error < 0.1) {display_message("Grade: A++");}
  else if (average_error < 0.2) {display_message("Grade: A");}
  else if (average_error < 0.3) {display_message("Grade: B");}
  else if (average_error < 0.4) {display_message("Grade: C");}
  else if (average_error < 0.5) {display_message("Grade: D");}
  else if (average_error < 0.6) {display_message("Grade: E");}
  
  else if (average_error < 0.7) {display_message("Grade: E-");}
  else if (average_error < 0.8) {display_message("Grade: E--");}
  else if (average_error < 0.9) {display_message("Grade: E---");}




  else                          {display_message("Grade: F");}

  printf("%f", average_error);

  // 
  singing_error = 0; average_error = 0;

  // 
  delay_secs(DELAY_TIM, 5);

}