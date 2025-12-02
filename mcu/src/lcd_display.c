/*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 23, 2025

Purpose: 
*/

#include "../lib/lcd_display.h"
#include "../lib/mcu_configuration.h"

// performs the LCD initialization sequence
void lcd_display_initialization(void)
{


  GPIOB->MODER&=~(3<<(7*2));
  GPIOB->MODER|=(1<<(7*2));
  GPIOB->AFR[0]&=~(0xF<<(7*4));


  // configures all of the necessary GPIO pins as outputs
  pinMode(E,  GPIO_OUTPUT); digitalWrite(E,  PIO_LOW);
  pinMode(RS, GPIO_OUTPUT); digitalWrite(RS, PIO_LOW);
  pinMode(D0, GPIO_OUTPUT); digitalWrite(D0, PIO_LOW);
  pinMode(D1, GPIO_OUTPUT); digitalWrite(D1, PIO_LOW);
  pinMode(D2, GPIO_OUTPUT); digitalWrite(D2, PIO_LOW);
  pinMode(D3, GPIO_OUTPUT); digitalWrite(D3, PIO_LOW);
  pinMode(D4, GPIO_OUTPUT); digitalWrite(D4, PIO_LOW);
  pinMode(D5, GPIO_OUTPUT); digitalWrite(D5, PIO_LOW);
  pinMode(D6, GPIO_OUTPUT); digitalWrite(D6, PIO_LOW);
  pinMode(D7, GPIO_OUTPUT); digitalWrite(D7, PIO_LOW);


  
  // GPIOB -> PUPDR |= _VAL2FLD(GPIO_PUPDR_PUPD7, GPIO_PULL_DOWN);



  // allows buffer time for Vdd to reach > 4.5 V
  delay_millis(DELAY_TIM, 45);   // wait time: > 40 ms

  // ensures proper LCD reset with three 0x30 commands and specific delays
  lcd_display_write(0x30);
  delay_millis(DELAY_TIM, 5);    // wait time: > 4.1 ms
  lcd_display_write(0x30);
  delay_micros(DELAY_TIM, 200);  // wait time: > 100 us
  lcd_display_write(0x30);
  delay_micros(DELAY_TIM, 200);

  // sets 8-bit mode
  lcd_display_write(0x30);
  delay_micros(DELAY_TIM, 200);

  // configures display: 8-bit, 2-line, 5x8 font
  lcd_display_write(0x38);
  delay_micros(DELAY_TIM, 200);

  // turns display off
  lcd_display_write(0x08);
  delay_micros(DELAY_TIM, 1500);

  // clears display
  lcd_display_write(0x01);
  delay_micros(DELAY_TIM, 1500);
  delay_micros(DELAY_TIM, 1500);

  // sets entry mode: enables display, cursor, and cursor blink
  lcd_display_write(0x06);
  delay_millis(DELAY_TIM, 1);

  // turns display back on
  lcd_display_write(0x0F);
  delay_millis(DELAY_TIM, 2);
  
  // sets cursor address to be Row 1, Column 1
  lcd_display_write(0x80);
  delay_millis(DELAY_TIM, 1);



  // writes "µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!"
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);

  //// writes "µPs!"
  ////lcd_display_write(0b111100100);
  //lcd_display_write(0x1E4);
  //delay_millis(TIM2, 1);
  ////lcd_display_write(0b101010000);
  //lcd_display_write(0x150);
  //delay_millis(TIM2, 1);
  ////lcd_display_write(0b101110011);
  //lcd_display_write(0x173);
  //delay_millis(TIM2, 1);
  ////lcd_display_write(0b100100001);
  //lcd_display_write(0x121);
  //delay_millis(TIM2, 1);

}

