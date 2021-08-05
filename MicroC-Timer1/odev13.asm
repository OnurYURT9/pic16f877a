
_main:

;odev13.c,2 :: 		void main(){
;odev13.c,3 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;odev13.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;odev13.c,5 :: 		PORTB=0X00;
	CLRF       PORTB+0
;odev13.c,6 :: 		TMR1H = 0xF6;
	MOVLW      246
	MOVWF      TMR1H+0
;odev13.c,7 :: 		TMR1L = 0x3C;
	MOVLW      60
	MOVWF      TMR1L+0
;odev13.c,8 :: 		T1CON.T1CKPS1 = 1;
	BSF        T1CON+0, 5
;odev13.c,9 :: 		T1CON.T1CKPS0 = 1;
	BSF        T1CON+0, 4
;odev13.c,10 :: 		T1CON.T1OSCEN = 0;
	BCF        T1CON+0, 3
;odev13.c,11 :: 		T1CON.T1SYNC = 0;
	BCF        T1CON+0, 2
;odev13.c,12 :: 		T1CON.TMR1CS = 0;
	BCF        T1CON+0, 1
;odev13.c,13 :: 		T1CON.TMR1ON = 1;
	BSF        T1CON+0, 0
;odev13.c,14 :: 		INTCON = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;odev13.c,15 :: 		PIE1.TMR1IE=1;
	BSF        PIE1+0, 0
;odev13.c,16 :: 		while(1){
L_main0:
;odev13.c,17 :: 		if (cnt<=500) {portb.rb0=1;portb.rb1=1,portb.rb2=0;portb.rb3=0;portb.rb4=0;portb.rb5=0,portb.rb6=0,portb.rb6=0;}
	MOVF       _cnt+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _cnt+0, 0
	SUBLW      244
L__main20:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
	BSF        PORTB+0, 0
	BSF        PORTB+0, 1
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
	BCF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 6
L_main2:
;odev13.c,18 :: 		if ((500<cnt)&&(cnt<=1000)) {portb.rb0=0;portb.rb1=0,portb.rb2=1;portb.rb3=1;portb.rb4=0;portb.rb5=0,portb.rb6=0,portb.rb7=0;}
	MOVF       _cnt+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVF       _cnt+0, 0
	SUBLW      244
L__main21:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVF       _cnt+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       _cnt+0, 0
	SUBLW      232
L__main22:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
L__main18:
	BCF        PORTB+0, 0
	BCF        PORTB+0, 1
	BSF        PORTB+0, 2
	BSF        PORTB+0, 3
	BCF        PORTB+0, 4
	BCF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 7
L_main5:
;odev13.c,19 :: 		if ((1000<cnt)&&(cnt<=1500)) {portb.rb0=0;portb.rb1=0,portb.rb2=0;portb.rb3=0;portb.rb4=1;portb.rb5=1,portb.rb6=0,portb.rb7=0;}
	MOVF       _cnt+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       _cnt+0, 0
	SUBLW      232
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVF       _cnt+1, 0
	SUBLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVF       _cnt+0, 0
	SUBLW      220
L__main24:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
L__main17:
	BCF        PORTB+0, 0
	BCF        PORTB+0, 1
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 4
	BSF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 7
L_main8:
;odev13.c,20 :: 		if ((1500<cnt)&&(cnt<=2000)) {portb.rb0=0;portb.rb1=0,portb.rb2=0;portb.rb3=0;portb.rb4=0;portb.rb5=0,portb.rb6=1,portb.rb7=1;}
	MOVF       _cnt+1, 0
	SUBLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _cnt+0, 0
	SUBLW      220
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
	MOVF       _cnt+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       _cnt+0, 0
	SUBLW      208
L__main26:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
L__main16:
	BCF        PORTB+0, 0
	BCF        PORTB+0, 1
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
	BCF        PORTB+0, 5
	BSF        PORTB+0, 6
	BSF        PORTB+0, 7
L_main11:
;odev13.c,21 :: 		if (cnt>2000) cnt =0;  }
	MOVF       _cnt+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVF       _cnt+0, 0
	SUBLW      208
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	CLRF       _cnt+0
	CLRF       _cnt+1
L_main12:
	GOTO       L_main0
;odev13.c,23 :: 		}
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

;odev13.c,24 :: 		void interrupt(void){
;odev13.c,25 :: 		if(PIR1.TMR1IF)
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt15
;odev13.c,27 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;odev13.c,28 :: 		TMR1H = 0xF6;
	MOVLW      246
	MOVWF      TMR1H+0
;odev13.c,29 :: 		TMR1L = 0x3C;
	MOVLW      60
	MOVWF      TMR1L+0
;odev13.c,30 :: 		PIR1.TMR1IF=0;
	BCF        PIR1+0, 0
;odev13.c,31 :: 		}
L_interrupt15:
;odev13.c,32 :: 		}
L_end_interrupt:
L__interrupt29:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
