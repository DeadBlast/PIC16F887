
_main:

;Contador as-des con 1 boton.c,5 :: 		void main() {
;Contador as-des con 1 boton.c,6 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Contador as-des con 1 boton.c,7 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador as-des con 1 boton.c,8 :: 		PORTD=0;
	CLRF       PORTD+0
;Contador as-des con 1 boton.c,9 :: 		TRISD=0; //declaramos el puerto D como salida
	CLRF       TRISD+0
;Contador as-des con 1 boton.c,10 :: 		PORTB=0;
	CLRF       PORTB+0
;Contador as-des con 1 boton.c,11 :: 		TRISB.F0=1; //Declaramos PORTB.F0 como entrada
	BSF        TRISB+0, 0
;Contador as-des con 1 boton.c,12 :: 		OPTION_REG.NOT_RBPU=0;
	BCF        OPTION_REG+0, 7
;Contador as-des con 1 boton.c,13 :: 		while(1){
L_main0:
;Contador as-des con 1 boton.c,14 :: 		PORTD=cuenta;  //Lo primero que haremos es imprimir en el puerto "cuenta"
	MOVF       _cuenta+0, 0
	MOVWF      PORTD+0
;Contador as-des con 1 boton.c,15 :: 		if(Button(&PORTB,0,0,1)){//Si no se oprime el boton el seguro esta abierto
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
;Contador as-des con 1 boton.c,16 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Contador as-des con 1 boton.c,17 :: 		}
L_main2:
;Contador as-des con 1 boton.c,18 :: 		if(Button(&PORTB,0,10,0)&&oldstate==1){  //Si se oprime el boton y el seguro esta abierto entonces...
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
L__main10:
;Contador as-des con 1 boton.c,19 :: 		oldstate=0;  //cerramos el seguro
	CLRF       _oldstate+0
;Contador as-des con 1 boton.c,20 :: 		if(updown==0){ //si updown=0 entonces quitamos una unidad a la cuenta
	MOVF       _updown+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Contador as-des con 1 boton.c,21 :: 		cuenta--;
	DECF       _cuenta+0, 1
;Contador as-des con 1 boton.c,22 :: 		}
L_main6:
;Contador as-des con 1 boton.c,23 :: 		if(updown==1){ //si updown=1 entonces le añadios una unidad a cuenta
	MOVF       _updown+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Contador as-des con 1 boton.c,24 :: 		cuenta++;
	INCF       _cuenta+0, 1
;Contador as-des con 1 boton.c,25 :: 		}
L_main7:
;Contador as-des con 1 boton.c,26 :: 		if(cuenta>14){ //Si la cuenta es mayor que 14(llegara al 15) updown ahora pasara a 0 (Por lo que descendera)
	MOVLW      128
	XORLW      14
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cuenta+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;Contador as-des con 1 boton.c,27 :: 		updown=0;
	CLRF       _updown+0
;Contador as-des con 1 boton.c,28 :: 		}
L_main8:
;Contador as-des con 1 boton.c,29 :: 		if(cuenta<1){  //Si la cuenta es menor a 1(llegara al 0) updown ahora sera 1 (Por lo que ascendera)
	MOVLW      128
	XORWF      _cuenta+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Contador as-des con 1 boton.c,30 :: 		updown=1;
	MOVLW      1
	MOVWF      _updown+0
;Contador as-des con 1 boton.c,31 :: 		}
L_main9:
;Contador as-des con 1 boton.c,32 :: 		}
L_main5:
;Contador as-des con 1 boton.c,33 :: 		}
	GOTO       L_main0
;Contador as-des con 1 boton.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
