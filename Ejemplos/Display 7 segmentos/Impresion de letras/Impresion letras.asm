
_main:

;Impresion letras.c,3 :: 		void main() {
;Impresion letras.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Impresion letras.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Impresion letras.c,6 :: 		PORTD=0;
	CLRF       PORTD+0
;Impresion letras.c,7 :: 		TRISD=0;
	CLRF       TRISD+0
;Impresion letras.c,8 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Impresion letras.c,9 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Impresion letras.c,10 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Impresion letras.c,11 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Impresion letras.c,12 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Impresion letras.c,13 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Impresion letras.c,14 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Impresion letras.c,15 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;Impresion letras.c,16 :: 		while(1){
L_main0:
;Impresion letras.c,17 :: 		PORTD=poli[0];
	MOVF       _poli+0, 0
	MOVWF      PORTD+0
;Impresion letras.c,18 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;Impresion letras.c,19 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Impresion letras.c,20 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Impresion letras.c,21 :: 		PORTD=poli[1];
	MOVF       _poli+1, 0
	MOVWF      PORTD+0
;Impresion letras.c,22 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;Impresion letras.c,23 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Impresion letras.c,24 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Impresion letras.c,25 :: 		PORTD=poli[2];
	MOVF       _poli+2, 0
	MOVWF      PORTD+0
;Impresion letras.c,26 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;Impresion letras.c,27 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;Impresion letras.c,28 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Impresion letras.c,29 :: 		PORTD=poli[3];
	MOVF       _poli+3, 0
	MOVWF      PORTD+0
;Impresion letras.c,30 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;Impresion letras.c,31 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Impresion letras.c,32 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;Impresion letras.c,33 :: 		}
	GOTO       L_main0
;Impresion letras.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
