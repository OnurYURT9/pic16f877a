unsigned cnt;                    // cnt isimli isaretsiz tamsayi bir de�i�ken tan�mland�
void main() {
     cnt = 0;                     // sayici
     TRISB= 0;                    // PORTB c�k�s olarak ayarlan�yor
     PORTB= 0x55;                 // PORTB ayarland�
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
     if(PIR1.TMR2IF) {           // TMR2 kesmesi olu�mus mu
        cnt++;                   // Her kesmede cnt i�eri�i 1 artt�r�l�yor
        TMR2 = 6;
        PIR1.TMR2IF =0;          // TMR2IF s�f�rland�
     }
}