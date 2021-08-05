#line 1 "C:/Users/Ali Güral Lojman/Desktop/3.ödev/odevv3.c"


short display = 0;

void main() {
 trisb = 0;
 portb = 0;
 trisc = 0x03;
 while(1) {
 if(! PORTC.RC0 ) {
 display++;
 while(! PORTC.RC0 );
 }
 if(! PORTC.RC1 ) {
 display--;
 while(! PORTC.RC1 );
 }
 if((display > 99) |(display < 0)) display=0;
 portb=display;

 }
}
