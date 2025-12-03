/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 2, 2025

Purpose: 
*/

#ifndef SONGS_H
#define SONGS_H

// pitches (Hz)
#define A3       220
#define A3_SHARP 233.1
#define B3_FLAT  233.1
#define B3       246.9
#define C4       261.6
#define C4_SHARP 277.2
#define D4_FLAT  277.2
#define D4       293.7
#define D4_SHARP 311.1
#define E4_FLAT  311.1
#define E4       329.6
#define F4       349.2
#define F4_SHARP 370
#define G4_FLAT  370
#define G4       392
#define G4_SHARP 415.3
#define A4_FLAT  415.3
#define A4       440
#define A4_SHARP 466.2
#define B4_FLAT  466.2
#define B4       493.9
#define C5       523.3
#define C5_SHARP 554.4
#define D5_FLAT  554.4
#define D5       587.3
#define D5_SHARP 622.2
#define E5_FLAT  622.2
#define E5       659.2
#define F5       698.4
#define F5_SHARP 740.9
#define G5_FLAT  740.9
#define G5       784
#define G5_SHARP 830.6
#define A5_FLAT  830.6
#define A5       880

// note durations (ms) [Mr. Brightside]
#define SIXTEENTH_NOTE 102
#define EIGHTH_NOTE    203
#define QUARTER_NOTE   405
#define HALF_NOTE      810
#define WHOLE_NOTE     1620

// Mr. Brightside notes 
// {pitch (Hz), duration (ms)}
const int mr_brightside_notes[][2] = 
{
  // example...
  {0, QUARTER_NOTE},
  {0, QUARTER_NOTE}
};

// Mr. Brightside lyrics
// FIRST LINE          THIRD LINE          SECOND LINE         FOURTH LINE
char* mr_brightside_lyrics[] =
{
  "Coming out of my    doing just fine     cage, and I've been",
  "Gotta, gotta be downall                 because I want it", 
  "It started out with end up like this?   a kiss, how did it",
  "It was only a kiss,                     it was only a kiss",
  "Now I'm falling     calling a cab       asleep, and she's",
  "While he's having a taking a drag       smoke, and she's",
  "Now they're going tois sick             bed, and my stomach",
  "And it's all in my  touching his chest  head, but she's     now",
  "He takes off her                        dress now, let me go",
  "I just can't look,                      it's killing me",
  "And taking control",
  "Jealousy, turning                       saints into the sea",
  "Swimming through    choking on your     sick lullabies,     alibis",
  "But it's just the   is calling me       price I pay, destiny",
  "Open up my eager    Brightside          eyes, 'cause I'm Mr.",
  "I'm coming out of mydoing just fine     cage, and I've been",
  "Gotta, gotta be downall                 because I want it",
  "It started out with end up like this?   a kiss, how did it",
  "It was only a kiss,                     it was only a kiss",
  "Now I'm falling     calling a cab       asleep, and she's",
  "While he's having a taking a drag       smoke, and she's",
  "Now they're going tois sick             bed, and my stomach",
  "And it's all in my  touching his chest  head, but she's     now",
  "He takes off her                        dress now, let me go",
  "'Cause I just can't me                  look, it's killing",
  "And taking control",
  "Jealousy, turning                       saints into the sea",
  "Swimming through    choking on your     sick lullabies,     alibis",
  "But it's just the   is calling me       price I pay, destiny",
  "Open up my eager    Brightside          eyes, 'cause I'm Mr.",
  "I never",
  "I never",
  "I never",
  "I never"
};

#endif