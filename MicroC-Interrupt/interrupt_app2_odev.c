void main(void) {
     TRISB = 0xF0;             //rb4..rb7 giri�, di�erleri ��k��
     PORTB = 0x00;

     INTCON.RBIF = 0;          // RB4..RB7 kesme bayrak biti (1: kesme olustu, 0: kesme olusmad�)
     INTCON.RBIE = 1;          // RB4..RB7 kesme izni veriliyor
     INTCON.GIE = 1;           // T�m kesme i�lemlerine izin veriliyor
     INTCON.PEIE = 0;          // Cevre ara birimlerinden gellen kesmelere izin verilmiyor

     while(1);
}
     void interrupt(void)
     {
          if(INTCON.RBIF)                // RB4..RB7 kesme olusmus mu diye bak�l�yor
          {
                INTCON.GIE = 0;          // Kesme varsa, baska kesme gelmemesi i�in kesme s�f�rlan�yor
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
                portb = portb;           // Son de�i�ikliklerin alg�lanmas� i�in portb'yi bir kere oku
                INTCON.RBIF = 0;         // Tekrar d�� kesme al�nabilmesi i�in kesme bayra�� temizleniyor
                INTCON.GIE = 1;          // Tekrar kesme al�nabilmesi i�in genel kesme bayra�� set ediliyor
           }
      }