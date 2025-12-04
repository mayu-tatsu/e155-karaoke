/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: 
*/

#include "../lib/music_player.h"
#include "../lib/songs.h"
#include "../lib/lcd_display.h"
#include "../lib/mcu_configuration.h"

// defines global variables
volatile int note_done;

// 
void music_player(int song)
{

  // TODO: add logic either in here or in main to only play a song when the first song has finished
  // i.e. don't let users spam buttons and start the process all over again??
  // not sure if this is completely necessary, though

  // resets the LCD screen
  lcd_display_reset();

  // initializes a timer to output a PWM
  timer_initialization(DELAY_TIM); pwm_initialization(PWM_TIM);
  
  // sets a GPIO pin to alternating function to actually output the PWM
  pinMode(PWM, GPIO_ALT);

  // enables AF14 for the PWM pin
  GPIOA -> AFR[0] &= ~GPIO_AFRL_AFSEL6_0; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_1; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_2; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_3; 

  // checks which song the user selected
  if (song == PLAY_MR_BRIGHTSIDE)
  {
    // 
    display_message(mr_brightside_lyrics[0]);
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();

    // loops through every note of the desired song
    for (uint32_t i = 0; i < mr_brightside_song_length; i++) 
    {
      // 
      note_done = 0;

      // generates each note's frequency
      pwm_generation(PWM_TIM, mr_brightside_notes[i][0]);

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, mr_brightside_notes[i][1]);

      // 
      if (mr_brightside_lyric_timing[i] != 0)
      {
        lcd_display_reset();
        display_message(mr_brightside_lyrics[mr_brightside_lyric_timing[i]]);
      }

      // 
      delay_micros(DELAY_TIM, 50);
  
      // 
      note_done = 1;
    }
  }

  else if (song == PLAY_GOLDEN)
  {
    // 
    display_message(golden_lyrics[0]);
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();
  
    // loops through every note of the desired song
    for (uint32_t i = 0; i < golden_song_length; i++) 
    {
      // 
      note_done = 0;

      // generates each note's frequency
      pwm_generation(PWM_TIM, golden_notes[i][0]);

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, golden_notes[i][1]);

      // 
      if (golden_lyric_timing[i] != 0)
      {
        lcd_display_reset();
        display_message(golden_lyrics[golden_lyric_timing[i]]);
      }

      // 
      delay_micros(DELAY_TIM, 50);
  
      // 
      note_done = 1;
    }
  }

  // 
  lcd_display_reset();

}

// initializes the PWM wave-generation function
void pwm_initialization(TIM_TypeDef * TIMx) 
{
  
  // divides the system clock input by a prescaler to generate a new clock signal for the timer's internal counter
  // (PSC[15:0] = PRESCALER_VALUE)
  TIMx -> PSC = 16;  // f_cnt_clk = f_psc_clk / (PSC[15:0] + 1)

  // allows the PWM wave to output properly
  // (OC1M[6:4] = 110, OC1PE = 1, CC1P = 0, CC1E = 1)
  TIMx -> CCMR1 |= ((1 << 6) | (1 << 5)); TIMx -> CCMR1 &= ~(1 << 4);  // activates the output channel when CNT < CCR1
  TIMx -> CCER &= ~(1 << 1); TIMx -> CCER |= (1 << 0);                 // makes the output channel active high
  TIMx -> CCMR1 |= (1 << 3);                                           // enables preloading to CCR1
  
  // enables output
  // (MOE = 1)
  TIMx -> BDTR |= (1 << 15);  // enables the main outputs if their respective enable bits are set
  
  // pushes the register updates
  // (UG = 1)
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers
  
  // enables the counter
  // (CEN = 1, UIFREMAP = 0)
  TIMx -> CR1 |= (1 << 0); TIMx -> CR1 &= ~(1 << 11);  // doesn't allow UIF status bit remapping when counting
	
}

// generates the PWM wave
void pwm_generation(TIM_TypeDef * TIMx, int frequency) 
{
  
  // calculates the counter clock frequency when given an 80 MHz system clock as input
  int counter_clock_frequency = 80000000 / (16 + 1);
  
  // sets the maximum counter value as appropriate
  // (ARR[15:0] = (counter_clock_frequency / frequency) - 1)
  TIMx -> ARR = (frequency > 0) ? ((counter_clock_frequency / frequency) - 1) : 0; // zeroes out ARR when the frequency is zero

  // sets the duty cycle as appropriate
  // (CCR1[15:0] = ((counter_clock_frequency / frequency) - 1) / 2)
  TIMx -> CCR1 = (frequency > 0) ? (((counter_clock_frequency / frequency) - 1) / 2) : 0;  // zeroes out the duty cycle when the frequency is zero

  // pushes the register updates
  // (UG = 1)
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers

  // resets the counter
  // (CNT[15:0] = 0)
  TIMx -> CNT = 0;  // manually forces CNT to zero

}