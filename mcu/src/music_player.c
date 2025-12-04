/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: To play the main singing melody of pre-determined songs.
*/

#include "../lib/music_player.h"
#include "../lib/songs.h"
#include "../lib/singing_grader.h"
#include "../lib/lcd_display.h"
#include "../lib/mcu_configuration.h"

// plays either Mr. Brightside or Golden, depending on the user's input
void music_player(int song)
{

  // resets the LCD screen
  lcd_display_reset();

  // initializes a timer to output a PWM
  timer_initialization(DELAY_TIM); pwm_initialization(PWM_TIM);
  
  // sets a GPIO pin to alternating function to actually output the PWM
  pinMode(PWM, GPIO_ALT);

  // enables AF14 for the PWM pin
  GPIOA -> AFR[0] &= ~GPIO_AFRL_AFSEL6_0; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_1; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_2; GPIOA -> AFR[0] |= GPIO_AFRL_AFSEL6_3; 
  
  // 
  interrupt_triggered_counter = 0; singing_error = 0;

  // checks which song the user selected
  // if it's Mr. Brightside...
  if (song == PLAY_MR_BRIGHTSIDE)
  {
    // tells the user which song they've chosen
    display_message(mr_brightside_lyrics[0]);
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();

    // counts down until the start of the song
    display_message("3");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("2");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("1");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("Sing!"); delay_secs(DELAY_TIM, 1); lcd_display_reset();

    // loops through every note of the desired song
    for (uint32_t i = 0; i < mr_brightside_song_length; i++) 
    {
      // 
      digitalWrite(NOTE_DONE, PIO_LOW);

      // generates each note's frequency
      pwm_generation(PWM_TIM, mr_brightside_notes[i][0]);
      expected_frequency = mr_brightside_notes[i][0];

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, mr_brightside_notes[i][1] / 1000);

      // checks if it's time to switch lyrics
      if (mr_brightside_lyric_timing[i] != 0)
      {
        lcd_display_reset();
        display_message(mr_brightside_lyrics[mr_brightside_lyric_timing[i]]);
      }

      // adds a small delay to distinguish notes
      delay_micros(DELAY_TIM, 50);
  
      // interrupt triggers, in singing_grader.c
      digitalWrite(NOTE_DONE, PIO_HIGH);

      // 
      fft_calculations_complete = 0;
    }
  }

  // if it's Golden...
  if (song == PLAY_GOLDEN)
  {
    // tells the user which song they've chosen
    //display_message(golden_lyrics[0]);
    //delay_secs(DELAY_TIM, 5);
    //lcd_display_reset();

    // counts down until the start of the song
    display_message("3");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("2");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("1");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("Sing!"); delay_secs(DELAY_TIM, 1); lcd_display_reset();
  
    // loops through every note of the desired song
    //for (uint32_t i = 0; i < golden_song_length; i++) 
    for (uint32_t i = 0; i < a_four_length; i++) 
    {
      // 
      digitalWrite(NOTE_DONE, PIO_LOW);

      // 
      fft_calculations_complete = 0;

      // generates each note's frequency
      //pwm_generation(PWM_TIM, golden_notes[i][0]);
      //expected_frequency = golden_notes[i][0];
      pwm_generation(PWM_TIM, a_four[i][0]);
      expected_frequency = a_four[i][0];

      // prolongs each note for however long is deemed necessary
      //delay_ms(DELAY_TIM, golden_notes[i][1] / 2);
      delay_ms(DELAY_TIM, a_four[i][1]);

      // checks if it's time to switch lyrics
      //if (golden_lyric_timing[i] != 0)
      //{
      //  lcd_display_reset();
      //  display_message(golden_lyrics[golden_lyric_timing[i]]);
      //}

      // adds a small delay to distinguish notes
      //delay_micros(DELAY_TIM, 50);
  
      // 
      digitalWrite(NOTE_DONE, PIO_HIGH);

      
    }
  }

  // resets the LCD display once more
  lcd_display_reset();

}

// initializes the PWM wave-generation function
void pwm_initialization(TIM_TypeDef * TIMx) 
{
  
  // divides the system clock input by a prescaler to generate a new clock signal for the timer's internal counter
  TIMx -> PSC = 16;  // f_cnt_clk = f_psc_clk / (PSC[15:0] + 1)

  // allows the PWM wave to output properly
  TIMx -> CCMR1 |= ((1 << 6) | (1 << 5)); TIMx -> CCMR1 &= ~(1 << 4);  // activates the output channel when CNT < CCR1
  TIMx -> CCER &= ~(1 << 1); TIMx -> CCER |= (1 << 0);                 // makes the output channel active high
  TIMx -> CCMR1 |= (1 << 3);                                           // enables preloading to CCR1
  
  // enables output
  TIMx -> BDTR |= (1 << 15);  // enables the main outputs if their respective enable bits are set
  
  // pushes the register updates
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers
  
  // enables the counter
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
  TIMx -> EGR |= (1 << 0);  // reinitializes the counter and generates an update of the registers

  // resets the counter
  TIMx -> CNT = 0;  // manually forces CNT to zero

}