// performs a low-level write to the LCD
void lcd_display_write(uint16_t data)
{

  // pushes each bit of data to the proper pin
  digitalWrite(RS, ((data >> 8) & 1));
  digitalWrite(D7, ((data >> 7) & 1));
  digitalWrite(D6, ((data >> 6) & 1));
  digitalWrite(D5, ((data >> 5) & 1));
  digitalWrite(D4, ((data >> 4) & 1));
  digitalWrite(D3, ((data >> 3) & 1));
  digitalWrite(D2, ((data >> 2) & 1));
  digitalWrite(D1, ((data >> 1) & 1));
  digitalWrite(D0, ((data >> 0) & 1));
  
  // pulses Enable to update each respective pin
  digitalWrite(E, PIO_HIGH); delay_micros(DELAY_TIM, 20); digitalWrite(E, PIO_LOW);

}

// 
void display_message(char* message[])
{

  // turns display off
  lcd_display_write(0x08);
  delay_millis(DELAY_TIM, 1500);

  // clears display
  lcd_display_write(0x01);
  delay_millis(DELAY_TIM, 1500);
  delay_millis(DELAY_TIM, 1500);

  // turns display back on
  lcd_display_write(0x0F);
  delay_millis(DELAY_TIM, 200);

  // sets cursor address to be Row 1, Column 1
  lcd_display_write(0x80);
  delay_millis(DELAY_TIM, 100);

  // 
  int message_length = strlen(*message);
  
  // 
  for (int i = 0; i < message_length; i++)
  {
    // 
    lcd_display_write(character_converter(message[i]));
    delay_millis(DELAY_TIM, 100);
  }

}

