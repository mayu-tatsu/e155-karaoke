/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 17, 2025

Purpose: 
*/



// 
void music_player(void)
{

  // configures the system clock
  configureFlash();
  configureClock();

  // enables GPIO port A
  RCC -> AHB2ENR |= (1 << 0);

  // enables both timers
  RCC -> APB2ENR |= (1 << 16); RCC -> APB2ENR |= (1 << 17);

  // sets PA6 to alternating function
  pinMode(6, 2);

  // enables AF14 for the GPIO pin PA6
  GPIO -> AFRL &= ~(1 << 24); GPIO -> AFRL |= (1 << 25); GPIO -> AFRL |= (1 << 26); GPIO -> AFRL |= (1 << 27); 

  // initializes the note frequency- and duration-generating functions
  PWM_duration_initialization();
  PWM_generation_initialization();

  // calculates the total length of the song
  int fur_elise_song_length = sizeof(fur_elise_notes) / sizeof(fur_elise_notes[0]);

  // loops through every note of Fur Elise, as provided in the above array
  for (int i = 0; i < fur_elise_song_length; i++) 
  {
    // generates each note's frequency 
    PWM_generation(fur_elise_notes[i][0]);

    // prolongs each note for however long is deemed necessary
    PWM_duration(fur_elise_notes[i][1]);
  }

  // calculates the total length of the song
  int legendary_song_length = sizeof(legendary_notes) / sizeof(legendary_notes[0]);

  // loops through every note of Fur Elise, as provided in the above array
  for (int j = 0; j < legendary_song_length; j++) 
  {
    // generates each note's frequency 
    PWM_generation(legendary_notes[j][0]);

    // prolongs each note for however long is deemed necessary
    PWM_duration(2 * legendary_notes[j][1]);
  }

}