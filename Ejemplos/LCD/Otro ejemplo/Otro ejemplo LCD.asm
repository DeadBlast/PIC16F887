
_main:

;Otro ejemplo LCD.c,18 :: 		void main() {
;Otro ejemplo LCD.c,19 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Otro ejemplo LCD.c,20 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Otro ejemplo LCD.c,21 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;Otro ejemplo LCD.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Otro ejemplo LCD.c,23 :: 		Lcd_out(1,1,"Serie de numeros");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Otro_32ejemplo_32LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Otro ejemplo LCD.c,24 :: 		while(1){
L_main0:
;Otro ejemplo LCD.c,25 :: 		Lcd_Out(1,1,"Serie de numeros");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Otro_32ejemplo_32LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Otro ejemplo LCD.c,26 :: 		if(numero==32768){
	MOVF       _numero+1, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      0
	XORWF      _numero+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Otro ejemplo LCD.c,27 :: 		numero=1;
	MOVLW      1
	MOVWF      _numero+0
	MOVLW      0
	MOVWF      _numero+1
;Otro ejemplo LCD.c,28 :: 		}
L_main2:
;Otro ejemplo LCD.c,29 :: 		Wordtostr(numero,texto);
	MOVF       _numero+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _numero+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Otro ejemplo LCD.c,30 :: 		Lcd_out(2,1,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Otro ejemplo LCD.c,31 :: 		numero=numero*2;
	RLF        _numero+0, 1
	RLF        _numero+1, 1
	BCF        _numero+0, 0
;Otro ejemplo LCD.c,32 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Otro ejemplo LCD.c,33 :: 		Wordtostr(numero,texto);
	MOVF       _numero+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _numero+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Otro ejemplo LCD.c,34 :: 		Lcd_out(2,6,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Otro ejemplo LCD.c,35 :: 		numero=numero*2;
	RLF        _numero+0, 1
	RLF        _numero+1, 1
	BCF        _numero+0, 0
;Otro ejemplo LCD.c,36 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Otro ejemplo LCD.c,37 :: 		Wordtostr(numero,texto);
	MOVF       _numero+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _numero+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Otro ejemplo LCD.c,38 :: 		Lcd_out(2,12,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Otro ejemplo LCD.c,39 :: 		numero=numero*2;
	RLF        _numero+0, 1
	RLF        _numero+1, 1
	BCF        _numero+0, 0
;Otro ejemplo LCD.c,40 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Otro ejemplo LCD.c,41 :: 		Lcd_Cmd(_Lcd_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Otro ejemplo LCD.c,42 :: 		}
	GOTO       L_main0
;Otro ejemplo LCD.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
