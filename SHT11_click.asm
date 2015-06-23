_Init_MCU:
;SHT11_click.c,52 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_click.c,55 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_8, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
MOVW	R2, #2084
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;SHT11_click.c,56 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_7, _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_OD | _GPIO_CFG_MODE_OUTPUT);
MOVW	R2, #2084
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;SHT11_click.c,58 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_12);                            // LED GREEN
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,59 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_13);                            // LED ORANGE
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,60 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_14);                            // LED RED
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,61 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_15);                           // LED BLUE
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,62 :: 		GPIO_Digital_Output(&GPIOC_ODR, _GPIO_PINMASK_5);                             // RF_STB
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,63 :: 		GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_4);                             // RF_RST
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,64 :: 		GPIO_Digital_Output(&GPIOA_IDR, _GPIO_PINMASK_0);                             // Button
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Output+0
;SHT11_click.c,66 :: 		GPIO_Alternate_Function_Enable(&_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
BL	_GPIO_Alternate_Function_Enable+0
;SHT11_click.c,67 :: 		UART2_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PA23);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART2_PA23+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART2_PA23+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #19200
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;SHT11_click.c,68 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Init_MCU0:
SUBS	R7, R7, #1
BNE	L_Init_MCU0
NOP
NOP
;SHT11_click.c,70 :: 		UART6_Init_Advanced(19200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67 );
MOVW	R0, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOVW	R0, #19200
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;SHT11_click.c,71 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Init_MCU2:
SUBS	R7, R7, #1
BNE	L_Init_MCU2
NOP
NOP
;SHT11_click.c,73 :: 		USART6_CR1bits.RXNEIE = 1;         // enable uart rx interrupt
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(USART6_CR1bits+0)
MOVT	R0, #hi_addr(USART6_CR1bits+0)
STR	R1, [R0, #0]
;SHT11_click.c,74 :: 		NVIC_IntEnable(IVT_INT_USART6);    // enable interrupt vector
MOVW	R0, #87
BL	_NVIC_IntEnable+0
;SHT11_click.c,75 :: 		Enableinterrupts();
BL	_EnableInterrupts+0
;SHT11_click.c,77 :: 		RF_STB = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,78 :: 		RF_RST = 0;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,79 :: 		Delay_ms(200);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_MCU4:
SUBS	R7, R7, #1
BNE	L_Init_MCU4
NOP
NOP
NOP
NOP
;SHT11_click.c,80 :: 		RF_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,81 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_interrupt:
;SHT11_click.c,85 :: 		void interrupt() iv IVT_INT_USART6 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_click.c,87 :: 		tmp = UART6_Read();                  // Store received data in the temporary variable
BL	_UART6_Read+0
; tmp start address is: 12 (R3)
UXTB	R3, R0
;SHT11_click.c,88 :: 		if ((tmp == '\r') || (rxCnt > 40)) { // Check if data counter is larger than the buffer string size
UXTB	R0, R0
CMP	R0, #13
IT	EQ
BEQ	L__interrupt21
MOVW	R0, #lo_addr(_rxCnt+0)
MOVT	R0, #hi_addr(_rxCnt+0)
LDRB	R0, [R0, #0]
CMP	R0, #40
IT	HI
BHI	L__interrupt20
IT	AL
BAL	L_interrupt8
; tmp end address is: 12 (R3)
L__interrupt21:
L__interrupt20:
;SHT11_click.c,90 :: 		rxBuff[rxCnt] = 0;                 // Terminate buffer string
MOVW	R2, #lo_addr(_rxCnt+0)
MOVT	R2, #hi_addr(_rxCnt+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rxBuff+0)
MOVT	R0, #hi_addr(_rxBuff+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;SHT11_click.c,91 :: 		rxCnt = 0;                         // Reset data counter
MOVS	R0, #0
STRB	R0, [R2, #0]
;SHT11_click.c,92 :: 		Received = 1;                      // Set Received data flag
MOVS	R1, #1
MOVW	R0, #lo_addr(_Received+0)
MOVT	R0, #hi_addr(_Received+0)
STRB	R1, [R0, #0]
;SHT11_click.c,93 :: 		}
IT	AL
BAL	L_interrupt9
L_interrupt8:
;SHT11_click.c,95 :: 		rxBuff[rxCnt] = tmp;               // Populate buffer string with received data
; tmp start address is: 12 (R3)
MOVW	R2, #lo_addr(_rxCnt+0)
MOVT	R2, #hi_addr(_rxCnt+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_rxBuff+0)
MOVT	R0, #hi_addr(_rxBuff+0)
ADDS	R0, R0, R1
STRB	R3, [R0, #0]
; tmp end address is: 12 (R3)
;SHT11_click.c,96 :: 		rxCnt = rxCnt + 1;                 // Increase data counter
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R2, #0]
;SHT11_click.c,97 :: 		}
L_interrupt9:
;SHT11_click.c,98 :: 		}
L_end_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interrupt
_Transmit_results:
;SHT11_click.c,102 :: 		void Transmit_results(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SHT11_click.c,104 :: 		Delay_Ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Transmit_results10:
SUBS	R7, R7, #1
BNE	L_Transmit_results10
NOP
NOP
NOP
NOP
;SHT11_click.c,105 :: 		sprintf(Temp_str, "T: %3.1f degC\r\n RH: %3.1f pct\r\n", temperature, rel_humidity);
MOVW	R0, #lo_addr(_rel_humidity+0)
MOVT	R0, #hi_addr(_rel_humidity+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temperature+0)
MOVT	R0, #hi_addr(_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_1_SHT11_click+0)
MOVT	R1, #hi_addr(?lstr_1_SHT11_click+0)
MOVW	R0, #lo_addr(_Temp_str+0)
MOVT	R0, #hi_addr(_Temp_str+0)
VPUSH	#0, (S1)
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #16
;SHT11_click.c,107 :: 		UART6_Write_Text(Temp_str);
MOVW	R0, #lo_addr(_Temp_str+0)
MOVT	R0, #hi_addr(_Temp_str+0)
BL	_UART6_Write_Text+0
;SHT11_click.c,109 :: 		}
L_end_Transmit_results:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Transmit_results
_main:
;SHT11_click.c,113 :: 		void main()
;SHT11_click.c,115 :: 		Init_MCU();
BL	_Init_MCU+0
;SHT11_click.c,117 :: 		while(1)                           // Endless loop
L_main12:
;SHT11_click.c,119 :: 		if(Received){                        // If data is received via UART :
MOVW	R0, #lo_addr(_Received+0)
MOVT	R0, #hi_addr(_Received+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main14
;SHT11_click.c,120 :: 		LED_RED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,121 :: 		Delay_Ms(500);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_main15:
SUBS	R7, R7, #1
BNE	L_main15
NOP
NOP
NOP
NOP
;SHT11_click.c,122 :: 		LED_RED = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;SHT11_click.c,123 :: 		UART2_Write_Text(rxBuff);
MOVW	R0, #lo_addr(_rxBuff+0)
MOVT	R0, #hi_addr(_rxBuff+0)
BL	_UART2_Write_Text+0
;SHT11_click.c,124 :: 		UART2_Write_Text("\r\n");
MOVW	R0, #lo_addr(?lstr2_SHT11_click+0)
MOVT	R0, #hi_addr(?lstr2_SHT11_click+0)
BL	_UART2_Write_Text+0
;SHT11_click.c,125 :: 		Received = 0;                      // clear received data flag
MOVS	R1, #0
MOVW	R0, #lo_addr(_Received+0)
MOVT	R0, #hi_addr(_Received+0)
STRB	R1, [R0, #0]
;SHT11_click.c,126 :: 		Delay_ms(250);                     // wait for 250ms
MOVW	R7, #11305
MOVT	R7, #10
NOP
NOP
L_main17:
SUBS	R7, R7, #1
BNE	L_main17
NOP
NOP
;SHT11_click.c,127 :: 		}
L_main14:
;SHT11_click.c,128 :: 		}
IT	AL
BAL	L_main12
;SHT11_click.c,130 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
