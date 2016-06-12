short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3}; //Declaramos numeros en hexadecimal a ocupar en el display
short contador=0;
short oldstate=0;
void main() {
ANSEL=0; //desactivamos salidas analogicas
ANSELH=0;
TRISD=0; //Declaramos puerto D como salida
PORTD=0;
PORTB=0;
TRISB=0;
//declaramos como entrada el puerto B.F0
TRISB.F0=1;
//declaramos como salidas los puertos C
TRISC.F0=0;
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;
//habilitamos o deshabilitamos los displays
PORTC.F0=1;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=0; //solo el display 4 prendera
OPTION_REG.NOT_RBPU=0;
 while(1){
  PORTD=numero[contador];
  if(Button(&PORTB,0,0,1)){
   oldstate=1;
  }
  if(Button(&PORTB,0,10,0)&&oldstate==1){
   oldstate=0;
   contador++;
   if(contador>9){
    contador=0;
   }
  }
 }
}