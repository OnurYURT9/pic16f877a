void interrupt()
{
 if(CCP1IF_bit) {
    portb++;         // CCP1 yakalama oluþtu, portb içeriðini 1 artýr
    }                // TMR1'in içeriði otomatik olarak CCPR1 içeriðine aktarýldý
    CCP1IF_bit = 0;  // CCP1IF bayraðý temizlendi
}
void main() {
     ADCON1 = 0x07;  // AN pinleri dijital I/O yapýlandýrýldý
     CMCON = 0;      // Comparators (karýþtýrýcýlar) pasif edildi
     TRISB = 0x00;   // PORTB çýkýþ yapýldý
     PORTB = 0x00;   // PORTB temizlendi
     TMR1L = 0x00;   // TMT1L ve TMR1H kaydedici çifti sýfýrlandý
     TMR1H = 0X00;
     T1CON = 0x33;   // TMR1 1:8 prescaler ve T13CKI giriþinden gelen
                     // her 8.yükselen darbe kenarýnda 1 artmaya ayarlandý
     TRISC.RC2 = 1;  // RC2 pini giriþ yapýldý
     CCPR1L = 0x00;  // CCPR1L ve CCPR1H kaydedici içeriði temizlendi
     CCPR1H = 0x00;
     CCP1CON = 0x06; // CCP1 donanýmý sinyalin her yükselen 4. kenarýný
     CCP1IE_bit = 1; // yakalar. CCP1 donanýmý aktif edildi
     INTCON = 0xC0;  // GIE, PEIE bitleri set edildi
     
     while(1);       // Sonsuz döngü
     
}