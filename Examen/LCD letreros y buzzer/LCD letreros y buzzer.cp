#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/LCD letreros y buzzer/LCD letreros y buzzer.c"

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
void main() {
 ANSEL=0;
 ANSELH=0;
 TRISA.F0=0;
 PORTA.F0=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Programacion");
 Lcd_Out(2,1,"Del PIC16F887");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Tu nombre aqui!");
 delay_ms(500);
 PORTA.F0=1;
 Lcd_out(2,1,"Boleta aqui");
 delay_ms(500);
 PORTA.F0=0;
}
