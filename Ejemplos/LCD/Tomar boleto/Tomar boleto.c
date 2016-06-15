//Conexiones para LCD
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
short oldstate=0;
void main() {
 ANSEL=0;
 ANSELH=0;
 PORTB=0;
 TRISB=0x00; //establacemos que todos los puertos B sean salidas
 TRISB.F0=1; //menos el puerto 0
 TRISA.F0=0;  //El puerto A0 como salida
 PORTA.F0=0;   //Salida 0 para que no suene  el buzzer
 OPTION_REG.NOT_RBPU=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(1){
  Lcd_Out(1,3,"Bienvenidos!");
  delay_ms(300);
  Lcd_Out(1,3,"            ");
  if(Button(&PORTB,0,0,1)){   // un seguro para que no siga dando boletos si se queda apretado el boton! :D
   oldstate=1;
  }
  if(Button(&PORTB,0,0,0)&&oldstate==1){//Si se oprime el boton
   oldstate=0; //el seguro se activa
   Lcd_Cmd(_Lcd_Clear);             //Limpia la LCD
   PORTA.F0=1;    //Prendemos el buzzer
   Lcd_Out(1,2,"Tome su boleto");      //Imprimimos los letreros
   Lcd_Out(2,5,"Porfavor!");
   delay_ms(500);
   PORTA.F0=0;  //desactivamos el buzzer
   delay_ms(3000);
   Lcd_Cmd(_LCD_CLEAR); //volvemos a limpiar la LCD
  }
  delay_ms(300);
 }
}