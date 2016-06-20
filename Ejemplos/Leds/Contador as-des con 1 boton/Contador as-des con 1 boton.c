//Programa que cuenta del 0-15 con boton en binario(lo muestra con leds) y despues baja a 0 con el mismo boton
short oldstate=0;//Seguro para que no cuente mas de 1 vez
short updown=1; //para indicar si sube o baja(1 sube, 0 baja)
short cuenta=0; //iniciamos la cuenta en 0
void main() {
ANSEL=0;
ANSELH=0;
PORTD=0;
TRISD=0; //declaramos el puerto D como salida
PORTB=0;
TRISB.F0=1; //Declaramos PORTB.F0 como entrada
OPTION_REG.NOT_RBPU=0;
while(1){
 PORTD=cuenta;  //Lo primero que haremos es imprimir en el puerto "cuenta"
 if(Button(&PORTB,0,0,1)){//Si no se oprime el boton el seguro esta abierto
  oldstate=1;
 }
 if(Button(&PORTB,0,10,0)&&oldstate==1){  //Si se oprime el boton y el seguro esta abierto entonces...
  oldstate=0;  //cerramos el seguro
  if(updown==0){ //si updown=0 entonces quitamos una unidad a la cuenta
   cuenta--;
  }
  if(updown==1){ //si updown=1 entonces le añadios una unidad a cuenta
  cuenta++;
  }
  if(cuenta>14){ //Si la cuenta es mayor que 14(llegara al 15) updown ahora pasara a 0 (Por lo que descendera)
   updown=0;
  }
  if(cuenta<1){  //Si la cuenta es menor a 1(llegara al 0) updown ahora sera 1 (Por lo que ascendera)
   updown=1;
  }
 }
}
}