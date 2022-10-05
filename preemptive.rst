                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _delayid
                                    111 	.globl _now
                                    112 	.globl _cnt
                                    113 	.globl _checkAlive
                                    114 	.globl _tmp2
                                    115 	.globl _tmp
                                    116 	.globl _i
                                    117 	.globl _newThread
                                    118 	.globl _bitmap
                                    119 	.globl _curThread
                                    120 	.globl _sp
                                    121 	.globl _ThreadCreate
                                    122 	.globl _ThreadYield
                                    123 	.globl _ThreadExit
                                    124 	.globl _delay
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           000030   240 _sp	=	0x0030
                           000034   241 _curThread	=	0x0034
                           000035   242 _bitmap	=	0x0035
                           000036   243 _newThread	=	0x0036
                           000037   244 _i	=	0x0037
                           000038   245 _tmp	=	0x0038
                           000039   246 _tmp2	=	0x0039
                           00003A   247 _checkAlive	=	0x003a
                           00003E   248 _cnt	=	0x003e
                           00003F   249 _now	=	0x003f
                           00002C   250 _delayid	=	0x002c
                                    251 ;--------------------------------------------------------
                                    252 ; overlayable items in internal ram 
                                    253 ;--------------------------------------------------------
                                    254 	.area	OSEG    (OVR,DATA)
                                    255 	.area	OSEG    (OVR,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; indirectly addressable internal ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area ISEG    (DATA)
                                    260 ;--------------------------------------------------------
                                    261 ; absolute internal ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area IABS    (ABS,DATA)
                                    264 	.area IABS    (ABS,DATA)
                                    265 ;--------------------------------------------------------
                                    266 ; bit data
                                    267 ;--------------------------------------------------------
                                    268 	.area BSEG    (BIT)
      000000                        269 _ThreadYield_sloc0_1_0:
      000000                        270 	.ds 1
                                    271 ;--------------------------------------------------------
                                    272 ; paged external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area PSEG    (PAG,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XSEG    (XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; absolute external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XABS    (ABS,XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; external initialized ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XISEG   (XDATA)
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT0 (CODE)
                                    289 	.area GSINIT1 (CODE)
                                    290 	.area GSINIT2 (CODE)
                                    291 	.area GSINIT3 (CODE)
                                    292 	.area GSINIT4 (CODE)
                                    293 	.area GSINIT5 (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area CSEG    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; global & static initialisations
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
                                    301 	.area GSINIT  (CODE)
                                    302 	.area GSFINAL (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; Home
                                    306 ;--------------------------------------------------------
                                    307 	.area HOME    (CODE)
                                    308 	.area HOME    (CODE)
                                    309 ;--------------------------------------------------------
                                    310 ; code
                                    311 ;--------------------------------------------------------
                                    312 	.area CSEG    (CODE)
                                    313 ;------------------------------------------------------------
                                    314 ;Allocation info for local variables in function 'Bootstrap'
                                    315 ;------------------------------------------------------------
                                    316 ;	preemptive.c:42: void Bootstrap(void) {
                                    317 ;	-----------------------------------------
                                    318 ;	 function Bootstrap
                                    319 ;	-----------------------------------------
      0003DE                        320 _Bootstrap:
                           000007   321 	ar7 = 0x07
                           000006   322 	ar6 = 0x06
                           000005   323 	ar5 = 0x05
                           000004   324 	ar4 = 0x04
                           000003   325 	ar3 = 0x03
                           000002   326 	ar2 = 0x02
                           000001   327 	ar1 = 0x01
                           000000   328 	ar0 = 0x00
                                    329 ;	preemptive.c:43: cnt = 0;
      0003DE 75 3E 00         [24]  330 	mov	_cnt,#0x00
                                    331 ;	preemptive.c:44: now = 0;
      0003E1 75 3F 00         [24]  332 	mov	_now,#0x00
                                    333 ;	preemptive.c:45: TMOD = 0;
      0003E4 75 89 00         [24]  334 	mov	_TMOD,#0x00
                                    335 ;	preemptive.c:46: IE = 0x82;
      0003E7 75 A8 82         [24]  336 	mov	_IE,#0x82
                                    337 ;	preemptive.c:47: TR0 = 1;
                                    338 ;	assignBit
      0003EA D2 8C            [12]  339 	setb	_TR0
                                    340 ;	preemptive.c:48: bitmap = 0b0000;
      0003EC 75 35 00         [24]  341 	mov	_bitmap,#0x00
                                    342 ;	preemptive.c:49: checkAlive[0] = 0b0001; checkAlive[1] = 0b0010; checkAlive[2] = 0b0100; checkAlive[3] = 0b1000;
      0003EF 75 3A 01         [24]  343 	mov	_checkAlive,#0x01
      0003F2 75 3B 02         [24]  344 	mov	(_checkAlive + 0x0001),#0x02
      0003F5 75 3C 04         [24]  345 	mov	(_checkAlive + 0x0002),#0x04
      0003F8 75 3D 08         [24]  346 	mov	(_checkAlive + 0x0003),#0x08
                                    347 ;	preemptive.c:50: delayid[0] = delayid[1] = delayid[2] = delayid[3] = 0;
      0003FB 75 2F 00         [24]  348 	mov	(_delayid + 0x0003),#0x00
      0003FE 75 2E 00         [24]  349 	mov	(_delayid + 0x0002),#0x00
      000401 75 2D 00         [24]  350 	mov	(_delayid + 0x0001),#0x00
      000404 75 2C 00         [24]  351 	mov	_delayid,#0x00
                                    352 ;	preemptive.c:51: curThread = ThreadCreate(main);
      000407 90 03 5B         [24]  353 	mov	dptr,#_main
      00040A 12 04 22         [24]  354 	lcall	_ThreadCreate
      00040D 85 82 34         [24]  355 	mov	_curThread,dpl
                                    356 ;	preemptive.c:52: RESTORESTATE;
      000410 E5 34            [12]  357 	mov	a,_curThread
      000412 24 30            [12]  358 	add	a,#_sp
      000414 F9               [12]  359 	mov	r1,a
      000415 87 81            [24]  360 	mov	_SP,@r1
      000417 D0 D0            [24]  361 	pop PSW 
      000419 D0 83            [24]  362 	pop DPH 
      00041B D0 82            [24]  363 	pop DPL 
      00041D D0 F0            [24]  364 	pop B 
      00041F D0 E0            [24]  365 	pop ACC 
                                    366 ;	preemptive.c:53: }
      000421 22               [24]  367 	ret
                                    368 ;------------------------------------------------------------
                                    369 ;Allocation info for local variables in function 'ThreadCreate'
                                    370 ;------------------------------------------------------------
                                    371 ;fp                        Allocated to registers 
                                    372 ;------------------------------------------------------------
                                    373 ;	preemptive.c:55: ThreadID ThreadCreate(FunctionPtr fp) {
                                    374 ;	-----------------------------------------
                                    375 ;	 function ThreadCreate
                                    376 ;	-----------------------------------------
      000422                        377 _ThreadCreate:
                                    378 ;	preemptive.c:56: if(bitmap == 0b1111) return -1;
      000422 74 0F            [12]  379 	mov	a,#0x0f
      000424 B5 35 04         [24]  380 	cjne	a,_bitmap,00102$
      000427 75 82 FF         [24]  381 	mov	dpl,#0xff
      00042A 22               [24]  382 	ret
      00042B                        383 00102$:
                                    384 ;	preemptive.c:57: EA=0;
                                    385 ;	assignBit
      00042B C2 AF            [12]  386 	clr	_EA
                                    387 ;	preemptive.c:58: for(i=0; i<MAXTHREADS; i++) {
      00042D 75 37 00         [24]  388 	mov	_i,#0x00
      000430                        389 00107$:
      000430 74 FC            [12]  390 	mov	a,#0x100 - 0x04
      000432 25 37            [12]  391 	add	a,_i
      000434 40 41            [24]  392 	jc	00105$
                                    393 ;	preemptive.c:59: if(((bitmap) & (0b0001<<i)) == 0) {
      000436 AF 37            [24]  394 	mov	r7,_i
      000438 8F F0            [24]  395 	mov	b,r7
      00043A 05 F0            [12]  396 	inc	b
      00043C 7F 01            [12]  397 	mov	r7,#0x01
      00043E 7E 00            [12]  398 	mov	r6,#0x00
      000440 80 06            [24]  399 	sjmp	00131$
      000442                        400 00130$:
      000442 EF               [12]  401 	mov	a,r7
      000443 2F               [12]  402 	add	a,r7
      000444 FF               [12]  403 	mov	r7,a
      000445 EE               [12]  404 	mov	a,r6
      000446 33               [12]  405 	rlc	a
      000447 FE               [12]  406 	mov	r6,a
      000448                        407 00131$:
      000448 D5 F0 F7         [24]  408 	djnz	b,00130$
      00044B AC 35            [24]  409 	mov	r4,_bitmap
      00044D 7D 00            [12]  410 	mov	r5,#0x00
      00044F EC               [12]  411 	mov	a,r4
      000450 52 07            [12]  412 	anl	ar7,a
      000452 ED               [12]  413 	mov	a,r5
      000453 52 06            [12]  414 	anl	ar6,a
      000455 EF               [12]  415 	mov	a,r7
      000456 4E               [12]  416 	orl	a,r6
      000457 70 17            [24]  417 	jnz	00108$
                                    418 ;	preemptive.c:60: bitmap |= (0b0001<<i);
      000459 AF 37            [24]  419 	mov	r7,_i
      00045B 8F F0            [24]  420 	mov	b,r7
      00045D 05 F0            [12]  421 	inc	b
      00045F 74 01            [12]  422 	mov	a,#0x01
      000461 80 02            [24]  423 	sjmp	00135$
      000463                        424 00133$:
      000463 25 E0            [12]  425 	add	a,acc
      000465                        426 00135$:
      000465 D5 F0 FB         [24]  427 	djnz	b,00133$
      000468 FF               [12]  428 	mov	r7,a
      000469 42 35            [12]  429 	orl	_bitmap,a
                                    430 ;	preemptive.c:61: newThread = i;
      00046B 85 37 36         [24]  431 	mov	_newThread,_i
                                    432 ;	preemptive.c:62: break;
      00046E 80 07            [24]  433 	sjmp	00105$
      000470                        434 00108$:
                                    435 ;	preemptive.c:58: for(i=0; i<MAXTHREADS; i++) {
      000470 E5 37            [12]  436 	mov	a,_i
      000472 04               [12]  437 	inc	a
      000473 F5 37            [12]  438 	mov	_i,a
      000475 80 B9            [24]  439 	sjmp	00107$
      000477                        440 00105$:
                                    441 ;	preemptive.c:65: tmp = SP;
      000477 85 81 38         [24]  442 	mov	_tmp,_SP
                                    443 ;	preemptive.c:66: SP = 0x3F + (i<<4);
      00047A E5 37            [12]  444 	mov	a,_i
      00047C C4               [12]  445 	swap	a
      00047D 54 F0            [12]  446 	anl	a,#0xf0
      00047F FF               [12]  447 	mov	r7,a
      000480 24 3F            [12]  448 	add	a,#0x3f
      000482 F5 81            [12]  449 	mov	_SP,a
                                    450 ;	preemptive.c:75: __endasm;
      000484 C0 82            [24]  451 	push	DPL
      000486 C0 83            [24]  452 	push	DPH
      000488 74 00            [12]  453 	mov	A, #0
      00048A C0 E0            [24]  454 	push	A
      00048C C0 E0            [24]  455 	push	A
      00048E C0 E0            [24]  456 	push	A
      000490 C0 E0            [24]  457 	push	A
                                    458 ;	preemptive.c:77: tmp2 = (i<<3);
      000492 E5 37            [12]  459 	mov	a,_i
      000494 FF               [12]  460 	mov	r7,a
      000495 C4               [12]  461 	swap	a
      000496 03               [12]  462 	rr	a
      000497 54 F8            [12]  463 	anl	a,#0xf8
      000499 F5 39            [12]  464 	mov	_tmp2,a
                                    465 ;	preemptive.c:81: __endasm;
      00049B C0 39            [24]  466 	push	_tmp2
                                    467 ;	preemptive.c:83: sp[newThread] = SP;
      00049D E5 36            [12]  468 	mov	a,_newThread
      00049F 24 30            [12]  469 	add	a,#_sp
      0004A1 F8               [12]  470 	mov	r0,a
      0004A2 A6 81            [24]  471 	mov	@r0,_SP
                                    472 ;	preemptive.c:84: SP = tmp;
      0004A4 85 38 81         [24]  473 	mov	_SP,_tmp
                                    474 ;	preemptive.c:85: EA=1;
                                    475 ;	assignBit
      0004A7 D2 AF            [12]  476 	setb	_EA
                                    477 ;	preemptive.c:86: return newThread;
      0004A9 85 36 82         [24]  478 	mov	dpl,_newThread
                                    479 ;	preemptive.c:87: }
      0004AC 22               [24]  480 	ret
                                    481 ;------------------------------------------------------------
                                    482 ;Allocation info for local variables in function 'ThreadYield'
                                    483 ;------------------------------------------------------------
                                    484 ;	preemptive.c:89: void ThreadYield(void) {
                                    485 ;	-----------------------------------------
                                    486 ;	 function ThreadYield
                                    487 ;	-----------------------------------------
      0004AD                        488 _ThreadYield:
                                    489 ;	preemptive.c:97: }
      0004AD D2 00            [12]  490 	setb	_ThreadYield_sloc0_1_0
      0004AF 10 AF 02         [24]  491 	jbc	ea,00122$
      0004B2 C2 00            [12]  492 	clr	_ThreadYield_sloc0_1_0
      0004B4                        493 00122$:
                                    494 ;	preemptive.c:91: SAVESTATE;
      0004B4 C0 E0            [24]  495 	push ACC 
      0004B6 C0 F0            [24]  496 	push B 
      0004B8 C0 82            [24]  497 	push DPL 
      0004BA C0 83            [24]  498 	push DPH 
      0004BC C0 D0            [24]  499 	push PSW 
      0004BE E5 34            [12]  500 	mov	a,_curThread
      0004C0 24 30            [12]  501 	add	a,#_sp
      0004C2 F8               [12]  502 	mov	r0,a
      0004C3 A6 81            [24]  503 	mov	@r0,_SP
                                    504 ;	preemptive.c:92: do {
      0004C5                        505 00103$:
                                    506 ;	preemptive.c:93: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
      0004C5 74 03            [12]  507 	mov	a,#0x03
      0004C7 B5 34 06         [24]  508 	cjne	a,_curThread,00108$
      0004CA 7E 00            [12]  509 	mov	r6,#0x00
      0004CC 7F 00            [12]  510 	mov	r7,#0x00
      0004CE 80 09            [24]  511 	sjmp	00109$
      0004D0                        512 00108$:
      0004D0 AD 34            [24]  513 	mov	r5,_curThread
      0004D2 0D               [12]  514 	inc	r5
      0004D3 ED               [12]  515 	mov	a,r5
      0004D4 FE               [12]  516 	mov	r6,a
      0004D5 33               [12]  517 	rlc	a
      0004D6 95 E0            [12]  518 	subb	a,acc
      0004D8 FF               [12]  519 	mov	r7,a
      0004D9                        520 00109$:
      0004D9 8E 34            [24]  521 	mov	_curThread,r6
                                    522 ;	preemptive.c:94: if(bitmap & checkAlive[curThread]) break;
      0004DB E5 34            [12]  523 	mov	a,_curThread
      0004DD 24 3A            [12]  524 	add	a,#_checkAlive
      0004DF F9               [12]  525 	mov	r1,a
      0004E0 E7               [12]  526 	mov	a,@r1
      0004E1 FF               [12]  527 	mov	r7,a
      0004E2 55 35            [12]  528 	anl	a,_bitmap
      0004E4 60 DF            [24]  529 	jz	00103$
                                    530 ;	preemptive.c:96: RESTORESTATE;
      0004E6 E5 34            [12]  531 	mov	a,_curThread
      0004E8 24 30            [12]  532 	add	a,#_sp
      0004EA F9               [12]  533 	mov	r1,a
      0004EB 87 81            [24]  534 	mov	_SP,@r1
      0004ED D0 D0            [24]  535 	pop PSW 
      0004EF D0 83            [24]  536 	pop DPH 
      0004F1 D0 82            [24]  537 	pop DPL 
      0004F3 D0 F0            [24]  538 	pop B 
      0004F5 D0 E0            [24]  539 	pop ACC 
      0004F7 A2 00            [12]  540 	mov	c,_ThreadYield_sloc0_1_0
      0004F9 92 AF            [24]  541 	mov	ea,c
                                    542 ;	preemptive.c:98: }
      0004FB 22               [24]  543 	ret
                                    544 ;------------------------------------------------------------
                                    545 ;Allocation info for local variables in function 'ThreadExit'
                                    546 ;------------------------------------------------------------
                                    547 ;	preemptive.c:100: void ThreadExit(void) {
                                    548 ;	-----------------------------------------
                                    549 ;	 function ThreadExit
                                    550 ;	-----------------------------------------
      0004FC                        551 _ThreadExit:
                                    552 ;	preemptive.c:101: EA=0;
                                    553 ;	assignBit
      0004FC C2 AF            [12]  554 	clr	_EA
                                    555 ;	preemptive.c:112: __endasm; 
      0004FE 74 00            [12]  556 	mov	A, #0
      000500 C0 E0            [24]  557 	push	A
      000502 C0 E0            [24]  558 	push	A
      000504 C0 E0            [24]  559 	push	A
      000506 C0 E0            [24]  560 	push	A
      000508 C0 E0            [24]  561 	push	A
      00050A C0 E0            [24]  562 	push	A
      00050C C0 E0            [24]  563 	push	A
      00050E C0 E0            [24]  564 	push	A
                                    565 ;	preemptive.c:113: sp[curThread] = 0;
      000510 E5 34            [12]  566 	mov	a,_curThread
      000512 24 30            [12]  567 	add	a,#_sp
      000514 F8               [12]  568 	mov	r0,a
      000515 76 00            [12]  569 	mov	@r0,#0x00
                                    570 ;	preemptive.c:114: bitmap &= ~(1<<curThread);
      000517 AF 34            [24]  571 	mov	r7,_curThread
      000519 8F F0            [24]  572 	mov	b,r7
      00051B 05 F0            [12]  573 	inc	b
      00051D 74 01            [12]  574 	mov	a,#0x01
      00051F 80 02            [24]  575 	sjmp	00133$
      000521                        576 00131$:
      000521 25 E0            [12]  577 	add	a,acc
      000523                        578 00133$:
      000523 D5 F0 FB         [24]  579 	djnz	b,00131$
      000526 F4               [12]  580 	cpl	a
      000527 FF               [12]  581 	mov	r7,a
      000528 52 35            [12]  582 	anl	_bitmap,a
                                    583 ;	preemptive.c:115: if(bitmap == 0){
      00052A E5 35            [12]  584 	mov	a,_bitmap
      00052C 70 02            [24]  585 	jnz	00108$
                                    586 ;	preemptive.c:116: while(1){};
      00052E                        587 00102$:
                                    588 ;	preemptive.c:118: do {
      00052E 80 FE            [24]  589 	sjmp	00102$
      000530                        590 00108$:
                                    591 ;	preemptive.c:119: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
      000530 74 03            [12]  592 	mov	a,#0x03
      000532 B5 34 06         [24]  593 	cjne	a,_curThread,00113$
      000535 7E 00            [12]  594 	mov	r6,#0x00
      000537 7F 00            [12]  595 	mov	r7,#0x00
      000539 80 09            [24]  596 	sjmp	00114$
      00053B                        597 00113$:
      00053B AD 34            [24]  598 	mov	r5,_curThread
      00053D 0D               [12]  599 	inc	r5
      00053E ED               [12]  600 	mov	a,r5
      00053F FE               [12]  601 	mov	r6,a
      000540 33               [12]  602 	rlc	a
      000541 95 E0            [12]  603 	subb	a,acc
      000543 FF               [12]  604 	mov	r7,a
      000544                        605 00114$:
      000544 8E 34            [24]  606 	mov	_curThread,r6
                                    607 ;	preemptive.c:120: if(bitmap & checkAlive[curThread]) break;
      000546 E5 34            [12]  608 	mov	a,_curThread
      000548 24 3A            [12]  609 	add	a,#_checkAlive
      00054A F9               [12]  610 	mov	r1,a
      00054B E7               [12]  611 	mov	a,@r1
      00054C FF               [12]  612 	mov	r7,a
      00054D 55 35            [12]  613 	anl	a,_bitmap
      00054F 60 DF            [24]  614 	jz	00108$
                                    615 ;	preemptive.c:122: RESTORESTATE;
      000551 E5 34            [12]  616 	mov	a,_curThread
      000553 24 30            [12]  617 	add	a,#_sp
      000555 F9               [12]  618 	mov	r1,a
      000556 87 81            [24]  619 	mov	_SP,@r1
      000558 D0 D0            [24]  620 	pop PSW 
      00055A D0 83            [24]  621 	pop DPH 
      00055C D0 82            [24]  622 	pop DPL 
      00055E D0 F0            [24]  623 	pop B 
      000560 D0 E0            [24]  624 	pop ACC 
                                    625 ;	preemptive.c:123: EA=1;
                                    626 ;	assignBit
      000562 D2 AF            [12]  627 	setb	_EA
                                    628 ;	preemptive.c:124: }
      000564 22               [24]  629 	ret
                                    630 ;------------------------------------------------------------
                                    631 ;Allocation info for local variables in function 'myTimer0Handler'
                                    632 ;------------------------------------------------------------
                                    633 ;	preemptive.c:126: void myTimer0Handler(void) {
                                    634 ;	-----------------------------------------
                                    635 ;	 function myTimer0Handler
                                    636 ;	-----------------------------------------
      000565                        637 _myTimer0Handler:
                                    638 ;	preemptive.c:127: EA=0;
                                    639 ;	assignBit
      000565 C2 AF            [12]  640 	clr	_EA
                                    641 ;	preemptive.c:129: SAVESTATE;
      000567 C0 E0            [24]  642 	push ACC 
      000569 C0 F0            [24]  643 	push B 
      00056B C0 82            [24]  644 	push DPL 
      00056D C0 83            [24]  645 	push DPH 
      00056F C0 D0            [24]  646 	push PSW 
      000571 E5 34            [12]  647 	mov	a,_curThread
      000573 24 30            [12]  648 	add	a,#_sp
      000575 F8               [12]  649 	mov	r0,a
      000576 A6 81            [24]  650 	mov	@r0,_SP
                                    651 ;	preemptive.c:138: __endasm;
      000578 89 E0            [24]  652 	mov	ACC, r1
      00057A 8A F0            [24]  653 	mov	B, r2
      00057C 8B 82            [24]  654 	mov	DPL, r3
      00057E 8C 83            [24]  655 	mov	DPH, r4
      000580 8D 37            [24]  656 	mov	_i, r5
      000582 8E 38            [24]  657 	mov	_tmp, r6
      000584 8F 39            [24]  658 	mov	_tmp2, r7
                                    659 ;	preemptive.c:139: do {
      000586                        660 00103$:
                                    661 ;	preemptive.c:140: curThread = (curThread == MAXTHREADS-1) ? 0 : curThread+1;
      000586 74 03            [12]  662 	mov	a,#0x03
      000588 B5 34 06         [24]  663 	cjne	a,_curThread,00110$
      00058B 7E 00            [12]  664 	mov	r6,#0x00
      00058D 7F 00            [12]  665 	mov	r7,#0x00
      00058F 80 09            [24]  666 	sjmp	00111$
      000591                        667 00110$:
      000591 AD 34            [24]  668 	mov	r5,_curThread
      000593 0D               [12]  669 	inc	r5
      000594 ED               [12]  670 	mov	a,r5
      000595 FE               [12]  671 	mov	r6,a
      000596 33               [12]  672 	rlc	a
      000597 95 E0            [12]  673 	subb	a,acc
      000599 FF               [12]  674 	mov	r7,a
      00059A                        675 00111$:
      00059A 8E 34            [24]  676 	mov	_curThread,r6
                                    677 ;	preemptive.c:141: if(bitmap & checkAlive[curThread]) break;
      00059C E5 34            [12]  678 	mov	a,_curThread
      00059E 24 3A            [12]  679 	add	a,#_checkAlive
      0005A0 F9               [12]  680 	mov	r1,a
      0005A1 E7               [12]  681 	mov	a,@r1
      0005A2 FF               [12]  682 	mov	r7,a
      0005A3 55 35            [12]  683 	anl	a,_bitmap
      0005A5 60 DF            [24]  684 	jz	00103$
                                    685 ;	preemptive.c:143: cnt++;
      0005A7 E5 3E            [12]  686 	mov	a,_cnt
      0005A9 04               [12]  687 	inc	a
      0005AA F5 3E            [12]  688 	mov	_cnt,a
                                    689 ;	preemptive.c:144: if(cnt==4) {
      0005AC 74 04            [12]  690 	mov	a,#0x04
      0005AE B5 3E 08         [24]  691 	cjne	a,_cnt,00107$
                                    692 ;	preemptive.c:145: cnt = 0;
      0005B1 75 3E 00         [24]  693 	mov	_cnt,#0x00
                                    694 ;	preemptive.c:146: now++;
      0005B4 E5 3F            [12]  695 	mov	a,_now
      0005B6 04               [12]  696 	inc	a
      0005B7 F5 3F            [12]  697 	mov	_now,a
      0005B9                        698 00107$:
                                    699 ;	preemptive.c:156: __endasm;
      0005B9 A9 E0            [24]  700 	mov	r1, ACC
      0005BB AA F0            [24]  701 	mov	r2, B
      0005BD AB 82            [24]  702 	mov	r3, DPL
      0005BF AC 83            [24]  703 	mov	r4, DPH
      0005C1 AD 37            [24]  704 	mov	r5, _i
      0005C3 AE 38            [24]  705 	mov	r6, _tmp
      0005C5 AF 39            [24]  706 	mov	r7, _tmp2
                                    707 ;	preemptive.c:157: RESTORESTATE;
      0005C7 E5 34            [12]  708 	mov	a,_curThread
      0005C9 24 30            [12]  709 	add	a,#_sp
      0005CB F9               [12]  710 	mov	r1,a
      0005CC 87 81            [24]  711 	mov	_SP,@r1
      0005CE D0 D0            [24]  712 	pop PSW 
      0005D0 D0 83            [24]  713 	pop DPH 
      0005D2 D0 82            [24]  714 	pop DPL 
      0005D4 D0 F0            [24]  715 	pop B 
      0005D6 D0 E0            [24]  716 	pop ACC 
                                    717 ;	preemptive.c:158: EA=1;
                                    718 ;	assignBit
      0005D8 D2 AF            [12]  719 	setb	_EA
                                    720 ;	preemptive.c:161: __endasm;
      0005DA 32               [24]  721 	reti
                                    722 ;	preemptive.c:163: }
      0005DB 22               [24]  723 	ret
                                    724 ;------------------------------------------------------------
                                    725 ;Allocation info for local variables in function 'delay'
                                    726 ;------------------------------------------------------------
                                    727 ;n                         Allocated to registers r7 
                                    728 ;------------------------------------------------------------
                                    729 ;	preemptive.c:165: void delay(unsigned char n) {
                                    730 ;	-----------------------------------------
                                    731 ;	 function delay
                                    732 ;	-----------------------------------------
      0005DC                        733 _delay:
      0005DC AF 82            [24]  734 	mov	r7,dpl
                                    735 ;	preemptive.c:166: delayid[curThread] = now + n;
      0005DE E5 34            [12]  736 	mov	a,_curThread
      0005E0 24 2C            [12]  737 	add	a,#_delayid
      0005E2 F9               [12]  738 	mov	r1,a
      0005E3 EF               [12]  739 	mov	a,r7
      0005E4 25 3F            [12]  740 	add	a,_now
      0005E6 F7               [12]  741 	mov	@r1,a
                                    742 ;	preemptive.c:167: while(now != delayid[curThread]);
      0005E7                        743 00101$:
      0005E7 E5 34            [12]  744 	mov	a,_curThread
      0005E9 24 2C            [12]  745 	add	a,#_delayid
      0005EB F9               [12]  746 	mov	r1,a
      0005EC E7               [12]  747 	mov	a,@r1
      0005ED B5 3F F7         [24]  748 	cjne	a,_now,00101$
                                    749 ;	preemptive.c:168: delayid[curThread] = 0;
      0005F0 E5 34            [12]  750 	mov	a,_curThread
      0005F2 24 2C            [12]  751 	add	a,#_delayid
      0005F4 F8               [12]  752 	mov	r0,a
      0005F5 76 00            [12]  753 	mov	@r0,#0x00
                                    754 ;	preemptive.c:169: }
      0005F7 22               [24]  755 	ret
                                    756 	.area CSEG    (CODE)
                                    757 	.area CONST   (CODE)
                                    758 	.area XINIT   (CODE)
                                    759 	.area CABS    (ABS,CODE)
