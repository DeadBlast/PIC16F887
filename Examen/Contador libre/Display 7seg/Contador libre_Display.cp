#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/Contador libre/Display 7seg/Contador libre_Display.c"
short numero []={0XFA,0X22,0XB9,0XAB,0X63,0XCB,0XDB,0XA2,0XFB,0XE3};
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

 PORTC.F0=1;
 PORTC.F1=1;
 PORTC.F2=1;
 PORTC.F3=0;
 while(1){
 PORTD=numero[cuenta];
 cuenta++;
 delay_ms(500);
 if(cuenta>9){
 cuenta=0;
 }
 }
}
