#line 1 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
#line 19 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
extern sfr sbit SDA_pin_out;
extern sfr sbit SDA_pin_in;
extern sfr sbit SCL_pin;




const float C1=-4.0;
const float C2=+0.0405;
const float C3=-0.0000028;
const float Temp1=+0.01;
const float Temp2=+0.00008;
#line 43 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
unsigned char ucSens_Error;

int iSHT_Temp;
int iSHT_Humi;
#line 59 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
void s_transstart()
{

 SDA_pin_out = 1;
 SCL_pin = 0;

 Delay_uS(1);
 SCL_pin = 1;
 Delay_uS(1);

 SDA_pin_out = 0;
 Delay_uS(1);
 SCL_pin = 0;
 Delay_uS(3);
 SCL_pin = 1;
 Delay_uS(1);

 SDA_pin_out = 1;
 Delay_uS(1);
 SCL_pin = 0;
}
#line 84 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
unsigned char s_read_byte(unsigned char ack)
{
 unsigned char i=0x80;
 unsigned char val=0;


 SDA_pin_out = 1;
 SCL_pin = 0;

 while(i)
 {
 SCL_pin = 1;
 Delay_uS(1);
 if (SDA_pin_in == 1)
 {
 val=(val | i);
 }
 SCL_pin = 0;
 Delay_uS(1);
 i=(i>>1);
 }

 if (ack)
 {

 SDA_pin_out = 0;
 }
 else
 {
 SDA_pin_out = 1;
 }

 SCL_pin = 1;
 Delay_uS(3);
 SCL_pin = 0;
 Delay_uS(1);

 SDA_pin_out = 1;
 return (val);
}
#line 128 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
unsigned char s_write_byte(unsigned char value)
{
 unsigned char i=0x80;
 unsigned char error=0;

 while(i)
 {
 if (i & value)
 {
 SDA_pin_out = 1;
 }
 else
 {
 SDA_pin_out = 0;
 }

 SCL_pin = 1;
 Delay_uS(3);
 SCL_pin = 0;
 Delay_uS(3);
 i=(i>>1);
 }

 SDA_pin_out = 1;

 SCL_pin = 1;
 Delay_uS(3);
 if (SDA_pin_in == 1) error = 1;
 Delay_uS(1);
 SCL_pin = 0;

 return(error);
}
#line 168 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
unsigned char s_measure(unsigned int *p_value, unsigned char mode)
{
 unsigned char i=0;
 unsigned char msb,lsb;
 unsigned char checksum;

 *p_value=0;
 s_transstart();

 if(mode)
 {
 mode =  0x05 ;
 }
 else
 {
 mode =  0x03 ;
 }

 if (s_write_byte(mode)) return(1);


 SDA_pin_out = 1;

 while(i<240)
 {
 Delay_mS(1);
 Delay_mS(1);
 Delay_mS(1);
 if (SDA_pin_in == 0)
 {
 i=0;
 break;
 }
 i++;
 }


 if(i) return(2);

 msb=s_read_byte( 1 );
 lsb=s_read_byte( 1 );
 checksum=s_read_byte( 0 );

 *p_value=(msb<<8)|(lsb);

 return(0);
}
#line 221 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
float calc_sth11_temp(unsigned int t)
{
 float t_out;
 t_out = t*0.01 - 40;

 return t_out;
}
#line 234 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
float calc_sth11_humi(unsigned int h, int t)
{
 float rh_lin;
 float rh_true;
 float t_C;

 t_C=t*0.01 - 40;
 rh_lin=C3*h*h + C2*h + C1;
 rh_true=(t_C-25)*(Temp1+Temp2*h)+rh_lin;








 if(rh_true>100)rh_true=100;
 if(rh_true<0.1)rh_true=0.1;

 return rh_true;
}
#line 260 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
void Read_SHT11(float *fT, float *fRH)
{
 unsigned int t;
 unsigned int h;
 float value;

 ucSens_Error = 0;

 ucSens_Error = s_measure(&t, 0);
 iSHT_Temp = (int)(calc_sth11_temp(t) * 10);

 ucSens_Error = s_measure(&h, 1);
 iSHT_Humi = (int)(calc_sth11_humi(h, t) * 10);

 value = (float)iSHT_Temp;
 *fT = value / 10;
 value = (float)iSHT_Humi;
 *fRH = value / 10;
}
#line 283 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
char s_read_statusreg(unsigned char *p_value)
{
 unsigned char checksum = 0;

 s_transstart();
 if(s_write_byte( 0x07 )) return 1;
 *p_value=s_read_byte( 1 );
 checksum=s_read_byte( 0 );

 return 0;
}
#line 300 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
char s_write_statusreg(unsigned char value)
{
 s_transstart();
 if(s_write_byte( 0x06 )) return 1;
 if(s_write_byte(value)) return 1;

 return 0;
}
#line 316 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
void s_connectionreset()
{
 unsigned char i;

 SDA_pin_out = 1;
 SCL_pin = 0;

 for(i=0; i<9; i++)
 {
 SCL_pin = 1;
 Delay_uS(3);
 SCL_pin = 0;
 Delay_uS(3);
 }

 s_transstart();
}
#line 337 "C:/Users/ayo/Downloads/Tea Brew Hack Firmware/SHT11_driver.c"
unsigned char s_softreset(void)
{
 s_connectionreset();

 return (s_write_byte( 0x1e ));
}