// 
uint16_t character_converter(char* character)
{
  
  // 
  uint16_t character_code;

  // 
  
  if      (inString(character, "!")  > 0) {return character_code = 0x121;}
  else if (inString(character, "\"") > 0) {return character_code = 0x122;}
  else if (inString(character, "#")  > 0) {return character_code = 0x123;}
  else if (inString(character, "$")  > 0) {return character_code = 0x124;}
  else if (inString(character, "%")  > 0) {return character_code = 0x125;}
  else if (inString(character, "&")  > 0) {return character_code = 0x126;}
  else if (inString(character, "'")  > 0) {return character_code = 0x127;}
  else if (inString(character, "(")  > 0) {return character_code = 0x128;}
  else if (inString(character, ")")  > 0) {return character_code = 0x129;}
  else if (inString(character, "*")  > 0) {return character_code = 0x12A;}
  else if (inString(character, "+")  > 0) {return character_code = 0x12B;}
  else if (inString(character, ",")  > 0) {return character_code = 0x12C;}
  else if (inString(character, "-")  > 0) {return character_code = 0x12D;}
  else if (inString(character, ".")  > 0) {return character_code = 0x12E;}
  else if (inString(character, "/")  > 0) {return character_code = 0x12F;}

  else if (inString(character, "0")  > 0) {return character_code = 0x130;}
  else if (inString(character, "1")  > 0) {return character_code = 0x131;}
  else if (inString(character, "2")  > 0) {return character_code = 0x132;}
  else if (inString(character, "3")  > 0) {return character_code = 0x133;}
  else if (inString(character, "4")  > 0) {return character_code = 0x134;}
  else if (inString(character, "5")  > 0) {return character_code = 0x135;}
  else if (inString(character, "6")  > 0) {return character_code = 0x136;}
  else if (inString(character, "7")  > 0) {return character_code = 0x137;}
  else if (inString(character, "8")  > 0) {return character_code = 0x138;}
  else if (inString(character, "9")  > 0) {return character_code = 0x139;}
  else if (inString(character, ":")  > 0) {return character_code = 0x13A;}
  else if (inString(character, ";")  > 0) {return character_code = 0x13B;}
  else if (inString(character, "<")  > 0) {return character_code = 0x13C;}
  else if (inString(character, "=")  > 0) {return character_code = 0x13D;}
  else if (inString(character, ">")  > 0) {return character_code = 0x13E;}
  else if (inString(character, "?")  > 0) {return character_code = 0x13F;}

  else if (inString(character, "@")  > 0) {return character_code = 0x140;}
  else if (inString(character, "A")  > 0) {return character_code = 0x141;}
  else if (inString(character, "B")  > 0) {return character_code = 0x142;}
  else if (inString(character, "C")  > 0) {return character_code = 0x143;}
  else if (inString(character, "D")  > 0) {return character_code = 0x144;}
  else if (inString(character, "E")  > 0) {return character_code = 0x145;}
  else if (inString(character, "F")  > 0) {return character_code = 0x146;}
  else if (inString(character, "G")  > 0) {return character_code = 0x147;}
  else if (inString(character, "H")  > 0) {return character_code = 0x148;}
  else if (inString(character, "I")  > 0) {return character_code = 0x149;}
  else if (inString(character, "J")  > 0) {return character_code = 0x14A;}
  else if (inString(character, "K")  > 0) {return character_code = 0x14B;}
  else if (inString(character, "L")  > 0) {return character_code = 0x14C;}
  else if (inString(character, "M")  > 0) {return character_code = 0x14D;}
  else if (inString(character, "N")  > 0) {return character_code = 0x14E;}
  else if (inString(character, "O")  > 0) {return character_code = 0x14F;}

  else if (inString(character, "P")  > 0) {return character_code = 0x150;}
  else if (inString(character, "Q")  > 0) {return character_code = 0x151;}
  else if (inString(character, "R")  > 0) {return character_code = 0x152;}
  else if (inString(character, "S")  > 0) {return character_code = 0x153;}
  else if (inString(character, "T")  > 0) {return character_code = 0x154;}
  else if (inString(character, "U")  > 0) {return character_code = 0x155;}
  else if (inString(character, "V")  > 0) {return character_code = 0x156;}
  else if (inString(character, "W")  > 0) {return character_code = 0x157;}
  else if (inString(character, "X")  > 0) {return character_code = 0x158;}
  else if (inString(character, "Y")  > 0) {return character_code = 0x159;}
  else if (inString(character, "Z")  > 0) {return character_code = 0x15A;}
  else if (inString(character, "[")  > 0) {return character_code = 0x15B;}
  else if (inString(character, "¥")  > 0) {return character_code = 0x15C;}
  else if (inString(character, "]")  > 0) {return character_code = 0x15D;}
  else if (inString(character, "^")  > 0) {return character_code = 0x15E;}
  else if (inString(character, "_")  > 0) {return character_code = 0x15F;}

  else if (inString(character, "`")  > 0) {return character_code = 0x160;}
  else if (inString(character, "a")  > 0) {return character_code = 0x161;}
  else if (inString(character, "b")  > 0) {return character_code = 0x162;}
  else if (inString(character, "c")  > 0) {return character_code = 0x163;}
  else if (inString(character, "d")  > 0) {return character_code = 0x164;}
  else if (inString(character, "e")  > 0) {return character_code = 0x165;}
  else if (inString(character, "f")  > 0) {return character_code = 0x166;}
  else if (inString(character, "g")  > 0) {return character_code = 0x167;}
  else if (inString(character, "h")  > 0) {return character_code = 0x168;}
  else if (inString(character, "i")  > 0) {return character_code = 0x169;}
  else if (inString(character, "j")  > 0) {return character_code = 0x16A;}
  else if (inString(character, "k")  > 0) {return character_code = 0x16B;}
  else if (inString(character, "l")  > 0) {return character_code = 0x16C;}
  else if (inString(character, "m")  > 0) {return character_code = 0x16D;}
  else if (inString(character, "n")  > 0) {return character_code = 0x16E;}
  else if (inString(character, "o")  > 0) {return character_code = 0x16F;}

  else if (inString(character, "p")  > 0) {return character_code = 0x170;}
  else if (inString(character, "q")  > 0) {return character_code = 0x171;}
  else if (inString(character, "r")  > 0) {return character_code = 0x172;}
  else if (inString(character, "s")  > 0) {return character_code = 0x173;}
  else if (inString(character, "t")  > 0) {return character_code = 0x174;}
  else if (inString(character, "u")  > 0) {return character_code = 0x175;}
  else if (inString(character, "v")  > 0) {return character_code = 0x176;}
  else if (inString(character, "w")  > 0) {return character_code = 0x177;}
  else if (inString(character, "x")  > 0) {return character_code = 0x178;}
  else if (inString(character, "y")  > 0) {return character_code = 0x179;}
  else if (inString(character, "z")  > 0) {return character_code = 0x17A;}
  else if (inString(character, "{")  > 0) {return character_code = 0x17B;}
  else if (inString(character, "|")  > 0) {return character_code = 0x17C;}
  else if (inString(character, "}")  > 0) {return character_code = 0x17D;}
  else if (inString(character, "→")  > 0) {return character_code = 0x17E;}
  else if (inString(character, "←")  > 0) {return character_code = 0x17F;}

  else if (inString(character, " ")  > 0) {return character_code = 0x1A0;}
  else if (inString(character, "。")  > 0) {return character_code = 0x1A1;}
  else if (inString(character, "「")  > 0) {return character_code = 0x1A2;}
  else if (inString(character, "」")  > 0) {return character_code = 0x1A3;}
  else if (inString(character, "、")  > 0) {return character_code = 0x1A4;}
  else if (inString(character, "・")  > 0) {return character_code = 0x1A5;}
  else if (inString(character, "ヲ")  > 0) {return character_code = 0x1A6;}
  else if (inString(character, "ァ")  > 0) {return character_code = 0x1A7;}
  else if (inString(character, "ィ")  > 0) {return character_code = 0x1A8;}
  else if (inString(character, "ゥ")  > 0) {return character_code = 0x1A9;}
  else if (inString(character, "ェ")  > 0) {return character_code = 0x1AA;}
  else if (inString(character, "ォ")  > 0) {return character_code = 0x1AB;}
  else if (inString(character, "ャ")  > 0) {return character_code = 0x1AC;}
  else if (inString(character, "ュ")  > 0) {return character_code = 0x1AD;}
  else if (inString(character, "ョ")  > 0) {return character_code = 0x1AE;}
  else if (inString(character, "ッ")  > 0) {return character_code = 0x1AF;}

  else if (inString(character, "―")  > 0) {return character_code = 0x1B0;}
  else if (inString(character, "ア")  > 0) {return character_code = 0x1B1;}
  else if (inString(character, "イ")  > 0) {return character_code = 0x1B2;}
  else if (inString(character, "ウ")  > 0) {return character_code = 0x1B3;}
  else if (inString(character, "エ")  > 0) {return character_code = 0x1B4;}
  else if (inString(character, "オ")  > 0) {return character_code = 0x1B5;}
  else if (inString(character, "カ")  > 0) {return character_code = 0x1B6;}
  else if (inString(character, "キ")  > 0) {return character_code = 0x1B7;}
  else if (inString(character, "ク")  > 0) {return character_code = 0x1B8;}
  else if (inString(character, "ケ")  > 0) {return character_code = 0x1B9;}
  else if (inString(character, "コ")  > 0) {return character_code = 0x1BA;}
  else if (inString(character, "サ")  > 0) {return character_code = 0x1BB;}
  else if (inString(character, "シ")  > 0) {return character_code = 0x1BC;}
  else if (inString(character, "ス")  > 0) {return character_code = 0x1BD;}
  else if (inString(character, "セ")  > 0) {return character_code = 0x1BE;}
  else if (inString(character, "ソ")  > 0) {return character_code = 0x1BF;}

  else if (inString(character, "タ")  > 0) {return character_code = 0x1C0;}
  else if (inString(character, "チ")  > 0) {return character_code = 0x1C1;}
  else if (inString(character, "ツ")  > 0) {return character_code = 0x1C2;}
  else if (inString(character, "テ")  > 0) {return character_code = 0x1C3;}
  else if (inString(character, "ト")  > 0) {return character_code = 0x1C4;}
  else if (inString(character, "ナ")  > 0) {return character_code = 0x1C5;}
  else if (inString(character, "ニ")  > 0) {return character_code = 0x1C6;}
  else if (inString(character, "ヌ")  > 0) {return character_code = 0x1C7;}
  else if (inString(character, "ネ")  > 0) {return character_code = 0x1C8;}
  else if (inString(character, "ノ")  > 0) {return character_code = 0x1C9;}
  else if (inString(character, "ハ")  > 0) {return character_code = 0x1CA;}
  else if (inString(character, "ヒ")  > 0) {return character_code = 0x1CB;}
  else if (inString(character, "フ")  > 0) {return character_code = 0x1CC;}
  else if (inString(character, "ヘ")  > 0) {return character_code = 0x1CD;}
  else if (inString(character, "ホ")  > 0) {return character_code = 0x1CE;}
  else if (inString(character, "マ")  > 0) {return character_code = 0x1CF;}

  else if (inString(character, "ミ")  > 0) {return character_code = 0x1D0;}
  else if (inString(character, "ム")  > 0) {return character_code = 0x1D1;}
  else if (inString(character, "メ")  > 0) {return character_code = 0x1D2;}
  else if (inString(character, "モ")  > 0) {return character_code = 0x1D3;}
  else if (inString(character, "ヤ")  > 0) {return character_code = 0x1D4;}
  else if (inString(character, "ユ")  > 0) {return character_code = 0x1D5;}
  else if (inString(character, "ヨ")  > 0) {return character_code = 0x1D6;}
  else if (inString(character, "ラ")  > 0) {return character_code = 0x1D7;}
  else if (inString(character, "リ")  > 0) {return character_code = 0x1D8;}
  else if (inString(character, "ル")  > 0) {return character_code = 0x1D9;}
  else if (inString(character, "レ")  > 0) {return character_code = 0x1DA;}
  else if (inString(character, "ロ")  > 0) {return character_code = 0x1DB;}
  else if (inString(character, "ワ")  > 0) {return character_code = 0x1DC;}
  else if (inString(character, "ン")  > 0) {return character_code = 0x1DD;}
  else if (inString(character, "〃")  > 0) {return character_code = 0x1DE;}
  else if (inString(character, "゜")   > 0) {return character_code = 0x1DF;}

  else if (inString(character, "α")  > 0) {return character_code = 0x1E0;}
  else if (inString(character, "ä")  > 0) {return character_code = 0x1E1;}
  else if (inString(character, "ß")  > 0) {return character_code = 0x1E2;}
  else if (inString(character, "ɛ")  > 0) {return character_code = 0x1E3;}
  else if (inString(character, "µ")  > 0) {return character_code = 0x1E4;}
  else if (inString(character, "σ")  > 0) {return character_code = 0x1E5;}
  else if (inString(character, "ρ")  > 0) {return character_code = 0x1E6;}
  else if (inString(character, "√")  > 0) {return character_code = 0x1E8;}
  else if (inString(character, "⊣")  > 0) {return character_code = 0x1E9;}
  else if (inString(character, "¢")  > 0) {return character_code = 0x1EC;}
  else if (inString(character, "₺")  > 0) {return character_code = 0x1ED;}
  else if (inString(character, "ɦ")  > 0) {return character_code = 0x1EE;}
  else if (inString(character, "ö")  > 0) {return character_code = 0x1EF;}

  else if (inString(character, "θ")  > 0) {return character_code = 0x1F2;}
  else if (inString(character, "∞")  > 0) {return character_code = 0x1F3;}
  else if (inString(character, "Ω")  > 0) {return character_code = 0x1F4;}
  else if (inString(character, "ü")  > 0) {return character_code = 0x1F5;}
  else if (inString(character, "∑")  > 0) {return character_code = 0x1F6;}
  else if (inString(character, "π")  > 0) {return character_code = 0x1F7;}
  else if (inString(character, "千") > 0) {return character_code = 0x1FA;}
  else if (inString(character, "万") > 0) {return character_code = 0x1FB;}
  else if (inString(character, "円") > 0) {return character_code = 0x1FC;}
  else if (inString(character, "÷")  > 0) {return character_code = 0x1FD;}
  else if (inString(character, "▮")  > 0) {return character_code = 0x1FF;}

  else if (inString(character, " ")  > 0) {return character_code = 0x120;}
  else                                    {return character_code = 0x120;}

}


