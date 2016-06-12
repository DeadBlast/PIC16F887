#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/Contador 0-20 LCD/Contador 0-20 LCD.c"

sbit LCD_RS at RC5_bit;
sbit LCD_EN at RC4_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISC5_bit;
sbit LCD_EN_Direction at TRISC4_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
short numero=0;
char cuenta[4];
void main() {
ANSEL=0;
ANSELH=0;
Lcd_init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,2,"Contador 0-20");
 while(1){
 ByteToStr(numero,cuenta);
 Lcd_Out(2,5,cuenta);
 numero++;
 delay_ms(500);
 if(numero>20){
 numero=0;
 }
 }
}
