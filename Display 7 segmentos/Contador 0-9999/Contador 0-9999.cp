#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Display 7 segmentos/Contador 0-9999/Contador 0-9999.c"
short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3};
short unidades,decenas,centenas,millares,time;
void main() {
ANSEL=0;
ANSELH=0;
PORTD=0;
TRISD=0;
TRISC.F0=0;
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;

PORTC.F0=1;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=1;

unidades=0;
decenas=0;
centenas=0;
millares=0;
 while(1){
 PORTD=numero[unidades];
 PORTC.F3=0;
 delay_ms(3);
 PORTC.F3=1;
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
 time++;
 if(time>1){
 time=0;
 unidades++;
 if(unidades>9){
 decenas++;
 if(decenas>9){
 decenas=0;
 centenas++;
 if(centenas>9){
 centenas=0;
 millares++;
 if(millares>9){
 millares=0;
 }
 }
 }
 unidades=0;
 }
 }
 }
}
