
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;on_c_nc__hafta_capture.c,1 :: 		void interrupt()
;on_c_nc__hafta_capture.c,3 :: 		if(CCP1IF_bit) {
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_interrupt0
;on_c_nc__hafta_capture.c,4 :: 		portb++;         // CCP1 yakalama oluþtu, portb içeriðini 1 artýr
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;on_c_nc__hafta_capture.c,5 :: 		}                // TMR1'in içeriði otomatik olarak CCPR1 içeriðine aktarýldý
L_interrupt0:
;on_c_nc__hafta_capture.c,6 :: 		CCP1IF_bit = 0;  // CCP1IF bayraðý temizlendi
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;on_c_nc__hafta_capture.c,7 :: 		}
L_end_interrupt:
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;on_c_nc__hafta_capture.c,8 :: 		void main() {
;on_c_nc__hafta_capture.c,9 :: 		ADCON1 = 0x07;  // AN pinleri dijital I/O yapýlandýrýldý
	MOVLW      7
	MOVWF      ADCON1+0
;on_c_nc__hafta_capture.c,10 :: 		CMCON = 0;      // Comparators (karýþtýrýcýlar) pasif edildi
	CLRF       CMCON+0
;on_c_nc__hafta_capture.c,11 :: 		TRISB = 0x00;   // PORTB çýkýþ yapýldý
	CLRF       TRISB+0
;on_c_nc__hafta_capture.c,12 :: 		PORTB = 0x00;   // PORTB temizlendi
	CLRF       PORTB+0
;on_c_nc__hafta_capture.c,13 :: 		TMR1L = 0x00;   // TMT1L ve TMR1H kaydedici çifti sýfýrlandý
	CLRF       TMR1L+0
;on_c_nc__hafta_capture.c,14 :: 		TMR1H = 0X00;
	CLRF       TMR1H+0
;on_c_nc__hafta_capture.c,15 :: 		T1CON = 0x33;   // TMR1 1:8 prescaler ve T13CKI giriþinden gelen
	MOVLW      51
	MOVWF      T1CON+0
;on_c_nc__hafta_capture.c,17 :: 		TRISC.RC2 = 1;  // RC2 pini giriþ yapýldý
	BSF        TRISC+0, 2
;on_c_nc__hafta_capture.c,18 :: 		CCPR1L = 0x00;  // CCPR1L ve CCPR1H kaydedici içeriði temizlendi
	CLRF       CCPR1L+0
;on_c_nc__hafta_capture.c,19 :: 		CCPR1H = 0x00;
	CLRF       CCPR1H+0
;on_c_nc__hafta_capture.c,20 :: 		CCP1CON = 0x06; // CCP1 donanýmý sinyalin her yükselen 4. kenarýný
	MOVLW      6
	MOVWF      CCP1CON+0
;on_c_nc__hafta_capture.c,21 :: 		CCP1IE_bit = 1; // yakalar. CCP1 donanýmý aktif edildi
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;on_c_nc__hafta_capture.c,22 :: 		INTCON = 0xC0;  // GIE, PEIE bitleri set edildi
	MOVLW      192
	MOVWF      INTCON+0
;on_c_nc__hafta_capture.c,24 :: 		while(1);       // Sonsuz döngü
L_main1:
	GOTO       L_main1
;on_c_nc__hafta_capture.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
