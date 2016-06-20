
_main:

;Alarma con buzzer.c,3 :: 		void main() {
;Alarma con buzzer.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Alarma con buzzer.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Alarma con buzzer.c,6 :: 		PORTD=0;
	CLRF       PORTD+0
;Alarma con buzzer.c,7 :: 		TRISD=0;
	CLRF       TRISD+0
;Alarma con buzzer.c,8 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Alarma con buzzer.c,9 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;Alarma con buzzer.c,10 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;Alarma con buzzer.c,11 :: 		TRISA.F0=0;
	BCF        TRISA+0, 0
;Alarma con buzzer.c,12 :: 		while(cuenta>=0){
L_main0:
	MOVLW      128
	XORWF      _cuenta+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main1
;Alarma con buzzer.c,13 :: 		PORTD=numero[cuenta];
	MOVF       _cuenta+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Alarma con buzzer.c,14 :: 		delay_ms(500);
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
;Alarma con buzzer.c,15 :: 		cuenta--;
	DECF       _cuenta+0, 1
;Alarma con buzzer.c,16 :: 		}
	GOTO       L_main0
L_main1:
;Alarma con buzzer.c,17 :: 		while(cuenta<2){
L_main3:
	MOVLW      128
	XORWF      _cuenta+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Alarma con buzzer.c,18 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;Alarma con buzzer.c,19 :: 		delay_ms(500);
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
;Alarma con buzzer.c,20 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;Alarma con buzzer.c,21 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Alarma con buzzer.c,22 :: 		cuenta++;
	INCF       _cuenta+0, 1
;Alarma con buzzer.c,23 :: 		}
	GOTO       L_main3
L_main4:
;Alarma con buzzer.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
