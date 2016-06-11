short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3,0xF3,0x5B,0xD8,0x3B,0xD9,0xD1};
short cuenta=0;
void main() {
ANSEL=0;
ANSELH=0;
TRISD=0;
PORTD=0;
//Conexiones para los display (Los declaramos como salidas)
TRISC.F0=0;
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;
//Habilitamos el display que queremos
PORTC.F0=0;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=1;
while(1){
 PORTD=numero[cuenta]; //Mandamos al puerto D el numero en la posicion "cuenta"
 cuenta++; //aumentamos cuenta
 delay_ms(500);
 if(cuenta>15){ //si llega a mas de 15 regresa a 0
  cuenta=0;
 }
}
}