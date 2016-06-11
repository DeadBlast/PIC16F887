
_main:

;Contador 0-F.c,3 :: 		void main() {
;Contador 0-F.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador 0-F.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador 0-F.c,6 :: 		TRISD=0;
	CLRF       TRISD+0
;Contador 0-F.c,7 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador 0-F.c,9 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Contador 0-F.c,10 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador 0-F.c,11 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador 0-F.c,12 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador 0-F.c,14 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;Contador 0-F.c,15 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador 0-F.c,16 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador 0-F.c,17 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;Contador 0-F.c,18 :: 		while(1){
L_main0:
;Contador 0-F.c,19 :: 		PORTD=numero[cuenta]; //Mandamos al puerto D el numero en la posicion "cuenta"
	MOVF       _cuenta+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-F.c,20 :: 		cuenta++; //aumentamos cuenta
	INCF       _cuenta+0, 1
;Contador 0-F.c,21 :: 		delay_ms(500);
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
;Contador 0-F.c,22 :: 		if(cuenta>15){ //si llega a mas de 15 regresa a 0
	MOVLW      128
	XORLW      15
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cuenta+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Contador 0-F.c,23 :: 		cuenta=0;
	CLRF       _cuenta+0
;Contador 0-F.c,24 :: 		}
L_main3:
;Contador 0-F.c,25 :: 		}
	GOTO       L_main0
;Contador 0-F.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
