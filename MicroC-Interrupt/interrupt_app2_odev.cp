#line 1 "C:/Users/Ali Güral Lojman/Desktop/interrupt_app_odev_4/interrupt_app2_odev.c"
void main(void) {
 TRISB = 0xF0;
 PORTB = 0x00;

 INTCON.RBIF = 0;
 INTCON.RBIE = 1;
 INTCON.GIE = 1;
 INTCON.PEIE = 0;

 while(1);
}
 void interrupt(void)
 {
 if(INTCON.RBIF)
 {
 INTCON.GIE = 0;
 if(portb.rb4) {
 portb.rb0 = ~portb.rb0;
 portb.rb1=0; portb.rb2=0; portb.rb3=0;
 }
 else if(portb.rb5) {
 portb.rb1 = ~portb.rb1;
 portb.rb0=0; portb.rb2=0; portb.rb3=0;
 }
 else if(portb.rb6) {
 portb.rb2 = ~portb.rb2;
 portb.rb0=0; portb.rb1=0; portb.rb3=0;
 }
 else if(portb.rb7) {
 portb.rb3 = ~portb.rb3;
 portb.rb0=0; portb.rb1=0; portb.rb2=0;
 }
 portb = portb;
 INTCON.RBIF = 0;
 INTCON.GIE = 1;
 }
 }
