
_main:

;interrupt_app2_odev.c,1 :: 		void main(void) {
;interrupt_app2_odev.c,2 :: 		TRISB = 0xF0;             //rb4..rb7 giriþ, diðerleri çýkýþ
	MOVLW      240
	MOVWF      TRISB+0
;interrupt_app2_odev.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;interrupt_app2_odev.c,5 :: 		INTCON.RBIF = 0;          // RB4..RB7 kesme bayrak biti (1: kesme olustu, 0: kesme olusmadý)
	BCF        INTCON+0, 0
;interrupt_app2_odev.c,6 :: 		INTCON.RBIE = 1;          // RB4..RB7 kesme izni veriliyor
	BSF        INTCON+0, 3
;interrupt_app2_odev.c,7 :: 		INTCON.GIE = 1;           // Tüm kesme iþlemlerine izin veriliyor
	BSF        INTCON+0, 7
;interrupt_app2_odev.c,8 :: 		INTCON.PEIE = 0;          // Cevre ara birimlerinden gellen kesmelere izin verilmiyor
	BCF        INTCON+0, 6
;interrupt_app2_odev.c,10 :: 		while(1);
L_main0:
	GOTO       L_main0
;interrupt_app2_odev.c,11 :: 		}
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

;interrupt_app2_odev.c,12 :: 		void interrupt(void)
;interrupt_app2_odev.c,14 :: 		if(INTCON.RBIF)                // RB4..RB7 kesme olusmus mu diye bakýlýyor
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt2
;interrupt_app2_odev.c,16 :: 		INTCON.GIE = 0;          // Kesme varsa, baska kesme gelmemesi için kesme sýfýrlanýyor
	BCF        INTCON+0, 7
;interrupt_app2_odev.c,17 :: 		if(portb.rb4) {
	BTFSS      PORTB+0, 4
	GOTO       L_interrupt3
;interrupt_app2_odev.c,18 :: 		portb.rb0 = ~portb.rb0;
	MOVLW      1
	XORWF      PORTB+0, 1
;interrupt_app2_odev.c,19 :: 		portb.rb1=0;   portb.rb2=0;   portb.rb3=0;
	BCF        PORTB+0, 1
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
;interrupt_app2_odev.c,20 :: 		}
	GOTO       L_interrupt4
L_interrupt3:
;interrupt_app2_odev.c,21 :: 		else if(portb.rb5) {
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt5
;interrupt_app2_odev.c,22 :: 		portb.rb1 = ~portb.rb1;
	MOVLW      2
	XORWF      PORTB+0, 1
;interrupt_app2_odev.c,23 :: 		portb.rb0=0;   portb.rb2=0;   portb.rb3=0;
	BCF        PORTB+0, 0
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
;interrupt_app2_odev.c,24 :: 		}
	GOTO       L_interrupt6
L_interrupt5:
;interrupt_app2_odev.c,25 :: 		else if(portb.rb6) {
	BTFSS      PORTB+0, 6
	GOTO       L_interrupt7
;interrupt_app2_odev.c,26 :: 		portb.rb2 = ~portb.rb2;
	MOVLW      4
	XORWF      PORTB+0, 1
;interrupt_app2_odev.c,27 :: 		portb.rb0=0;   portb.rb1=0;   portb.rb3=0;
	BCF        PORTB+0, 0
	BCF        PORTB+0, 1
	BCF        PORTB+0, 3
;interrupt_app2_odev.c,28 :: 		}
	GOTO       L_interrupt8
L_interrupt7:
;interrupt_app2_odev.c,29 :: 		else if(portb.rb7) {
	BTFSS      PORTB+0, 7
	GOTO       L_interrupt9
;interrupt_app2_odev.c,30 :: 		portb.rb3 = ~portb.rb3;
	MOVLW      8
	XORWF      PORTB+0, 1
;interrupt_app2_odev.c,31 :: 		portb.rb0=0;   portb.rb1=0;   portb.rb2=0;
	BCF        PORTB+0, 0
	BCF        PORTB+0, 1
	BCF        PORTB+0, 2
;interrupt_app2_odev.c,32 :: 		}
L_interrupt9:
L_interrupt8:
L_interrupt6:
L_interrupt4:
;interrupt_app2_odev.c,33 :: 		portb = portb;           // Son deðiþikliklerin algýlanmasý için portb'yi bir kere oku
;interrupt_app2_odev.c,34 :: 		INTCON.RBIF = 0;         // Tekrar dýþ kesme alýnabilmesi için kesme bayraðý temizleniyor
	BCF        INTCON+0, 0
;interrupt_app2_odev.c,35 :: 		INTCON.GIE = 1;          // Tekrar kesme alýnabilmesi için genel kesme bayraðý set ediliyor
	BSF        INTCON+0, 7
;interrupt_app2_odev.c,36 :: 		}
L_interrupt2:
;interrupt_app2_odev.c,37 :: 		}
L_end_interrupt:
L__interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
