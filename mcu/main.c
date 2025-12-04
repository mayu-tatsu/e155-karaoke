/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 16, 2025

Purpose: 
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

// 
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
  enable_test = 1;

  // runs continuously
  while (1)
  {
    //
    if (digitalRead(MR_BRIGHTSIDE_SELECTOR) == 1)
    {
      //  
      music_player(PLAY_MR_BRIGHTSIDE);
      singing_grader();
    }

    // 
    else if (digitalRead(GOLDEN_SELECTOR) == 1)
    {
      // 
      music_player(PLAY_GOLDEN);
      singing_grader();
    }

    // 
    if (enable_test == 1)
    {
      // 
      music_player(PLAY_TEST);
      singing_grader();
    }
  }

}