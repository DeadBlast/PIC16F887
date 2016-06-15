#line 1 "C:/Users/jujoj/Documents/GitHub/PIC16F887/Ejemplos/Leds/Contador as-des con 1 boton/Contador as-des con 1 boton.c"

short oldstate=0;
short updown=1;
short cuenta=0;
void main() {
ANSEL=0;
ANSELH=0;
PORTD=0;
TRISD=0;
PORTB=0;
TRISB.F0=1;
OPTION_REG.NOT_RBPU=0;
while(1){
 PORTD=cuenta;
 if(Button(&PORTB,0,0,1)){
 oldstate=1;
 }
 if(Button(&PORTB,0,10,0)&&oldstate==1){
 oldstate=0;
 if(updown==0){
 cuenta--;
 }
 if(updown==1){
 cuenta++;
 }
 if(cuenta>14){
 updown=0;
 }
 if(cuenta<1){
 updown=1;
 }
 }
}
}
