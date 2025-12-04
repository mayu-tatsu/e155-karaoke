/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 18, 2025

Purpose: To determine the note corresponding to a given frequency.
*/

#include "../lib/note_determiner.h"

// TODO: fix note accuracy!!
// returns the note that a given frequency corresponds to
const char* note_determiner(float32_t note_frequency)
{
  
  // determines which note has been detected, accounting for some small margin of error
  int note_A3 = ((note_frequency < (220   + FREQUENCY_ERROR_BOUND)) & (note_frequency > (220   - FREQUENCY_ERROR_BOUND)));
  int note_B3 = ((note_frequency < (246.9 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (246.9 - FREQUENCY_ERROR_BOUND)));
  int note_C4 = ((note_frequency < (261.6 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (261.6 - FREQUENCY_ERROR_BOUND)));
  int note_D4 = ((note_frequency < (293.7 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (293.7 - FREQUENCY_ERROR_BOUND)));
  int note_E4 = ((note_frequency < (329.6 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (329.6 - FREQUENCY_ERROR_BOUND)));
  int note_F4 = ((note_frequency < (349.2 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (349.2 - FREQUENCY_ERROR_BOUND)));
  int note_G4 = ((note_frequency < (392   + FREQUENCY_ERROR_BOUND)) & (note_frequency > (392   - FREQUENCY_ERROR_BOUND)));
  int note_A4 = ((note_frequency < (440   + FREQUENCY_ERROR_BOUND)) & (note_frequency > (440   - FREQUENCY_ERROR_BOUND)));
  int note_B4 = ((note_frequency < (493.9 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (493.9 - FREQUENCY_ERROR_BOUND)));
  int note_C5 = ((note_frequency < (523.3 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (523.3 - FREQUENCY_ERROR_BOUND)));
  int note_D5 = ((note_frequency < (587.3 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (587.3 - FREQUENCY_ERROR_BOUND)));
  int note_E5 = ((note_frequency < (659.2 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (659.2 - FREQUENCY_ERROR_BOUND)));
  int note_F5 = ((note_frequency < (698.4 + FREQUENCY_ERROR_BOUND)) & (note_frequency > (698.4 - FREQUENCY_ERROR_BOUND)));
  int note_G5 = ((note_frequency < (784   + FREQUENCY_ERROR_BOUND)) & (note_frequency > (784   - FREQUENCY_ERROR_BOUND)));
  int note_A5 = ((note_frequency < (880   + FREQUENCY_ERROR_BOUND)) & (note_frequency > (880   - FREQUENCY_ERROR_BOUND)));

  // returns the note accordingly
  if      (note_A3 == 1) {return "A3";}
  else if (note_B3 == 1) {return "B3";}
  else if (note_C4 == 1) {return "C4";}
  else if (note_D4 == 1) {return "D4";}
  else if (note_E4 == 1) {return "E4";}
  else if (note_F4 == 1) {return "F4";}
  else if (note_G4 == 1) {return "G4";}
  else if (note_A4 == 1) {return "A4";}
  else if (note_B4 == 1) {return "B4";}
  else if (note_C5 == 1) {return "C5";}
  else if (note_D5 == 1) {return "D5";}
  else if (note_E5 == 1) {return "E5";}
  else if (note_F5 == 1) {return "F5";}
  else if (note_G5 == 1) {return "G5";}
  else if (note_A5 == 1) {return "A5";}
  else                   {return "ERROR! Undefined note";}

}