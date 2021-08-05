#define sil portb.rb5
#define sola portb.rb6

//LCD module baðlantýlarý
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

//çýkýþ LCD module baðlantýlarý
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void main() {
     Lcd_Init(); //LCD display hazýrlandý.
     Lcd_Cmd(_LCD_CURSOR_OFF); //LCD display ekranýnda imleç kaldýrýldý.
     Lcd_Cmd(_LCD_CLEAR); //LCD ekraný temizlendi.
     Lcd_Out(1, 1, "Pic16f877a ve");  //1.satýr ve 1.sütuna text yazýldý.
     Lcd_Out(2, 3, "MicroC");

     while(1) {
              if(sil) Lcd_Cmd(_LCD_CLEAR);
              if(sola) {
                 Lcd_Cmd(_LCD_SHIFT_RIGHT); //evet ise display ekranýndaki yazýyý kaydýr. butonun býrakýlmasýný bekle.
                 while(1);
                 }
              }

}