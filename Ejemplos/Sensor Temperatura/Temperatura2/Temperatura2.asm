
_main:

;Temperatura2.c,20 :: 		void main() {
;Temperatura2.c,21 :: 		ANSEL=0x00;
	CLRF       ANSEL+0
;Temperatura2.c,22 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Temperatura2.c,23 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Temperatura2.c,24 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;Temperatura2.c,25 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Temperatura2.c,26 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;Temperatura2.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Temperatura2.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperatura2.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperatura2.c,30 :: 		Lcd_Out(1,1,"Activa el sensor");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Temperatura2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperatura2.c,31 :: 		Lcd_Out(2,1,"para ver la Temp");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Temperatura2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperatura2.c,32 :: 		while(1){
L_main0:
;Temperatura2.c,33 :: 		if(PORTB.F1==0){
	BTFSC      PORTB+0, 1
	GOTO       L_main2
;Temperatura2.c,34 :: 		oldstate=1;
	MOVLW      1
	MOVWF      _oldstate+0
;Temperatura2.c,35 :: 		}
L_main2:
;Temperatura2.c,36 :: 		if(PORTB.F1==1&&oldstate==1){
	BTFSS      PORTB+0, 1
	GOTO       L_main5
	MOVF       _oldstate+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main5
L__main7:
;Temperatura2.c,37 :: 		oldstate=0;
	CLRF       _oldstate+0
;Temperatura2.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Temperatura2.c,39 :: 		Lcd_Out(1,3,"Temperatura:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Temperatura2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperatura2.c,40 :: 		Radc = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Radc+0
	MOVF       R0+1, 0
	MOVWF      _Radc+1
;Temperatura2.c,41 :: 		Tem = 0.244*Radc;
	CALL       _word2double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      124
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _Tem+0
	MOVF       R0+1, 0
	MOVWF      _Tem+1
	MOVF       R0+2, 0
	MOVWF      _Tem+2
	MOVF       R0+3, 0
	MOVWF      _Tem+3
;Temperatura2.c,42 :: 		TemI = Tem;
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _TemI+0
	MOVF       R0+1, 0
	MOVWF      _TemI+1
;Temperatura2.c,43 :: 		IntToStr( Tem, Text);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _Text+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Temperatura2.c,44 :: 		Lcd_Out(2,4,Text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperatura2.c,45 :: 		Lcd_Out(2,10,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Temperatura2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Temperatura2.c,46 :: 		delay_ms(1000);
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
;Temperatura2.c,47 :: 		}
L_main5:
;Temperatura2.c,48 :: 		}
	GOTO       L_main0
;Temperatura2.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
