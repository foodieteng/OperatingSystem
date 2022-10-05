;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Mac OS X x86_64)
;--------------------------------------------------------
	.module testparking
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ExitSpot
	.globl _TimeUnit
	.globl _and
	.globl _GotSpot
	.globl _Car
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Car5
	.globl _Car4
	.globl _Car3
	.globl _Car2
	.globl _Car1
	.globl _delay
	.globl _ThreadExit
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _now
	.globl _bitmap
	.globl _CarSpot
	.globl _CarOut
	.globl _CarIn
	.globl _spots
	.globl _spotsSync
	.globl _sem
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_sem	=	0x0021
_spotsSync	=	0x0022
_spots	=	0x0023
_CarIn	=	0x0025
_CarOut	=	0x004a
_CarSpot	=	0x005a
_bitmap	=	0x0035
_now	=	0x003f
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Car1'
;------------------------------------------------------------
;	testparking.c:19: void Car1(void){
;	-----------------------------------------
;	 function Car1
;	-----------------------------------------
_Car1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testparking.c:20: SemaphoreWait(sem);
		0$:
	mov a, _sem 
	jz 0$ 
	jb ACC.7, 0$ 
	dec _sem 
;	testparking.c:22: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:23: SemaphoreWait(spotsSync);
		1$:
	mov a, _spotsSync 
	jz 1$ 
	jb ACC.7, 1$ 
	dec _spotsSync 
;	testparking.c:24: if(spots[0]=='X') {
	mov	a,#0x58
	cjne	a,_spots,00102$
;	testparking.c:25: spots[0] = '1';
	mov	_spots,#0x31
;	testparking.c:26: CarSpot[0] = '0';
	mov	_CarSpot,#0x30
	sjmp	00103$
00102$:
;	testparking.c:28: spots[1] = '1';
	mov	(_spots + 0x0001),#0x31
;	testparking.c:29: CarSpot[0] = '1';
	mov	_CarSpot,#0x31
00103$:
;	testparking.c:31: CarIn[0] = now;
	mov	_CarIn,_now
;	testparking.c:32: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:33: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:35: delay(7);
	mov	dpl,#0x07
	lcall	_delay
;	testparking.c:37: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:38: SemaphoreWait(spotsSync);
		2$:
	mov a, _spotsSync 
	jz 2$ 
	jb ACC.7, 2$ 
	dec _spotsSync 
;	testparking.c:39: if(spots[0]=='1') {
	mov	a,#0x31
	cjne	a,_spots,00105$
;	testparking.c:40: spots[0] = 'X';
	mov	_spots,#0x58
	sjmp	00106$
00105$:
;	testparking.c:42: spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
00106$:
;	testparking.c:44: CarOut[0] = now;
	mov	_CarOut,_now
;	testparking.c:45: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:46: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:48: SemaphoreSignal(sem);
	inc _sem 
;	testparking.c:50: ThreadExit();
;	testparking.c:52: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'Car2'
;------------------------------------------------------------
;	testparking.c:54: void Car2(void){
;	-----------------------------------------
;	 function Car2
;	-----------------------------------------
_Car2:
;	testparking.c:55: SemaphoreWait(sem);
		3$:
	mov a, _sem 
	jz 3$ 
	jb ACC.7, 3$ 
	dec _sem 
;	testparking.c:57: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:58: SemaphoreWait(spotsSync);
		4$:
	mov a, _spotsSync 
	jz 4$ 
	jb ACC.7, 4$ 
	dec _spotsSync 
;	testparking.c:59: if(spots[0]=='X') {
	mov	a,#0x58
	cjne	a,_spots,00102$
;	testparking.c:60: spots[0] = '2';
	mov	_spots,#0x32
;	testparking.c:61: CarSpot[1] = '0';
	mov	(_CarSpot + 0x0001),#0x30
	sjmp	00103$
00102$:
;	testparking.c:63: spots[1] = '2';
	mov	(_spots + 0x0001),#0x32
;	testparking.c:64: CarSpot[1] = '1';
	mov	(_CarSpot + 0x0001),#0x31
00103$:
;	testparking.c:66: CarIn[1] = now;
	mov	(_CarIn + 0x0001),_now
;	testparking.c:67: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:68: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:70: delay(6);
	mov	dpl,#0x06
	lcall	_delay
;	testparking.c:72: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:73: SemaphoreWait(spotsSync);
		5$:
	mov a, _spotsSync 
	jz 5$ 
	jb ACC.7, 5$ 
	dec _spotsSync 
;	testparking.c:74: if(spots[0]=='2') {
	mov	a,#0x32
	cjne	a,_spots,00105$
;	testparking.c:75: spots[0] = 'X';
	mov	_spots,#0x58
	sjmp	00106$
00105$:
;	testparking.c:77: spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
00106$:
;	testparking.c:79: CarOut[1] = now;
	mov	(_CarOut + 0x0001),_now
;	testparking.c:80: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:81: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:83: SemaphoreSignal(sem);
	inc _sem 
;	testparking.c:85: ThreadExit();
;	testparking.c:87: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'Car3'
;------------------------------------------------------------
;	testparking.c:89: void Car3(void){
;	-----------------------------------------
;	 function Car3
;	-----------------------------------------
_Car3:
;	testparking.c:90: SemaphoreWait(sem);
		6$:
	mov a, _sem 
	jz 6$ 
	jb ACC.7, 6$ 
	dec _sem 
;	testparking.c:92: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:93: SemaphoreWait(spotsSync);
		7$:
	mov a, _spotsSync 
	jz 7$ 
	jb ACC.7, 7$ 
	dec _spotsSync 
;	testparking.c:94: if(spots[0]=='X') {
	mov	a,#0x58
	cjne	a,_spots,00102$
;	testparking.c:95: spots[0] = '3';
	mov	_spots,#0x33
;	testparking.c:96: CarSpot[2] = '0';
	mov	(_CarSpot + 0x0002),#0x30
	sjmp	00103$
00102$:
;	testparking.c:98: spots[1] = '3';
	mov	(_spots + 0x0001),#0x33
;	testparking.c:99: CarSpot[2] = '1';
	mov	(_CarSpot + 0x0002),#0x31
00103$:
;	testparking.c:101: CarIn[2] = now;
	mov	(_CarIn + 0x0002),_now
;	testparking.c:102: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:103: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:105: delay(5);
	mov	dpl,#0x05
	lcall	_delay
;	testparking.c:107: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:108: SemaphoreWait(spotsSync);
		8$:
	mov a, _spotsSync 
	jz 8$ 
	jb ACC.7, 8$ 
	dec _spotsSync 
;	testparking.c:109: if(spots[0]=='3') {
	mov	a,#0x33
	cjne	a,_spots,00105$
;	testparking.c:110: spots[0] = 'X';
	mov	_spots,#0x58
	sjmp	00106$
00105$:
;	testparking.c:112: spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
00106$:
;	testparking.c:114: CarOut[2] = now;
	mov	(_CarOut + 0x0002),_now
;	testparking.c:115: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:116: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:118: SemaphoreSignal(sem);
	inc _sem 
;	testparking.c:120: ThreadExit();
;	testparking.c:122: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'Car4'
;------------------------------------------------------------
;	testparking.c:124: void Car4(void){
;	-----------------------------------------
;	 function Car4
;	-----------------------------------------
_Car4:
;	testparking.c:125: SemaphoreWait(sem);
		9$:
	mov a, _sem 
	jz 9$ 
	jb ACC.7, 9$ 
	dec _sem 
;	testparking.c:127: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:128: SemaphoreWait(spotsSync);
		10$:
	mov a, _spotsSync 
	jz 10$ 
	jb ACC.7, 10$ 
	dec _spotsSync 
;	testparking.c:129: if(spots[0]=='X') {
	mov	a,#0x58
	cjne	a,_spots,00102$
;	testparking.c:130: spots[0] = '4';
	mov	_spots,#0x34
;	testparking.c:131: CarSpot[3] = '0';
	mov	(_CarSpot + 0x0003),#0x30
	sjmp	00103$
00102$:
;	testparking.c:133: spots[1] = '4';
	mov	(_spots + 0x0001),#0x34
;	testparking.c:134: CarSpot[3] = '1';
	mov	(_CarSpot + 0x0003),#0x31
00103$:
;	testparking.c:136: CarIn[3] = now;
	mov	(_CarIn + 0x0003),_now
;	testparking.c:137: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:138: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:140: delay(7);
	mov	dpl,#0x07
	lcall	_delay
;	testparking.c:142: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:143: SemaphoreWait(spotsSync);
		11$:
	mov a, _spotsSync 
	jz 11$ 
	jb ACC.7, 11$ 
	dec _spotsSync 
;	testparking.c:144: if(spots[0]=='4') {
	mov	a,#0x34
	cjne	a,_spots,00105$
;	testparking.c:145: spots[0] = 'X';
	mov	_spots,#0x58
	sjmp	00106$
00105$:
;	testparking.c:147: spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
00106$:
;	testparking.c:149: CarOut[3] = now;
	mov	(_CarOut + 0x0003),_now
;	testparking.c:150: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:151: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:153: SemaphoreSignal(sem);
	inc _sem 
;	testparking.c:155: ThreadExit();
;	testparking.c:157: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'Car5'
;------------------------------------------------------------
;	testparking.c:159: void Car5(void){
;	-----------------------------------------
;	 function Car5
;	-----------------------------------------
_Car5:
;	testparking.c:160: SemaphoreWait(sem);
		12$:
	mov a, _sem 
	jz 12$ 
	jb ACC.7, 12$ 
	dec _sem 
;	testparking.c:162: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:163: SemaphoreWait(spotsSync);
		13$:
	mov a, _spotsSync 
	jz 13$ 
	jb ACC.7, 13$ 
	dec _spotsSync 
;	testparking.c:164: if(spots[0]=='X') {
	mov	a,#0x58
	cjne	a,_spots,00102$
;	testparking.c:165: spots[0] = '5';
	mov	_spots,#0x35
;	testparking.c:166: CarSpot[4] = '0';
	mov	(_CarSpot + 0x0004),#0x30
	sjmp	00103$
00102$:
;	testparking.c:168: spots[1] = '5';
	mov	(_spots + 0x0001),#0x35
;	testparking.c:169: CarSpot[4] = '1';
	mov	(_CarSpot + 0x0004),#0x31
00103$:
;	testparking.c:171: CarIn[4] = now;
	mov	(_CarIn + 0x0004),_now
;	testparking.c:172: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:173: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:175: delay(3);
	mov	dpl,#0x03
	lcall	_delay
;	testparking.c:177: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:178: SemaphoreWait(spotsSync);
		14$:
	mov a, _spotsSync 
	jz 14$ 
	jb ACC.7, 14$ 
	dec _spotsSync 
;	testparking.c:179: if(spots[0]=='5') {
	mov	a,#0x35
	cjne	a,_spots,00105$
;	testparking.c:180: spots[0] = 'X';
	mov	_spots,#0x58
	sjmp	00106$
00105$:
;	testparking.c:182: spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
00106$:
;	testparking.c:184: CarOut[4] = now;
	mov	(_CarOut + 0x0004),_now
;	testparking.c:185: SemaphoreSignal(spotsSync);
	inc _spotsSync 
;	testparking.c:186: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:188: SemaphoreSignal(sem);
	inc _sem 
;	testparking.c:190: ThreadExit();
;	testparking.c:192: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;j                         Allocated to registers r6 
;------------------------------------------------------------
;	testparking.c:194: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	testparking.c:195: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	testparking.c:196: TH1 = -6;
	mov	_TH1,#0xfa
;	testparking.c:197: SCON = 0x50;
	mov	_SCON,#0x50
;	testparking.c:198: TR1 = 1;
;	assignBit
	setb	_TR1
;	testparking.c:199: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:200: for(char i=0; i<5; i++){
	mov	r7,#0x00
00180$:
	cjne	r7,#0x05,00384$
00384$:
	jc	00385$
	ljmp	00157$
00385$:
;	testparking.c:201: for(char j=0; j<5; j++) {
	mov	r6,#0x00
00159$:
	cjne	r6,#0x05,00386$
00386$:
	jnc	00104$
;	testparking.c:202: SBUF = Car[j];
	mov	dpl,r6
	mov	dph,#(_Car >> 8)
	clr	a
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:203: while(!TI);
00101$:
;	testparking.c:204: TI = 0;
;	assignBit
	jbc	_TI,00388$
	sjmp	00101$
00388$:
;	testparking.c:201: for(char j=0; j<5; j++) {
	inc	r6
	sjmp	00159$
00104$:
;	testparking.c:207: SBUF = '1' + i;
	mov	ar6,r7
	mov	a,#0x31
	add	a,r6
	mov	_SBUF,a
;	testparking.c:208: while(!TI);
00105$:
;	testparking.c:209: TI = 0;
;	assignBit
	jbc	_TI,00389$
	sjmp	00105$
00389$:
;	testparking.c:211: for(char j=0; j<11; j++) {
	mov	r6,#0x00
00162$:
	cjne	r6,#0x0b,00390$
00390$:
	jnc	00111$
;	testparking.c:212: SBUF = GotSpot[j];
	mov	a,r6
	mov	dptr,#_GotSpot
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:213: while(!TI);
00108$:
;	testparking.c:214: TI = 0;
;	assignBit
	jbc	_TI,00392$
	sjmp	00108$
00392$:
;	testparking.c:211: for(char j=0; j<11; j++) {
	inc	r6
	sjmp	00162$
00111$:
;	testparking.c:217: SBUF = CarSpot[i];
	mov	a,r7
	add	a,#_CarSpot
	mov	r1,a
	mov	_SBUF,@r1
;	testparking.c:218: while(!TI);
00112$:
;	testparking.c:219: TI = 0;
;	assignBit
	jbc	_TI,00393$
	sjmp	00112$
00393$:
;	testparking.c:221: for(char j=0; j<16; j++) {
	mov	r6,#0x00
00165$:
	cjne	r6,#0x10,00394$
00394$:
	jnc	00118$
;	testparking.c:222: SBUF = TimeUnit[j];
	mov	a,r6
	mov	dptr,#_TimeUnit
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:223: while(!TI);
00115$:
;	testparking.c:224: TI = 0;
;	assignBit
	jbc	_TI,00396$
	sjmp	00115$
00396$:
;	testparking.c:221: for(char j=0; j<16; j++) {
	inc	r6
	sjmp	00165$
00118$:
;	testparking.c:227: if(CarIn[i]>9) {
	mov	a,r7
	add	a,#_CarIn
	mov	r1,a
	mov	a,@r1
	add	a,#0xff - 0x09
	jnc	00123$
;	testparking.c:228: SBUF = '0' + (CarIn[i]/10);
	mov	a,r7
	add	a,#_CarIn
	mov	r1,a
	mov	ar6,@r1
	mov	r5,#0x00
	mov	__divsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r5
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,#0x30
	add	a,r5
	mov	_SBUF,a
;	testparking.c:229: while(!TI);
00119$:
;	testparking.c:230: TI = 0;
;	assignBit
	jbc	_TI,00398$
	sjmp	00119$
00398$:
00123$:
;	testparking.c:233: SBUF = '0' + (CarIn[i]%10);
	mov	a,r7
	add	a,#_CarIn
	mov	r1,a
	mov	ar6,@r1
	mov	r5,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r5
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	lcall	__modsint
	mov	r5,dpl
	pop	ar7
	mov	a,#0x30
	add	a,r5
	mov	_SBUF,a
;	testparking.c:234: while(!TI);
00124$:
;	testparking.c:235: TI = 0;
;	assignBit
	jbc	_TI,00399$
	sjmp	00124$
00399$:
;	testparking.c:237: for(char j=0; j<5; j++) {
	mov	r6,#0x00
00168$:
	cjne	r6,#0x05,00400$
00400$:
	jnc	00130$
;	testparking.c:238: SBUF = and[j];
	mov	a,r6
	mov	dptr,#_and
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:239: while(!TI);
00127$:
;	testparking.c:240: TI = 0;
;	assignBit
	jbc	_TI,00402$
	sjmp	00127$
00402$:
;	testparking.c:237: for(char j=0; j<5; j++) {
	inc	r6
	sjmp	00168$
00130$:
;	testparking.c:244: for(char j=0; j<5; j++) {
	mov	r6,#0x00
00171$:
	cjne	r6,#0x05,00403$
00403$:
	jnc	00134$
;	testparking.c:245: SBUF = Car[j];
	mov	dpl,r6
	mov	dph,#(_Car >> 8)
	clr	a
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:246: while(!TI);
00131$:
;	testparking.c:247: TI = 0;
;	assignBit
	jbc	_TI,00405$
	sjmp	00131$
00405$:
;	testparking.c:244: for(char j=0; j<5; j++) {
	inc	r6
	sjmp	00171$
00134$:
;	testparking.c:250: SBUF = '1' + i;
	mov	ar6,r7
	mov	a,#0x31
	add	a,r6
	mov	_SBUF,a
;	testparking.c:251: while(!TI);
00135$:
;	testparking.c:252: TI = 0;
;	assignBit
	jbc	_TI,00406$
	sjmp	00135$
00406$:
;	testparking.c:254: for(char j=0; j<7; j++) {
	mov	r6,#0x00
00174$:
	cjne	r6,#0x07,00407$
00407$:
	jnc	00141$
;	testparking.c:255: SBUF = ExitSpot[j];
	mov	a,r6
	mov	dptr,#_ExitSpot
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:256: while(!TI);
00138$:
;	testparking.c:257: TI = 0;
;	assignBit
	jbc	_TI,00409$
	sjmp	00138$
00409$:
;	testparking.c:254: for(char j=0; j<7; j++) {
	inc	r6
	sjmp	00174$
00141$:
;	testparking.c:260: for(char j=0; j<16; j++) {
	mov	r6,#0x00
00177$:
	cjne	r6,#0x10,00410$
00410$:
	jnc	00145$
;	testparking.c:261: SBUF = TimeUnit[j];
	mov	a,r6
	mov	dptr,#_TimeUnit
	movc	a,@a+dptr
	mov	_SBUF,a
;	testparking.c:262: while(!TI);
00142$:
;	testparking.c:263: TI = 0;
;	assignBit
	jbc	_TI,00412$
	sjmp	00142$
00412$:
;	testparking.c:260: for(char j=0; j<16; j++) {
	inc	r6
	sjmp	00177$
00145$:
;	testparking.c:266: if(CarOut[i]>9) {
	mov	a,r7
	add	a,#_CarOut
	mov	r1,a
	mov	a,@r1
	add	a,#0xff - 0x09
	jnc	00150$
;	testparking.c:267: SBUF = '0' + (CarOut[i]/10);
	mov	a,r7
	add	a,#_CarOut
	mov	r1,a
	mov	ar6,@r1
	mov	r5,#0x00
	mov	__divsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r5
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,#0x30
	add	a,r5
	mov	_SBUF,a
;	testparking.c:268: while(!TI);
00146$:
;	testparking.c:269: TI = 0;
;	assignBit
	jbc	_TI,00414$
	sjmp	00146$
00414$:
00150$:
;	testparking.c:271: SBUF = '0' + (CarOut[i]%10);
	mov	a,r7
	add	a,#_CarOut
	mov	r1,a
	mov	ar6,@r1
	mov	r5,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r5
	mov	dpl,r6
	mov	dph,r5
	push	ar7
	lcall	__modsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,#0x30
	add	a,r5
	mov	_SBUF,a
;	testparking.c:272: while(!TI);
00151$:
;	testparking.c:273: TI = 0;
;	assignBit
	jbc	_TI,00415$
	sjmp	00151$
00415$:
;	testparking.c:275: SBUF = '\n';
	mov	_SBUF,#0x0a
;	testparking.c:276: while(!TI);
00154$:
;	testparking.c:277: TI = 0;
;	assignBit
	jbc	_TI,00416$
	sjmp	00154$
00416$:
;	testparking.c:200: for(char i=0; i<5; i++){
	inc	r7
	ljmp	00180$
00157$:
;	testparking.c:280: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:281: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:283: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:284: EA=0;
;	assignBit
	clr	_EA
;	testparking.c:285: spots[0] = spots[1] = 'X';
	mov	(_spots + 0x0001),#0x58
	mov	_spots,#0x58
;	testparking.c:286: SemaphoreCreate(sem,2);
	mov	_sem,#0x02
;	testparking.c:287: SemaphoreCreate(spotsSync,1);
	mov	_spotsSync,#0x01
;	testparking.c:288: EA=1;
;	assignBit
	setb	_EA
;	testparking.c:290: ThreadCreate(Car1);
	mov	dptr,#_Car1
	lcall	_ThreadCreate
;	testparking.c:291: do{ delay(2); } while(bitmap==0x0F);
00101$:
	mov	dpl,#0x02
	lcall	_delay
	mov	a,#0x0f
	cjne	a,_bitmap,00163$
	sjmp	00101$
00163$:
;	testparking.c:292: ThreadCreate(Car2);
	mov	dptr,#_Car2
	lcall	_ThreadCreate
;	testparking.c:293: do{ delay(2); } while(bitmap==0x0F);
00104$:
	mov	dpl,#0x02
	lcall	_delay
	mov	a,#0x0f
	cjne	a,_bitmap,00164$
	sjmp	00104$
00164$:
;	testparking.c:294: ThreadCreate(Car3);
	mov	dptr,#_Car3
	lcall	_ThreadCreate
;	testparking.c:295: do{ delay(2); } while(bitmap==0x0F);
00107$:
	mov	dpl,#0x02
	lcall	_delay
	mov	a,#0x0f
	cjne	a,_bitmap,00165$
	sjmp	00107$
00165$:
;	testparking.c:296: ThreadCreate(Car4);
	mov	dptr,#_Car4
	lcall	_ThreadCreate
;	testparking.c:297: do{ delay(2); } while(bitmap==0x0F);
00110$:
	mov	dpl,#0x02
	lcall	_delay
	mov	a,#0x0f
	cjne	a,_bitmap,00166$
	sjmp	00110$
00166$:
;	testparking.c:298: ThreadCreate(Car5);
	mov	dptr,#_Car5
	lcall	_ThreadCreate
;	testparking.c:299: do{ delay(2); } while(spots[0] != 'X' || spots[1] != 'X');
00114$:
	mov	dpl,#0x02
	lcall	_delay
	mov	a,#0x58
	cjne	a,_spots,00114$
	mov	a,#0x58
	cjne	a,(_spots + 0x0001),00114$
;	testparking.c:301: Consumer();
	lcall	_Consumer
;	testparking.c:304: ThreadExit();
;	testparking.c:305: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:307: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:310: __endasm;
	ljmp	_Bootstrap
;	testparking.c:311: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:313: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:314: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:315: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:317: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:320: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:321: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
	.org 0x0700
_Car:
	.ascii "Car "
	.db 0x00
	.org 0x0710
_GotSpot:
	.ascii " parks at spot "
	.db 0x00
	.org 0x0720
_and:
	.ascii "and "
	.db 0x00
	.org 0x0730
_TimeUnit:
	.ascii " at time unit: "
	.db 0x00
	.org 0x0740
_ExitSpot:
	.ascii " exits"
	.db 0x00
