#line 1 "C:/Users/gs_fa/Desktop/MicroC/ond_rd_nc__hafta_PWM.c"
unsigned aktif_duty1, aktif_duty2;

void main() {
 ADCON1 |=0x0F;
 CMCON |=7;

 TRISB=0xFF;
 PORTB=0x00;

 PWM1_Init(500);
 PWM2_Init(500);

 aktif_duty1=50;
 aktif_duty2=100;

 PWM1_Start();
 PWM2_Start();
 PWM1_Set_Duty(aktif_duty1);
 PWM2_Set_Duty(aktif_duty2);

 while(1) {
 if(portb.rb6) {
 delay_ms(40);
 aktif_duty1++;
 PWM1_Set_Duty(aktif_duty1);
 }

 if(portb.rb7) {
 delay_ms(40);
 aktif_duty1--;
 PWM1_Set_Duty(aktif_duty1);
 }
 }

}
