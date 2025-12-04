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

// 
void music_player(int song)
{

  // TODO: add logic either in here or in main to only play a song when the first song has finished
  // i.e. don't let users spam buttons and start the process all over again??
  // not sure if this is completely necessary, though

  // 
  lcd_display_reset();

  // 
  pwm_initialization(PWM_TIM);
  
  // sets PWM output pin to alternating function
  pinMode(PWM, GPIO_ALT);

  // TODO: CHECK IF THIS IS NECESSARY?? + FIX IF IT IS
  // enables AF14 for the GPIO pin PA6
  // GPIO -> AFRL &= ~(1 << 24); GPIO -> AFRL |= (1 << 25); GPIO -> AFRL |= (1 << 26); GPIO -> AFRL |= (1 << 27); 

  // 
  int song_length = ((song == PLAY_MR_BRIGHTSIDE) ? mr_brightside_song_length : golden_song_length);

  // 
  const int song_notes[song_length][2];

  // 
  if (song == PLAY_MR_BRIGHTSIDE)
  {
    memcpy(song_notes, mr_brightside_notes, mr_brightside_song_length);
    display_message(mr_brightside_lyrics[0]);
    delay_secs(DELAY_TIM, 7);
    lcd_display_reset();
  }
  else
  {
    memcpy(song_notes, golden_notes, golden_song_length);
    display_message(golden_lyrics[0]);
    delay_secs(DELAY_TIM, 7);
    lcd_display_reset();
  }

  // loops through every note of the desired song
  for (int i = 0; i < song_length; i++) 
  {
    // generates each note's frequency 
    pwm_generation(PWM_TIM, song_notes[i][0]);

    // prolongs each note for however long is deemed necessary
    delay_ms(DELAY_TIM, 1000 * song_notes[i][1]);

    // 
    if (mr_brightside_lyric_timing[i] != 0)
    {
      lcd_display_reset();
      display_message(mr_brightside_lyrics[mr_brightside_lyric_timing[i]]);
    }
  
    // TODO: include a NOTE_FINISHED flag?
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