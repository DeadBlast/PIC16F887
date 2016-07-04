//Conexiones de la LCD
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
//declaramos las variables a ocupar
unsigned int Radc, TemI;
float Tem;
char Text[8];
short oldstate=0;
void main() {
 ANSEL=0x00;
 ANSELH=0;
 PORTA=0x00;
 TRISA=0xFF;
 PORTB=0x00;
 TRISB.F1=1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Activa el sensor");
 Lcd_Out(2,1,"para ver la Temp");
 while(1){
  if(PORTB.F1==0){
   oldstate=1;
  }
  if(PORTB.F1==1&&oldstate==1){
   oldstate=0;
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1,3,"Temperatura:");
   Radc = ADC_Read(2);
   Tem = 0.244*Radc;
   TemI = Tem;
   IntToStr( Tem, Text);
   Lcd_Out(2,4,Text);
   Lcd_Out(2,10,"C");
   delay_ms(1000);
  }
 }
}