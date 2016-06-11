
_main:

;Contador 0-20 LCD.c,17 :: 		void main() {
;Contador 0-20 LCD.c,18 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador 0-20 LCD.c,19 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador 0-20 LCD.c,20 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;Contador 0-20 LCD.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Contador 0-20 LCD.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Contador 0-20 LCD.c,23 :: 		Lcd_Out(1,2,"Contador 0-20");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Contador_320_4520_32LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Contador 0-20 LCD.c,24 :: 		while(1){
L_main0:
;Contador 0-20 LCD.c,25 :: 		ByteToStr(numero,cuenta);
	MOVF       _numero+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _cuenta+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Contador 0-20 LCD.c,26 :: 		Lcd_Out(2,5,cuenta);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cuenta+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Contador 0-20 LCD.c,27 :: 		numero++;
	INCF       _numero+0, 1
;Contador 0-20 LCD.c,28 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Contador 0-20 LCD.c,29 :: 		if(numero>20){
	MOVLW      128
	XORLW      20
	MOVWF      R0+0
	MOVLW      128
	XORWF      _numero+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Contador 0-20 LCD.c,30 :: 		numero=0;
	CLRF       _numero+0
;Contador 0-20 LCD.c,31 :: 		}
L_main3:
;Contador 0-20 LCD.c,32 :: 		}
	GOTO       L_main0
;Contador 0-20 LCD.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
