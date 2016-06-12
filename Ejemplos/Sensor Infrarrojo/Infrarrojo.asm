
_main:

;Infrarrojo.c,17 :: 		void main() {
;Infrarrojo.c,18 :: 		C1ON_bit = 0;//Deshabilitamos comparadores
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Infrarrojo.c,19 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Infrarrojo.c,20 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Infrarrojo.c,21 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Infrarrojo.c,22 :: 		TRISD=0;
	CLRF       TRISD+0
;Infrarrojo.c,23 :: 		PORTD=0;
	CLRF       PORTD+0
;Infrarrojo.c,24 :: 		TRISB=0;
	CLRF       TRISB+0
;Infrarrojo.c,25 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;Infrarrojo.c,26 :: 		PORTB=0;
	CLRF       PORTB+0
;Infrarrojo.c,27 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Infrarrojo.c,28 :: 		Lcd_Init(); //Iniciamos la LCD
	CALL       _Lcd_Init+0
;Infrarrojo.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);//Limpiamos el display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Infrarrojo.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);//Quitamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Infrarrojo.c,31 :: 		Lcd_Cmd(_LCD_Clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Infrarrojo.c,32 :: 		Lcd_out(1,1,"Personas");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Infrarrojo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Infrarrojo.c,33 :: 		while(1){
L_main0:
;Infrarrojo.c,34 :: 		ByteToStr(contador,cuenta); //Convertimos contador en un caracter para que pueda imprimirse en la LCD
	MOVF       _contador+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _cuenta+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Infrarrojo.c,35 :: 		Lcd_out(2,6,cuenta);//Imprimimos cuenta en la LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cuenta+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Infrarrojo.c,36 :: 		if(Button(&PORTB,0,0,0)){ //Si el boton no esta oprimido la bandera esta en 1
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Infrarrojo.c,37 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Infrarrojo.c,38 :: 		}
L_main2:
;Infrarrojo.c,39 :: 		if(Button(&PORTB,0,0,1)&&oldstate==1){ //Si oprimimos el boton la bandera cambia y sumara una unidad a contador
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main5
L__main6:
;Infrarrojo.c,40 :: 		oldstate=0;
	CLRF       _oldstate+0
;Infrarrojo.c,41 :: 		contador++;
	INCF       _contador+0, 1
;Infrarrojo.c,42 :: 		}
L_main5:
;Infrarrojo.c,43 :: 		}
	GOTO       L_main0
;Infrarrojo.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
