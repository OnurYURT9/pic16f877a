
_main:

;ond_rd_nc__hafta_PWM.c,3 :: 		void main() {
;ond_rd_nc__hafta_PWM.c,4 :: 		ADCON1 |=0x0F;                          // AN pinlerri dijital I/0 yapýlandýrýldý
	MOVLW      15
	IORWF      ADCON1+0, 1
;ond_rd_nc__hafta_PWM.c,5 :: 		CMCON |=7;                              // Comparators (karþýlaþtýrýcýlar) pasif edildi
	MOVLW      7
	IORWF      CMCON+0, 1
;ond_rd_nc__hafta_PWM.c,7 :: 		TRISB=0xFF;                             // PORTB giriþ yapýldý
	MOVLW      255
	MOVWF      TRISB+0
;ond_rd_nc__hafta_PWM.c,8 :: 		PORTB=0x00;                             // PORTB temizlendi
	CLRF       PORTB+0
;ond_rd_nc__hafta_PWM.c,10 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ond_rd_nc__hafta_PWM.c,11 :: 		PWM2_Init(500);                         // PWM1 ile PWM2 modülü 500 Hz'e ayarlandý
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;ond_rd_nc__hafta_PWM.c,13 :: 		aktif_duty1=50;                         // Aktif_duty1 deðiþkenine 50 yüklendi
	MOVLW      50
	MOVWF      _aktif_duty1+0
	MOVLW      0
	MOVWF      _aktif_duty1+1
;ond_rd_nc__hafta_PWM.c,14 :: 		aktif_duty2=100;                        // Aktif_duty2 deðiþkenine 100 yüklendi
	MOVLW      100
	MOVWF      _aktif_duty2+0
	MOVLW      0
	MOVWF      _aktif_duty2+1
;ond_rd_nc__hafta_PWM.c,16 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;ond_rd_nc__hafta_PWM.c,17 :: 		PWM2_Start();                           // PWM1 ve PWM2 baþlatýldý
	CALL       _PWM2_Start+0
;ond_rd_nc__hafta_PWM.c,18 :: 		PWM1_Set_Duty(aktif_duty1);             // PWM1 için duty_cycle set edildi
	MOVF       _aktif_duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ond_rd_nc__hafta_PWM.c,19 :: 		PWM2_Set_Duty(aktif_duty2);             // PWM2 için duty_cycle set edildi
	MOVF       _aktif_duty2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ond_rd_nc__hafta_PWM.c,21 :: 		while(1) {
L_main0:
;ond_rd_nc__hafta_PWM.c,22 :: 		if(portb.rb6) {
	BTFSS      PORTB+0, 6
	GOTO       L_main2
;ond_rd_nc__hafta_PWM.c,23 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;ond_rd_nc__hafta_PWM.c,24 :: 		aktif_duty1++;              // Aktif_duty1 deðerini 1 arttýr
	INCF       _aktif_duty1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _aktif_duty1+1, 1
;ond_rd_nc__hafta_PWM.c,25 :: 		PWM1_Set_Duty(aktif_duty1); // PWM1 için duty_cycle set deildi
	MOVF       _aktif_duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ond_rd_nc__hafta_PWM.c,26 :: 		}
L_main2:
;ond_rd_nc__hafta_PWM.c,28 :: 		if(portb.rb7) {
	BTFSS      PORTB+0, 7
	GOTO       L_main4
;ond_rd_nc__hafta_PWM.c,29 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;ond_rd_nc__hafta_PWM.c,30 :: 		aktif_duty1--;               // Aktif_duty1 deðerini 1 azalt
	MOVLW      1
	SUBWF      _aktif_duty1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _aktif_duty1+1, 1
;ond_rd_nc__hafta_PWM.c,31 :: 		PWM1_Set_Duty(aktif_duty1);  // PWM1 için duty_cycle set edildi
	MOVF       _aktif_duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ond_rd_nc__hafta_PWM.c,32 :: 		}
L_main4:
;ond_rd_nc__hafta_PWM.c,33 :: 		}
	GOTO       L_main0
;ond_rd_nc__hafta_PWM.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
