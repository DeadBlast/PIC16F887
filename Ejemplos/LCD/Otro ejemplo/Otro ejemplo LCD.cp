#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Ejemplos/LCD/Otro ejemplo/Otro ejemplo LCD.c"

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
char texto[5];
short columna;
int numero=1;
void main() {
 ANSEL=0;
 ANSELH=0;
 Lcd_init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_out(1,1,"Serie de numeros");
 while(1){
 Lcd_Out(1,1,"Serie de numeros");
 if(numero==32768){
 numero=1;
 }
 Wordtostr(numero,texto);
 Lcd_out(2,1,texto);
 numero=numero*2;
 delay_ms(500);
 Wordtostr(numero,texto);
 Lcd_out(2,6,texto);
 numero=numero*2;
 delay_ms(500);
 Wordtostr(numero,texto);
 Lcd_out(2,12,texto);
 numero=numero*2;
 delay_ms(500);
 Lcd_Cmd(_Lcd_CLEAR);
 }
 }
