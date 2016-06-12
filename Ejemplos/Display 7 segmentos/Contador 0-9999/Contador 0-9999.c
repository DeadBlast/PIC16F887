short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3};//Codigo hex para prender los displays
short unidades,decenas,centenas,millares,time;//declaramos variables
void main() {
ANSEL=0;   //Salidas analogicas a 0
ANSELH=0;
PORTD=0;      //Puertos D a 0
TRISD=0;
TRISC.F0=0;  //Declaramos el puerto C como salida.
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;
//Deshabilitamos totalmente todos los displays
PORTC.F0=1;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=1;
//Mandamos a 0 las unidades,decenas,centenas y millares.
unidades=0;
decenas=0;
centenas=0;
millares=0;
 while(1){  //Ciclo infinito para imprimir permanentemente  --->
  PORTD=numero[unidades];//los datos en cada displaycorrespondiente
  PORTC.F3=0;    //Habilitamos puerto F3 para habilitar el 4to display
  delay_ms(3);    //dejamos un tiempo para que eñ display reciba los datos
  PORTC.F3=1;     //deshabilitamos el display F3 para que no siga recibiendo datos.
  PORTD=numero[decenas];
  PORTC.F2=0;
  delay_ms(3);
  PORTC.F2=1;
  PORTD=numero[centenas];
  PORTC.F1=0;
  delay_ms(3);
  PORTC.F1=1;
  PORTD=numero[millares];
  PORTC.F0=0;
  delay_ms(3);
  PORTC.F0=1;
  time++;  //el time lo ocupamos por un error en los delay, por lo que ponemos
  if(time>1){  // a hacer algo al programa en lo que cumple la condicion, en este caso imprimimos los datos.
   time=0;//regresamos a 0 para que pueda seguir funcionando el tiempo
   unidades++; //aumentamos las unidades
   if(unidades>9){ //si las unidades llegan a mas de 9 entonces las decenas aumentan
    decenas++;
    if(decenas>9){//si las decenas llegan a mas de 9 las centenas aumentan
     decenas=0;
     centenas++;
     if(centenas>9){ //Si las centenas centenas llegan a mas de 9 van a 0
      centenas=0; // centenas llega a 0
      millares++;  //millares aumenta
      if(millares>9){ //Si los millares llegan a mas de 9
       millares=0; //millares regresa a 0
      }
     }
    }
    unidades=0;// las unidades van a 0 si llegan a mas de 9
   }
  }
 }
}