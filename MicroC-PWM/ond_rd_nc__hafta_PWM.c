unsigned aktif_duty1, aktif_duty2;

void main() {
     ADCON1 |=0x0F;                          // AN pinlerri dijital I/0 yapýlandýrýldý
     CMCON |=7;                              // Comparators (karþýlaþtýrýcýlar) pasif edildi
     
     TRISB=0xFF;                             // PORTB giriþ yapýldý
     PORTB=0x00;                             // PORTB temizlendi
     
     PWM1_Init(500);
     PWM2_Init(500);                         // PWM1 ile PWM2 modülü 500 Hz'e ayarlandý
     
     aktif_duty1=50;                         // Aktif_duty1 deðiþkenine 50 yüklendi
     aktif_duty2=100;                        // Aktif_duty2 deðiþkenine 100 yüklendi
     
     PWM1_Start();
     PWM2_Start();                           // PWM1 ve PWM2 baþlatýldý
     PWM1_Set_Duty(aktif_duty1);             // PWM1 için duty_cycle set edildi
     PWM2_Set_Duty(aktif_duty2);             // PWM2 için duty_cycle set edildi
     
     while(1) {
              if(portb.rb6) {
                 delay_ms(40);
                 aktif_duty1++;              // Aktif_duty1 deðerini 1 arttýr
                 PWM1_Set_Duty(aktif_duty1); // PWM1 için duty_cycle set deildi
              }
              
              if(portb.rb7) {
                 delay_ms(40);
                 aktif_duty1--;               // Aktif_duty1 deðerini 1 azalt
                 PWM1_Set_Duty(aktif_duty1);  // PWM1 için duty_cycle set edildi
              }
     }

}