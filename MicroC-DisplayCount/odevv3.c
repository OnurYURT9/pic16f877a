#define artir PORTC.RC0  // RCO pinine isim tanımlaması yapıldı
#define azalt PORTC.RC1  // RC1 pinine isim tanımlaması yapıldı
short display  = 0;

void main() {
     trisb = 0;
     portb = 0;
     trisc = 0x03;  // C portunun RC0 ve RC1 pinleri giriş yapıldı
           while(1) {
              if(!artir) {  // artir isimli butona basıldı mı? (RC0 = 0 mı?)
                 display++;
                 while(!artir);  // butonun bırakılmasını bekle
                 }
                 if(!azalt) {
                 display--;
                 while(!azalt);
                 }
                if((display > 99) |(display < 0))   display=0;
                            portb=display;

           }
}