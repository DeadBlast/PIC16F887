#line 1 "E:/Motor1/Motor1.c"
short mov;
void main() {
ANSEL=0;
ANSELH=0;
C1ON_bit=0;
C2ON_bit=0;
PORTA=0;
TRISA.F1=0;
TRISA.F2=0;
TRISA.F3=0;
TRISA.F4=0;
PORTB=0;
while(1){
 for(mov=0;mov<3;mov++){
 PORTA=0;
 delay_ms(500);
 PORTA.F1=1;
 delay_ms(300);
 PORTA.F2=0;
 delay_ms(300);
 }
 for(mov=0;mov<2;mov++){
 PORTA=0;
 delay_ms(500);
 PORTA.F1=0;
 delay_ms(300);
 PORTA.F2=1;
 delay_ms(300);
 }
 }
}
