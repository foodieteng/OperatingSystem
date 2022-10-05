
#include <8051.h>
#include "preemptive.h"

__data __at (0x39) char buffer;
__data __at (0x3A) char Token;
__data __at (0x3B) char bufferFull;


void Producer(void) {
		Token = 'A';
        while (1) {
                while(bufferFull){
                }
                //ThreadCreate entry secrtion
                __critical{
                buffer = Token;
                bufferFull = 1;
                if(Token == 'Z')
                        Token = 'A';
                else 
                        Token++;
                }
        }
}

void Consumer(void) {
        EA = 0;
        TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;
        while (1) {
                while(!bufferFull){
                    //ThreadYield();
                }
                __critical{
                SBUF = buffer;
		        bufferFull = 0;
                }
                while(!TI){
			        //ThreadYield();
				}
                TI = 0;
        }
}

void main(void) {
        bufferFull = 0;
        ThreadCreate( Producer );
        Consumer();    
        
}

void _sdcc_gsinit_startup(void) {
        __asm
            ljmp  _Bootstrap
        __endasm;
}

//ISR
void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}
