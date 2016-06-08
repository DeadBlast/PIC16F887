
_main:

;Contador 0-9.c,4 :: 		void main() {
;Contador 0-9.c,5 :: 		ANSEL=0; //desactivamos salidas analogicas
	CLRF       ANSEL+0
;Contador 0-9.c,6 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador 0-9.c,7 :: 		TRISD=0; //Declaramos puerto D como salida
	CLRF       TRISD+0
;Contador 0-9.c,8 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador 0-9.c,9 :: 		PORTB=0;
	CLRF       PORTB+0
;Contador 0-9.c,10 :: 		TRISB=0;
	CLRF       TRISB+0
;Contador 0-9.c,12 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;Contador 0-9.c,14 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Contador 0-9.c,15 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador 0-9.c,16 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador 0-9.c,17 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador 0-9.c,19 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador 0-9.c,20 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador 0-9.c,21 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador 0-9.c,22 :: 		PORTC.F3=0; //solo el display 4 prendera
	BCF        PORTC+0, 3
;Contador 0-9.c,23 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Contador 0-9.c,24 :: 		while(1){
L_main0:
;Contador 0-9.c,25 :: 		PORTD=numero[contador];
	MOVF       _contador+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9.c,26 :: 		if(Button(&PORTB,0,0,1)){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	CLRF       FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Contador 0-9.c,27 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Contador 0-9.c,28 :: 		}
L_main2:
;Contador 0-9.c,29 :: 		if(Button(&PORTB,0,10,0)&&oldstate==1){
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main5
L__main7:
;Contador 0-9.c,30 :: 		oldstate=0;
	CLRF       _oldstate+0
;Contador 0-9.c,31 :: 		contador++;
	INCF       _contador+0, 1
;Contador 0-9.c,32 :: 		if(contador>9){
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _contador+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Contador 0-9.c,33 :: 		contador=0;
	CLRF       _contador+0
;Contador 0-9.c,34 :: 		}
L_main6:
;Contador 0-9.c,35 :: 		}
L_main5:
;Contador 0-9.c,36 :: 		}
	GOTO       L_main0
;Contador 0-9.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
