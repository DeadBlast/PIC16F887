
_main:

;Contador libre_Display.c,3 :: 		void main() {
;Contador libre_Display.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador libre_Display.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador libre_Display.c,6 :: 		TRISD=0;
	CLRF       TRISD+0
;Contador libre_Display.c,7 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador libre_Display.c,9 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Contador libre_Display.c,10 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador libre_Display.c,11 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador libre_Display.c,12 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador libre_Display.c,14 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador libre_Display.c,15 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador libre_Display.c,16 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador libre_Display.c,17 :: 		PORTC.F3=0;//Habilitamos unicamente el 4to display
	BCF        PORTC+0, 3
;Contador libre_Display.c,18 :: 		while(1){
L_main0:
;Contador libre_Display.c,19 :: 		PORTD=numero[cuenta]; //Al puerto D le mandamos numero en la posicion de "cuenta"
	MOVF       _cuenta+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador libre_Display.c,20 :: 		cuenta++;//Aumentamos en una unidad
	INCF       _cuenta+0, 1
;Contador libre_Display.c,21 :: 		delay_ms(500);
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
;Contador libre_Display.c,22 :: 		if(cuenta>9){ //Si la cuenta es mayor a 9 regresa a 0
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cuenta+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Contador libre_Display.c,23 :: 		cuenta=0;
	CLRF       _cuenta+0
;Contador libre_Display.c,24 :: 		}
L_main3:
;Contador libre_Display.c,25 :: 		}
	GOTO       L_main0
;Contador libre_Display.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
