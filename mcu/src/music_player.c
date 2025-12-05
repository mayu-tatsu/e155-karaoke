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
#include "../lib/dma_configuration.h"

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
  
  // resets the interrupt counter and error total
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
      // lowers the note-done flag
      digitalWrite(NOTE_DONE, PIO_LOW);

      // resets the completed-FFT flag
      fft_calculations_complete = 0;

      // generates each note's frequency
      pwm_generation(PWM_TIM, mr_brightside_notes[i][0]);
      expected_frequency = mr_brightside_notes[i][0];

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, mr_brightside_notes[i][1]);

      // checks if it's time to switch lyrics
      if (mr_brightside_lyric_timing[i] != 0)
      {
        lcd_display_reset();
        display_message(mr_brightside_lyrics[mr_brightside_lyric_timing[i]]);
      }

      // adds a small delay to distinguish notes
      delay_micros(DELAY_TIM, 50);
  
      // raises the note done flag (so that an interrupt triggers)
      // note: you can find this interrupt in singing_grader.c
      digitalWrite(NOTE_DONE, PIO_HIGH);
    }
  }

  // checks which song the user selected
  // if it's Golden...
  if (song == PLAY_GOLDEN)
  {
    // tells the user which song they've chosen
    display_message(golden_lyrics[0]);
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();

    // counts down until the start of the song
    display_message("3");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("2");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("1");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("Sing!"); delay_secs(DELAY_TIM, 1); lcd_display_reset();
  
    // loops through every note of the desired song
    for (uint32_t i = 0; i < golden_song_length; i++) 
    {
      // lowers the note-done flag
      digitalWrite(NOTE_DONE, PIO_LOW);

      // resets the completed-FFT flag
      fft_calculations_complete = 0;

      // generates each note's frequency
      pwm_generation(PWM_TIM, golden_notes[i][0]);
      expected_frequency = golden_notes[i][0];

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, golden_notes[i][1]);

      // checks if it's time to switch lyrics
      if (golden_lyric_timing[i] != 0)
      {
        lcd_display_reset();
        display_message(golden_lyrics[golden_lyric_timing[i]]);
      }

      // adds a small delay to distinguish notes
      delay_micros(DELAY_TIM, 50);
  
      // raises the note done flag (so that an interrupt triggers)
      // note: you can find this interrupt in singing_grader.c
      digitalWrite(NOTE_DONE, PIO_HIGH);
    }
  }

  // if the user wants to test the microphone's detection...
  if (song == PLAY_TEST)
  {
    // confirms that it's a test run
    display_message("Test notes!");
    delay_secs(DELAY_TIM, 5);
    lcd_display_reset();

    // counts down until the start of the test
    display_message("3");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("2");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("1");     delay_secs(DELAY_TIM, 1); lcd_display_reset();
    display_message("Test!"); delay_secs(DELAY_TIM, 1); lcd_display_reset();
  
    // loops through every note of the test array
    for (uint32_t i = 0; i < test_notes_length; i++) 
    {
      // lowers the note-done flag
      digitalWrite(NOTE_DONE, PIO_LOW);

      // resets the completed-FFT flag
      fft_calculations_complete = 0;

      // generates each note's frequency
      pwm_generation(PWM_TIM, test_notes[i][0]);
      expected_frequency = test_notes[i][0];

      // prolongs each note for however long is deemed necessary
      delay_ms(DELAY_TIM, test_notes[i][1]);
  
      // raises the note done flag (so that an interrupt triggers)
      // note: you can find this interrupt in singing_grader.c
      digitalWrite(NOTE_DONE, PIO_HIGH);
    }
  }
  
  // lowers the note-done flag
  digitalWrite(NOTE_DONE, PIO_LOW);

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