
_main:

;Contador 0-9999.c,3 :: 		void main() {
;Contador 0-9999.c,4 :: 		ANSEL=0;   //Salidas analogicas a 0
	CLRF       ANSEL+0
;Contador 0-9999.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Contador 0-9999.c,6 :: 		PORTD=0;      //Puertos D a 0
	CLRF       PORTD+0
;Contador 0-9999.c,7 :: 		TRISD=0;
	CLRF       TRISD+0
;Contador 0-9999.c,8 :: 		TRISC.F0=0;  //Declaramos el puerto C como salida.
	BCF        TRISC+0, 0
;Contador 0-9999.c,9 :: 		TRISC.F1=0;
	BCF        TRISC+0, 1
;Contador 0-9999.c,10 :: 		TRISC.F2=0;
	BCF        TRISC+0, 2
;Contador 0-9999.c,11 :: 		TRISC.F3=0;
	BCF        TRISC+0, 3
;Contador 0-9999.c,13 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador 0-9999.c,14 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador 0-9999.c,15 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador 0-9999.c,16 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;Contador 0-9999.c,18 :: 		unidades=0;
	CLRF       _unidades+0
;Contador 0-9999.c,19 :: 		decenas=0;
	CLRF       _decenas+0
;Contador 0-9999.c,20 :: 		centenas=0;
	CLRF       _centenas+0
;Contador 0-9999.c,21 :: 		millares=0;
	CLRF       _millares+0
;Contador 0-9999.c,22 :: 		while(1){  //Ciclo infinito para imprimir permanentemente  --->
L_main0:
;Contador 0-9999.c,23 :: 		PORTD=numero[unidades];//los datos en cada displaycorrespondiente
	MOVF       _unidades+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9999.c,24 :: 		PORTC.F3=0;    //Habilitamos puerto F3 para habilitar el 4to display
	BCF        PORTC+0, 3
;Contador 0-9999.c,25 :: 		delay_ms(3);    //dejamos un tiempo para que eñ display reciba los datos
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
;Contador 0-9999.c,26 :: 		PORTC.F3=1;     //deshabilitamos el display F3 para que no siga recibiendo datos.
	BSF        PORTC+0, 3
;Contador 0-9999.c,27 :: 		PORTD=numero[decenas];
	MOVF       _decenas+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9999.c,28 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;Contador 0-9999.c,29 :: 		delay_ms(3);
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
;Contador 0-9999.c,30 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;Contador 0-9999.c,31 :: 		PORTD=numero[centenas];
	MOVF       _centenas+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9999.c,32 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;Contador 0-9999.c,33 :: 		delay_ms(3);
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
;Contador 0-9999.c,34 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;Contador 0-9999.c,35 :: 		PORTD=numero[millares];
	MOVF       _millares+0, 0
	ADDLW      _numero+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Contador 0-9999.c,36 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;Contador 0-9999.c,37 :: 		delay_ms(3);
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
;Contador 0-9999.c,38 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;Contador 0-9999.c,39 :: 		time++;  //el time lo ocupamos por un error en los delay, por lo que ponemos
	INCF       _time+0, 1
;Contador 0-9999.c,40 :: 		if(time>1){  // a hacer algo al programa en lo que cumple la condicion, en este caso imprimimos los datos.
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _time+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Contador 0-9999.c,41 :: 		time=0;//regresamos a 0 para que pueda seguir funcionando el tiempo
	CLRF       _time+0
;Contador 0-9999.c,42 :: 		unidades++; //aumentamos las unidades
	INCF       _unidades+0, 1
;Contador 0-9999.c,43 :: 		if(unidades>9){ //si las unidades llegan a mas de 9 entonces las decenas aumentan
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _unidades+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Contador 0-9999.c,44 :: 		decenas++;
	INCF       _decenas+0, 1
;Contador 0-9999.c,45 :: 		if(decenas>9){//si las decenas llegan a mas de 9 las centenas aumentan
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _decenas+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;Contador 0-9999.c,46 :: 		decenas=0;
	CLRF       _decenas+0
;Contador 0-9999.c,47 :: 		centenas++;
	INCF       _centenas+0, 1
;Contador 0-9999.c,48 :: 		if(centenas>9){ //Si las centenas centenas llegan a mas de 9 van a 0
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _centenas+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Contador 0-9999.c,49 :: 		centenas=0; // centenas llega a 0
	CLRF       _centenas+0
;Contador 0-9999.c,50 :: 		millares++;  //millares aumenta
	INCF       _millares+0, 1
;Contador 0-9999.c,51 :: 		if(millares>9){ //Si los millares llegan a mas de 9
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      _millares+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Contador 0-9999.c,52 :: 		millares=0; //millares regresa a 0
	CLRF       _millares+0
;Contador 0-9999.c,53 :: 		}
L_main10:
;Contador 0-9999.c,54 :: 		}
L_main9:
;Contador 0-9999.c,55 :: 		}
L_main8:
;Contador 0-9999.c,56 :: 		unidades=0;// las unidades van a 0 si llegan a mas de 9
	CLRF       _unidades+0
;Contador 0-9999.c,57 :: 		}
L_main7:
;Contador 0-9999.c,58 :: 		}
L_main6:
;Contador 0-9999.c,59 :: 		}
	GOTO       L_main0
;Contador 0-9999.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
