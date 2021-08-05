unsigned cnt;                    // cnt isimli isaretsiz tamsayi bir deðiþken tanýmlandý
void main() {
     cnt = 0;                     // sayici
     TRISB= 0;                    // PORTB cýkýs olarak ayarlanýyor
     PORTB= 0x55;                 // PORTB ayarlandý
     TMR2 = 6;
     
     // TMR2 8 bit modunda, zamanlayici, presaler 01 = 4
     T2CON = 0x05;


     INTCON = 0xC0;              // GIE, PEIE bitleri set verildi
     PIE1.TMR2IE=1;              // TMR2 kesmesi katif edildi

     while(1){
         if(cnt>=1000) {          // cnt x 100 = 500
            portb=~portb;
            cnt=0;               // cnt resetlendi
         }
     } while(1);
}
void interrupt (void) {
     if(PIR1.TMR2IF) {           // TMR2 kesmesi oluþmus mu
        cnt++;                   // Her kesmede cnt içeriði 1 arttýrýlýyor
        TMR2 = 6;
        PIR1.TMR2IF =0;          // TMR2IF sýfýrlandý
     }
}