short poli[]={0xF1,0xFA,0x58,0x50};
short time;
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
while(1){
 PORTD=poli[0];
 PORTC.F0=0;
 delay_ms(3);
 PORTC.F0=1;
 PORTD=poli[1];
 PORTC.F1=0;
 delay_ms(3);
 PORTC.F1=1;
 PORTD=poli[2];
 PORTC.F2=0;
 delay_ms(3);
 PORTC.F2=1;
 PORTD=poli[3];
 PORTC.F3=0;
 delay_ms(3);
 PORTC.F3=1;
}
}