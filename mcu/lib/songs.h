/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     December 2, 2025

Purpose: 
*/

#ifndef SONGS_H
#define SONGS_H

// pitches (Hz)
#define A3_NOTE       220
#define A3_SHARP_NOTE 233.1
#define B3_FLAT_NOTE  233.1
#define B3_NOTE       246.9
#define C4_NOTE       261.6
#define C4_SHARP_NOTE 277.2
#define D4_FLAT_NOTE  277.2
#define D4_NOTE       293.7
#define D4_SHARP_NOTE 311.1
#define E4_FLAT_NOTE  311.1
#define E4_NOTE       329.6
#define F4_NOTE       349.2
#define F4_SHARP_NOTE 370
#define G4_FLAT_NOTE  370
#define G4_NOTE       392
#define G4_SHARP_NOTE 415.3
#define A4_FLAT_NOTE  415.3
#define A4_NOTE       440
#define A4_SHARP_NOTE 466.2
#define B4_FLAT_NOTE  466.2
#define B4_NOTE       493.9
#define C5_NOTE       523.3
#define C5_SHARP_NOTE 554.4
#define D5_FLAT_NOTE  554.4
#define D5_NOTE       587.3
#define D5_SHARP_NOTE 622.2
#define E5_FLAT_NOTE  622.2
#define E5_NOTE       659.2
#define F5_NOTE       698.4
#define F5_SHARP_NOTE 740.9
#define G5_FLAT_NOTE  740.9
#define G5_NOTE       784
#define G5_SHARP_NOTE 830.6
#define A5_FLAT_NOTE  830.6
#define A5_NOTE       880

#define MR_BRIGHTSIDE_BPM 148

// Mr. Brightside lyrics
// FIRST LINE          THIRD LINE          SECOND LINE         FOURTH LINE
char* mr_brightside_lyrics[] =
{
  "Mr. Brightside",
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

// Mr. Brightside notes 
// {pitch (Hz), duration (s)}
// D Major / B minor
const int mr_brightside_notes[][2] = 
{
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // com
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // out
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // of
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // cage
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I've
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // been
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // do
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // fine
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // got
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ta
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // got
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ta
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // be
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // down
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // be
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // cause
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // want
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // all.
    {0,      0.5 * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // start
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ed
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // out
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // with
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // How
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // did
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // end
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // up
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // like
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // this
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // was
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ly
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // was
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ly
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Now
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I'm
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // fall
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // sleep
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // call
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // cab
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // while
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // he's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // hav
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // smoke
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // tak
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // drag
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Now
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // they're
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // go
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // to
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // bed
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // stom
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ach
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // is
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // sick
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // And
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // all
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // head
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // but
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // touch
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // his
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // chest
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // now
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // He
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // takes
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // off
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // her
    {554.37, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // dress
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // now
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // Let
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // go.
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // can't
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // look
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // It's
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // kill
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {440,    1   * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {659.26, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // tak
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // con
    {587.33, 3   * (60. / MR_BRIGHTSIDE_BPM)},  // trol
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Jeal
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ous
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // y
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // turn
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // saints
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // to
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // the
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // sea
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // swim
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ming
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // through
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // sick
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // lull
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // bies
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // chok
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // your
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // al
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // i
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // bis
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // But
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // it's
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // the
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // price
    {739.99, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // pay
    {783.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // Dest
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // y
    {440,    1   * (60. / MR_BRIGHTSIDE_BPM)},  // is
    {659.26, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // call
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // O
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // pen
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // up
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // eag
    {739.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // er
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // eyes
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // 'cause
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I'm
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // Mis
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ter
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // Bright
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // side
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // com
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // out
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // of
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // cage
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I've
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // been
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // do
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // fine
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // got
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ta
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // got
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ta
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // be
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // down
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // be
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // cause
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // want
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // all.
    {0,      0.5 * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // start
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ed
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // out
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // with
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // How
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // did
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // end
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // up
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // like
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // this
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // was
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ly
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // It
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // was
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ly
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // kiss
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Now
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I'm
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // fall
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // sleep
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // call
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // cab
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // while
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // he's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // hav
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // smoke
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // tak
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // drag
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Now
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // they're
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // go
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // to
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // bed
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // stom
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ach
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // is
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // sick
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // And
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // it's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // all
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {554.37, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // head
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // but
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // she's
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // touch
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // his
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // chest
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // now
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // He
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // takes
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // off
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // her
    {554.37, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // dress
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // now
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // Let
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // go.
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // can't
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // look
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // It's
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // kill
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {440,    1   * (60. / MR_BRIGHTSIDE_BPM)},  // and
    {659.26, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // tak
    {587.33, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // con
    {587.33, 3   * (60. / MR_BRIGHTSIDE_BPM)},  // trol
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // Jeal
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ous
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // y
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // turn
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // saints
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // to
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // the
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // sea
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // swim
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ming
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // through
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // sick
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // lull
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // a
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // bies
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // chok
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // on
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // your
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // al
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // i
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // bis
    {554.37, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // But
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // it's
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // just
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // the
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // price
    {739.99, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // pay
    {783.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // Dest
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // in
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // y
    {440,    1   * (60. / MR_BRIGHTSIDE_BPM)},  // is
    {659.26, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // call
    {587.33, 0.5 * (60. / MR_BRIGHTSIDE_BPM)},  // ing
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // me
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // O
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // pen
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // up
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // my
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // eag
    {739.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // er
    {739.99, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // eyes
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // 'cause
    {739.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I'm
    {659.26, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // Mis
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // ter
    {659.26, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // Bright
    {587.33, 2   * (60. / MR_BRIGHTSIDE_BPM)},  // side
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // nev
    {587.33, 2.5 * (60. / MR_BRIGHTSIDE_BPM)},  // er
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {587.33, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {554.37, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // nev
    {587.33, 2.5 * (60. / MR_BRIGHTSIDE_BPM)},  // er
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {783.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},  // I
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},  // nev
    {739.99, 5.5 * (60. / MR_BRIGHTSIDE_BPM)},  // er
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      2   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {783.99, 1   * (60. / MR_BRIGHTSIDE_BPM)},
    {783.99, 1.5 * (60. / MR_BRIGHTSIDE_BPM)},
    {739.99, 5.5 * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      1   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
    {0,      4   * (60. / MR_BRIGHTSIDE_BPM)},
};

// 
int mr_brightside_lyric_timing[] =
{
  0,  // opening sequence (no lyrics)
  0,  // opening sequence (no lyrics)
  0,  // opening sequence (no lyrics)
  0,  // opening sequence (no lyrics)
  1
};

// 
char* golden_lyrics[] =
{
  "Golden"
};

// 
const int golden_notes[][2] =
{

};

// 
int mr_brightside_song_length = (sizeof(mr_brightside_notes) / sizeof(mr_brightside_notes[0]));
int golden_song_length        = (sizeof(golden_notes)        / sizeof(golden_notes[0]));

#endif