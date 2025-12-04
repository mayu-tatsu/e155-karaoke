// STM32L432KC_SPI.c
// Source code for SPI functions

#include "STM32L432KC.h"
#include "STM32L432KC_SPI.h"
#include "STM32L432KC_GPIO.h"
#include "STM32L432KC_RCC.h"

/* Enables the SPI peripheral and intializes its clock speed (baud rate), polarity, and phase.
 *    -- br: (0b000 - 0b111). The SPI clk will be the master clock / 2^(BR+1).
 *    -- cpol: clock polarity (0: inactive state is logical 0, 1: inactive state is logical 1).
 *    -- cpha: clock phase (0: data captured on leading edge of clk and changed on next edge, 
 *          1: data changed on leading edge of clk and captured on next edge)
 * Refer to the datasheet for more low-level details. */ 
void initSPI(int br, int cpol, int cpha)
{

  // Enable SPI1 peripheral
  RCC -> APB2ENR |= RCC_APB2ENR_SPI1EN;

  // Force PB5 (MISO) to safe input mode
  GPIOB->MODER &= ~(0b11 << (5 * 2));

  // Enable alternate functions
  GPIOB->AFR[0] &= ~((0xF << 12) | (0xF << 16) | (0xF << 20));    // clears registers
  GPIOB->AFR[0] |= _VAL2FLD(GPIO_AFRL_AFSEL3, 0b0101);            // PB3 = SCK
  GPIOB->AFR[0] |= _VAL2FLD(GPIO_AFRL_AFSEL4, 0b0101);            // PB4 = MOSI

  // Clear CR1
  SPI1->CR1 = 0;

  // set SPI Mode 0 (based on params)
  // SPI1 -> CR1 |= (br << 3);                     // set baud rate (param); unecessary for this config
  SPI1->CR1 |= _VAL2FLD(SPI_CR1_CPOL, cpol);    // set cpol (param)
  SPI1->CR1 |= _VAL2FLD(SPI_CR1_CPHA, cpha);    // set cpha (param)

  // FPGA is controller, MCU peripheral
  SPI1->CR1 &= ~SPI_CR1_MSTR;            // Slave mode
  SPI1->CR1 |= SPI_CR1_BIDIMODE;         // ← BIDIRECTIONAL (single wire) mode
  SPI1->CR1 &= ~SPI_CR1_BIDIOE;          // ← Receive only (disable output)

  SPI1->CR1 &= ~SPI_CR1_LSBFIRST;        // MSB first
  SPI1->CR1 |= SPI_CR1_SSM;              // Software NSS
  SPI1->CR1 &= ~SPI_CR1_SSI;             // NSS = 0

  // Clear CR2
  SPI1->CR2 = 0;

  SPI1->CR2 |= _VAL2FLD(SPI_CR2_DS, 0b1111);   // 16-bit data
  SPI1->CR2 &= ~SPI_CR2_FRXTH;                 // 16-bit threshold
  SPI1->CR2 &= ~SPI_CR2_SSOE;                  // No NSS output
  SPI1->CR2 |= SPI_CR2_RXDMAEN;                // DMA on RX

  // Assign GPIO pins as SPI
  pinMode(SPI_SCK, GPIO_ALT);   // SCK: PB3
  pinMode(SPI_MOSI, GPIO_ALT);  // MOSI: PB4

  // Clear all pull up/down resistors
  GPIOB->PUPDR &= ~((0b11 << (3 * 2)) | (0b11 << (4 * 2)) | (0b11 << (5 * 2)));

  // Fast for SCK, MOSI
  GPIOB->OSPEEDR |= (GPIO_OSPEEDR_OSPEED3 | GPIO_OSPEEDR_OSPEED4);

  // Enable SPI
  SPI1->CR1 |= SPI_CR1_SPE;

}

/* Transmits a character (1 byte) over SPI and returns the received character.
 *    -- send: the character to send over SPI
 *    -- return: the character received over SPI */
uint16_t spiSendReceive(uint16_t send) {
    //while(!(SPI1->SR & SPI_SR_TXE)); // Wait until the transmit buffer is empty
    //*(volatile uint16_t *) (&SPI1->DR) = send; // Transmit the character over SPI
    while(!(SPI1->SR & SPI_SR_RXNE)); // Wait until data has been received
    uint16_t rec = (volatile uint16_t) SPI1->DR;
    return rec; // Return received character
}