// FROM TUTORIAL CODE
// determines whether a given character sequence is in a char array request
// returns 1 if present and -1 if not present
int inString(char request[], char des[])
{

  // printf("inString req: %x\n", request);
  // printf("inString des: %x\n", des);
  if (request[0] == des[0]) {return 1;}
  return -1;

}




// -----------------------------
// HD44780 Initialization (8-bit)
// -----------------------------
void lcd_init(void)
{
    pinMode(E,  GPIO_OUTPUT);
    pinMode(RS, GPIO_OUTPUT);

    pinMode(D0, GPIO_OUTPUT);
    pinMode(D1, GPIO_OUTPUT);
    pinMode(D2, GPIO_OUTPUT);
    pinMode(D3, GPIO_OUTPUT);
    pinMode(D4, GPIO_OUTPUT);
    pinMode(D5, GPIO_OUTPUT);
    pinMode(D6, GPIO_OUTPUT);
    pinMode(D7, GPIO_OUTPUT);

    // Wait >40 ms after power-up
    delay_millis(TIM2, 50);

    // ===== Function Set 0x30 (x3 during initialization) =====
    lcd_cmd_raw(0x30);
    delay_millis(TIM2, 5);

    lcd_cmd_raw(0x30);
    delay_micros(TIM2, 200);

    lcd_cmd_raw(0x30);
    delay_micros(TIM2, 200);

    // ===== Function Set: 8-bit, 2 lines, 5×8 dots (0x38) =====
    lcd_cmd_raw(0x38);
    delay_micros(TIM2, 50);

    // ===== Display OFF (0x08) =====
    lcd_cmd_raw(0x08);
    delay_micros(TIM2, 50);

    // ===== Display Clear (0x01) =====
    lcd_cmd_raw(0x01);
    delay_millis(TIM2, 2);  // Must be >= 1.52ms

    // ===== Entry Mode Set: Increment, No Shift (0x06) =====
    lcd_cmd_raw(0x06);
    delay_micros(TIM2, 50);

    // ===== Display ON, Cursor OFF, Blink OFF (0x0C) =====
    lcd_cmd_raw(0x0C);
    delay_micros(TIM2, 50);
}

