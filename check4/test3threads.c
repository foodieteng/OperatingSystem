
#include <8051.h>
#include "preemptive.h"

__data __at(0x20) char buffer[3];
__data __at(0x23) char Token;
__data __at(0x24) int full;
__data __at(0x26) char mutex;
__data __at(0x27) int empty;
__data __at(0x29) char Token2;
__data __at(0x2A) char turn;
__data __at(0x2B) char turn2;
__data __at(0x30) int in;
__data __at(0x32) int out;

#define L(x) LABEL(x)
#define LABEL(x) x##$

void Producer1(void)
{
        Token = 'A';
        while (1)
        {
                /* @@@ [6 pt]
                 * wait for the buffer to be available,
                 * and then write the new data into the buffer */
                SemaphoreWaitBody(turn, L(__COUNTER__));
                SemaphoreWaitBody(empty, L(__COUNTER__));
                SemaphoreWaitBody(mutex, L(__COUNTER__));
                buffer[in] = Token;
                in = (in + 1) % 3;
                Token = (Token == 'Z') ? 'A' : Token + 1;
                // P1 = 0x0;
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(turn2);
        }
}
void Producer2(void)
{
        Token2 = '0';
        while (1)
        {
                /* @@@ [6 pt]
                 * wait for the buffer to be available,
                 * and then write the new data into the buffer */
                SemaphoreWaitBody(turn2, L(__COUNTER__));
                SemaphoreWaitBody(empty, L(__COUNTER__));
                SemaphoreWaitBody(mutex, L(__COUNTER__));
                buffer[in] = Token2;
                in = (in + 1) % 3;
                Token2 = (Token2 == '9') ? '0' : Token2 + 1;
                // P1 = 0x5;
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(turn);
        }
}

void Consumer(void)
{
        /* @@@ [2 pt] initialize Tx for polling */
        EA = 0;
        TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;
        while (1)
        {
                SemaphoreWaitBody(full, L(__COUNTER__));
                SemaphoreWaitBody(mutex, L(__COUNTER__));
                SBUF = buffer[out];
                out = (out + 1) % 3;
                // P1 = 0xFF;
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

                while (!TI)
                {
                }
                TI = 0;
        }
}

void main(void)
{
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty, 3);
        SemaphoreCreate(turn, 0);
        SemaphoreCreate(turn2, 1);

        ThreadCreate(Producer1);
        ThreadCreate(Producer2);
        Consumer();
}

void _sdcc_gsinit_startup(void)
{
        __asm ljmp _Bootstrap
            __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1)
{
        __asm ljmp _myTimer0Handler
            __endasm;
}
