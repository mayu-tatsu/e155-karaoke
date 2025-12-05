/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: To create a karaoke machine that outputs the main melodies of pre-programmed songs and take the user's singing as input, 
         ultimately giving them a grade based on accuracy in return.
*/

#include "lib/mcu_peripherals/STM32L432KC.h"
#include "lib/arm_math/arm_math.h"
#include "lib/mcu_configuration.h"
#include "lib/dma_configuration.h"
#include "lib/frequency_determiner.h"
#include "lib/note_determiner.h"
#include "lib/lcd_display.h"
#include "lib/music_player.h"
#include "lib/singing_grader.h"

// configures and runs the karaoke machine
int main(void)
{

  // sets up the MCU with all desired functionalities
  mcu_configuration();

  // initializes the LCD display so that it is ready to use
  lcd_display_initialization();
  
  // raises the completed FFT flag
  // note: this needs to be set to one initially in order for the DMA interrupt to occur
  fft_calculations_complete = 1;

  // sets test-mode
  // note: EXAMPLE CODE (not meant to be a part of the main program)
  enable_test = 0;

  // runs continuously
  while (1)
  {
    // clears the LCD screen
    lcd_display_reset();

    // displays a starter message for the user's understanding
    display_message("Choose a song!"); delay_secs(DELAY_TIM, 3); lcd_display_reset();
    display_message("Switch 1: Mr.       Switch 2: Golden    Brightside"); delay_secs(DELAY_TIM, 3); lcd_display_reset();

    // adds a three second delay
    delay_secs(DELAY_TIM, 3);

    // if the user flips the first switch, begins to play Mr. Brightside
    // subsequently outputs the user's grade
    if (digitalRead(MR_BRIGHTSIDE_SELECTOR) == 1) 
    {
        music_player(PLAY_MR_BRIGHTSIDE); 
        singing_grader();
      }

    // if the user flips the second switch, begins to play Golden
    // subsequently outputs the user's grade
    else if (digitalRead(GOLDEN_SELECTOR) == 1) 
    {
      music_player(PLAY_GOLDEN); 
      singing_grader();
    }

    // if test-mode is set, runs through some test code to display detected frequencies
    // subsequently outputs the user's grade
    else if (enable_test == 1) 
    {
      music_player(PLAY_TEST); 
      singing_grader();
    }
  }

}
