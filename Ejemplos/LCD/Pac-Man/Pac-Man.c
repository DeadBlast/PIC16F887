const char pacman[] = {0,0,14,28,24,28,14,0}; //Direccion inicial 64.
const char pacman2[] = {0,0,14,7,3,7,14,0}; // Direccion 72
const char pacman3[] = {0,0,14,31,31,31,14,0};//Direccion 80
const char fantasma[] = {0,0,14,31,21,31,21,0};//Direccion 88
//Guardando caracteres
void Lcd_RAM_Car(char IntDir, const char *Mapa){
 char i;
 LCD_Cmd(IntDir); //Dirección inicial.
 //Bucle para guardar el mapa en la RAM del LCD.
 for(i=0;i<8;i++) LCD_Chr_Cp(Mapa[i]);
}
//LCD
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
short nivel=0;
short oldstate=0;
short control=0;
short control1=0;
short xf,yf,x,y,e,e1,e2,e3,a,m,xf2;
void iniciado(){
 Lcd_Out(1,3,"Iniciando....");
 delay_ms(1000);
 x=6;
 a=0;
 y=1;
 xf=16;
 yf=2;
 m=1;
 Lcd_Chr(y,x,0);
 Lcd_Chr(yf,xf,3);
 control=0;
 control1=0;
 while(nivel==1){
 if(x==xf&&y==yf){
  LCD_Cmd(_LCD_CLEAR);
  LCD_Out(1,4,"Game over!");
  for(x=1;x<18;x++){
   e=x-1;
   Lcd_chr(2,x,3);
   Lcd_Out(2,e," ");
   delay_ms(100);
   }
   delay_ms(500);
   nivel=0;
  }
 if(m==1){
   xf--;
   xf2=xf+1;
   Lcd_Chr(yf,xf,3);
   Lcd_Out(yf,xf2," ");
   xf2=xf+1;
   if(xf==1){
    m=0;
    delay_ms(80);
   }
  }
 if(m==0){
  xf++;
  xf2=xf-1;
  Lcd_Chr(yf,xf,3);
  Lcd_Out(yf,xf2," ");
  xf2=xf-1;
  if(xf==16){
   m=1;
  }
 }
  if(nivel==1){
   if(x==xf&&y==yf){
    LCD_Cmd(_LCD_CLEAR);
    LCD_Out(1,4,"Game over!");
    for(x=1;x<18;x++){
     e=x-1;
     Lcd_chr(2,x,3);
     Lcd_Out(2,e," ");
     delay_ms(100);
     }
     delay_ms(500);
     nivel=0;
    }
   if(Button(&PORTB,0,10,1)&&Button(&PORTB,1,10,1)){  //Estando inmovil
    Lcd_Chr(y,x,a);
    delay_ms(70);
    Lcd_Chr(y,x,2);
    delay_ms(70);
    control=0;
    control1=0;
   }
   if(Button(&PORTB,0,0,1)||Button(&PORTB,1,0,1)){
    control=0;
    control1=0;
   }
   if(Button(&PORTB,0,20,0)&&control==0){  //movimiento izquierda
    control1=1;
    x--;
    if(x==0){
     x=1;
    }
    e1=x+1;
    Lcd_Chr(y,x,1);
    Lcd_Out(y,e1," ");
    delay_ms(70);
    Lcd_Chr(y,x,2);
    delay_ms(70);
    a=1;
   }
   if(Button(&PORTB,1,20,0)&&control1==0){ //movimiento derecha
    control=1;
    x++;
    if(x==17){
     x=16;
    }
    e=x-1;
    Lcd_Chr(y,x,0);
    Lcd_out(y,e," ");
    delay_ms(70);
    Lcd_Chr(y,x,2);
    delay_ms(70);
    a=0;
   }
   if(Button(&PORTB,2,0,1)&&Button(&PORTB,3,0,1)){
    oldstate=1;
   }
   if(Button(&PORTB,3,0,0)&&oldstate==1){  //movimiento abajo
    oldstate=0;
    if(y==1){
     y=2;
     e2=y-1;
     Lcd_Out(e2,x," ");
     }
    }
   if(Button(&PORTB,2,0,0)&&oldstate==1){  //movimiento arriba
    oldstate==0;
    if(y==2){
      y=1;
      e2=y+1;
      Lcd_Out(e2,x," ");
     }
    }
   if(Button(&PORTB,4,0,0)){//Pausa
    nivel=2;
    Lcd_Cmd(_LCD_CLEAR);
    e=1;
    Lcd_Out(1,5,"Pausa");
    Lcd_Out(2,5,"Salir");
    oldstate=0;
    while(nivel==2){
     if(Button(&PORTB,2,0,1)&&Button(&PORTB,3,0,1)&&Button(&PORTB,4,0,1)){
      oldstate=1;
     }
     Lcd_Out(e,4,"~");
     if(Button(&PORTB,3,0,0)&&oldstate==1){
      e=2;
      Lcd_Out(1,4," ");
     }
     if(Button(&PORTB,2,0,0)&&oldstate==1){
      e=1;
      Lcd_Out(2,4," ");
     }
     if(Button(&PORTB,4,0,0)&&oldstate==1){
      oldstate=0;
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1,1,"Deja vu?....");
      if(e==1){
       nivel=1;
      }
      if(e==2){
       nivel=0;
      }
     }
    }
   }
   }
  if(nivel==0){
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1,1,"Dev: Juan Jose");
   Lcd_Out(2,2,".... Lovecraft");
   Lcd_Chr(2,1,3);
   delay_ms(1500);
   for(x=0;x<18;x++){
    e=x-1;
    Lcd_Chr(1,x,0);
    Lcd_out(1,e," ");
    delay_ms(70);
    Lcd_Chr(1,x,2);
    delay_ms(70);
   }
   for(x=16;x>-3;x--){
    e=x+1;
    Lcd_Chr(2,x,1);
    Lcd_Out(2,e," ");
    delay_ms(70);
    Lcd_Chr(2,x,2);
    delay_ms(70);
   }
   Lcd_Cmd(_LCD_ClEAR);
   delay_ms(200);
   oldstate=0;
  }
 }
}
void main() {
ANSEL=0;
ANSELH=0;
C1ON_bit=0;
C2ON_bit=0;
PORTB=0x00;
TRISB.F0=1;
TRISB.F1=1;
TRISB.F2=1;
TRISB.F3=1;
TRISB.F4=1;
TRISB.F7=1;
PORTD=0xFF;
OPTION_REG.NOT_RBPU=0;
 Lcd_Init(); //Inicio del LCD.
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_RAM_Car(64, pacman);//Se guarda en 64
 Lcd_RAM_Car(72, pacman2);//Se guarda en 72
 Lcd_RAM_Car(80, pacman3);//Se guarda en 80
 Lcd_RAM_Car(88,fantasma);//Se guarda en 88
 while(1){
  Lcd_Chr(1,10,3);
  Lcd_Chr(1,7,0);
  Lcd_Out(1,5,"Pa");
  Lcd_Out(1,8,"-m");
  Lcd_Out(1,11,"n");
  Lcd_Out(2,6,"      ");
  delay_ms(200);
  Lcd_Chr(1,7,2);
  Lcd_Out(2,6,"Start!");
  delay_ms(200);
  if(Button(&PORTB,4,0,0)&&oldstate==0){
   nivel=1;
   oldstate=1;
   Lcd_Cmd(_LCD_CLEAR);
  }
  while(nivel==1){
   iniciado();
  }
 }
}