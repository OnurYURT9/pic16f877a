#line 1 "C:/Users/Ali Güral Lojman/Desktop/odev13/odev13.c"
unsigned cnt;
void main(){
 cnt = 0;
 TRISB=0;
 PORTB=0X00;
 TMR1H = 0xF6;
 TMR1L = 0x3C;
 T1CON.T1CKPS1 = 1;
 T1CON.T1CKPS0 = 1;
 T1CON.T1OSCEN = 0;
 T1CON.T1SYNC = 0;
 T1CON.TMR1CS = 0;
 T1CON.TMR1ON = 1;
 INTCON = 0xC0;
 PIE1.TMR1IE=1;
 while(1){
 if (cnt<=500) {portb.rb0=1;portb.rb1=1,portb.rb2=0;portb.rb3=0;portb.rb4=0;portb.rb5=0,portb.rb6=0,portb.rb6=0;}
if ((500<cnt)&&(cnt<=1000)) {portb.rb0=0;portb.rb1=0,portb.rb2=1;portb.rb3=1;portb.rb4=0;portb.rb5=0,portb.rb6=0,portb.rb7=0;}
if ((1000<cnt)&&(cnt<=1500)) {portb.rb0=0;portb.rb1=0,portb.rb2=0;portb.rb3=0;portb.rb4=1;portb.rb5=1,portb.rb6=0,portb.rb7=0;}
if ((1500<cnt)&&(cnt<=2000)) {portb.rb0=0;portb.rb1=0,portb.rb2=0;portb.rb3=0;portb.rb4=0;portb.rb5=0,portb.rb6=1,portb.rb7=1;}
if (cnt>2000) cnt =0; }
 while(1);
 }
 void interrupt(void){
 if(PIR1.TMR1IF)
 {
 cnt++;
 TMR1H = 0xF6;
 TMR1L = 0x3C;
 PIR1.TMR1IF=0;
 }
}
