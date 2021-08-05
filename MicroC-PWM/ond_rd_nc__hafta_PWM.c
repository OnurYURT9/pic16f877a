unsigned aktif_duty1, aktif_duty2;

void main() {
     ADCON1 |=0x0F;                          // AN pinlerri dijital I/0 yap�land�r�ld�
     CMCON |=7;                              // Comparators (kar��la�t�r�c�lar) pasif edildi
     
     TRISB=0xFF;                             // PORTB giri� yap�ld�
     PORTB=0x00;                             // PORTB temizlendi
     
     PWM1_Init(500);
     PWM2_Init(500);                         // PWM1 ile PWM2 mod�l� 500 Hz'e ayarland�
     
     aktif_duty1=50;                         // Aktif_duty1 de�i�kenine 50 y�klendi
     aktif_duty2=100;                        // Aktif_duty2 de�i�kenine 100 y�klendi
     
     PWM1_Start();
     PWM2_Start();                           // PWM1 ve PWM2 ba�lat�ld�
     PWM1_Set_Duty(aktif_duty1);             // PWM1 i�in duty_cycle set edildi
     PWM2_Set_Duty(aktif_duty2);             // PWM2 i�in duty_cycle set edildi
     
     while(1) {
              if(portb.rb6) {
                 delay_ms(40);
                 aktif_duty1++;              // Aktif_duty1 de�erini 1 artt�r
                 PWM1_Set_Duty(aktif_duty1); // PWM1 i�in duty_cycle set deildi
              }
              
              if(portb.rb7) {
                 delay_ms(40);
                 aktif_duty1--;               // Aktif_duty1 de�erini 1 azalt
                 PWM1_Set_Duty(aktif_duty1);  // PWM1 i�in duty_cycle set edildi
              }
     }

}