
_main:

;onikinci_hafta_timer2.c,2 :: 		void main() {
;onikinci_hafta_timer2.c,3 :: 		cnt = 0;                     // sayici
	CLRF       _cnt+0
	CLRF       _cnt+1
;onikinci_hafta_timer2.c,4 :: 		TRISB= 0;                    // PORTB cýkýs olarak ayarlanýyor
	CLRF       TRISB+0
;onikinci_hafta_timer2.c,5 :: 		PORTB= 0x55;                 // PORTB ayarlandý
	MOVLW      85
	MOVWF      PORTB+0
;onikinci_hafta_timer2.c,6 :: 		TMR2 = 6;
	MOVLW      6
	MOVWF      TMR2+0
;onikinci_hafta_timer2.c,9 :: 		T2CON = 0x05;
	MOVLW      5
	MOVWF      T2CON+0
;onikinci_hafta_timer2.c,12 :: 		INTCON = 0xC0;              // GIE, PEIE bitleri set verildi
	MOVLW      192
	MOVWF      INTCON+0
;onikinci_hafta_timer2.c,13 :: 		PIE1.TMR2IE=1;              // TMR2 kesmesi katif edildi
	BSF        PIE1+0, 1
;onikinci_hafta_timer2.c,15 :: 		while(1){
L_main0:
;onikinci_hafta_timer2.c,16 :: 		if(cnt>=1000) {          // cnt x 100 = 500
	MOVLW      3
	SUBWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      232
	SUBWF      _cnt+0, 0
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;onikinci_hafta_timer2.c,17 :: 		portb=~portb;
	COMF       PORTB+0, 1
;onikinci_hafta_timer2.c,18 :: 		cnt=0;               // cnt resetlendi
	CLRF       _cnt+0
	CLRF       _cnt+1
;onikinci_hafta_timer2.c,19 :: 		}
L_main2:
;onikinci_hafta_timer2.c,20 :: 		} while(1);
	GOTO       L_main0
;onikinci_hafta_timer2.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;onikinci_hafta_timer2.c,22 :: 		void interrupt (void) {
;onikinci_hafta_timer2.c,23 :: 		if(PIR1.TMR2IF) {           // TMR2 kesmesi oluþmus mu
	BTFSS      PIR1+0, 1
	GOTO       L_interrupt5
;onikinci_hafta_timer2.c,24 :: 		cnt++;                   // Her kesmede cnt içeriði 1 arttýrýlýyor
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;onikinci_hafta_timer2.c,25 :: 		TMR2 = 6;
	MOVLW      6
	MOVWF      TMR2+0
;onikinci_hafta_timer2.c,26 :: 		PIR1.TMR2IF =0;          // TMR2IF sýfýrlandý
	BCF        PIR1+0, 1
;onikinci_hafta_timer2.c,27 :: 		}
L_interrupt5:
;onikinci_hafta_timer2.c,28 :: 		}
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
