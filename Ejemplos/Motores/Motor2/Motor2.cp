#line 1 "E:/Motor2/Motor2.c"

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

short mov=0;
void main() {
ANSEL=0;
ANSELH=0;
C1ON_bit=0;
C2ON_bit=0;
PORTD=0;
TRISD=0x00;
PORTA=0;
TRISA.F1=0;
TRISA.F2=0;
PORTB=0x00;
TRISB.F0=1;
TRISB.F1=1;
TRISB.F2=1;
Lcd_Init();
Lcd_cmd(_LCD_CURSOR_OFF);
Lcd_cmd(_LCD_CLEAR);
Lcd_Out(1,1,"B1 | B2 | B3");
lcd_Out(2,1,"Izq|Pau.|Der");
delay_ms(500);
OPTION_REG.NOT_RBPU=0;
while(1){
PORTD=0x00;
 if(Button(&PORTB,0,0,0)){
 mov=1;
 }
 if(Button(&PORTB,1,0,0)){
 mov=0;
 }
 if(Button(&PORTB,2,0,0)){
 mov=2;
 }
 if(mov==0){
 PORTA=0x00;
 PORTD=0x00;
 delay_ms(100);
 PORTD=0xFF;
 delay_ms(100);
 }
 if(mov==1){
 PORTD=0x01;
 PORTA.F1=1;
 delay_ms(300);
 PORTA.F2=0;
 delay_ms(300);
 }
 if(mov==2){
 PORTD=0x02;
 PORTA.F1=0;
 delay_ms(300);
 PORTA.F2=1;
 delay_ms(300);
 }
}
}
