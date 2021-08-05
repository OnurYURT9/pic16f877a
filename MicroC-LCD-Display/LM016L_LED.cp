#line 1 "C:/Users/gs_fa/Desktop/MicroC/LM016L_LED.c"




sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Pic16f877a ve");
 Lcd_Out(2, 3, "MicroC");

 while(1) {
 if( portb.rb5 ) Lcd_Cmd(_LCD_CLEAR);
 if( portb.rb6 ) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 while(1);
 }
 }

}
