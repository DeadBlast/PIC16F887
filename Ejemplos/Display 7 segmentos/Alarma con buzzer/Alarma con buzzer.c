short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3};
short cuenta=9;
void main() {
ANSEL=0;
ANSELH=0;
PORTD=0;
TRISD=0;
TRISC.F3=0;
PORTC.F3=0;
PORTA.F0=0;
TRISA.F0=0;
 while(cuenta>=0){  //usare un while en lugar de un for por que hay un problema al momento de encender los display!
  PORTD=numero[cuenta];
  delay_ms(500);
  cuenta--;
 }
 while(cuenta<2){
  PORTA.F0=1;
  delay_ms(500);
  PORTA.F0=0;
  delay_ms(500);
  cuenta++;
 }
}