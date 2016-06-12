short numero []={0XFA,0X22,0XB9,0XAB,0X63,0XCB,0XDB,0XA2,0XFB,0XE3};  //Numeros en HEX a ocupar para prender el display
short cuenta=0;
short oldstate=0;
void main() {
 ANSEL=0;
 ANSELH=0;
 TRISD=0;
 PORTD=0;
 PORTB=0;
 TRISB=0;
 TRISB.F0=1;
 TRISB.F1=1;
 OPTION_REG.NOT_RBPU=0;
 //Conexiones para el display
 TRISC.F0=0;
 TRISC.F1=0;
 TRISC.F2=0;
 TRISC.F3=0;
 //habilitar displays
 PORTC.F0=1;
 PORTC.F1=1;
 PORTC.F2=1;
 PORTC.F3=0;
 while(1){
  PORTD=numero[cuenta];
  if(Button(&PORTB,0,5,1)&&Button(&PORTB,1,0,1)){   //Si ambos botones no estan oprimidos el seguro esta abierto
   oldstate=1;
  }
  if(Button(&PORTB,0,0,0)&&oldstate==1){   //Si el primer boton se oprime  y esta abierto el seguro
   oldstate=0;   //El seguro se cierra
   cuenta++; //Aumentamos cuenta
   if(cuenta>9){  //Si la cuenta es mayor a 9 regresa a 0
   cuenta=0;
   }
  }
  if(Button(&PORTB,1,0,0)&&oldstate==1){ //Si promimos el boton 2 y el seguro esta abierto
   oldstate=0;  //El seguro se cierra
   cuenta--;     //Cuenta disminuye
   if(cuenta<0){ //si la cuenta es menor a 0 regresa a 9
    cuenta=9;
   }
  }
 }
}