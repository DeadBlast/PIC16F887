
_main:

;Contador As y Des 0-9 Display.c,4 :: 		void main() {
;Contador As y Des 0-9 Display.c,5 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador As y Des 0-9 Display.c,6 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador As y Des 0-9 Display.c,7 :: 		TRISD=0;
	CLRF       TRISD+0
;Contador As y Des 0-9 Display.c,8 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador As y Des 0-9 Display.c,9 :: 		PORTB=0;
	CLRF       PORTB+0
;Contador As y Des 0-9 Display.c,10 :: 		TRISB=0;
	CLRF       TRISB+0
;Contador As y Des 0-9 Display.c,11 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;Contador As y Des 0-9 Display.c,12 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;Contador As y Des 0-9 Display.c,13 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Contador As y Des 0-9 Display.c,15 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Contador As y Des 0-9 Display.c,16 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador As y Des 0-9 Display.c,17 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador As y Des 0-9 Display.c,18 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador As y Des 0-9 Display.c,20 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador As y Des 0-9 Display.c,21 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador As y Des 0-9 Display.c,22 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador As y Des 0-9 Display.c,23 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;Contador As y Des 0-9 Display.c,24 :: 		while(1){
L_main0:
;Contador As y Des 0-9 Display.c,25 :: 		PORTD=numero[cuenta];
	MOVF       _cuenta+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador As y Des 0-9 Display.c,26 :: 		if(Button(&PORTB,0,5,1)&&Button(&PORTB,1,0,1)){   //Si ambos botones no estan oprimidos el seguro esta abierto
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      5
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
L__main15:
;Contador As y Des 0-9 Display.c,27 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Contador As y Des 0-9 Display.c,28 :: 		}
L_main4:
;Contador As y Des 0-9 Display.c,29 :: 		if(Button(&PORTB,0,0,0)&&oldstate==1){   //Si el primer boton se oprime  y esta abierto el seguro
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
L__main14:
;Contador As y Des 0-9 Display.c,30 :: 		oldstate=0;   //El seguro se cierra
	CLRF       _oldstate+0
;Contador As y Des 0-9 Display.c,31 :: 		cuenta++; //Aumentamos cuenta
	INCF       _cuenta+0, 1
;Contador As y Des 0-9 Display.c,32 :: 		if(cuenta>9){  //Si la cuenta es mayor a 9 regresa a 0
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cuenta+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;Contador As y Des 0-9 Display.c,33 :: 		cuenta=0;
	CLRF       _cuenta+0
;Contador As y Des 0-9 Display.c,34 :: 		}
L_main8:
;Contador As y Des 0-9 Display.c,35 :: 		}
L_main7:
;Contador As y Des 0-9 Display.c,36 :: 		if(Button(&PORTB,1,0,0)&&oldstate==1){ //Si promimos el boton 2 y el seguro esta abierto
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main11
L__main13:
;Contador As y Des 0-9 Display.c,37 :: 		oldstate=0;  //El seguro se cierra
	CLRF       _oldstate+0
;Contador As y Des 0-9 Display.c,38 :: 		cuenta--;     //Cuenta disminuye
	DECF       _cuenta+0, 1
;Contador As y Des 0-9 Display.c,39 :: 		if(cuenta<0){ //si la cuenta es menor a 0 regresa a 9
	MOVLW      128
	XORWF      _cuenta+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;Contador As y Des 0-9 Display.c,40 :: 		cuenta=9;
	MOVLW      9
	MOVWF      _cuenta+0
;Contador As y Des 0-9 Display.c,41 :: 		}
L_main12:
;Contador As y Des 0-9 Display.c,42 :: 		}
L_main11:
;Contador As y Des 0-9 Display.c,43 :: 		}
	GOTO       L_main0
;Contador As y Des 0-9 Display.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
