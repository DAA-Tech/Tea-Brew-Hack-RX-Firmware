#line 1 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
#line 20 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
sbit RF_STB at GPIOC_ODR.B5;
sbit RF_RST at GPIOE_ODR.B4;
sbit LED_GRN at GPIOD_ODR.B12;
sbit LED_ORNG at GPIOD_ODR.B13;
sbit LED_RED at GPIOD_ODR.B14;
sbit LED_BLUE at GPIOD_ODR.B15;
sbit User_Button at GPIOA_IDR.B0;



sbit SDA_pin_out at GPIOB_ODR.B7;
sbit SDA_pin_in at GPIOB_IDR.B7;
sbit SCL_pin at GPIOB_ODR.B8;


float temperature;
float rel_humidity;

char Temp_str[40], Old_Temp_str[40];
char Humi_str[40], Old_Humi_str[40];

void Read_SHT11(float *fT, float *fRH);
int oldvalue[2] = {0, 0};

char rxBuff[40];
char rxCnt = 0;
unsigned short Received = 0;
char lab1[17] = {0};
#line 52 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
void Init_MCU() {


 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);

 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_12);
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_13);
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_14);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOC_ODR, _GPIO_PINMASK_5);
 GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_4);
 GPIO_Digital_Output(&GPIOA_IDR, _GPIO_PINMASK_0);

 GPIO_Alternate_Function_Enable(&_GPIO_MODULE_USART2_PA23);
 UART2_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
 Delay_ms(100);

 UART6_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67 );
 Delay_ms(100);

 USART6_CR1bits.RXNEIE = 1;
 NVIC_IntEnable(IVT_INT_USART6);
 Enableinterrupts();

 RF_STB = 0;
 RF_RST = 0;
 Delay_ms(200);
 RF_RST = 1;
}
#line 85 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
void interrupt() iv IVT_INT_USART6 ics ICS_AUTO {
 char tmp;
 tmp = UART6_Read();
 if ((tmp == '\r') || (rxCnt > 40)) {

 rxBuff[rxCnt] = 0;
 rxCnt = 0;
 Received = 1;
 }
 else{
 rxBuff[rxCnt] = tmp;
 rxCnt = rxCnt + 1;
 }
}
#line 102 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
void Transmit_results(){
 char i;
 Delay_Ms(2000);
 sprintf(Temp_str, "T: %3.1f degC\r\n RH: %3.1f pct\r\n", temperature, rel_humidity);

 UART6_Write_Text(Temp_str);

}
#line 113 "C:/Users/Ayodele/Google Drive/DAA STEM Academy/Hack Software/Tea Brew Hack Firmware/Tea Brew Hack RX Firmware/SHT11_click.c"
void main()
{
 Init_MCU();

 while(1)
 {
 if(Received){
 LED_RED = 1;
 Delay_Ms(500);
 LED_RED = 0;
 UART2_Write_Text(rxBuff);
 UART2_Write_Text("\r\n");
 Received = 0;
 Delay_ms(250);
 }
 }

}
