
_main:

;Contador libre_LCD.c,17 :: 		void main() {
;Contador libre_LCD.c,18 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador libre_LCD.c,19 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador libre_LCD.c,20 :: 		Lcd_Init();  //Iniciamos LCD
	CALL       _Lcd_Init+0
;Contador libre_LCD.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   //Apagamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Contador libre_LCD.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);//Limpiamos la pantalla
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Contador libre_LCD.c,23 :: 		Lcd_Out(1,1,"Contador libre");  //Imprimimos el letrero
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Contador_32libre_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Contador libre_LCD.c,24 :: 		while(1){
L_main0:
;Contador libre_LCD.c,25 :: 		ByteToStr(numero,cuenta);//La funcion ByteToStr nos convierte numero en cuenta que es un caracter alfanumerico
	MOVF       _numero+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _cuenta+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Contador libre_LCD.c,26 :: 		Lcd_Out(2,6,cuenta);  //Para poder imprimirlo en la LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cuenta+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Contador libre_LCD.c,27 :: 		numero++;    //Aumentamos numero
	INCF       _numero+0, 1
;Contador libre_LCD.c,28 :: 		if(numero>9){ //si numero es mayor a 9 regresa a 0
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _numero+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;Contador libre_LCD.c,29 :: 		numero=0;
	CLRF       _numero+0
;Contador libre_LCD.c,30 :: 		}
L_main2:
;Contador libre_LCD.c,31 :: 		delay_ms(500);
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
;Contador libre_LCD.c,32 :: 		}
	GOTO       L_main0
;Contador libre_LCD.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
