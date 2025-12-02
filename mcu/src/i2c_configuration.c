 /*
Name(s):  Quinn Miyamoto, Mayu Tatsumi
Email(s): qmiyamoto@g.hmc.edu, mtatsumi@g.hmc.edu
Date:     November 22, 2025

Purpose: 
*/
 
#include "../lib/i2c_configuration.h"

// 
void i2c_configuration(void)
{

  // 
  

  // 
  RCC -> APB1ENR1 |= RCC_APB1ENR1_I2C1EN;

  // 
  I2C1 -> CR1 &= ~I2C_CR1_PE;

  // 
  I2C1 -> CR2 &= ~I2C_CR2_ADD10;
  
  // 
  // t_PRESC = (PRESC+1) x t_I2CCLK
  I2C1 -> TIMINGR |= _VAL2FLD(I2C_TIMINGR_PRESC, 0b000);

  // 
  I2C1 -> CR1 |= I2C_CR1_PE;

}

// 
void i2c_write(char address, uint32_t message)
{

  // 
  I2C1 -> CR1 &= ~I2C_CR1_PE;

  // requests a Write transaction
  I2C1 -> CR2 &= ~I2C_CR2_RD_WRN;

  // 
  I2C1 -> CR2 |= _VAL2FLD(I2C_CR2_SADD, address);

  // 
  // If the number of bytes is equal to or greater than 255 bytes, NBYTES[7:0] must initially be filled with 0xFF
  I2C1 -> CR2 |= _VAL2FLD(I2C_CR2_NBYTES, 0b00000000);

  // 
  I2C1 -> CR1 |= I2C_CR1_PE;

  // 
  I2C1 -> CR2 |= I2C_CR2_START;

  // 
  I2C1 -> TXDR |= _VAL2FLD(I2C_TXDR_TXDATA, message);

}