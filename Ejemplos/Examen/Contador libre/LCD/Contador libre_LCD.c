//Conexiones para la LCD
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
short numero=0;//empezamos en 0
char cuenta[4]; //necesitamos cuenta para poder convertir numero en en un caracter alfanumerico
void main() {
 ANSEL=0;
 ANSELH=0;
 Lcd_Init();  //Iniciamos LCD
 Lcd_Cmd(_LCD_CURSOR_OFF);   //Apagamos el cursor
 Lcd_Cmd(_LCD_CLEAR);//Limpiamos la pantalla
 Lcd_Out(1,1,"Contador libre");  //Imprimimos el letrero
 while(1){
  ByteToStr(numero,cuenta);//La funcion ByteToStr nos convierte numero en cuenta que es un caracter alfanumerico
  Lcd_Out(2,6,cuenta);  //Para poder imprimirlo en la LCD
  numero++;    //Aumentamos numero
  if(numero>9){ //si numero es mayor a 9 regresa a 0
   numero=0;
  }
  delay_ms(500);
 }
}