;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Mac OS X x86_64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _delayid
	.globl _now
	.globl _cnt
	.globl _checkAlive
	.globl _tmp2
	.globl _tmp
	.globl _i
	.globl _newThread
	.globl _bitmap
	.globl _curThread
	.globl _sp
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
	.globl _delay
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
_sp	=	0x0030
_curThread	=	0x0034
_bitmap	=	0x0035
_newThread	=	0x0036
_i	=	0x0037
_tmp	=	0x0038
_tmp2	=	0x0039
_checkAlive	=	0x003a
_cnt	=	0x003e
_now	=	0x003f
_delayid	=	0x002c
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
_ThreadYield_sloc0_1_0:
	.ds 1
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:42: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:43: cnt = 0;
	mov	_cnt,#0x00
;	preemptive.c:44: now = 0;
	mov	_now,#0x00
;	preemptive.c:45: TMOD = 0;
	mov	_TMOD,#0x00
;	preemptive.c:46: IE = 0x82;
	mov	_IE,#0x82
;	preemptive.c:47: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:48: bitmap = 0b0000;
	mov	_bitmap,#0x00
;	preemptive.c:49: checkAlive[0] = 0b0001; checkAlive[1] = 0b0010; checkAlive[2] = 0b0100; checkAlive[3] = 0b1000;
	mov	_checkAlive,#0x01
	mov	(_checkAlive + 0x0001),#0x02
	mov	(_checkAlive + 0x0002),#0x04
	mov	(_checkAlive + 0x0003),#0x08
;	preemptive.c:50: delayid[0] = delayid[1] = delayid[2] = delayid[3] = 0;
	mov	(_delayid + 0x0003),#0x00
	mov	(_delayid + 0x0002),#0x00
	mov	(_delayid + 0x0001),#0x00
	mov	_delayid,#0x00
;	preemptive.c:51: curThread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_curThread,dpl
;	preemptive.c:52: RESTORESTATE;
	mov	a,_curThread
	add	a,#_sp
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:53: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:55: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:56: if(bitmap == 0b1111) return -1;
	mov	a,#0x0f
	cjne	a,_bitmap,00102$
	mov	dpl,#0xff
	ret
00102$:
;	preemptive.c:57: EA=0;
;	assignBit
	clr	_EA
