
_main:

;Motor2.c,17 :: 		void main() {
;Motor2.c,18 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Motor2.c,19 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Motor2.c,20 :: 		C1ON_bit=0; //apago los comparadores
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Motor2.c,21 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Motor2.c,22 :: 		PORTD=0;   //Programo el puerto D como salida
	CLRF       PORTD+0
;Motor2.c,23 :: 		TRISD=0x00;
	CLRF       TRISD+0
;Motor2.c,24 :: 		PORTA=0;
	CLRF       PORTA+0
;Motor2.c,25 :: 		TRISA.F1=0;  //Los puertos A como salida(Para 1 solo motor)
	BCF        TRISA+0, 1
;Motor2.c,26 :: 		TRISA.F2=0;
	BCF        TRISA+0, 2
;Motor2.c,27 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Motor2.c,28 :: 		TRISB.F0=1; //Declaro PORTB(F0,F1,F2) como entrada
	BSF        TRISB+0, 0
;Motor2.c,29 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;Motor2.c,30 :: 		TRISB.F2=1;
	BSF        TRISB+0, 2
;Motor2.c,31 :: 		Lcd_Init(); //Inicializamos la LCD
	CALL       _Lcd_Init+0
;Motor2.c,32 :: 		Lcd_cmd(_LCD_CURSOR_OFF);//Apagamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Motor2.c,33 :: 		Lcd_cmd(_LCD_CLEAR); //Limpiamos la LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Motor2.c,34 :: 		Lcd_Out(1,1,"B1 | B2 | B3"); //Imprimimos las lineas en la LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Motor2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Motor2.c,35 :: 		lcd_Out(2,1,"Izq|Pau.|Der");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Motor2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Motor2.c,36 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Motor2.c,37 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Motor2.c,38 :: 		while(1){
L_main1:
;Motor2.c,39 :: 		PORTD=0x00;
	CLRF       PORTD+0
;Motor2.c,40 :: 		if(Button(&PORTB,0,0,0)){ //Si el primner boton es oprimido mov=1
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Motor2.c,41 :: 		mov=1;
	MOVLW      1
	MOVWF      _mov+0
;Motor2.c,42 :: 		}
L_main3:
;Motor2.c,43 :: 		if(Button(&PORTB,1,0,0)){ //Si el segundo boton es oprimido mov=0
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;Motor2.c,44 :: 		mov=0;
	CLRF       _mov+0
;Motor2.c,45 :: 		}
L_main4:
;Motor2.c,46 :: 		if(Button(&PORTB,2,0,0)){ //Si el tercer boton es oprimido mov=2
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;Motor2.c,47 :: 		mov=2;
	MOVLW      2
	MOVWF      _mov+0
;Motor2.c,48 :: 		}
L_main5:
;Motor2.c,49 :: 		if(mov==0){     //Pasamos a hacer una comparacion de lo que tengamos en mov, si es 0 hará un juego de luces donde prende y apaga todas
	MOVF       _mov+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Motor2.c,50 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Motor2.c,51 :: 		PORTD=0x00;
	CLRF       PORTD+0
;Motor2.c,52 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;Motor2.c,53 :: 		PORTD=0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;Motor2.c,54 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;Motor2.c,55 :: 		}
L_main6:
;Motor2.c,56 :: 		if(mov==1){ //si mov=1  girara a la izquierda
	MOVF       _mov+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;Motor2.c,57 :: 		PORTD=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;Motor2.c,58 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;Motor2.c,59 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;Motor2.c,60 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;Motor2.c,61 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Motor2.c,62 :: 		}
L_main9:
;Motor2.c,63 :: 		if(mov==2){ //si mov=2 girara a la derecha
	MOVF       _mov+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Motor2.c,64 :: 		PORTD=0x02;
	MOVLW      2
	MOVWF      PORTD+0
;Motor2.c,65 :: 		PORTA.F1=0;
	BCF        PORTA+0, 1
;Motor2.c,66 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Motor2.c,67 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;Motor2.c,68 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;Motor2.c,69 :: 		}
L_main12:
;Motor2.c,70 :: 		}
	GOTO       L_main1
;Motor2.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
