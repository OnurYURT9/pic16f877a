void main(void) {
     TRISB = 0xF0;             //rb4..rb7 giriþ, diðerleri çýkýþ
     PORTB = 0x00;

     INTCON.RBIF = 0;          // RB4..RB7 kesme bayrak biti (1: kesme olustu, 0: kesme olusmadý)
     INTCON.RBIE = 1;          // RB4..RB7 kesme izni veriliyor
     INTCON.GIE = 1;           // Tüm kesme iþlemlerine izin veriliyor
     INTCON.PEIE = 0;          // Cevre ara birimlerinden gellen kesmelere izin verilmiyor

     while(1);
}
     void interrupt(void)
     {
          if(INTCON.RBIF)                // RB4..RB7 kesme olusmus mu diye bakýlýyor
          {
                INTCON.GIE = 0;          // Kesme varsa, baska kesme gelmemesi için kesme sýfýrlanýyor
                if(portb.rb4) {
                portb.rb0 = ~portb.rb0;
                portb.rb1=0;   portb.rb2=0;   portb.rb3=0;
                }
                else if(portb.rb5) {
                portb.rb1 = ~portb.rb1;
                portb.rb0=0;   portb.rb2=0;   portb.rb3=0;
                }
                else if(portb.rb6) {
                portb.rb2 = ~portb.rb2;
                portb.rb0=0;   portb.rb1=0;   portb.rb3=0;
                }
                else if(portb.rb7) {
                portb.rb3 = ~portb.rb3;
                portb.rb0=0;   portb.rb1=0;   portb.rb2=0;
                }
                portb = portb;           // Son deðiþikliklerin algýlanmasý için portb'yi bir kere oku
                INTCON.RBIF = 0;         // Tekrar dýþ kesme alýnabilmesi için kesme bayraðý temizleniyor
                INTCON.GIE = 1;          // Tekrar kesme alýnabilmesi için genel kesme bayraðý set ediliyor
           }
      }