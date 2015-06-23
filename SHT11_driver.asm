_s_transstart:
;SHT11_driver.c,59 :: 		void s_transstart()
;SHT11_driver.c,62 :: 		SDA_pin_out = 1;                       //release DATA-line
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SDA_pin_out+0)
MOVT	R0, #hi_addr(SDA_pin_out+0)
STR	R1, [R0, #0]
;SHT11_driver.c,63 :: 		SCL_pin = 0;                           // SCL Low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,65 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_transstart0:
SUBS	R7, R7, #1
BNE	L_s_transstart0
NOP
NOP
;SHT11_driver.c,66 :: 		SCL_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,67 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_transstart2:
SUBS	R7, R7, #1
BNE	L_s_transstart2
NOP
NOP
;SHT11_driver.c,69 :: 		SDA_pin_out = 0;                       // SDA low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SDA_pin_out+0)
MOVT	R0, #hi_addr(SDA_pin_out+0)
STR	R1, [R0, #0]
;SHT11_driver.c,70 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_transstart4:
SUBS	R7, R7, #1
BNE	L_s_transstart4
NOP
NOP
;SHT11_driver.c,71 :: 		SCL_pin = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,72 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_transstart6:
SUBS	R7, R7, #1
BNE	L_s_transstart6
NOP
NOP
NOP
;SHT11_driver.c,73 :: 		SCL_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,74 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_transstart8:
SUBS	R7, R7, #1
BNE	L_s_transstart8
NOP
NOP
;SHT11_driver.c,76 :: 		SDA_pin_out = 1;                       //release DATA-line
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SDA_pin_out+0)
MOVT	R0, #hi_addr(SDA_pin_out+0)
STR	R1, [R0, #0]
;SHT11_driver.c,77 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_transstart10:
SUBS	R7, R7, #1
BNE	L_s_transstart10
NOP
NOP
;SHT11_driver.c,78 :: 		SCL_pin = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,79 :: 		}
L_end_s_transstart:
BX	LR
; end of _s_transstart
_s_read_byte:
;SHT11_driver.c,84 :: 		unsigned char s_read_byte(unsigned char ack)
; ack start address is: 0 (R0)
; ack end address is: 0 (R0)
; ack start address is: 0 (R0)
;SHT11_driver.c,86 :: 		unsigned char i=0x80;
; i start address is: 12 (R3)
MOVS	R3, #128
;SHT11_driver.c,87 :: 		unsigned char val=0;
; val start address is: 16 (R4)
MOVS	R4, #0
;SHT11_driver.c,90 :: 		SDA_pin_out = 1;        //release DATA-line
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,91 :: 		SCL_pin = 0;            // SCL Low
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
; ack end address is: 0 (R0)
; val end address is: 16 (R4)
; i end address is: 12 (R3)
;SHT11_driver.c,93 :: 		while(i)                //shift bit for masking
L_s_read_byte12:
; val start address is: 16 (R4)
; i start address is: 12 (R3)
; ack start address is: 0 (R0)
CMP	R3, #0
IT	EQ
BEQ	L_s_read_byte13
;SHT11_driver.c,95 :: 		SCL_pin = 1;          //clk for SENSI-BUS
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,96 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_read_byte14:
SUBS	R7, R7, #1
BNE	L_s_read_byte14
NOP
NOP
;SHT11_driver.c,97 :: 		if (SDA_pin_in == 1)
MOVW	R2, #lo_addr(SDA_pin_in+0)
MOVT	R2, #hi_addr(SDA_pin_in+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L__s_read_byte63
;SHT11_driver.c,99 :: 		val=(val | i);      //read bit
ORRS	R4, R3
UXTB	R4, R4
; val end address is: 16 (R4)
;SHT11_driver.c,100 :: 		}
IT	AL
BAL	L_s_read_byte16
L__s_read_byte63:
;SHT11_driver.c,97 :: 		if (SDA_pin_in == 1)
;SHT11_driver.c,100 :: 		}
L_s_read_byte16:
;SHT11_driver.c,101 :: 		SCL_pin = 0;
; val start address is: 16 (R4)
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,102 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_read_byte17:
SUBS	R7, R7, #1
BNE	L_s_read_byte17
NOP
NOP
;SHT11_driver.c,103 :: 		i=(i>>1);
LSRS	R3, R3, #1
UXTB	R3, R3
;SHT11_driver.c,104 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_s_read_byte12
L_s_read_byte13:
;SHT11_driver.c,106 :: 		if (ack)
CMP	R0, #0
IT	EQ
BEQ	L_s_read_byte19
; ack end address is: 0 (R0)
;SHT11_driver.c,109 :: 		SDA_pin_out = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,110 :: 		}
IT	AL
BAL	L_s_read_byte20
L_s_read_byte19:
;SHT11_driver.c,113 :: 		SDA_pin_out = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,114 :: 		}
L_s_read_byte20:
;SHT11_driver.c,116 :: 		SCL_pin = 1;            //clk #9 for ack
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,117 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_read_byte21:
SUBS	R7, R7, #1
BNE	L_s_read_byte21
NOP
NOP
NOP
;SHT11_driver.c,118 :: 		SCL_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,119 :: 		Delay_uS(1);
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_read_byte23:
SUBS	R7, R7, #1
BNE	L_s_read_byte23
NOP
NOP
;SHT11_driver.c,121 :: 		SDA_pin_out = 1;        //release DATA-line
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,122 :: 		return (val);
UXTB	R0, R4
; val end address is: 16 (R4)
;SHT11_driver.c,123 :: 		}
L_end_s_read_byte:
BX	LR
; end of _s_read_byte
_s_write_byte:
;SHT11_driver.c,128 :: 		unsigned char s_write_byte(unsigned char value)
; value start address is: 0 (R0)
UXTB	R1, R0
; value end address is: 0 (R0)
; value start address is: 4 (R1)
;SHT11_driver.c,130 :: 		unsigned char i=0x80;
; i start address is: 16 (R4)
MOVS	R4, #128
;SHT11_driver.c,131 :: 		unsigned char error=0;
; error start address is: 0 (R0)
MOVS	R0, #0
; value end address is: 4 (R1)
; i end address is: 16 (R4)
; error end address is: 0 (R0)
UXTB	R3, R1
;SHT11_driver.c,133 :: 		while(i)
L_s_write_byte25:
; error start address is: 0 (R0)
; value start address is: 12 (R3)
; i start address is: 16 (R4)
; value start address is: 12 (R3)
; value end address is: 12 (R3)
CMP	R4, #0
IT	EQ
BEQ	L_s_write_byte26
; value end address is: 12 (R3)
;SHT11_driver.c,135 :: 		if (i & value)
; value start address is: 12 (R3)
AND	R1, R4, R3, LSL #0
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_s_write_byte27
;SHT11_driver.c,137 :: 		SDA_pin_out = 1;    //masking value with i , write to SENSI-BUS
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,138 :: 		}
IT	AL
BAL	L_s_write_byte28
L_s_write_byte27:
;SHT11_driver.c,141 :: 		SDA_pin_out = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,142 :: 		}
L_s_write_byte28:
;SHT11_driver.c,144 :: 		SCL_pin = 1;          //clk for SENSI-BUS
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,145 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_write_byte29:
SUBS	R7, R7, #1
BNE	L_s_write_byte29
NOP
NOP
NOP
;SHT11_driver.c,146 :: 		SCL_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,147 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_write_byte31:
SUBS	R7, R7, #1
BNE	L_s_write_byte31
NOP
NOP
NOP
;SHT11_driver.c,148 :: 		i=(i>>1);
LSRS	R4, R4, #1
UXTB	R4, R4
;SHT11_driver.c,149 :: 		}
; value end address is: 12 (R3)
; i end address is: 16 (R4)
IT	AL
BAL	L_s_write_byte25
L_s_write_byte26:
;SHT11_driver.c,151 :: 		SDA_pin_out = 1;        //release DATA-line
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(SDA_pin_out+0)
MOVT	R1, #hi_addr(SDA_pin_out+0)
STR	R2, [R1, #0]
;SHT11_driver.c,153 :: 		SCL_pin = 1;            //clk #9 for ack
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,154 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_write_byte33:
SUBS	R7, R7, #1
BNE	L_s_write_byte33
NOP
NOP
NOP
;SHT11_driver.c,155 :: 		if (SDA_pin_in == 1)  error = 1; //check ack (DATA will be pulled down by SHT11)
MOVW	R2, #lo_addr(SDA_pin_in+0)
MOVT	R2, #hi_addr(SDA_pin_in+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	EQ
BEQ	L__s_write_byte64
MOVS	R0, #1
; error end address is: 0 (R0)
IT	AL
BAL	L_s_write_byte35
L__s_write_byte64:
L_s_write_byte35:
;SHT11_driver.c,156 :: 		Delay_uS(1);
; error start address is: 0 (R0)
MOVW	R7, #1
MOVT	R7, #0
NOP
NOP
L_s_write_byte36:
SUBS	R7, R7, #1
BNE	L_s_write_byte36
NOP
NOP
;SHT11_driver.c,157 :: 		SCL_pin = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(SCL_pin+0)
MOVT	R1, #hi_addr(SCL_pin+0)
STR	R2, [R1, #0]
;SHT11_driver.c,159 :: 		return(error); //error=1 in case of no acknowledge
; error end address is: 0 (R0)
;SHT11_driver.c,160 :: 		}
L_end_s_write_byte:
BX	LR
; end of _s_write_byte
_s_measure:
;SHT11_driver.c,168 :: 		unsigned char s_measure(unsigned int *p_value, unsigned char mode)
; mode start address is: 4 (R1)
; p_value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTB	R3, R1
; mode end address is: 4 (R1)
; p_value end address is: 0 (R0)
; p_value start address is: 20 (R5)
; mode start address is: 12 (R3)
;SHT11_driver.c,170 :: 		unsigned char i=0;
; i start address is: 24 (R6)
MOVS	R6, #0
;SHT11_driver.c,174 :: 		*p_value=0;
MOVS	R2, #0
STRH	R2, [R5, #0]
;SHT11_driver.c,175 :: 		s_transstart(); //transmission start
BL	_s_transstart+0
;SHT11_driver.c,177 :: 		if(mode)
CMP	R3, #0
IT	EQ
BEQ	L_s_measure38
; mode end address is: 12 (R3)
;SHT11_driver.c,179 :: 		mode = MEASURE_HUMI;
; mode start address is: 0 (R0)
MOVS	R0, #5
;SHT11_driver.c,180 :: 		}
; mode end address is: 0 (R0)
IT	AL
BAL	L_s_measure39
L_s_measure38:
;SHT11_driver.c,183 :: 		mode = MEASURE_TEMP;
; mode start address is: 0 (R0)
MOVS	R0, #3
; mode end address is: 0 (R0)
;SHT11_driver.c,184 :: 		}
L_s_measure39:
;SHT11_driver.c,186 :: 		if (s_write_byte(mode)) return(1);
; mode start address is: 0 (R0)
; mode end address is: 0 (R0)
BL	_s_write_byte+0
CMP	R0, #0
IT	EQ
BEQ	L_s_measure40
; i end address is: 24 (R6)
; p_value end address is: 20 (R5)
MOVS	R0, #1
IT	AL
BAL	L_end_s_measure
L_s_measure40:
;SHT11_driver.c,189 :: 		SDA_pin_out = 1;               //release DATA-line
; p_value start address is: 20 (R5)
; i start address is: 24 (R6)
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(SDA_pin_out+0)
MOVT	R2, #hi_addr(SDA_pin_out+0)
STR	R3, [R2, #0]
; i end address is: 24 (R6)
; p_value end address is: 20 (R5)
UXTB	R0, R6
;SHT11_driver.c,191 :: 		while(i<240)
L_s_measure41:
; i start address is: 0 (R0)
; p_value start address is: 20 (R5)
CMP	R0, #240
IT	CS
BCS	L__s_measure65
;SHT11_driver.c,193 :: 		Delay_mS(1);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_s_measure43:
SUBS	R7, R7, #1
BNE	L_s_measure43
NOP
NOP
;SHT11_driver.c,194 :: 		Delay_mS(1);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_s_measure45:
SUBS	R7, R7, #1
BNE	L_s_measure45
NOP
NOP
;SHT11_driver.c,195 :: 		Delay_mS(1);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_s_measure47:
SUBS	R7, R7, #1
BNE	L_s_measure47
NOP
NOP
;SHT11_driver.c,196 :: 		if (SDA_pin_in == 0)
MOVW	R3, #lo_addr(SDA_pin_in+0)
MOVT	R3, #hi_addr(SDA_pin_in+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L_s_measure49
;SHT11_driver.c,198 :: 		i=0;
MOVS	R0, #0
;SHT11_driver.c,199 :: 		break;
IT	AL
BAL	L_s_measure42
;SHT11_driver.c,200 :: 		}
L_s_measure49:
;SHT11_driver.c,201 :: 		i++;
ADDS	R0, R0, #1
UXTB	R0, R0
;SHT11_driver.c,202 :: 		}
; i end address is: 0 (R0)
IT	AL
BAL	L_s_measure41
L__s_measure65:
;SHT11_driver.c,191 :: 		while(i<240)
;SHT11_driver.c,202 :: 		}
L_s_measure42:
;SHT11_driver.c,205 :: 		if(i) return(2);
; i start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_s_measure50
; p_value end address is: 20 (R5)
; i end address is: 0 (R0)
MOVS	R0, #2
IT	AL
BAL	L_end_s_measure
L_s_measure50:
;SHT11_driver.c,207 :: 		msb=s_read_byte(ACK); //read the first byte (MSB)
; p_value start address is: 20 (R5)
MOVS	R0, #1
BL	_s_read_byte+0
; msb start address is: 24 (R6)
UXTB	R6, R0
;SHT11_driver.c,208 :: 		lsb=s_read_byte(ACK); //read the second byte (LSB)
MOVS	R0, #1
BL	_s_read_byte+0
; lsb start address is: 32 (R8)
UXTB	R8, R0
;SHT11_driver.c,209 :: 		checksum=s_read_byte(noACK);                //read checksum (8-bit)
MOVS	R0, #0
BL	_s_read_byte+0
;SHT11_driver.c,211 :: 		*p_value=(msb<<8)|(lsb);
LSLS	R2, R6, #8
UXTH	R2, R2
; msb end address is: 24 (R6)
ORR	R2, R2, R8, LSL #0
; lsb end address is: 32 (R8)
STRH	R2, [R5, #0]
; p_value end address is: 20 (R5)
;SHT11_driver.c,213 :: 		return(0);
MOVS	R0, #0
;SHT11_driver.c,214 :: 		}
L_end_s_measure:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _s_measure
_calc_sth11_temp:
;SHT11_driver.c,221 :: 		float calc_sth11_temp(unsigned int t)
; t start address is: 0 (R0)
; t end address is: 0 (R0)
; t start address is: 0 (R0)
;SHT11_driver.c,224 :: 		t_out =  t*0.01 - 40;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
; t end address is: 0 (R0)
MOVW	R1, #55050
MOVT	R1, #15395
VMOV	S0, R1
VMUL.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #16928
VMOV	S0, R1
VSUB.F32	S0, S1, S0
;SHT11_driver.c,226 :: 		return t_out;
VMOV.F32	S0, S0
;SHT11_driver.c,227 :: 		}
L_end_calc_sth11_temp:
BX	LR
; end of _calc_sth11_temp
_calc_sth11_humi:
;SHT11_driver.c,234 :: 		float calc_sth11_humi(unsigned int h, int t)
; t start address is: 4 (R1)
; h start address is: 0 (R0)
; t end address is: 4 (R1)
; h end address is: 0 (R0)
; h start address is: 0 (R0)
; t start address is: 4 (R1)
;SHT11_driver.c,240 :: 		t_C=t*0.01 - 40;                          //calc. temperature from ticks to [°C]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
; t end address is: 4 (R1)
MOVW	R2, #55050
MOVT	R2, #15395
VMOV	S0, R2
VMUL.F32	S1, S1, S0
MOVW	R2, #0
MOVT	R2, #16928
VMOV	S0, R2
VSUB.F32	S2, S1, S0
;SHT11_driver.c,241 :: 		rh_lin=C3*h*h + C2*h + C1;                //calc. humidity from ticks to [%RH]
VMOV	S4, R0
VCVT.F32	#0, S4, S4
; h end address is: 0 (R0)
MOVW	R2, #59298
MOVT	R2, #46651
VMOV	S0, R2
VMUL.F32	S0, S0, S4
VMUL.F32	S1, S0, S4
MOVW	R2, #58196
MOVT	R2, #15653
VMOV	S0, R2
VMUL.F32	S0, S0, S4
VADD.F32	S1, S1, S0
VMOV.F32	S0, #-4
VADD.F32	S3, S1, S0
;SHT11_driver.c,242 :: 		rh_true=(t_C-25)*(Temp1+Temp2*h)+rh_lin;        //calc. temperature compensated humidity
VMOV.F32	S0, #25
VSUB.F32	S2, S2, S0
MOVW	R2, #50604
MOVT	R2, #14503
VMOV	S0, R2
VMUL.F32	S1, S0, S4
MOVW	R2, #55050
MOVT	R2, #15395
VMOV	S0, R2
VADD.F32	S0, S0, S1
VMUL.F32	S0, S2, S0
VADD.F32	S1, S0, S3
; rh_true start address is: 8 (R2)
VMOV.F32	S2, S1
;SHT11_driver.c,251 :: 		if(rh_true>100)rh_true=100;               //cut if the value is outside of
MOVW	R2, #0
MOVT	R2, #17096
VMOV	S0, R2
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L__calc_sth11_humi66
; rh_true end address is: 8 (R2)
MOVW	R2, #0
MOVT	R2, #17096
; rh_true start address is: 4 (R1)
VMOV	S1, R2
; rh_true end address is: 4 (R1)
IT	AL
BAL	L_calc_sth11_humi51
L__calc_sth11_humi66:
VMOV.F32	S1, S2
L_calc_sth11_humi51:
;SHT11_driver.c,252 :: 		if(rh_true<0.1)rh_true=0.1;               //the physical possible range
; rh_true start address is: 4 (R1)
MOVW	R2, #52429
MOVT	R2, #15820
VMOV	S0, R2
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__calc_sth11_humi67
; rh_true end address is: 4 (R1)
MOVW	R2, #52429
MOVT	R2, #15820
; rh_true start address is: 0 (R0)
VMOV	S0, R2
; rh_true end address is: 0 (R0)
IT	AL
BAL	L_calc_sth11_humi52
L__calc_sth11_humi67:
VMOV.F32	S0, S1
L_calc_sth11_humi52:
;SHT11_driver.c,254 :: 		return rh_true;
; rh_true start address is: 0 (R0)
; rh_true end address is: 0 (R0)
;SHT11_driver.c,255 :: 		}
L_end_calc_sth11_humi:
BX	LR
; end of _calc_sth11_humi
_Read_SHT11:
;SHT11_driver.c,260 :: 		void Read_SHT11(float *fT, float *fRH)
; fRH start address is: 4 (R1)
; fT start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R9, R0
MOV	R10, R1
; fRH end address is: 4 (R1)
; fT end address is: 0 (R0)
; fT start address is: 36 (R9)
; fRH start address is: 40 (R10)
;SHT11_driver.c,266 :: 		ucSens_Error = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_ucSens_Error+0)
MOVT	R2, #hi_addr(_ucSens_Error+0)
STRB	R3, [R2, #0]
;SHT11_driver.c,268 :: 		ucSens_Error = s_measure(&t, 0);
ADD	R2, SP, #4
MOVS	R1, #0
MOV	R0, R2
BL	_s_measure+0
MOVW	R2, #lo_addr(_ucSens_Error+0)
MOVT	R2, #hi_addr(_ucSens_Error+0)
STRB	R0, [R2, #0]
;SHT11_driver.c,269 :: 		iSHT_Temp = (int)(calc_sth11_temp(t) * 10);
LDRH	R0, [SP, #4]
BL	_calc_sth11_temp+0
VMOV.F32	S1, #10
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
MOVW	R2, #lo_addr(_iSHT_Temp+0)
MOVT	R2, #hi_addr(_iSHT_Temp+0)
STR	R2, [SP, #8]
STRH	R3, [R2, #0]
;SHT11_driver.c,271 :: 		ucSens_Error = s_measure(&h, 1);
ADD	R2, SP, #6
MOVS	R1, #1
MOV	R0, R2
BL	_s_measure+0
MOVW	R2, #lo_addr(_ucSens_Error+0)
MOVT	R2, #hi_addr(_ucSens_Error+0)
STRB	R0, [R2, #0]
;SHT11_driver.c,272 :: 		iSHT_Humi = (int)(calc_sth11_humi(h, t) * 10);
LDRH	R1, [SP, #4]
LDRH	R0, [SP, #6]
BL	_calc_sth11_humi+0
VMOV.F32	S1, #10
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
SXTH	R2, R2
MOVW	R3, #lo_addr(_iSHT_Humi+0)
MOVT	R3, #hi_addr(_iSHT_Humi+0)
STRH	R2, [R3, #0]
;SHT11_driver.c,274 :: 		value = (float)iSHT_Temp;
LDR	R2, [SP, #8]
LDRSH	R2, [R2, #0]
VMOV	S1, R2
VCVT.F32	#1, S1, S1
;SHT11_driver.c,275 :: 		*fT = value / 10;
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R9, #0]
; fT end address is: 36 (R9)
;SHT11_driver.c,276 :: 		value = (float)iSHT_Humi;
MOV	R2, R3
LDRSH	R2, [R2, #0]
VMOV	S1, R2
VCVT.F32	#1, S1, S1
;SHT11_driver.c,277 :: 		*fRH = value / 10;
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R10, #0]
; fRH end address is: 40 (R10)
;SHT11_driver.c,278 :: 		}
L_end_Read_SHT11:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Read_SHT11
_s_read_statusreg:
;SHT11_driver.c,283 :: 		char s_read_statusreg(unsigned char *p_value)
; p_value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; p_value end address is: 0 (R0)
; p_value start address is: 20 (R5)
;SHT11_driver.c,285 :: 		unsigned char checksum = 0;
;SHT11_driver.c,287 :: 		s_transstart();                             //transmission start
BL	_s_transstart+0
;SHT11_driver.c,288 :: 		if(s_write_byte(STATUS_REG_R)) return 1;    //send command to sensor
MOVS	R0, #7
BL	_s_write_byte+0
CMP	R0, #0
IT	EQ
BEQ	L_s_read_statusreg53
; p_value end address is: 20 (R5)
MOVS	R0, #1
IT	AL
BAL	L_end_s_read_statusreg
L_s_read_statusreg53:
;SHT11_driver.c,289 :: 		*p_value=s_read_byte(ACK);                  //read status register (8-bit)
; p_value start address is: 20 (R5)
MOVS	R0, #1
BL	_s_read_byte+0
STRB	R0, [R5, #0]
; p_value end address is: 20 (R5)
;SHT11_driver.c,290 :: 		checksum=s_read_byte(noACK);                //read checksum (8-bit)
MOVS	R0, #0
BL	_s_read_byte+0
;SHT11_driver.c,292 :: 		return 0;
MOVS	R0, #0
;SHT11_driver.c,293 :: 		}
L_end_s_read_statusreg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _s_read_statusreg
_s_write_statusreg:
;SHT11_driver.c,300 :: 		char s_write_statusreg(unsigned char value)
; value start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R5, R0
; value end address is: 0 (R0)
; value start address is: 20 (R5)
;SHT11_driver.c,302 :: 		s_transstart();                             //transmission start
BL	_s_transstart+0
;SHT11_driver.c,303 :: 		if(s_write_byte(STATUS_REG_W)) return 1;    //send command to sensor
MOVS	R0, #6
BL	_s_write_byte+0
CMP	R0, #0
IT	EQ
BEQ	L_s_write_statusreg54
; value end address is: 20 (R5)
MOVS	R0, #1
IT	AL
BAL	L_end_s_write_statusreg
L_s_write_statusreg54:
;SHT11_driver.c,304 :: 		if(s_write_byte(value)) return 1;           //send value of status register
; value start address is: 20 (R5)
UXTB	R0, R5
; value end address is: 20 (R5)
BL	_s_write_byte+0
CMP	R0, #0
IT	EQ
BEQ	L_s_write_statusreg55
MOVS	R0, #1
IT	AL
BAL	L_end_s_write_statusreg
L_s_write_statusreg55:
;SHT11_driver.c,306 :: 		return 0;
MOVS	R0, #0
;SHT11_driver.c,307 :: 		}
L_end_s_write_statusreg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _s_write_statusreg
_s_connectionreset:
;SHT11_driver.c,316 :: 		void s_connectionreset()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_driver.c,320 :: 		SDA_pin_out = 1;                           //release DATA-line
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SDA_pin_out+0)
MOVT	R0, #hi_addr(SDA_pin_out+0)
STR	R1, [R0, #0]
;SHT11_driver.c,321 :: 		SCL_pin = 0;                           // SCL Low
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,323 :: 		for(i=0; i<9; i++)                     //9 SCK cycles
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_s_connectionreset56:
; i start address is: 8 (R2)
CMP	R2, #9
IT	CS
BCS	L_s_connectionreset57
;SHT11_driver.c,325 :: 		SCL_pin = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,326 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_connectionreset59:
SUBS	R7, R7, #1
BNE	L_s_connectionreset59
NOP
NOP
NOP
;SHT11_driver.c,327 :: 		SCL_pin = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(SCL_pin+0)
MOVT	R0, #hi_addr(SCL_pin+0)
STR	R1, [R0, #0]
;SHT11_driver.c,328 :: 		Delay_uS(3);
MOVW	R7, #6
MOVT	R7, #0
NOP
NOP
L_s_connectionreset61:
SUBS	R7, R7, #1
BNE	L_s_connectionreset61
NOP
NOP
NOP
;SHT11_driver.c,323 :: 		for(i=0; i<9; i++)                     //9 SCK cycles
ADDS	R2, R2, #1
UXTB	R2, R2
;SHT11_driver.c,329 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_s_connectionreset56
L_s_connectionreset57:
;SHT11_driver.c,331 :: 		s_transstart();                        //transmission start
BL	_s_transstart+0
;SHT11_driver.c,332 :: 		}
L_end_s_connectionreset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _s_connectionreset
_s_softreset:
;SHT11_driver.c,337 :: 		unsigned char s_softreset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_driver.c,339 :: 		s_connectionreset();                         //reset communication
BL	_s_connectionreset+0
;SHT11_driver.c,341 :: 		return (s_write_byte(RESET));                //return=1 in case of no response form the sensor
MOVS	R0, #30
BL	_s_write_byte+0
;SHT11_driver.c,342 :: 		}
L_end_s_softreset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _s_softreset
