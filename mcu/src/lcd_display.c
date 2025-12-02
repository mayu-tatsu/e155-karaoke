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

  // allows buffer time for Vdd to reach > 4.5 V
  delay_millis(TIM2, 45);   // wait time: > 40 ms

  // ensures proper LCD reset with three 0x30 commands and specific delays
  lcd_display_write(0x30);
  delay_millis(TIM2, 5);    // wait time: > 4.1 ms
  lcd_display_write(0x30);
  delay_micros(TIM2, 200);  // wait time: > 100 us
  lcd_display_write(0x30);
  delay_micros(TIM2, 200);

  // sets 8-bit mode
  lcd_display_write(0x30);
  delay_micros(TIM2, 200);

  // configures display: 8-bit, 2-line, 5x8 font
  lcd_display_write(0x38);
  delay_micros(TIM2, 200);

  // turns display off
  lcd_display_write(0x08);
  delay_micros(TIM2, 1500);

  // clears display
  lcd_display_write(0x01);
  delay_micros(TIM2, 1500);
  delay_micros(TIM2, 1500);

  // sets entry mode: enables display, cursor, and cursor blink
  lcd_display_write(0x06);
  delay_millis(TIM2, 1);

  // turns display back on
  lcd_display_write(0x0F);
  delay_millis(TIM2, 2);




  // --------------------------------------------------------------------------------
  
  // writes address
  //lcd_display_write(0b010000000);
  lcd_display_write(0x80);
  delay_millis(TIM2, 1);

  // writes "µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!µ!"
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);
  lcd_display_write(0x1E4);
  delay_millis(TIM2, 1);
  lcd_display_write(0x121);
  delay_millis(TIM2, 1);

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
// µ: 0x1E4
// !: 0x121




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
