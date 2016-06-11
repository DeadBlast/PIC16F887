#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/Contador 0-9 buzzer-infrarrojo/Contador 0-9 Buzzer-Infrarrojo.c"
short numero []={0XFA,0X22,0XB9,0XAB,0X63,0XCB,0XDB,0XA2,0XFB,0XE3};
short cuenta=0;
short oldstate=0;
void main(){
ANSEL=0;
ANSELH=0;
PORTD=0;
TRISD=0X00;
C1ON_bit=0;
C2ON_bit=0;
TRISB.F1=1;

TRISC.F0=0;
TRISC.F1=0;
TRISC.F2=0;
TRISC.F3=0;

PORTC.F0=1;
PORTC.F1=1;
PORTC.F2=1;
PORTC.F3=0;

TRISA.F0=0;
PORTA.F0=0;
 while(1){
 PORTD=numero[cuenta];
 delay_ms(250);
 PORTA.F0=0;
 if(PORTB.F1==0){
 oldstate=1;
 }
 if(PORTB.F1==1&&oldstate==1){
 oldstate=0;
 cuenta++;
 PORTA.F0=1;
 if(cuenta>9){
 cuenta=0;
 }
 }
 }
}
