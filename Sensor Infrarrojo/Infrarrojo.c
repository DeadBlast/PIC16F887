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
short contador=0;
char cuenta[4];
short oldstate=0;
void main() {
C1ON_bit = 0;//Deshabilitamos comparadores
C2ON_bit = 0;
ANSEL=0;
ANSELH=0;
TRISD=0;
PORTD=0;
TRISB=0;
TRISB.F0=1;
PORTB=0;
OPTION_REG.NOT_RBPU=0;
Lcd_Init(); //Iniciamos la LCD
Lcd_Cmd(_LCD_CLEAR);//Limpiamos el display
Lcd_Cmd(_LCD_CURSOR_OFF);//Quitamos el cursor
Lcd_Cmd(_LCD_Clear);
Lcd_out(1,1,"Personas");
 while(1){
  ByteToStr(contador,cuenta); //Convertimos contador en un caracter para que pueda imprimirse en la LCD
  Lcd_out(2,6,cuenta);//Imprimimos cuenta en la LCD
 if(Button(&PORTB,0,0,0)){ //Si el boton no esta oprimido la bandera esta en 1
   oldstate=1;
  }
 if(Button(&PORTB,0,0,1)&&oldstate==1){ //Si oprimimos el boton la bandera cambia y sumara una unidad a contador
  oldstate=0;
  contador++;
  }
 }
}