;	preemptive.c:58: for(i=0; i<MAXTHREADS; i++) {
	mov	_i,#0x00
00107$:
	mov	a,#0x100 - 0x04
	add	a,_i
	jc	00105$
;	preemptive.c:59: if(((bitmap) & (0b0001<<i)) == 0) {
	mov	r7,_i
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00131$
00130$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00131$:
	djnz	b,00130$
	mov	r4,_bitmap
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jnz	00108$
;	preemptive.c:60: bitmap |= (0b0001<<i);
	mov	r7,_i
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00135$
00133$:
	add	a,acc
00135$:
	djnz	b,00133$
	mov	r7,a
	orl	_bitmap,a
;	preemptive.c:61: newThread = i;
	mov	_newThread,_i
;	preemptive.c:62: break;
	sjmp	00105$
00108$:
;	preemptive.c:58: for(i=0; i<MAXTHREADS; i++) {
	mov	a,_i
	inc	a
	mov	_i,a
	sjmp	00107$
00105$:
;	preemptive.c:65: tmp = SP;
	mov	_tmp,_SP
;	preemptive.c:66: SP = 0x3F + (i<<4);
	mov	a,_i
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:75: __endasm;
	push	DPL
	push	DPH
	mov	A, #0
	push	A
	push	A
	push	A
	push	A
;	preemptive.c:77: tmp2 = (i<<3);
	mov	a,_i
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_tmp2,a
;	preemptive.c:81: __endasm;
	push	_tmp2
;	preemptive.c:83: sp[newThread] = SP;
	mov	a,_newThread
	add	a,#_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:84: SP = tmp;
	mov	_SP,_tmp
;	preemptive.c:85: EA=1;
;	assignBit
	setb	_EA
;	preemptive.c:86: return newThread;
	mov	dpl,_newThread
;	preemptive.c:87: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:89: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:97: }
	setb	_ThreadYield_sloc0_1_0
	jbc	ea,00122$
	clr	_ThreadYield_sloc0_1_0
00122$:
;	preemptive.c:91: SAVESTATE;
	push ACC 
	push B 
	push DPL 
	push DPH 
	push PSW 
	mov	a,_curThread
	add	a,#_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:92: do {
00103$:
;	preemptive.c:93: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
	mov	a,#0x03
	cjne	a,_curThread,00108$
	mov	r6,#0x00
	mov	r7,#0x00
	sjmp	00109$
00108$:
	mov	r5,_curThread
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00109$:
	mov	_curThread,r6
;	preemptive.c:94: if(bitmap & checkAlive[curThread]) break;
	mov	a,_curThread
	add	a,#_checkAlive
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	anl	a,_bitmap
	jz	00103$
;	preemptive.c:96: RESTORESTATE;
	mov	a,_curThread
	add	a,#_sp
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
	mov	c,_ThreadYield_sloc0_1_0
	mov	ea,c
;	preemptive.c:98: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:100: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:101: EA=0;
;	assignBit
	clr	_EA
;	preemptive.c:112: __endasm; 
	mov	A, #0
	push	A
	push	A
	push	A
	push	A
	push	A
	push	A
	push	A
	push	A
;	preemptive.c:113: sp[curThread] = 0;
	mov	a,_curThread
	add	a,#_sp
	mov	r0,a
	mov	@r0,#0x00
;	preemptive.c:114: bitmap &= ~(1<<curThread);
	mov	r7,_curThread
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00133$
00131$:
	add	a,acc
00133$:
	djnz	b,00131$
	cpl	a
	mov	r7,a
	anl	_bitmap,a
;	preemptive.c:115: if(bitmap == 0){
	mov	a,_bitmap
	jnz	00108$
;	preemptive.c:116: while(1){};
00102$:
;	preemptive.c:118: do {
	sjmp	00102$
00108$:
;	preemptive.c:119: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
	mov	a,#0x03
	cjne	a,_curThread,00113$
	mov	r6,#0x00
	mov	r7,#0x00
	sjmp	00114$
00113$:
	mov	r5,_curThread
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00114$:
	mov	_curThread,r6
;	preemptive.c:120: if(bitmap & checkAlive[curThread]) break;
	mov	a,_curThread
	add	a,#_checkAlive
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	anl	a,_bitmap
	jz	00108$
;	preemptive.c:122: RESTORESTATE;
	mov	a,_curThread
	add	a,#_sp
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:123: EA=1;
;	assignBit
	setb	_EA
;	preemptive.c:124: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:126: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:127: EA=0;
;	assignBit
	clr	_EA
;	preemptive.c:129: SAVESTATE;
	push ACC 
	push B 
	push DPL 
	push DPH 
	push PSW 
	mov	a,_curThread
	add	a,#_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:138: __endasm;
	mov	ACC, r1
	mov	B, r2
	mov	DPL, r3
	mov	DPH, r4
	mov	_i, r5
	mov	_tmp, r6
	mov	_tmp2, r7
;	preemptive.c:139: do {
00103$:
;	preemptive.c:140: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
	mov	a,#0x03
	cjne	a,_curThread,00110$
	mov	r6,#0x00
	mov	r7,#0x00
	sjmp	00111$
00110$:
	mov	r5,_curThread
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00111$:
	mov	_curThread,r6
;	preemptive.c:141: if(bitmap & checkAlive[curThread]) break;
	mov	a,_curThread
	add	a,#_checkAlive
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	anl	a,_bitmap
	jz	00103$
;	preemptive.c:143: cnt++;
	mov	a,_cnt
	inc	a
	mov	_cnt,a
;	preemptive.c:144: if(cnt==4) {
	mov	a,#0x04
	cjne	a,_cnt,00107$
;	preemptive.c:145: cnt = 0;
	mov	_cnt,#0x00
;	preemptive.c:146: now++;
	mov	a,_now
	inc	a
	mov	_now,a
00107$:
;	preemptive.c:156: __endasm;
	mov	r1, ACC
	mov	r2, B
	mov	r3, DPL
	mov	r4, DPH
	mov	r5, _i
	mov	r6, _tmp
	mov	r7, _tmp2
;	preemptive.c:157: RESTORESTATE;
	mov	a,_curThread
	add	a,#_sp
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:158: EA=1;
;	assignBit
	setb	_EA
;	preemptive.c:161: __endasm;
	reti
;	preemptive.c:163: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;n                         Allocated to registers r7 
;------------------------------------------------------------
;	preemptive.c:165: void delay(unsigned char n) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r7,dpl
;	preemptive.c:166: delayid[curThread] = now + n;
	mov	a,_curThread
	add	a,#_delayid
	mov	r1,a
	mov	a,r7
	add	a,_now
	mov	@r1,a
;	preemptive.c:167: while(now != delayid[curThread]);
00101$:
	mov	a,_curThread
	add	a,#_delayid
	mov	r1,a
	mov	a,@r1
	cjne	a,_now,00101$
;	preemptive.c:168: delayid[curThread] = 0;
	mov	a,_curThread
	add	a,#_delayid
	mov	r0,a
	mov	@r0,#0x00
;	preemptive.c:169: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
