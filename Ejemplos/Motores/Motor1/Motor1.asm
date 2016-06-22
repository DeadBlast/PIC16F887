
_main:

;Motor1.c,2 :: 		void main() {
;Motor1.c,3 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Motor1.c,4 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Motor1.c,5 :: 		C1ON_bit=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Motor1.c,6 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Motor1.c,7 :: 		PORTA=0;
	CLRF       PORTA+0
;Motor1.c,8 :: 		TRISA.F1=0;
	BCF        TRISA+0, 1
;Motor1.c,9 :: 		TRISA.F2=0;
	BCF        TRISA+0, 2
;Motor1.c,10 :: 		TRISA.F3=0;
	BCF        TRISA+0, 3
;Motor1.c,11 :: 		TRISA.F4=0;
	BCF        TRISA+0, 4
;Motor1.c,12 :: 		PORTB=0;
	CLRF       PORTB+0
;Motor1.c,13 :: 		while(1){
L_main0:
;Motor1.c,14 :: 		for(mov=0;mov<3;mov++){
	CLRF       _mov+0
L_main2:
	MOVLW      128
	XORWF      _mov+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Motor1.c,15 :: 		PORTA=0;
	CLRF       PORTA+0
;Motor1.c,16 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Motor1.c,17 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;Motor1.c,18 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Motor1.c,19 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;Motor1.c,20 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;Motor1.c,14 :: 		for(mov=0;mov<3;mov++){
	INCF       _mov+0, 1
;Motor1.c,21 :: 		}
	GOTO       L_main2
L_main3:
;Motor1.c,22 :: 		for(mov=0;mov<2;mov++){
	CLRF       _mov+0
L_main8:
	MOVLW      128
	XORWF      _mov+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Motor1.c,23 :: 		PORTA=0;
	CLRF       PORTA+0
;Motor1.c,24 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Motor1.c,25 :: 		PORTA.F1=0;
	BCF        PORTA+0, 1
;Motor1.c,26 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;Motor1.c,27 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;Motor1.c,28 :: 		delay_ms(300);
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
;Motor1.c,22 :: 		for(mov=0;mov<2;mov++){
	INCF       _mov+0, 1
;Motor1.c,29 :: 		}
	GOTO       L_main8
L_main9:
;Motor1.c,30 :: 		}
	GOTO       L_main0
;Motor1.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
