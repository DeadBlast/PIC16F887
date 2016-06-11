
_Lcd_Ram_Chr:

;Caracter.c,2 :: 		void Lcd_Ram_Chr(char InitDir, const char *Mapa) { //Con esto guardamos los caracteres
;Caracter.c,4 :: 		Lcd_Cmd(InitDir);
	MOVF       FARG_Lcd_Ram_Chr_InitDir+0, 0
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Caracter.c,5 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(Mapa[i]);
	CLRF       Lcd_Ram_Chr_i_L0+0
L_Lcd_Ram_Chr0:
	MOVF       Lcd_Ram_Chr_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_Lcd_Ram_Chr1
	MOVF       Lcd_Ram_Chr_i_L0+0, 0
	ADDWF      FARG_Lcd_Ram_Chr_Mapa+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_Ram_Chr_Mapa+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       Lcd_Ram_Chr_i_L0+0, 1
	GOTO       L_Lcd_Ram_Chr0
L_Lcd_Ram_Chr1:
;Caracter.c,6 :: 		}
L_end_Lcd_Ram_Chr:
	RETURN
; end of _Lcd_Ram_Chr

_main:

;Caracter.c,22 :: 		void main() {
;Caracter.c,23 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Caracter.c,24 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Caracter.c,25 :: 		Lcd_Init();//iniciamos la LCD
	CALL       _Lcd_Init+0
;Caracter.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);//Limpiamos la pantalla
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Caracter.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //Quitamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Caracter.c,28 :: 		Lcd_RAM_Chr(64,caracter1); //Elegimos la posicion donde se va a guardar y lo que vamos a guardar
	MOVLW      64
	MOVWF      FARG_Lcd_Ram_Chr_InitDir+0
	MOVLW      _caracter1+0
	MOVWF      FARG_Lcd_Ram_Chr_Mapa+0
	MOVLW      hi_addr(_caracter1+0)
	MOVWF      FARG_Lcd_Ram_Chr_Mapa+1
	CALL       _Lcd_Ram_Chr+0
;Caracter.c,29 :: 		Lcd_Chr(1,1,0);//En la linea 1 columna 1 imprimiremos el caracter guardado en "0" (Que es el primero)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Caracter.c,30 :: 		Lcd_Out(2,1,"Politecnico");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Caracter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Caracter.c,32 :: 		while(1){
L_main3:
;Caracter.c,33 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
L_main5:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      5
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Caracter.c,34 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Caracter.c,35 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;Caracter.c,33 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
;Caracter.c,36 :: 		}
	GOTO       L_main5
L_main6:
;Caracter.c,37 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
L_main9:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      5
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Caracter.c,38 :: 		Lcd_Cmd(_LCD_SHIFT_Left);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Caracter.c,39 :: 		delay_ms(300);
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
;Caracter.c,37 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
;Caracter.c,40 :: 		}
	GOTO       L_main9
L_main10:
;Caracter.c,41 :: 		}
	GOTO       L_main3
;Caracter.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
