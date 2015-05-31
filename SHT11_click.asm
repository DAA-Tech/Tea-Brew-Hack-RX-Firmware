_DrawScr:
;SHT11_click.c,42 :: 		void DrawScr(){
;SHT11_click.c,54 :: 		}
L_end_DrawScr:
BX	LR
; end of _DrawScr
_Transmit_results:
;SHT11_click.c,59 :: 		void Transmit_results(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_click.c,62 :: 		sprintf(Temp_str, "T: %3.1f degC", temperature);
MOVW	R0, #lo_addr(_temperature+0)
MOVT	R0, #hi_addr(_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_1_SHT11_click+0)
MOVT	R1, #hi_addr(?lstr_1_SHT11_click+0)
MOVW	R0, #lo_addr(_Temp_str+0)
MOVT	R0, #hi_addr(_Temp_str+0)
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;SHT11_click.c,63 :: 		sprintf(Humi_str, "RH: %3.1f pct", rel_humidity);
MOVW	R0, #lo_addr(_rel_humidity+0)
MOVT	R0, #hi_addr(_rel_humidity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_2_SHT11_click+0)
MOVT	R1, #hi_addr(?lstr_2_SHT11_click+0)
MOVW	R0, #lo_addr(_Humi_str+0)
MOVT	R0, #hi_addr(_Humi_str+0)
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;SHT11_click.c,75 :: 		for (i = 0; i < 16; i++){
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_Transmit_results0:
; i start address is: 8 (R2)
CMP	R2, #16
IT	CS
BCS	L_Transmit_results1
;SHT11_click.c,76 :: 		Old_Temp_str[i] = Temp_str[i];
MOVW	R0, #lo_addr(_Old_Temp_str+0)
MOVT	R0, #hi_addr(_Old_Temp_str+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_Temp_str+0)
MOVT	R0, #hi_addr(_Temp_str+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;SHT11_click.c,77 :: 		Old_Humi_str[i] = Humi_str[i];
MOVW	R0, #lo_addr(_Old_Humi_str+0)
MOVT	R0, #hi_addr(_Old_Humi_str+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_Humi_str+0)
MOVT	R0, #hi_addr(_Humi_str+0)
ADDS	R0, R0, R2
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;SHT11_click.c,75 :: 		for (i = 0; i < 16; i++){
ADDS	R2, R2, #1
UXTB	R2, R2
;SHT11_click.c,78 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_Transmit_results0
L_Transmit_results1:
;SHT11_click.c,79 :: 		}
L_end_Transmit_results:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Transmit_results
_main:
;SHT11_click.c,84 :: 		void main()
;SHT11_click.c,87 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_6, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
MOVW	R2, #2084
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;SHT11_click.c,88 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
MOVW	R2, #2084
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;SHT11_click.c,90 :: 		SDA_pin_out = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,92 :: 		while(1)                           // Endless loop
L_main3:
;SHT11_click.c,94 :: 		Read_SHT11(&temperature, &rel_humidity);
MOVW	R1, #lo_addr(_rel_humidity+0)
MOVT	R1, #hi_addr(_rel_humidity+0)
MOVW	R0, #lo_addr(_temperature+0)
MOVT	R0, #hi_addr(_temperature+0)
BL	_Read_SHT11+0
;SHT11_click.c,95 :: 		Transmit_results();
BL	_Transmit_results+0
;SHT11_click.c,96 :: 		Delay_ms(800);                   // delay 800ms
MOVW	R7, #63486
MOVT	R7, #292
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;SHT11_click.c,97 :: 		}
IT	AL
BAL	L_main3
;SHT11_click.c,98 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
