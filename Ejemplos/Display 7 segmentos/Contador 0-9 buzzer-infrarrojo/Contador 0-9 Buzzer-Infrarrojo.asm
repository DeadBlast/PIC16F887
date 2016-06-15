
_main:

;Contador 0-9 Buzzer-Infrarrojo.c,4 :: 		void main(){
;Contador 0-9 Buzzer-Infrarrojo.c,5 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador 0-9 Buzzer-Infrarrojo.c,6 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador 0-9 Buzzer-Infrarrojo.c,7 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador 0-9 Buzzer-Infrarrojo.c,8 :: 		TRISD=0X00;
	CLRF       TRISD+0
;Contador 0-9 Buzzer-Infrarrojo.c,9 :: 		C1ON_bit=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Contador 0-9 Buzzer-Infrarrojo.c,10 :: 		C2ON_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Contador 0-9 Buzzer-Infrarrojo.c,11 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;Contador 0-9 Buzzer-Infrarrojo.c,13 :: 		TRISC.F0=0;
	BCF        TRISC+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,14 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador 0-9 Buzzer-Infrarrojo.c,15 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador 0-9 Buzzer-Infrarrojo.c,16 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador 0-9 Buzzer-Infrarrojo.c,18 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,19 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador 0-9 Buzzer-Infrarrojo.c,20 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador 0-9 Buzzer-Infrarrojo.c,21 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;Contador 0-9 Buzzer-Infrarrojo.c,23 :: 		TRISA.F0=0;
	BCF        TRISA+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,24 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,25 :: 		while(1){
L_main0:
;Contador 0-9 Buzzer-Infrarrojo.c,26 :: 		PORTD=numero[cuenta];//Tomaremos numero en la posicion cuenta!
	MOVF       _cuenta+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9 Buzzer-Infrarrojo.c,27 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Contador 0-9 Buzzer-Infrarrojo.c,28 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,29 :: 		if(PORTB.F1==0){
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;Contador 0-9 Buzzer-Infrarrojo.c,30 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Contador 0-9 Buzzer-Infrarrojo.c,31 :: 		}
L_main3:
;Contador 0-9 Buzzer-Infrarrojo.c,32 :: 		if(PORTB.F1==1&&oldstate==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main6
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main6
L__main8:
;Contador 0-9 Buzzer-Infrarrojo.c,33 :: 		oldstate=0;
	CLRF       _oldstate+0
;Contador 0-9 Buzzer-Infrarrojo.c,34 :: 		cuenta++;
	INCF       _cuenta+0, 1
;Contador 0-9 Buzzer-Infrarrojo.c,35 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;Contador 0-9 Buzzer-Infrarrojo.c,36 :: 		if(cuenta>9){
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cuenta+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Contador 0-9 Buzzer-Infrarrojo.c,37 :: 		cuenta=0;
	CLRF       _cuenta+0
;Contador 0-9 Buzzer-Infrarrojo.c,38 :: 		}
L_main7:
;Contador 0-9 Buzzer-Infrarrojo.c,39 :: 		}
L_main6:
;Contador 0-9 Buzzer-Infrarrojo.c,40 :: 		}
	GOTO       L_main0
;Contador 0-9 Buzzer-Infrarrojo.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