// -----------------------------
// Low-level byte writer
// -----------------------------
void lcd_write_bus(uint8_t data)
{
    digitalWrite(D7, (data >> 7) & 1);
    digitalWrite(D6, (data >> 6) & 1);
    digitalWrite(D5, (data >> 5) & 1);
    digitalWrite(D4, (data >> 4) & 1);
    digitalWrite(D3, (data >> 3) & 1);
    digitalWrite(D2, (data >> 2) & 1);
    digitalWrite(D1, (data >> 1) & 1);
    digitalWrite(D0,  data       & 1);

    digitalWrite(E, 1);
    delay_micros(TIM2, 1); // >450ns pulse
    digitalWrite(E, 0);
}

// -----------------------------
// Command (RS=0)
// -----------------------------
void lcd_cmd_raw(uint8_t cmd)
{
    digitalWrite(RS, 0);
    lcd_write_bus(cmd);
}

// -----------------------------
// Data (RS=1)
// -----------------------------
void lcd_data(uint8_t data)
{
    digitalWrite(RS, 1);
    lcd_write_bus(data);
}

// -----------------------------
// Set cursor line/column
// 4×16 displays wrap after col=16
// -----------------------------
void lcd_set_cursor(uint8_t line, uint8_t col)
{
    uint8_t base_addr[] = {0x00, 0x40, 0x10, 0x50};  // 4×16 mapping
    lcd_cmd_raw(0x80 | (base_addr[line] + col));
    delay_micros(TIM2, 50);
}

// -----------------------------
// Example: initialize + print “!”
// -----------------------------
void lcd_test(void)
{
    lcd_init();

    lcd_set_cursor(0, 0);  // Line 0, Column 0

    lcd_data('!');  // ASCII 0x21
}
