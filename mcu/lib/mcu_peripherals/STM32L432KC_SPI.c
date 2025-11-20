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
void initSPI(int br, int cpol, int cpha) {

  // enables the SPI1 peripheral
  RCC -> APB2ENR |= RCC_APB2ENR_SPI1EN;

  // enables alternate functions for the desired GPIO pins 
  GPIOB -> AFR[0] &= ~((0xF << 12) | (0xF << 16) | (0xF << 20));  // clears the register
  GPIOB -> AFR[0] |= _VAL2FLD(GPIO_AFRL_AFSEL3, 0b0101);          // sets the necessary bits accordingly
  GPIOB -> AFR[0] |= _VAL2FLD(GPIO_AFRL_AFSEL4, 0b0101);          // sets the necessary bits accordingly
  GPIOB -> AFR[0] |= _VAL2FLD(GPIO_AFRL_AFSEL5, 0b0101);          // sets the necessary bits accordingly

  // sets the baud rate to a value of the user's choosing
  SPI1 -> CR1 |= (br << 3);

  // sets the clock polarity and clock phase to values of the user's choosing
  SPI1 -> CR1 &= ~((1 << 1) | (1 << 0));          // clears the register
  SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_CPOL, cpol);    // sets the necessary bits accordingly
  SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_CPHA, cpha);    // sets the necessary bits accordingly
  
  // selects a data frame format
  SPI1 -> CR2 |= _VAL2FLD(SPI_CR2_DS, 0b1111);

  // generates RXNE events for 16-bit data
  SPI1 -> CR2 &= ~SPI_CR2_FRXTH;

  // sends the MSB first
  SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_LSBFIRST, 0);

  // configures pin as a manually toggle-able CE signal
  SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_SSM, 1); SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_SSI, 1); SPI1 -> CR2 |= _VAL2FLD(SPI_CR2_NSSP, 0);

  // initially assigns SPI pins
  pinMode(SPI_SCK, GPIO_INPUT); // SPI1_SCK
  //pinMode(SPI_SCK, GPIO_ALT); // SPI1_SCK
  //GPIOB -> OSPEEDR |= (GPIO_OSPEEDR_OSPEED3);
  pinMode(SPI_MISO, GPIO_ALT);  // SPI1_MISO
  pinMode(SPI_MOSI, GPIO_ALT);  // SPI1_MOSI
  pinMode(SPI_CE, GPIO_OUTPUT); //  Manual CS

  // asserts the MCU as the peripheral
  SPI1 -> CR1 &= ~SPI_CR1_MSTR; SPI1 -> CR1 |= SPI_CR1_RXONLY;
  //SPI1 -> CR1 |= SPI_CR1_MSTR;

  // allows SPI to work in multi-master environments
  SPI1 -> CR2 &= ~SPI_CR2_SSOE;

  // enables the generation of DMA requests whenever the RXNE flag is set
  SPI1 -> CR2 |= SPI_CR2_RXDMAEN;

  // enables SPI
  SPI1 -> CR1 |= _VAL2FLD(SPI_CR1_SPE, 1);

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