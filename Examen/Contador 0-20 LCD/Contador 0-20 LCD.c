//Conexiones para la LCD! ;D
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
char  cuenta[4]; //Cuenta debe ser del tipo "char" para poder aceptar numeros y letras
void main() {
ANSEL=0;
ANSELH=0;
Lcd_init();
Lcd_Cmd(_LCD_CLEAR);//limpiamos la LCD
Lcd_Cmd(_LCD_CURSOR_OFF);//Apagamos el cursor
Lcd_Out(1,2,"Contador 0-20");//Imprimimos el letrero
 while(1){
  ByteToStr(numero,cuenta); //La funcion ByteToStr nos sirve para convertir un numero en un caracter para que este pueda ser impreso en la LCD!
  Lcd_Out(2,5,cuenta);
  numero++;//Aumentamos una unidad
  delay_ms(500);
  if(numero>20){ // si es mayor de 20 regresamos a 0
   numero=0;
  }
 }
}