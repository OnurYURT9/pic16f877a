
_main:

;odevv3.c,5 :: 		void main() {
;odevv3.c,6 :: 		trisb = 0;
	CLRF       TRISB+0
;odevv3.c,7 :: 		portb = 0;
	CLRF       PORTB+0
;odevv3.c,8 :: 		trisc = 0x03;  // C portunun RC0 ve RC1 pinleri giriş yapıldı
	MOVLW      3
	MOVWF      TRISC+0
;odevv3.c,9 :: 		while(1) {
L_main0:
;odevv3.c,10 :: 		if(!artir) {  // artir isimli butona basıldı mı? (RC0 = 0 mı?)
	BTFSC      PORTC+0, 0
	GOTO       L_main2
;odevv3.c,11 :: 		display++;
	INCF       _display+0, 1
;odevv3.c,12 :: 		while(!artir);  // butonun bırakılmasını bekle
L_main3:
	BTFSC      PORTC+0, 0
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;odevv3.c,13 :: 		}
L_main2:
;odevv3.c,14 :: 		if(!azalt) {
	BTFSC      PORTC+0, 1
	GOTO       L_main5
;odevv3.c,15 :: 		display--;
	DECF       _display+0, 1
;odevv3.c,16 :: 		while(!azalt);
L_main6:
	BTFSC      PORTC+0, 1
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;odevv3.c,17 :: 		}
L_main5:
;odevv3.c,18 :: 		if((display > 99) |(display < 0))   display=0;
	MOVLW      128
	XORLW      99
	MOVWF      R1+0
	MOVLW      128
	XORWF      _display+0, 0
	SUBWF      R1+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _display+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	CLRF       _display+0
L_main8:
;odevv3.c,19 :: 		portb=display;
	MOVF       _display+0, 0
	MOVWF      PORTB+0
;odevv3.c,21 :: 		}
	GOTO       L_main0
;odevv3.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
