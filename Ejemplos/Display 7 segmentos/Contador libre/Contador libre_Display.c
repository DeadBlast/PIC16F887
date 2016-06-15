short numero []={0XFA,0X22,0XB9,0XAB,0X63,0XCB,0XDB,0XA2,0XFB,0XE3};//Numeros en hex que ocuparemos para prender el display
short cuenta=0;
void main() {
 ANSEL=0;
 ANSELH=0;
 TRISD=0;
 PORTD=0;
 //Conexiones para los display
 TRISC.F0=0;
 TRISC.F1=0;
 TRISC.F2=0;
 TRISC.F3=0;
 //Habilitar o deshabilitar ([0 habilitado] [1 deshabilitado])
 PORTC.F0=1;
 PORTC.F1=1;
 PORTC.F2=1;
 PORTC.F3=0;//Habilitamos unicamente el 4to display
 while(1){
  PORTD=numero[cuenta]; //Al puerto D le mandamos numero en la posicion de "cuenta"
  cuenta++;//Aumentamos en una unidad
  delay_ms(500);
  if(cuenta>9){ //Si la cuenta es mayor a 9 regresa a 0
   cuenta=0;
  }
 }
}