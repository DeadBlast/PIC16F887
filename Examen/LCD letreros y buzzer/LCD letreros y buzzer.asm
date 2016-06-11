
_main:

;LCD letreros y buzzer.c,15 :: 		void main() {
;LCD letreros y buzzer.c,16 :: 		ANSEL=0;
	CLRF       ANSEL+0
;LCD letreros y buzzer.c,17 :: 		ANSELH=0;
	CLRF       ANSELH+0
;LCD letreros y buzzer.c,18 :: 		TRISA.F0=0; //declaramos el puerto A0 como salida(Es donde se conecta el buzzer)
	BCF        TRISA+0, 0
;LCD letreros y buzzer.c,19 :: 		PORTA.F0=0;  //Mandamos a 0 el puerto A0 para que no este sonando el buzzer
	BCF        PORTA+0, 0
;LCD letreros y buzzer.c,20 :: 		Lcd_Init(); //Iniciamos la LCD
	CALL       _Lcd_Init+0
;LCD letreros y buzzer.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);//quitamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD letreros y buzzer.c,22 :: 		Lcd_Cmd(_LCD_CLEAR); //Limpiamos la LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD letreros y buzzer.c,23 :: 		Lcd_Out(1,1,"Programacion"); //imprimimos los letreros
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD_32letreros_32y_32buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD letreros y buzzer.c,24 :: 		Lcd_Out(2,1,"Del PIC16F887");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD_32letreros_32y_32buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD letreros y buzzer.c,25 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;LCD letreros y buzzer.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);//Limpiamos para que no se sobrepongan los letreros
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD letreros y buzzer.c,27 :: 		Lcd_Out(1,1,"Tu nombre aqui!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_LCD_32letreros_32y_32buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD letreros y buzzer.c,28 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;LCD letreros y buzzer.c,29 :: 		PORTA.F0=1;    //Activamos el buzzer
	BSF        PORTA+0, 0
;LCD letreros y buzzer.c,30 :: 		Lcd_out(2,1,"Boleta aqui");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_LCD_32letreros_32y_32buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD letreros y buzzer.c,31 :: 		delay_ms(500);
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
;LCD letreros y buzzer.c,32 :: 		PORTA.F0=0; //despues de 500 milisegundos lo apagamos
	BCF        PORTA+0, 0
;LCD letreros y buzzer.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
