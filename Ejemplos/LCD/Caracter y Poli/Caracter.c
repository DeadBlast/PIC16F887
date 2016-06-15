const char caracter1[] = {17,31,21,14,21,4,27,0};
void Lcd_Ram_Chr(char InitDir, const char *Mapa) { //Con esto guardamos los caracteres
  char i;
  Lcd_Cmd(InitDir);
  for (i = 0; i<=7; i++) Lcd_Chr_CP(Mapa[i]);
}
//Hacemos las conexiones para la LCD! :D   cambiamos los puertos e.e''
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
short i;
void main() {
 ANSEL=0;
 ANSELH=0;
 Lcd_Init();//iniciamos la LCD
 Lcd_Cmd(_LCD_CLEAR);//Limpiamos la pantalla
 Lcd_Cmd(_LCD_CURSOR_OFF); //Quitamos el cursor
 Lcd_RAM_Chr(64,caracter1); //Elegimos la posicion donde se va a guardar y lo que vamos a guardar
 Lcd_Chr(1,1,0);//En la linea 1 columna 1 imprimiremos el caracter guardado en "0" (Que es el primero)
 Lcd_Out(2,1,"Politecnico");
 //Ahora haremos el movimiento!
 while(1){
  for(i=0;i<5;i++){
   Lcd_Cmd(_LCD_SHIFT_RIGHT); // lo movemos a la derecha
   delay_ms(300);
  }
  for(i=0;i<5;i++){
   Lcd_Cmd(_LCD_SHIFT_Left);// lo movemos a la izquierda
   delay_ms(300);
  }
 }
}




