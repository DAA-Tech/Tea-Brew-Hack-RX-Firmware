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
#include "resources.h"

//SHT11 connections
sbit SDA_pin_out at GPIOB_ODR.B7;                 // Serial data pin out
sbit SDA_pin_in  at GPIOB_IDR.B7;                 // Serial data pin in
sbit SCL_pin     at GPIOB_ODR.B6;                 // Serial clock pin

// Lcd constants
char txt1[] = "mikroElektronika";
char txt2[] = "SHT11 click";

// global variables
float temperature;
float rel_humidity;

char Temp_str[16], Old_Temp_str[16];
char Humi_str[16], Old_Humi_str[16];

void Read_SHT11(float *fT, float *fRH);
int oldvalue[2] = {0, 0};

/**************************************************************************************************
* Draw Screen
**************************************************************************************************/
void DrawScr(){
/*TFT_Fill_Screen(CL_WHITE);
  TFT_Set_Pen(CL_Black, 1);
  TFT_Line(20, 220, 300, 220);
  TFT_LIne(20,  46, 300,  46);
  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("SHT1X click  TEST", 75, 14);
  TFT_Set_Font(&Verdana12x13_Regular, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("EasyMX PRO v7", 19, 223);
  TFT_Set_Font(&Verdana12x13_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("www.mikroe.com", 200, 223);
  TFT_Set_Font(&TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);*/
}

/**************************************************************************************************
* displays result on TFT
**************************************************************************************************/
void Transmit_results(){
  char i;
  
  sprintf(Temp_str, "T: %3.1f degC", temperature);
  sprintf(Humi_str, "RH: %3.1f pct", rel_humidity);
  
/*TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_WHITE, FO_HORIZONTAL);
  TFT_Write_Text(Old_Temp_str, 20, 85);
  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text(Temp_str, 20, 85);

  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_WHITE, FO_HORIZONTAL);
  TFT_Write_Text(Old_Humi_str, 20, 145);
  TFT_Set_Font(&HandelGothic_BT21x22_Regular, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text(Humi_str, 20, 145);*/
  
  for (i = 0; i < 16; i++){
    Old_Temp_str[i] = Temp_str[i];
    Old_Humi_str[i] = Humi_str[i];
  }
}

/**************************************************************************************************
* MAIN PROGRAM
**************************************************************************************************/
void main()
{
  // Set PORTB6/7 to Open Drain output mode
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_6, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
  GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
  
  SDA_pin_out = 1;
  // Start the test example
  while(1)                           // Endless loop
  {
    Read_SHT11(&temperature, &rel_humidity);
    Transmit_results();
    Delay_ms(800);                   // delay 800ms
  }
}

/**************************************************************************************************
* End of File
**************************************************************************************************/