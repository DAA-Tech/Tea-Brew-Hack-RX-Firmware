#line 1 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
#line 1 "c:/users/ayo/downloads/tea brew hack firmware/resources.h"
#line 21 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
sbit SDA_pin_out at GPIOB_ODR.B7;
sbit SDA_pin_in at GPIOB_IDR.B7;
sbit SCL_pin at GPIOB_ODR.B6;


char txt1[] = "mikroElektronika";
char txt2[] = "SHT11 click";


float temperature;
float rel_humidity;

char Temp_str[16], Old_Temp_str[16];
char Humi_str[16], Old_Humi_str[16];

void Read_SHT11(float *fT, float *fRH);
int oldvalue[2] = {0, 0};
#line 42 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
void DrawScr(){
#line 54 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
}
#line 59 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
void Transmit_results(){
 char i;

 sprintf(Temp_str, "T: %3.1f degC", temperature);
 sprintf(Humi_str, "RH: %3.1f pct", rel_humidity);
#line 75 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
 for (i = 0; i < 16; i++){
 Old_Temp_str[i] = Temp_str[i];
 Old_Humi_str[i] = Humi_str[i];
 }
}
#line 84 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_click.c"
void main()
{

 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_6, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);

 SDA_pin_out = 1;

 while(1)
 {
 Read_SHT11(&temperature, &rel_humidity);
 Transmit_results();
 Delay_ms(800);
 }
}
