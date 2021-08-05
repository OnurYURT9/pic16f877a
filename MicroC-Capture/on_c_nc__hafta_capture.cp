#line 1 "C:/Users/gs_fa/Desktop/MicroC/on_c_nc__hafta_capture.c"
void interrupt()
{
 if(CCP1IF_bit) {
 portb++;
 }
 CCP1IF_bit = 0;
}
void main() {
 ADCON1 = 0x07;
 CMCON = 0;
 TRISB = 0x00;
 PORTB = 0x00;
 TMR1L = 0x00;
 TMR1H = 0X00;
 T1CON = 0x33;

 TRISC.RC2 = 1;
 CCPR1L = 0x00;
 CCPR1H = 0x00;
 CCP1CON = 0x06;
 CCP1IE_bit = 1;
 INTCON = 0xC0;

 while(1);

}
