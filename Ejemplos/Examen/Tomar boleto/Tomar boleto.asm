
_main:

;Tomar boleto.c,16 :: 		void main() {
;Tomar boleto.c,17 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Tomar boleto.c,18 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Tomar boleto.c,19 :: 		PORTB=0;
	CLRF       PORTB+0
;Tomar boleto.c,20 :: 		TRISB=0x00; //establacemos que todos los puertos B sean salidas
	CLRF       TRISB+0
;Tomar boleto.c,21 :: 		TRISB.F0=1; //menos el puerto 0
	BSF        TRISB+0, 0
;Tomar boleto.c,22 :: 		TRISA.F0=0;  //El puerto A0 como salida
	BCF        TRISA+0, 0
;Tomar boleto.c,23 :: 		PORTA.F0=0;   //Salida 0 para que no suene  el buzzer
	BCF        PORTA+0, 0
;Tomar boleto.c,24 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Tomar boleto.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Tomar boleto.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Tomar boleto.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Tomar boleto.c,28 :: 		while(1){
L_main0:
;Tomar boleto.c,29 :: 		Lcd_Out(1,3,"Bienvenidos!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Tomar_32boleto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Tomar boleto.c,30 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;Tomar boleto.c,31 :: 		Lcd_Out(1,3,"            ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Tomar_32boleto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Tomar boleto.c,32 :: 		if(Button(&PORTB,0,0,1)){   // un seguro para que no siga dando boletos si se queda apretado el boton! :D
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Tomar boleto.c,33 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Tomar boleto.c,34 :: 		}
L_main3:
;Tomar boleto.c,35 :: 		if(Button(&PORTB,0,0,0)&&oldstate==1){//Si se oprime el boton
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main6
L__main10:
;Tomar boleto.c,36 :: 		oldstate=0; //el seguro se activa
	CLRF       _oldstate+0
;Tomar boleto.c,37 :: 		Lcd_Cmd(_Lcd_Clear);             //Limpia la LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Tomar boleto.c,38 :: 		PORTA.F0=1;    //Prendemos el buzzer
	BSF        PORTA+0, 0
;Tomar boleto.c,39 :: 		Lcd_Out(1,2,"Tome su boleto");      //Imprimimos los letreros
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Tomar_32boleto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Tomar boleto.c,40 :: 		Lcd_Out(2,5,"Porfavor!");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Tomar_32boleto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Tomar boleto.c,41 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Tomar boleto.c,42 :: 		PORTA.F0=0;  //desactivamos el buzzer
	BCF        PORTA+0, 0
;Tomar boleto.c,43 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;Tomar boleto.c,44 :: 		Lcd_Cmd(_LCD_CLEAR); //volvemos a limpiar la LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Tomar boleto.c,45 :: 		}
L_main6:
;Tomar boleto.c,46 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Tomar boleto.c,47 :: 		}
	GOTO       L_main0
;Tomar boleto.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
