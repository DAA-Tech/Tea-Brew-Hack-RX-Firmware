/**************************************************************************************************
 * Project name:
 TEA Brew Hack TX (modified version of SHT11_click firmware)
 * Copyright:
     (c) DAA Technology Solutions, 2015.
 * Revision History:
     20150530: - initial release;
 * Description:
     This code demonstrates how to use mikroBUS board SHT11 click and the tRF Click
     to set up a remote warehouse monitoring system.
     SHT1x semsor uses I2C communication and measures temperature and relative humidity.
     tRF Click transfers data wirelessly using the 866MHz freq band.

 * Test configuration:
     Device:          STM32F407VC
     Oscillator:      8.000MHz
**************************************************************************************************/
//******************************************************************************
//******************************************************************************
sbit RF_STB      at GPIOC_ODR.B5;
sbit RF_RST      at GPIOE_ODR.B4;
sbit LED_GRN     at GPIOD_ODR.B12;
sbit LED_ORNG    at GPIOD_ODR.B13;
sbit LED_RED     at GPIOD_ODR.B14;
sbit LED_BLUE    at GPIOD_ODR.B15;
sbit User_Button at GPIOA_IDR.B0;
//******************************************************************************

//SHT11 connections
sbit SDA_pin_out at GPIOB_ODR.B7;                 // Serial data pin out
sbit SDA_pin_in  at GPIOB_IDR.B7;                 // Serial data pin in
sbit SCL_pin     at GPIOB_ODR.B8;                 // Serial clock pin

// global variables
float temperature;
float rel_humidity;

char Temp_str[40], Old_Temp_str[40];
char Humi_str[40], Old_Humi_str[40];

void Read_SHT11(float *fT, float *fRH);
int oldvalue[2] = {0, 0};

char rxBuff[40];                         // Buffer string for storing data
char rxCnt = 0;                          // Counter for data writen in buffer string
unsigned short Received = 0;             // Received data flag
char lab1[17] = {0};

/**************************************************************************************************
* Init MCU
**************************************************************************************************/
void Init_MCU() {

  // Set PORTB8/7 to Open Drain output mode
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);

  GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_12);                            // LED GREEN
  GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_13);                            // LED ORANGE
  GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_14);                            // LED RED
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15);                           // LED BLUE
  GPIO_Digital_Output(&GPIOC_ODR, _GPIO_PINMASK_5);                             // RF_STB
  GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_4);                             // RF_RST
  GPIO_Digital_Output(&GPIOA_IDR, _GPIO_PINMASK_0);                             // Button

  GPIO_Alternate_Function_Enable(&_GPIO_MODULE_USART2_PA23);
  UART2_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
  Delay_ms(100);

  UART6_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67 );
  Delay_ms(100);
  // Enable Usart Receiver interrupt:
  USART6_CR1bits.RXNEIE = 1;         // enable uart rx interrupt
  NVIC_IntEnable(IVT_INT_USART6);    // enable interrupt vector
  Enableinterrupts();

  RF_STB = 0;
  RF_RST = 0;
  Delay_ms(200);
  RF_RST = 1;
}
/**************************************************************************************************
// Interrupt routine
**************************************************************************************************/
void interrupt() iv IVT_INT_USART6 ics ICS_AUTO {
  char tmp;                              // Temporary variable declaration
    tmp = UART6_Read();                  // Store received data in the temporary variable
    if ((tmp == '\r') || (rxCnt > 40)) { // Check if data counter is larger than the buffer string size
                                         // or the received data is equal to the Carriage Return character
      rxBuff[rxCnt] = 0;                 // Terminate buffer string
      rxCnt = 0;                         // Reset data counter
      Received = 1;                      // Set Received data flag
    }
    else{
      rxBuff[rxCnt] = tmp;               // Populate buffer string with received data
      rxCnt = rxCnt + 1;                 // Increase data counter
    }
}
/**************************************************************************************************
* Transmit result to Receiver
**************************************************************************************************/
void Transmit_results(){
  char i;
  Delay_Ms(2000);
  sprintf(Temp_str, "T: %3.1f degC\r\n RH: %3.1f pct\r\n", temperature, rel_humidity);
  //sprintf(Humi_str, "RH: %3.1f pct\r\n", rel_humidity);
  UART6_Write_Text(Temp_str);
  //UART6_Write_Text(Humi_str);
}
/**************************************************************************************************
* MAIN PROGRAM
**************************************************************************************************/
void main()
{
    Init_MCU();
    // Start the test example
    while(1)                           // Endless loop
    {
      if(Received){                        // If data is received via UART :
        LED_RED = 1;
        Delay_Ms(500);
        LED_RED = 0;
        UART2_Write_Text(rxBuff);
        UART2_Write_Text("\r\n");
        Received = 0;                      // clear received data flag
        Delay_ms(250);                     // wait for 250ms
      }
    }

}
/**************************************************************************************************
* End of File
**************************************************************************************************/