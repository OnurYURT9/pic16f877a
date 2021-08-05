#line 1 "C:/Users/gs_fa/Desktop/MicroC/onikinci_hafta_timer2.c"
unsigned cnt;
void main() {
 cnt = 0;
 TRISB= 0;
 PORTB= 0x55;
 TMR2 = 6;


 T2CON = 0x05;


 INTCON = 0xC0;
 PIE1.TMR2IE=1;

 while(1){
 if(cnt>=1000) {
 portb=~portb;
 cnt=0;
 }
 } while(1);
}
void interrupt (void) {
 if(PIR1.TMR2IF) {
 cnt++;
 TMR2 = 6;
 PIR1.TMR2IF =0;
 }
}
