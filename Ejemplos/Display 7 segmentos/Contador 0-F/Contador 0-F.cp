#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/Contador 0-F/Contador 0-F.c"
short numero[]={0xFA,0x22,0xB9,0xAB,0x63,0xCB,0xDB,0xA2,0xFB,0xE3,0xF3,0x5B,0xD8,0x3B,0xD9,0xD1};
short cuenta=0;
void main() {
ANSEL=0;
ANSELH=0;
TRISD=0;
PORTD=0;

TRISC.F0=0;
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;

PORTC.F0=0;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=1;
while(1){
 PORTD=numero[cuenta];
 cuenta++;
 delay_ms(500);
 if(cuenta>15){
 cuenta=0;
 }
}
}
