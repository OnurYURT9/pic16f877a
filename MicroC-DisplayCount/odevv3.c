#define artir PORTC.RC0  // RCO pinine isim tan�mlamas� yap�ld�
#define azalt PORTC.RC1  // RC1 pinine isim tan�mlamas� yap�ld�
short display  = 0;

void main() {
     trisb = 0;
     portb = 0;
     trisc = 0x03;  // C portunun RC0 ve RC1 pinleri giri� yap�ld�
           while(1) {
              if(!artir) {  // artir isimli butona bas�ld� m�? (RC0 = 0 m�?)
                 display++;
                 while(!artir);  // butonun b�rak�lmas�n� bekle
                 }
                 if(!azalt) {
                 display--;
                 while(!azalt);
                 }
                if((display > 99) |(display < 0))   display=0;
                            portb=display;

           }
}