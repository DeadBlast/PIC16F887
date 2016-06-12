#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Examen/Contador As y Des 0-9 Display/Contador As y Des 0-9 Display.c"
short numero []={0XFA,0X22,0XB9,0XAB,0X63,0XCB,0XDB,0XA2,0XFB,0XE3};
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
 if(Button(&PORTB,0,5,1)&&Button(&PORTB,1,0,1)){
 oldstate=1;
 }
 if(Button(&PORTB,0,0,0)&&oldstate==1){
 oldstate=0;
 cuenta++;
 if(cuenta>9){
 cuenta=0;
 }
 }
 if(Button(&PORTB,1,0,0)&&oldstate==1){
 oldstate=0;
 cuenta--;
 if(cuenta<0){
 cuenta=9;
 }
 }
 }
}
