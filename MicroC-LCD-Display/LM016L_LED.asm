
_main:

;LM016L_LED.c,21 :: 		void main() {
;LM016L_LED.c,22 :: 		Lcd_Init(); //LCD display hazýrlandý.
	CALL       _Lcd_Init+0
;LM016L_LED.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //LCD display ekranýnda imleç kaldýrýldý.
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM016L_LED.c,24 :: 		Lcd_Cmd(_LCD_CLEAR); //LCD ekraný temizlendi.
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM016L_LED.c,25 :: 		Lcd_Out(1, 1, "Pic16f877a ve");  //1.satýr ve 1.sütuna text yazýldý.
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LM016L_LED+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM016L_LED.c,26 :: 		Lcd_Out(2, 3, "MicroC");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LM016L_LED+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LM016L_LED.c,28 :: 		while(1) {
L_main0:
;LM016L_LED.c,29 :: 		if(sil) Lcd_Cmd(_LCD_CLEAR);
	BTFSS      PORTB+0, 5
	GOTO       L_main2
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_main2:
;LM016L_LED.c,30 :: 		if(sola) {
	BTFSS      PORTB+0, 6
	GOTO       L_main3
;LM016L_LED.c,31 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT); //evet ise display ekranýndaki yazýyý kaydýr. butonun býrakýlmasýný bekle.
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LM016L_LED.c,32 :: 		while(1);
L_main4:
	GOTO       L_main4
;LM016L_LED.c,33 :: 		}
L_main3:
;LM016L_LED.c,34 :: 		}
	GOTO       L_main0
;LM016L_LED.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
