void interrupt()
{
 if(CCP1IF_bit) {
    portb++;         // CCP1 yakalama olu�tu, portb i�eri�ini 1 art�r
    }                // TMR1'in i�eri�i otomatik olarak CCPR1 i�eri�ine aktar�ld�
    CCP1IF_bit = 0;  // CCP1IF bayra�� temizlendi
}
void main() {
     ADCON1 = 0x07;  // AN pinleri dijital I/O yap�land�r�ld�
     CMCON = 0;      // Comparators (kar��t�r�c�lar) pasif edildi
     TRISB = 0x00;   // PORTB ��k�� yap�ld�
     PORTB = 0x00;   // PORTB temizlendi
     TMR1L = 0x00;   // TMT1L ve TMR1H kaydedici �ifti s�f�rland�
     TMR1H = 0X00;
     T1CON = 0x33;   // TMR1 1:8 prescaler ve T13CKI giri�inden gelen
                     // her 8.y�kselen darbe kenar�nda 1 artmaya ayarland�
     TRISC.RC2 = 1;  // RC2 pini giri� yap�ld�
     CCPR1L = 0x00;  // CCPR1L ve CCPR1H kaydedici i�eri�i temizlendi
     CCPR1H = 0x00;
     CCP1CON = 0x06; // CCP1 donan�m� sinyalin her y�kselen 4. kenar�n�
     CCP1IE_bit = 1; // yakalar. CCP1 donan�m� aktif edildi
     INTCON = 0xC0;  // GIE, PEIE bitleri set edildi
     
     while(1);       // Sonsuz d�ng�
     
}