;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14683 (MINGW64)
;--------------------------------------------------------
	.module wiznet
	.optsdcc -mmcs51 --model-large
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _parseInp
	.globl _externalInt80
	.globl _externalInt10
	.globl _enableSocketInt
	.globl _handleDat
	.globl _sendResponse
	.globl _updateSn_RX_WR
	.globl _updateSn_RX_RD
	.globl _printpacketadd
	.globl _PrintNetworkInfo
	.globl _transmitString
	.globl _TransmitByte
	.globl _String
	.globl _Transmit_data
	.globl _UART_Init
	.globl _configNetwork
	.globl _readW55000
	.globl _resetArrays
	.globl _readInt
	.globl _readByte
	.globl _sockReceive0
	.globl _openSocket
	.globl _sendByte
	.globl _writeToW5500
	.globl _setOM
	.globl _setWrite
	.globl _setRead
	.globl _initPhase
	.globl _delay
	.globl _IntToStr
	.globl _ByteToHex
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
	.globl _dataReceived
	.globl _udp
	.globl _polling
	.globl _timeout
	.globl _sendFlag
	.globl _strreceived
	.globl _bufIndex
	.globl _tmpsubnet
	.globl _tmpmac
	.globl _tmpip
	.globl _tmpgateway
	.globl _port
	.globl _gateway
	.globl _subnet
	.globl _mac
	.globl _ip
	.globl _RTU
	.globl _parseInp_PARM_3
	.globl _parseInp_PARM_2
	.globl _sendResponse_PARM_2
	.globl _readW55000_PARM_3
	.globl _readW55000_PARM_2
	.globl _resetArrays_PARM_4
	.globl _resetArrays_PARM_3
	.globl _resetArrays_PARM_2
	.globl _readInt_PARM_2
	.globl _readByte_PARM_3
	.globl _readByte_PARM_2
	.globl _sockReceive0_PARM_2
	.globl _openSocket_PARM_3
	.globl _openSocket_PARM_2
	.globl _sendByte_PARM_4
	.globl _sendByte_PARM_3
	.globl _sendByte_PARM_2
	.globl _writeToW5500_PARM_2
	.globl _initPhase_PARM_2
	.globl _IntToStr_PARM_2
	.globl _ByteToHex_PARM_2
	.globl _bufferM
	.globl _message
	.globl _get_size
	.globl _peer_port
	.globl _peer_ip
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
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_IntToStr_sloc0_1_0:
	.ds 3
_writeToW5500_sloc0_1_0:
	.ds 3
_writeToW5500_sloc1_1_0:
	.ds 3
_readByte_sloc0_1_0:
	.ds 1
_readByte_sloc1_1_0:
	.ds 1
_readByte_sloc2_1_0:
	.ds 1
_sendResponse_sloc0_1_0:
	.ds 2
_parseInp_sloc0_1_0:
	.ds 1
_parseInp_sloc1_1_0:
	.ds 2
_parseInp_sloc2_1_0:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
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
_ByteToHex_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_peer_ip::
	.ds 4
_peer_port::
	.ds 2
_get_size::
	.ds 2
_message::
	.ds 24
_bufferM::
	.ds 25
_ByteToHex_PARM_2:
	.ds 3
_ByteToHex_byte_10000_1:
	.ds 1
_IntToStr_PARM_2:
	.ds 3
_IntToStr_num_10000_3:
	.ds 2
_IntToStr_temp_10000_4:
	.ds 6
_IntToStr_i_10000_4:
	.ds 2
_initPhase_PARM_2:
	.ds 1
_initPhase_addr_10000_11:
	.ds 2
_initPhase_mask0_10001_13:
	.ds 2
_initPhase_mask1_10002_18:
	.ds 1
_writeToW5500_PARM_2:
	.ds 2
_writeToW5500_data_10000_30:
	.ds 3
_writeToW5500_mask_30000_33:
	.ds 2
_sendByte_PARM_2:
	.ds 1
_sendByte_PARM_3:
	.ds 3
_sendByte_PARM_4:
	.ds 2
_sendByte_addr_10000_38:
	.ds 2
_openSocket_PARM_2:
	.ds 1
_openSocket_PARM_3:
	.ds 1
_openSocket_addr_10000_40:
	.ds 2
_openSocket_temp2_10001_42:
	.ds 1
_sockReceive0_PARM_2:
	.ds 1
_sockReceive0_addr_10000_43:
	.ds 2
_sockReceive0_data_10001_45:
	.ds 2
_sockReceive0_mask_10001_45:
	.ds 2
_readByte_PARM_2:
	.ds 1
_readByte_PARM_3:
	.ds 2
_readByte_addr_10000_49:
	.ds 2
_readByte_data_30000_52:
	.ds 1
_readInt_PARM_2:
	.ds 1
_readInt_addr_10000_61:
	.ds 2
_readInt_data_10001_63:
	.ds 1
_resetArrays_PARM_2:
	.ds 3
_resetArrays_PARM_3:
	.ds 3
_resetArrays_PARM_4:
	.ds 3
_resetArrays_peer_ip_10000_68:
	.ds 3
_readW55000_PARM_2:
	.ds 1
_readW55000_PARM_3:
	.ds 2
_readW55000_addr_10000_78:
	.ds 2
_readW55000_dataByte_30002_83:
	.ds 1
_Transmit_data_tx_data_10000_94:
	.ds 1
_String_str_10000_96:
	.ds 3
_TransmitByte_data_10000_100:
	.ds 1
_transmitString_string_10000_102:
	.ds 3
_PrintNetworkInfo_buffer_10000_105:
	.ds 6
_printpacketadd_buffer_10000_114:
	.ds 6
_printpacketadd_msgChar_40002_121:
	.ds 2
_updateSn_RX_RD_newPtr_10000_122:
	.ds 2
_updateSn_RX_RD_test_10000_123:
	.ds 2
_updateSn_RX_WR_newPtr_10000_124:
	.ds 2
_updateSn_RX_WR_test_10000_125:
	.ds 2
_sendResponse_PARM_2:
	.ds 2
_sendResponse_message_10000_126:
	.ds 3
_sendResponse_send_command_10002_131:
	.ds 1
_handleDat_command_10003_136:
	.ds 1
_enableSocketInt_interruptMask_10000_140:
	.ds 1
_enableSocketInt_interruptMask0_10000_140:
	.ds 1
_enableSocketInt_intmask_10000_140:
	.ds 1
_externalInt10_clearInt_20001_143:
	.ds 1
_externalInt10_clearInt_20000_144:
	.ds 1
_externalInt80_receivedChar_20000_147:
	.ds 1
_parseInp_PARM_2:
	.ds 3
_parseInp_PARM_3:
	.ds 2
_parseInp_arrbuff_10000_150:
	.ds 3
_parseInp_num_10000_151:
	.ds 2
_main_command0_10001_157:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_RTU::
	.ds 1
_ip::
	.ds 4
_mac::
	.ds 6
_subnet::
	.ds 4
_gateway::
	.ds 4
_port::
	.ds 2
_tmpgateway::
	.ds 4
_tmpip::
	.ds 4
_tmpmac::
	.ds 6
_tmpsubnet::
	.ds 4
_bufIndex::
	.ds 1
_strreceived::
	.ds 1
_sendFlag::
	.ds 1
_timeout::
	.ds 2
_polling::
	.ds 1
_udp::
	.ds 1
_dataReceived::
	.ds 1
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
	ljmp	_externalInt10
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_externalInt80
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
;Allocation info for local variables in function 'ByteToHex'
;------------------------------------------------------------
;str                       Allocated with name '_ByteToHex_PARM_2'
;byte                      Allocated with name '_ByteToHex_byte_10000_1'
;highNibble                Allocated with name '_ByteToHex_highNibble_10000_2'
;lowNibble                 Allocated with name '_ByteToHex_lowNibble_10000_2'
;------------------------------------------------------------
;	wiznet.c:40: void ByteToHex(unsigned char byte, char* str) {
;	-----------------------------------------
;	 function ByteToHex
;	-----------------------------------------
_ByteToHex:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	a,dpl
	mov	dptr,#_ByteToHex_byte_10000_1
	movx	@dptr,a
;	wiznet.c:41: unsigned char highNibble = (byte >> 4) & 0x0F;  // Extract the high nibble
	movx	a,@dptr
	mov	r7,a
	swap	a
	anl	a,#0x0f
	mov	r6,a
	anl	ar6,#0x0f
;	wiznet.c:42: unsigned char lowNibble = byte & 0x0F;          // Extract the low nibble
	anl	ar7,#0x0f
;	wiznet.c:45: str[0] = (highNibble <= 9) ? ('0' + highNibble) : ('A' + highNibble - 10);
	mov	dptr,#_ByteToHex_PARM_2
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r6
	add	a,#0xff - 0x09
	mov	_ByteToHex_sloc0_1_0,c
	jc	00103$
	mov	ar2,r6
	mov	a,#0x30
	add	a, r2
	mov	r2,a
	sjmp	00104$
00103$:
	mov	a,#0x37
	add	a, r6
	mov	r2,a
00104$:
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r2
	lcall	__gptrput
;	wiznet.c:48: str[1] = (lowNibble <= 9) ? ('0' + lowNibble) : ('A' + lowNibble - 10);
	mov	a,#0x01
	add	a, r3
	mov	r1,a
	clr	a
	addc	a, r4
	mov	r2,a
	mov	ar6,r5
	mov	a,r7
	add	a,#0xff - 0x09
	mov	_ByteToHex_sloc0_1_0,c
	jc	00105$
	mov	ar0,r7
	mov	a,#0x30
	add	a, r0
	mov	r0,a
	sjmp	00106$
00105$:
	mov	a,#0x37
	add	a, r7
	mov	r0,a
00106$:
	mov	dpl,r1
	mov	dph,r2
	mov	b,r6
	mov	a,r0
	lcall	__gptrput
;	wiznet.c:50: str[2] = '\0';  // Null-terminate the string
	mov	a,#0x02
	add	a, r3
	mov	r3,a
	clr	a
	addc	a, r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
;	wiznet.c:51: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'IntToStr'
;------------------------------------------------------------
;sloc0                     Allocated with name '_IntToStr_sloc0_1_0'
;str                       Allocated with name '_IntToStr_PARM_2'
;num                       Allocated with name '_IntToStr_num_10000_3'
;temp                      Allocated with name '_IntToStr_temp_10000_4'
;i                         Allocated with name '_IntToStr_i_10000_4'
;j                         Allocated with name '_IntToStr_j_10001_8'
;------------------------------------------------------------
;	wiznet.c:55: void IntToStr(unsigned int num, unsigned char *str)
;	-----------------------------------------
;	 function IntToStr
;	-----------------------------------------
_IntToStr:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_IntToStr_num_10000_3
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:59: if (num == 0)
	mov	dptr,#_IntToStr_num_10000_3
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00114$
;	wiznet.c:61: str[i++] == '0';
	mov	dptr,#_IntToStr_i_10000_4
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:65: while (num > 0)
	sjmp	00116$
00114$:
	mov	r6,#0x00
	mov	r7,#0x00
00101$:
	mov	dptr,#_IntToStr_num_10000_3
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	orl	a,r4
	jz	00117$
;	wiznet.c:67: temp[i++] = (num % 10) + '0';
	mov	a,r6
	add	a, #_IntToStr_temp_10000_4
	mov	r2,a
	mov	a,r7
	addc	a, #(_IntToStr_temp_10000_4 >> 8)
	mov	r3,a
	inc	r6
	cjne	r6,#0x00,00146$
	inc	r7
00146$:
	mov	dptr,#__moduint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	__moduint
	mov	r0, dpl
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	mov	a,#0x30
	add	a, r0
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	wiznet.c:68: num /= 10;
	mov	dptr,#__divuint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	lcall	__divuint
	mov	a, dpl
	mov	b, dph
	pop	ar6
	pop	ar7
	mov	dptr,#_IntToStr_num_10000_3
	movx	@dptr,a
	mov	a,b
	inc	dptr
	movx	@dptr,a
	sjmp	00101$
00117$:
	mov	dptr,#_IntToStr_i_10000_4
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:72: while (i > 0)
00116$:
	mov	dptr,#_IntToStr_PARM_2
	movx	a,@dptr
	mov	_IntToStr_sloc0_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_IntToStr_sloc0_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_IntToStr_sloc0_1_0 + 2),a
	mov	r3,#0x00
	mov	r4,#0x00
	mov	dptr,#_IntToStr_i_10000_4
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
00107$:
	clr	c
	clr	a
	subb	a,r1
	mov	a,#(0x00 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00109$
;	wiznet.c:74: str[j++] = temp[--i];
	mov	a,r3
	add	a, _IntToStr_sloc0_1_0
	mov	r0,a
	mov	a,r4
	addc	a, (_IntToStr_sloc0_1_0 + 1)
	mov	r6,a
	mov	r7,(_IntToStr_sloc0_1_0 + 2)
	inc	r3
	cjne	r3,#0x00,00148$
	inc	r4
00148$:
	dec	r1
	cjne	r1,#0xff,00149$
	dec	r2
00149$:
	mov	a,r1
	add	a, #_IntToStr_temp_10000_4
	mov	dpl,a
	mov	a,r2
	addc	a, #(_IntToStr_temp_10000_4 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r0
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
	sjmp	00107$
00109$:
;	wiznet.c:76: str[j] = '\0';
	mov	a,r3
	add	a, _IntToStr_sloc0_1_0
	mov	r3,a
	mov	a,r4
	addc	a, (_IntToStr_sloc0_1_0 + 1)
	mov	r4,a
	mov	r7,(_IntToStr_sloc0_1_0 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	clr	a
;	wiznet.c:77: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;	wiznet.c:79: void delay()
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
;	wiznet.c:81: return;
;	wiznet.c:82: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initPhase'
;------------------------------------------------------------
;bsb                       Allocated with name '_initPhase_PARM_2'
;addr                      Allocated with name '_initPhase_addr_10000_11'
;mask0                     Allocated with name '_initPhase_mask0_10001_13'
;pos                       Allocated with name '_initPhase_pos_20001_14'
;mask1                     Allocated with name '_initPhase_mask1_10002_18'
;pos0                      Allocated with name '_initPhase_pos0_20002_19'
;------------------------------------------------------------
;	wiznet.c:95: void initPhase(unsigned int addr, unsigned char bsb)
;	-----------------------------------------
;	 function initPhase
;	-----------------------------------------
_initPhase:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_initPhase_addr_10000_11
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:97: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:98: delay();
	lcall	_delay
;	wiznet.c:99: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:100: delay();
	lcall	_delay
;	wiznet.c:101: W5500_SCS = 0;
;	assignBit
	clr	_P1_0
;	wiznet.c:102: delay();
	lcall	_delay
;	wiznet.c:103: unsigned int mask0 = 0x8000;
	mov	dptr,#_initPhase_mask0_10001_13
	clr	a
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
;	wiznet.c:104: for (int pos = 0; pos < 16; pos++)
	mov	dptr,#_initPhase_addr_10000_11
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r4,#0x00
	mov	r5,#0x00
00113$:
	clr	c
	mov	a,r4
	subb	a,#0x10
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00104$
;	wiznet.c:106: delay();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_delay
;	wiznet.c:107: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:108: delay();
	lcall	_delay
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:109: if (addr & mask0)
	mov	dptr,#_initPhase_mask0_10001_13
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,r6
	anl	ar2,a
	mov	a,r7
	anl	ar3,a
	mov	a,r2
	orl	a,r3
	jz	00102$
;	wiznet.c:111: W5500_MOSI = 1;
;	assignBit
	setb	_P1_3
	sjmp	00103$
00102$:
;	wiznet.c:115: W5500_MOSI = 0;
;	assignBit
	clr	_P1_3
00103$:
;	wiznet.c:117: mask0 >>= 1;
	mov	dptr,#_initPhase_mask0_10001_13
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	clr	c
	rrc	a
	xch	a,r2
	rrc	a
	xch	a,r2
	mov	r3,a
	mov	dptr,#_initPhase_mask0_10001_13
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
;	wiznet.c:118: delay();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_delay
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:119: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:104: for (int pos = 0; pos < 16; pos++)
	inc	r4
	cjne	r4,#0x00,00113$
	inc	r5
	sjmp	00113$
00104$:
;	wiznet.c:121: unsigned char mask1 = 0x80;
	mov	dptr,#_initPhase_mask1_10002_18
	mov	a,#0x80
	movx	@dptr,a
;	wiznet.c:122: for (int pos0 = 0; pos0 < 8; pos0++)
	mov	dptr,#_initPhase_PARM_2
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
00116$:
	cjne	r6,#0x08,00167$
00167$:
	jnc	00111$
;	wiznet.c:124: if (pos0 >= 3)
	cjne	r6,#0x03,00169$
00169$:
	jc	00109$
;	wiznet.c:126: delay();
	push	ar7
	push	ar6
	lcall	_delay
;	wiznet.c:127: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:128: delay();
	lcall	_delay
	pop	ar6
	pop	ar7
;	wiznet.c:129: if (bsb & mask1)
	mov	dptr,#_initPhase_mask1_10002_18
	movx	a,@dptr
	anl	a,r7
	jz	00106$
;	wiznet.c:131: W5500_MOSI = 1;
;	assignBit
	setb	_P1_3
	sjmp	00107$
00106$:
;	wiznet.c:135: W5500_MOSI = 0;
;	assignBit
	clr	_P1_3
00107$:
;	wiznet.c:138: delay();
	push	ar7
	push	ar6
	lcall	_delay
	pop	ar6
	pop	ar7
;	wiznet.c:139: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:140: mask1 >>= 1;
	mov	dptr,#_initPhase_mask1_10002_18
	movx	a,@dptr
	clr	c
	rrc	a
	movx	@dptr,a
	sjmp	00117$
00109$:
;	wiznet.c:144: mask1 >>= 1;
	mov	dptr,#_initPhase_mask1_10002_18
	movx	a,@dptr
	clr	c
	rrc	a
	movx	@dptr,a
00117$:
;	wiznet.c:122: for (int pos0 = 0; pos0 < 8; pos0++)
	inc	r6
	sjmp	00116$
00111$:
;	wiznet.c:148: delay();
	lcall	_delay
;	wiznet.c:149: delay();
;	wiznet.c:150: }
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'setRead'
;------------------------------------------------------------
;	wiznet.c:151: void setRead()
;	-----------------------------------------
;	 function setRead
;	-----------------------------------------
_setRead:
;	wiznet.c:153: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:154: delay();
	lcall	_delay
;	wiznet.c:155: W5500_MOSI = 0;
;	assignBit
	clr	_P1_3
;	wiznet.c:156: delay();
	lcall	_delay
;	wiznet.c:157: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:158: delay();
;	wiznet.c:159: }
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'setWrite'
;------------------------------------------------------------
;	wiznet.c:160: void setWrite()
;	-----------------------------------------
;	 function setWrite
;	-----------------------------------------
_setWrite:
;	wiznet.c:162: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:163: delay();
	lcall	_delay
;	wiznet.c:164: W5500_MOSI = 1;
;	assignBit
	setb	_P1_3
;	wiznet.c:165: delay();
	lcall	_delay
;	wiznet.c:166: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:167: delay();
;	wiznet.c:168: }
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'setOM'
;------------------------------------------------------------
;pos2                      Allocated with name '_setOM_pos2_20000_28'
;------------------------------------------------------------
;	wiznet.c:169: void setOM()
;	-----------------------------------------
;	 function setOM
;	-----------------------------------------
_setOM:
;	wiznet.c:171: for (int pos2 = 0; pos2 < 2; pos2++)
	mov	r7,#0x00
00103$:
	cjne	r7,#0x02,00120$
00120$:
	jnc	00105$
;	wiznet.c:173: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:174: delay();
	push	ar7
	lcall	_delay
;	wiznet.c:175: W5500_MOSI = 0;
;	assignBit
	clr	_P1_3
;	wiznet.c:176: delay();
	lcall	_delay
;	wiznet.c:177: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:178: delay();
	lcall	_delay
	pop	ar7
;	wiznet.c:171: for (int pos2 = 0; pos2 < 2; pos2++)
	inc	r7
	sjmp	00103$
00105$:
;	wiznet.c:180: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'writeToW5500'
;------------------------------------------------------------
;sloc0                     Allocated with name '_writeToW5500_sloc0_1_0'
;sloc1                     Allocated with name '_writeToW5500_sloc1_1_0'
;len                       Allocated with name '_writeToW5500_PARM_2'
;data                      Allocated with name '_writeToW5500_data_10000_30'
;i                         Allocated with name '_writeToW5500_i_20000_32'
;mask                      Allocated with name '_writeToW5500_mask_30000_33'
;x                         Allocated with name '_writeToW5500_x_40000_34'
;------------------------------------------------------------
;	wiznet.c:182: void writeToW5500(unsigned char *data, unsigned int len){
;	-----------------------------------------
;	 function writeToW5500
;	-----------------------------------------
_writeToW5500:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_writeToW5500_data_10000_30
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:183: for (int i = 0; i < len; i++)
	mov	dptr,#_writeToW5500_data_10000_30
	movx	a,@dptr
	mov	_writeToW5500_sloc1_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_writeToW5500_sloc1_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_writeToW5500_sloc1_1_0 + 2),a
	mov	dptr,#_writeToW5500_PARM_2
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r1,#0x00
	mov	r2,#0x00
00110$:
	mov	ar0,r1
	mov	ar7,r2
	clr	c
	mov	a,r0
	subb	a,r3
	mov	a,r7
	subb	a,r4
	jc	00146$
	ret
00146$:
;	wiznet.c:185: unsigned int mask = 0x80;
	mov	dptr,#_writeToW5500_mask_30000_33
	mov	a,#0x80
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:186: for (int x = 0; x < 8; x++)
	mov	a,r1
	add	a, _writeToW5500_sloc1_1_0
	mov	_writeToW5500_sloc0_1_0,a
	mov	a,r2
	addc	a, (_writeToW5500_sloc1_1_0 + 1)
	mov	(_writeToW5500_sloc0_1_0 + 1),a
	mov	(_writeToW5500_sloc0_1_0 + 2),(_writeToW5500_sloc1_1_0 + 2)
	mov	r0,#0x00
00107$:
	cjne	r0,#0x08,00147$
00147$:
	jc	00148$
	ljmp	00111$
00148$:
;	wiznet.c:188: delay();
	push	ar3
	push	ar4
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	_delay
;	wiznet.c:189: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:190: delay();
	lcall	_delay
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
;	wiznet.c:191: if (data[i] & mask)
	mov	dpl,_writeToW5500_sloc0_1_0
	mov	dph,(_writeToW5500_sloc0_1_0 + 1)
	mov	b,(_writeToW5500_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r4,a
	mov	dptr,#_writeToW5500_mask_30000_33
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,r4
	anl	ar3,a
	mov	a,r6
	anl	ar7,a
	mov	a,r3
	orl	a,r7
	pop	ar4
	pop	ar3
	jz	00102$
;	wiznet.c:193: W5500_MOSI = 1;
;	assignBit
	setb	_P1_3
	sjmp	00103$
00102$:
;	wiznet.c:197: W5500_MOSI = 0;
;	assignBit
	clr	_P1_3
00103$:
;	wiznet.c:199: mask >>= 1;
	mov	dptr,#_writeToW5500_mask_30000_33
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	clr	c
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
	mov	dptr,#_writeToW5500_mask_30000_33
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:200: delay();
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	_delay
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
;	wiznet.c:201: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:186: for (int x = 0; x < 8; x++)
	inc	r0
	ljmp	00107$
00111$:
;	wiznet.c:183: for (int i = 0; i < len; i++)
	inc	r1
	cjne	r1,#0x00,00150$
	inc	r2
00150$:
;	wiznet.c:204: }
	ljmp	00110$
;------------------------------------------------------------
;Allocation info for local variables in function 'sendByte'
;------------------------------------------------------------
;bsb                       Allocated with name '_sendByte_PARM_2'
;data                      Allocated with name '_sendByte_PARM_3'
;len                       Allocated with name '_sendByte_PARM_4'
;addr                      Allocated with name '_sendByte_addr_10000_38'
;------------------------------------------------------------
;	wiznet.c:209: void sendByte(unsigned int addr, unsigned char bsb, unsigned char *data, unsigned int len)
;	-----------------------------------------
;	 function sendByte
;	-----------------------------------------
_sendByte:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_sendByte_addr_10000_38
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:211: initPhase(addr, bsb);
	mov	dptr,#_sendByte_addr_10000_38
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_sendByte_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	lcall	_initPhase
;	wiznet.c:212: delay();
	lcall	_delay
;	wiznet.c:213: setWrite();
	lcall	_setWrite
;	wiznet.c:214: delay();
	lcall	_delay
;	wiznet.c:215: setOM();
	lcall	_setOM
;	wiznet.c:216: delay();
	lcall	_delay
;	wiznet.c:218: writeToW5500(data, len);
	mov	dptr,#_sendByte_PARM_3
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_sendByte_PARM_4
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_writeToW5500_PARM_2
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r6
	mov	b, r7
	lcall	_writeToW5500
;	wiznet.c:219: delay();
	lcall	_delay
;	wiznet.c:220: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:221: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:222: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'openSocket'
;------------------------------------------------------------
;bsb                       Allocated with name '_openSocket_PARM_2'
;data                      Allocated with name '_openSocket_PARM_3'
;addr                      Allocated with name '_openSocket_addr_10000_40'
;temp2                     Allocated with name '_openSocket_temp2_10001_42'
;------------------------------------------------------------
;	wiznet.c:226: void openSocket(unsigned int addr, unsigned char bsb, unsigned char data)
;	-----------------------------------------
;	 function openSocket
;	-----------------------------------------
_openSocket:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_openSocket_addr_10000_40
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:228: initPhase(addr, bsb);
	mov	dptr,#_openSocket_addr_10000_40
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_openSocket_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	lcall	_initPhase
;	wiznet.c:229: delay();
	lcall	_delay
;	wiznet.c:230: setWrite();
	lcall	_setWrite
;	wiznet.c:231: delay();
	lcall	_delay
;	wiznet.c:232: setOM();
	lcall	_setOM
;	wiznet.c:233: delay();
	lcall	_delay
;	wiznet.c:235: unsigned char temp2[1] = {data};
	mov	dptr,#_openSocket_PARM_3
	movx	a,@dptr
	mov	dptr,#_openSocket_temp2_10001_42
	movx	@dptr,a
;	wiznet.c:236: writeToW5500(temp2, 1);
	mov	dptr,#_writeToW5500_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_openSocket_temp2_10001_42
	mov	b,a
	lcall	_writeToW5500
;	wiznet.c:237: delay();
	lcall	_delay
;	wiznet.c:238: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:239: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:240: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sockReceive0'
;------------------------------------------------------------
;bsb                       Allocated with name '_sockReceive0_PARM_2'
;addr                      Allocated with name '_sockReceive0_addr_10000_43'
;data                      Allocated with name '_sockReceive0_data_10001_45'
;mask                      Allocated with name '_sockReceive0_mask_10001_45'
;i                         Allocated with name '_sockReceive0_i_10001_45'
;------------------------------------------------------------
;	wiznet.c:241: unsigned char sockReceive0(unsigned int addr, unsigned char bsb)
;	-----------------------------------------
;	 function sockReceive0
;	-----------------------------------------
_sockReceive0:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_sockReceive0_addr_10000_43
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:243: initPhase(addr, bsb);
	mov	dptr,#_sockReceive0_addr_10000_43
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_sockReceive0_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	lcall	_initPhase
;	wiznet.c:244: setRead();
	lcall	_setRead
;	wiznet.c:245: setOM();
	lcall	_setOM
;	wiznet.c:246: unsigned int data = 0;
	mov	dptr,#_sockReceive0_data_10001_45
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:247: unsigned int mask = 0x80;
	mov	dptr,#_sockReceive0_mask_10001_45
	mov	a,#0x80
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:251: for (i = 0; i < 8; i++)
	mov	r7,a
00104$:
;	wiznet.c:253: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:254: delay();
	push	ar7
	lcall	_delay
	pop	ar7
;	wiznet.c:256: if (W5500_MISO)
	jnb	_P1_2,00102$
;	wiznet.c:258: data |= mask;
	mov	dptr,#_sockReceive0_mask_10001_45
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_sockReceive0_data_10001_45
	movx	a,@dptr
	orl	a,r5
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	orl	a,r6
	movx	@dptr,a
00102$:
;	wiznet.c:261: mask >>= 1;
	mov	dptr,#_sockReceive0_mask_10001_45
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	clr	c
	rrc	a
	xch	a,r5
	rrc	a
	xch	a,r5
	mov	r6,a
	mov	dptr,#_sockReceive0_mask_10001_45
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	wiznet.c:263: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:264: delay();
	push	ar7
	lcall	_delay
	pop	ar7
;	wiznet.c:251: for (i = 0; i < 8; i++)
	inc	r7
	cjne	r7,#0x08,00128$
00128$:
	jc	00104$
;	wiznet.c:268: delay();
	lcall	_delay
;	wiznet.c:269: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:270: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:271: return data;
	mov	dptr,#_sockReceive0_data_10001_45
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl, r6
;	wiznet.c:272: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readByte'
;------------------------------------------------------------
;sloc0                     Allocated with name '_readByte_sloc0_1_0'
;sloc1                     Allocated with name '_readByte_sloc1_1_0'
;sloc2                     Allocated with name '_readByte_sloc2_1_0'
;bsb                       Allocated with name '_readByte_PARM_2'
;len                       Allocated with name '_readByte_PARM_3'
;addr                      Allocated with name '_readByte_addr_10000_49'
;j                         Allocated with name '_readByte_j_20000_51'
;i                         Allocated with name '_readByte_i_30000_52'
;data                      Allocated with name '_readByte_data_30000_52'
;------------------------------------------------------------
;	wiznet.c:348: void readByte(unsigned int addr, unsigned char bsb, unsigned int len)
;	-----------------------------------------
;	 function readByte
;	-----------------------------------------
_readByte:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_readByte_addr_10000_49
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:350: initPhase(addr, bsb);
	mov	dptr,#_readByte_addr_10000_49
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_readByte_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	push	ar7
	push	ar6
	lcall	_initPhase
;	wiznet.c:351: setRead();
	lcall	_setRead
;	wiznet.c:352: setOM();
	lcall	_setOM
	pop	ar6
	pop	ar7
;	wiznet.c:355: for (int j = 0; j < len; j++)
	clr	a
	cjne	r6,#0x0f,00187$
	cjne	r7,#0x00,00187$
	inc	a
00187$:
	mov	r5,a
	clr	a
	cjne	r6,#0x09,00189$
	cjne	r7,#0x00,00189$
	inc	a
00189$:
	mov	_readByte_sloc1_1_0,a
	clr	a
	cjne	r6,#0x05,00191$
	cjne	r7,#0x00,00191$
	inc	a
00191$:
	mov	_readByte_sloc0_1_0,a
	cjne	r6,#0x01,00193$
	cjne	r7,#0x00,00193$
	mov	a,r6
	sjmp	00194$
00193$:
	clr	a
00194$:
	mov	_readByte_sloc2_1_0,a
	mov	dptr,#_readByte_PARM_3
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	r0,#0x00
	mov	r1,#0x00
00121$:
	mov	ar3,r0
	mov	ar7,r1
	clr	c
	mov	a,r3
	subb	a,r2
	mov	a,r7
	subb	a,r6
	jc	00195$
	ljmp	00117$
00195$:
;	wiznet.c:357: unsigned char i, data = 0;
	mov	dptr,#_readByte_data_30000_52
	clr	a
	movx	@dptr,a
;	wiznet.c:358: for (i = 0; i < 8; i++)
	mov	r3,a
00118$:
;	wiznet.c:360: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:361: delay();
	push	ar6
	push	ar5
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	_delay
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar5
	pop	ar6
;	wiznet.c:363: if (W5500_MISO)
	jnb	_P1_2,00102$
;	wiznet.c:365: data |= 1;
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
00102$:
;	wiznet.c:367: if (i < 7)
	cjne	r3,#0x07,00197$
00197$:
	jnc	00104$
;	wiznet.c:369: data <<= 1;
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	add	a,acc
	movx	@dptr,a
;	wiznet.c:394: W5500_SCS = 1;
;	wiznet.c:369: data <<= 1;
00104$:
;	wiznet.c:371: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:372: delay();
	push	ar6
	push	ar5
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	_delay
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar5
	pop	ar6
;	wiznet.c:358: for (i = 0; i < 8; i++)
	inc	r3
	cjne	r3,#0x08,00199$
00199$:
	jc	00118$
;	wiznet.c:374: if (addr == 0x000F)
	mov	a,r5
	jz	00115$
;	wiznet.c:376: tmpip[j] = data;
	mov	a,r0
	add	a, #_tmpip
	mov	r3,a
	mov	a,r1
	addc	a, #(_tmpip >> 8)
	mov	r7,a
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r7
	movx	@dptr,a
	sjmp	00122$
00115$:
;	wiznet.c:378: else if (addr == 0x0009)
	mov	a,_readByte_sloc1_1_0
	jz	00112$
;	wiznet.c:380: tmpmac[j] = data;
	mov	a,r0
	add	a, #_tmpmac
	mov	r3,a
	mov	a,r1
	addc	a, #(_tmpmac >> 8)
	mov	r4,a
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
	sjmp	00122$
00112$:
;	wiznet.c:382: else if (addr == 0x0005)
	mov	a,_readByte_sloc0_1_0
	jz	00109$
;	wiznet.c:384: tmpsubnet[j] = data;
	mov	a,r0
	add	a, #_tmpsubnet
	mov	r3,a
	mov	a,r1
	addc	a, #(_tmpsubnet >> 8)
	mov	r4,a
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
	sjmp	00122$
00109$:
;	wiznet.c:386: else if(addr == 0x0001){
	mov	a,_readByte_sloc2_1_0
	jz	00122$
;	wiznet.c:387: tmpgateway[j] = data;
	mov	a,r0
	add	a, #_tmpgateway
	mov	r3,a
	mov	a,r1
	addc	a, #(_tmpgateway >> 8)
	mov	r4,a
	mov	dptr,#_readByte_data_30000_52
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
00122$:
;	wiznet.c:355: for (int j = 0; j < len; j++)
	inc	r0
	cjne	r0,#0x00,00205$
	inc	r1
00205$:
	ljmp	00121$
00117$:
;	wiznet.c:392: delay();
	lcall	_delay
;	wiznet.c:393: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:394: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:395: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readInt'
;------------------------------------------------------------
;bsb                       Allocated with name '_readInt_PARM_2'
;addr                      Allocated with name '_readInt_addr_10000_61'
;i                         Allocated with name '_readInt_i_10001_63'
;data                      Allocated with name '_readInt_data_10001_63'
;data01                    Allocated with name '_readInt_data01_10002_67'
;data1                     Allocated with name '_readInt_data1_10002_67'
;------------------------------------------------------------
;	wiznet.c:397: unsigned char readInt(unsigned int addr, unsigned char bsb)
;	-----------------------------------------
;	 function readInt
;	-----------------------------------------
_readInt:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_readInt_addr_10000_61
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:399: initPhase(addr, bsb);
	mov	dptr,#_readInt_addr_10000_61
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_readInt_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	lcall	_initPhase
;	wiznet.c:400: setRead();
	lcall	_setRead
;	wiznet.c:401: setOM();
	lcall	_setOM
;	wiznet.c:404: unsigned char i, data = 0;
	mov	dptr,#_readInt_data_10001_63
	clr	a
	movx	@dptr,a
;	wiznet.c:405: for (i = 0; i < 8; i++)
	mov	r7,a
00104$:
;	wiznet.c:407: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:408: delay();
	push	ar7
	lcall	_delay
	pop	ar7
;	wiznet.c:410: if (W5500_MISO)
	jnb	_P1_2,00102$
;	wiznet.c:412: data |= 1;
	mov	dptr,#_readInt_data_10001_63
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
00102$:
;	wiznet.c:414: data <<= 1;
	mov	dptr,#_readInt_data_10001_63
	movx	a,@dptr
	add	a,acc
	movx	@dptr,a
;	wiznet.c:415: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:416: delay();
	push	ar7
	lcall	_delay
	pop	ar7
;	wiznet.c:405: for (i = 0; i < 8; i++)
	inc	r7
	cjne	r7,#0x08,00128$
00128$:
	jc	00104$
;	wiznet.c:419: unsigned char data1 = (data >> 1);
	mov	dptr,#_readInt_data_10001_63
	movx	a,@dptr
	clr	c
	rrc	a
	mov	r7,a
;	wiznet.c:421: delay();
	push	ar7
	lcall	_delay
	pop	ar7
;	wiznet.c:422: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:423: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:424: return data01;
	mov	dpl, r7
;	wiznet.c:425: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'resetArrays'
;------------------------------------------------------------
;peer_port                 Allocated with name '_resetArrays_PARM_2'
;get_size                  Allocated with name '_resetArrays_PARM_3'
;message                   Allocated with name '_resetArrays_PARM_4'
;peer_ip                   Allocated with name '_resetArrays_peer_ip_10000_68'
;i                         Allocated with name '_resetArrays_i_20000_70'
;i                         Allocated with name '_resetArrays_i_20000_72'
;i                         Allocated with name '_resetArrays_i_20000_74'
;i                         Allocated with name '_resetArrays_i_20000_76'
;------------------------------------------------------------
;	wiznet.c:430: void resetArrays(unsigned char *peer_ip, unsigned char *peer_port, unsigned char *get_size, unsigned char *message){
;	-----------------------------------------
;	 function resetArrays
;	-----------------------------------------
_resetArrays:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_resetArrays_peer_ip_10000_68
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:431: for (int i = 0; i < 2; i++){
	mov	dptr,#_resetArrays_peer_ip_10000_68
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00106$:
	clr	c
	mov	a,r3
	subb	a,#0x02
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00101$
;	wiznet.c:432: peer_ip[i] = 0;
	mov	a,r3
	add	a, r5
	mov	r0,a
	mov	a,r4
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
;	wiznet.c:431: for (int i = 0; i < 2; i++){
	inc	r3
	cjne	r3,#0x00,00106$
	inc	r4
	sjmp	00106$
00101$:
;	wiznet.c:434: for (int i = 0; i < 2; i++){
	mov	dptr,#_resetArrays_PARM_2
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00109$:
	clr	c
	mov	a,r3
	subb	a,#0x02
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00102$
;	wiznet.c:435: peer_port[i] = 0;
	mov	a,r3
	add	a, r5
	mov	r0,a
	mov	a,r4
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
;	wiznet.c:434: for (int i = 0; i < 2; i++){
	inc	r3
	cjne	r3,#0x00,00109$
	inc	r4
	sjmp	00109$
00102$:
;	wiznet.c:437: for (int i = 0; i <= 2; i++){
	mov	dptr,#_resetArrays_PARM_3
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00112$:
	clr	c
	mov	a,#0x02
	subb	a,r3
	mov	a,#(0x00 ^ 0x80)
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jc	00103$
;	wiznet.c:438: get_size[i] = 0;
	mov	a,r3
	add	a, r5
	mov	r0,a
	mov	a,r4
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
;	wiznet.c:437: for (int i = 0; i <= 2; i++){
	inc	r3
	cjne	r3,#0x00,00112$
	inc	r4
	sjmp	00112$
00103$:
;	wiznet.c:440: for (int i = 0; i < 24; i++){
	mov	dptr,#_resetArrays_PARM_4
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00115$:
	clr	c
	mov	a,r3
	subb	a,#0x18
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00117$
;	wiznet.c:441: message[i] = '\0';
	mov	a,r3
	add	a, r5
	mov	r0,a
	mov	a,r4
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	clr	a
	lcall	__gptrput
;	wiznet.c:440: for (int i = 0; i < 24; i++){
	inc	r3
	cjne	r3,#0x00,00115$
	inc	r4
	sjmp	00115$
00117$:
;	wiznet.c:443: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readW55000'
;------------------------------------------------------------
;bsb                       Allocated with name '_readW55000_PARM_2'
;len                       Allocated with name '_readW55000_PARM_3'
;addr                      Allocated with name '_readW55000_addr_10000_78'
;dataIndex                 Allocated with name '_readW55000_dataIndex_10001_80'
;j                         Allocated with name '_readW55000_j_20001_81'
;dataByte                  Allocated with name '_readW55000_dataByte_30002_83'
;i                         Allocated with name '_readW55000_i_40002_84'
;------------------------------------------------------------
;	wiznet.c:445: void readW55000(unsigned int addr, unsigned char bsb, unsigned int len) {
;	-----------------------------------------
;	 function readW55000
;	-----------------------------------------
_readW55000:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_readW55000_addr_10000_78
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:446: initPhase(addr, bsb);
	mov	dptr,#_readW55000_addr_10000_78
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_readW55000_PARM_2
	movx	a,@dptr
	mov	dptr,#_initPhase_PARM_2
	movx	@dptr,a
	mov	dpl, r6
	mov	dph, r7
	lcall	_initPhase
;	wiznet.c:447: setRead();
	lcall	_setRead
;	wiznet.c:448: setOM();
	lcall	_setOM
;	wiznet.c:450: resetArrays(peer_ip, peer_port, get_size, message);
	mov	dptr,#_resetArrays_PARM_2
	mov	a,#_peer_port
	movx	@dptr,a
	mov	a,#(_peer_port >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_resetArrays_PARM_3
	mov	a,#_get_size
	movx	@dptr,a
	mov	a,#(_get_size >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_resetArrays_PARM_4
	mov	a,#_message
	movx	@dptr,a
	mov	a,#(_message >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_peer_ip
	mov	b,a
	lcall	_resetArrays
;	wiznet.c:451: for (int j = 0; j < len; j++) {
	mov	dptr,#_readW55000_PARM_3
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r4,#0x00
	mov	r5,#0x00
00122$:
	mov	ar2,r4
	mov	ar3,r5
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r3
	subb	a,r7
	jc	00194$
	ljmp	00117$
00194$:
;	wiznet.c:452: delay();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_delay
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:453: unsigned char dataByte = 0;
	mov	dptr,#_readW55000_dataByte_30002_83
	clr	a
	movx	@dptr,a
;	wiznet.c:454: for (int i = 0; i < 8; i++) {
	mov	r2,a
	mov	r3,a
00119$:
	clr	c
	mov	a,r2
	subb	a,#0x08
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
;	wiznet.c:455: delay();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	_delay
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:456: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:457: if (W5500_MISO) {
	jnb	_P1_2,00102$
;	wiznet.c:458: dataByte |= 1;
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
00102$:
;	wiznet.c:460: if (i < 7) {
	clr	c
	mov	a,r2
	subb	a,#0x07
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00104$
;	wiznet.c:461: dataByte <<= 1;
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	add	a,acc
	movx	@dptr,a
00104$:
;	wiznet.c:463: delay();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	_delay
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:464: W5500_SCLK = 1;
;	assignBit
	setb	_P1_1
;	wiznet.c:454: for (int i = 0; i < 8; i++) {
	inc	r2
	cjne	r2,#0x00,00119$
	inc	r3
	sjmp	00119$
00105$:
;	wiznet.c:468: if (j < 4) {
	clr	c
	mov	a,r4
	subb	a,#0x04
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00115$
;	wiznet.c:469: peer_ip[j] = dataByte;
	mov	a,r4
	add	a, #_peer_ip
	mov	r2,a
	mov	a,r5
	addc	a, #(_peer_ip >> 8)
	mov	r3,a
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
	ljmp	00123$
00115$:
;	wiznet.c:470: } else if (j >= 4 && j <= 5) {
	clr	c
	mov	a,r4
	subb	a,#0x04
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00111$
	mov	a,#0x05
	subb	a,r4
	mov	a,#(0x00 ^ 0x80)
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jc	00111$
;	wiznet.c:471: peer_port[j - 4] = dataByte;
	mov	ar3,r4
	dec	r3
	dec	r3
	dec	r3
	dec	r3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a, #_peer_port
	mov	r3,a
	mov	a,r2
	addc	a, #(_peer_port >> 8)
	mov	r2,a
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r2
	movx	@dptr,a
	sjmp	00123$
00111$:
;	wiznet.c:472: } else if (j >= 6 && j <= 7) {
	clr	c
	mov	a,r4
	subb	a,#0x06
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00107$
	mov	a,#0x07
	subb	a,r4
	mov	a,#(0x00 ^ 0x80)
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jc	00107$
;	wiznet.c:473: get_size[j - 6] = dataByte;
	mov	ar3,r4
	mov	a,r3
	add	a,#0xfa
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a, #_get_size
	mov	r3,a
	mov	a,r2
	addc	a, #(_get_size >> 8)
	mov	r2,a
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r2
	movx	@dptr,a
	sjmp	00123$
00107$:
;	wiznet.c:476: message[j-8] = dataByte;
	mov	ar3,r4
	mov	a,r3
	add	a,#0xf8
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a, #_message
	mov	r3,a
	mov	a,r2
	addc	a, #(_message >> 8)
	mov	r2,a
	mov	dptr,#_readW55000_dataByte_30002_83
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r2
	movx	@dptr,a
00123$:
;	wiznet.c:451: for (int j = 0; j < len; j++) {
	inc	r4
	cjne	r4,#0x00,00204$
	inc	r5
00204$:
	ljmp	00122$
00117$:
;	wiznet.c:480: W5500_SCLK = 0;
;	assignBit
	clr	_P1_1
;	wiznet.c:481: W5500_SCS = 1;
;	assignBit
	setb	_P1_0
;	wiznet.c:482: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'configNetwork'
;------------------------------------------------------------
;	wiznet.c:484: void configNetwork(){
;	-----------------------------------------
;	 function configNetwork
;	-----------------------------------------
_configNetwork:
;	wiznet.c:485: sendByte(0x000F, 0, ip, 4);//set ip
	mov	dptr,#_sendByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_ip
	movx	@dptr,a
	mov	a,#(_ip >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x000f
	lcall	_sendByte
;	wiznet.c:486: delay();
	lcall	_delay
;	wiznet.c:488: sendByte(0x0005, 0, subnet, 4); //
	mov	dptr,#_sendByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_subnet
	movx	@dptr,a
	mov	a,#(_subnet >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0005
	lcall	_sendByte
;	wiznet.c:489: delay();
	lcall	_delay
;	wiznet.c:491: sendByte(0x0009, 0, mac, 6);
	mov	dptr,#_sendByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_mac
	movx	@dptr,a
	mov	a,#(_mac >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x06
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0009
	lcall	_sendByte
;	wiznet.c:492: delay();
	lcall	_delay
;	wiznet.c:493: sendByte(0x0001, 0, gateway, 4);
	mov	dptr,#_sendByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_gateway
	movx	@dptr,a
	mov	a,#(_gateway >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0001
;	wiznet.c:494: }
	ljmp	_sendByte
;------------------------------------------------------------
;Allocation info for local variables in function 'UART_Init'
;------------------------------------------------------------
;	wiznet.c:496: void UART_Init()
;	-----------------------------------------
;	 function UART_Init
;	-----------------------------------------
_UART_Init:
;	wiznet.c:498: TMOD = 0x20; /* Timer 1, 8-bit auto reload mode */
	mov	_TMOD,#0x20
;	wiznet.c:499: TH1 = 0xFD;	 /* Load value for 9600 baud rate */
	mov	_TH1,#0xfd
;	wiznet.c:500: SCON = 0x50; /* Mode 1, reception enable */
	mov	_SCON,#0x50
;	wiznet.c:501: TR1 = 1;	 /* Start timer 1 */
;	assignBit
	setb	_TR1
;	wiznet.c:502: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Transmit_data'
;------------------------------------------------------------
;tx_data                   Allocated with name '_Transmit_data_tx_data_10000_94'
;------------------------------------------------------------
;	wiznet.c:504: void Transmit_data(char tx_data)
;	-----------------------------------------
;	 function Transmit_data
;	-----------------------------------------
_Transmit_data:
	mov	a,dpl
	mov	dptr,#_Transmit_data_tx_data_10000_94
	movx	@dptr,a
;	wiznet.c:506: SBUF = tx_data;
	movx	a,@dptr
	mov	_SBUF,a
;	wiznet.c:507: while (TI == 0);
00101$:
;	wiznet.c:508: TI = 0; 
;	assignBit
	jbc	_TI,00118$
	sjmp	00101$
00118$:
;	wiznet.c:509: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'String'
;------------------------------------------------------------
;str                       Allocated with name '_String_str_10000_96'
;i                         Allocated with name '_String_i_10000_97'
;------------------------------------------------------------
;	wiznet.c:511: void String(char *str)
;	-----------------------------------------
;	 function String
;	-----------------------------------------
_String:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_String_str_10000_96
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:514: for (i = 0; str[i] != 0; i++) 
	mov	dptr,#_String_str_10000_96
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00103$:
	mov	a,r3
	add	a, r5
	mov	r0,a
	mov	a,r4
	addc	a, r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	r2,a
	jz	00105$
;	wiznet.c:516: Transmit_data(str[i]); 
	mov	dpl, r2
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_Transmit_data
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:514: for (i = 0; str[i] != 0; i++) 
	inc	r3
	cjne	r3,#0x00,00103$
	inc	r4
	sjmp	00103$
00105$:
;	wiznet.c:518: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TransmitByte'
;------------------------------------------------------------
;data                      Allocated with name '_TransmitByte_data_10000_100'
;------------------------------------------------------------
;	wiznet.c:520: void TransmitByte(unsigned char data)
;	-----------------------------------------
;	 function TransmitByte
;	-----------------------------------------
_TransmitByte:
	mov	a,dpl
	mov	dptr,#_TransmitByte_data_10000_100
	movx	@dptr,a
;	wiznet.c:522: SBUF = data;
	movx	a,@dptr
	mov	_SBUF,a
;	wiznet.c:523: while (!TI)
00101$:
;	wiznet.c:525: TI = 0;
;	assignBit
	jbc	_TI,00118$
	sjmp	00101$
00118$:
;	wiznet.c:526: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'transmitString'
;------------------------------------------------------------
;string                    Allocated with name '_transmitString_string_10000_102'
;------------------------------------------------------------
;	wiznet.c:528: void transmitString(char *string)
;	-----------------------------------------
;	 function transmitString
;	-----------------------------------------
_transmitString:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_transmitString_string_10000_102
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:531: while (*string)
	mov	dptr,#_transmitString_string_10000_102
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	jz	00108$
;	wiznet.c:533: TransmitByte(*string++);
	inc	r5
	cjne	r5,#0x00,00120$
	inc	r6
00120$:
	mov	dptr,#_transmitString_string_10000_102
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	push	ar7
	push	ar6
	push	ar5
	lcall	_TransmitByte
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00101$
00108$:
	mov	dptr,#_transmitString_string_10000_102
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:537: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PrintNetworkInfo'
;------------------------------------------------------------
;buffer                    Allocated with name '_PrintNetworkInfo_buffer_10000_105'
;i                         Allocated with name '_PrintNetworkInfo_i_20000_106'
;i                         Allocated with name '_PrintNetworkInfo_i_20000_108'
;i                         Allocated with name '_PrintNetworkInfo_i_20000_110'
;i                         Allocated with name '_PrintNetworkInfo_i_20000_112'
;------------------------------------------------------------
;	wiznet.c:539: void PrintNetworkInfo()
;	-----------------------------------------
;	 function PrintNetworkInfo
;	-----------------------------------------
_PrintNetworkInfo:
;	wiznet.c:542: readByte(0x000F, 0, 4);
	mov	dptr,#_readByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_readByte_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x000f
	lcall	_readByte
;	wiznet.c:543: delay();
	lcall	_delay
;	wiznet.c:544: readByte(0x0005, 0, 4);
	mov	dptr,#_readByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_readByte_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0005
	lcall	_readByte
;	wiznet.c:545: delay();
	lcall	_delay
;	wiznet.c:546: readByte(0x0009, 0, 6);
	mov	dptr,#_readByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_readByte_PARM_3
	mov	a,#0x06
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0009
	lcall	_readByte
;	wiznet.c:547: delay();
	lcall	_delay
;	wiznet.c:548: readByte(0x0001, 0, 4);
	mov	dptr,#_readByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_readByte_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_readByte
;	wiznet.c:550: transmitString("CURRENT CONFIG:");
	mov	dptr,#___str_0
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:551: transmitString("          CHANGE CMD:\r\n");
	mov	dptr,#___str_1
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:552: transmitString("RTU Addr (0-9): ");
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:553: IntToStr(RTU, buffer);
	mov	dptr,#_RTU
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_PrintNetworkInfo_buffer_10000_105
	movx	@dptr,a
	mov	a,#(_PrintNetworkInfo_buffer_10000_105 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r7
	mov	dph, r6
	lcall	_IntToStr
;	wiznet.c:554: transmitString(buffer);
	mov	dptr,#_PrintNetworkInfo_buffer_10000_105
	mov	b, #0x00
	lcall	_transmitString
;	wiznet.c:555: transmitString("          RTU=#\r\n");
	mov	dptr,#___str_3
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:557: transmitString("IP Addr: ");
	mov	dptr,#___str_4
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:558: for (int i = 0; i < 4; i++)
	mov	r6,#0x00
	mov	r7,#0x00
00114$:
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00103$
;	wiznet.c:560: IntToStr(tmpip[i], buffer);
	mov	a,r6
	add	a, #_tmpip
	mov	dpl,a
	mov	a,r7
	addc	a, #(_tmpip >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_PrintNetworkInfo_buffer_10000_105
	movx	@dptr,a
	mov	a,#(_PrintNetworkInfo_buffer_10000_105 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r4
	push	ar7
	push	ar6
	lcall	_IntToStr
;	wiznet.c:561: transmitString(buffer);
	mov	dptr,#_PrintNetworkInfo_buffer_10000_105
	mov	b, #0x00
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:562: if (i < 3)
	clr	c
	mov	a,r6
	subb	a,#0x03
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00115$
;	wiznet.c:563: transmitString(".");
	mov	dptr,#___str_5
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00115$:
;	wiznet.c:558: for (int i = 0; i < 4; i++)
	inc	r6
	cjne	r6,#0x00,00114$
	inc	r7
	sjmp	00114$
00103$:
;	wiznet.c:565: transmitString("   IP=###.###.###.###\r\n");
	mov	dptr,#___str_6
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:566: transmitString("Subnet Mask: ");
	mov	dptr,#___str_7
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:567: for (int i = 0; i < 4; i++)
	mov	r6,#0x00
	mov	r7,#0x00
00117$:
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00106$
;	wiznet.c:569: IntToStr(tmpsubnet[i], buffer);
	mov	a,r6
	add	a, #_tmpsubnet
	mov	dpl,a
	mov	a,r7
	addc	a, #(_tmpsubnet >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_PrintNetworkInfo_buffer_10000_105
	movx	@dptr,a
	mov	a,#(_PrintNetworkInfo_buffer_10000_105 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r4
	push	ar7
	push	ar6
	lcall	_IntToStr
;	wiznet.c:570: transmitString(buffer);
	mov	dptr,#_PrintNetworkInfo_buffer_10000_105
	mov	b, #0x00
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:571: if (i < 3)
	clr	c
	mov	a,r6
	subb	a,#0x03
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00118$
;	wiznet.c:572: transmitString(".");
	mov	dptr,#___str_5
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00118$:
;	wiznet.c:567: for (int i = 0; i < 4; i++)
	inc	r6
	cjne	r6,#0x00,00117$
	inc	r7
	sjmp	00117$
00106$:
;	wiznet.c:574: transmitString("   SUB=###.###.###.###\r\n");
	mov	dptr,#___str_8
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:575: transmitString("Gateway: ");
	mov	dptr,#___str_9
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:576: for (int i = 0; i < 4; i++)
	mov	r6,#0x00
	mov	r7,#0x00
00120$:
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00109$
;	wiznet.c:578: IntToStr(tmpgateway[i], buffer);
	mov	a,r6
	add	a, #_tmpgateway
	mov	dpl,a
	mov	a,r7
	addc	a, #(_tmpgateway >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_PrintNetworkInfo_buffer_10000_105
	movx	@dptr,a
	mov	a,#(_PrintNetworkInfo_buffer_10000_105 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r4
	push	ar7
	push	ar6
	lcall	_IntToStr
;	wiznet.c:579: transmitString(buffer);
	mov	dptr,#_PrintNetworkInfo_buffer_10000_105
	mov	b, #0x00
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:580: if (i < 3)
	clr	c
	mov	a,r6
	subb	a,#0x03
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00121$
;	wiznet.c:581: transmitString(".");
	mov	dptr,#___str_5
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00121$:
;	wiznet.c:576: for (int i = 0; i < 4; i++)
	inc	r6
	cjne	r6,#0x00,00120$
	inc	r7
	sjmp	00120$
00109$:
;	wiznet.c:583: transmitString("    GATE=###.###.###.###\r\n");
	mov	dptr,#___str_10
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:584: transmitString("MAC Addr: ");
	mov	dptr,#___str_11
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:585: for (int i = 0; i < 6; i++)
	mov	r6,#0x00
	mov	r7,#0x00
00123$:
	clr	c
	mov	a,r6
	subb	a,#0x06
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00112$
;	wiznet.c:587: IntToStr(tmpmac[i], buffer);
	mov	a,r6
	add	a, #_tmpmac
	mov	dpl,a
	mov	a,r7
	addc	a, #(_tmpmac >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_PrintNetworkInfo_buffer_10000_105
	movx	@dptr,a
	mov	a,#(_PrintNetworkInfo_buffer_10000_105 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r4
	push	ar7
	push	ar6
	lcall	_IntToStr
;	wiznet.c:588: transmitString(buffer);
	mov	dptr,#_PrintNetworkInfo_buffer_10000_105
	mov	b, #0x00
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:589: if (i < 5)
	clr	c
	mov	a,r6
	subb	a,#0x05
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00124$
;	wiznet.c:590: transmitString(" ");
	mov	dptr,#___str_12
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00124$:
;	wiznet.c:585: for (int i = 0; i < 6; i++)
	inc	r6
	cjne	r6,#0x00,00123$
	inc	r7
	sjmp	00123$
00112$:
;	wiznet.c:592: transmitString("    MAC=FF FF FF FF FF FF\r\n");
	mov	dptr,#___str_13
	mov	b, #0x80
;	wiznet.c:598: }
	ljmp	_transmitString
;------------------------------------------------------------
;Allocation info for local variables in function 'printpacketadd'
;------------------------------------------------------------
;buffer                    Allocated with name '_printpacketadd_buffer_10000_114'
;i                         Allocated with name '_printpacketadd_i_20000_115'
;portValue                 Allocated with name '_printpacketadd_portValue_10001_117'
;sizeValue                 Allocated with name '_printpacketadd_sizeValue_10002_118'
;i                         Allocated with name '_printpacketadd_i_20002_119'
;msgChar                   Allocated with name '_printpacketadd_msgChar_40002_121'
;------------------------------------------------------------
;	wiznet.c:599: void printpacketadd() {
;	-----------------------------------------
;	 function printpacketadd
;	-----------------------------------------
_printpacketadd:
;	wiznet.c:601: transmitString("Peer IP: ");
	mov	dptr,#___str_14
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:602: for (int i = 0; i < 4; i++) {
	mov	r6,#0x00
	mov	r7,#0x00
00108$:
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00103$
;	wiznet.c:603: IntToStr(peer_ip[i], buffer);
	mov	a,r6
	add	a, #_peer_ip
	mov	dpl,a
	mov	a,r7
	addc	a, #(_peer_ip >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_printpacketadd_buffer_10000_114
	movx	@dptr,a
	mov	a,#(_printpacketadd_buffer_10000_114 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r5
	mov	dph, r4
	push	ar7
	push	ar6
	lcall	_IntToStr
;	wiznet.c:604: transmitString(buffer);
	mov	dptr,#_printpacketadd_buffer_10000_114
	mov	b, #0x00
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:605: if (i < 3) transmitString(".");
	clr	c
	mov	a,r6
	subb	a,#0x03
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00109$
	mov	dptr,#___str_5
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00109$:
;	wiznet.c:602: for (int i = 0; i < 4; i++) {
	inc	r6
	cjne	r6,#0x00,00108$
	inc	r7
	sjmp	00108$
00103$:
;	wiznet.c:607: transmitString("\r\nPeer Port: ");
	mov	dptr,#___str_15
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:608: unsigned int portValue = (peer_port[0] << 8) | peer_port[1];
	mov	dptr,#_peer_port
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_peer_port + 0x0001)
	movx	a,@dptr
	mov	r4,#0x00
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
;	wiznet.c:609: IntToStr(portValue, buffer);
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_printpacketadd_buffer_10000_114
	movx	@dptr,a
	mov	a,#(_printpacketadd_buffer_10000_114 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r7
	mov	dph, r6
	lcall	_IntToStr
;	wiznet.c:610: transmitString(buffer);
	mov	dptr,#_printpacketadd_buffer_10000_114
	mov	b, #0x00
	lcall	_transmitString
;	wiznet.c:611: transmitString("\r\nData Packet Size: ");
	mov	dptr,#___str_16
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:612: unsigned int sizeValue = (get_size[0] << 8) | get_size[1];
	mov	dptr,#_get_size
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_get_size + 0x0001)
	movx	a,@dptr
	mov	r4,#0x00
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
;	wiznet.c:613: IntToStr(sizeValue, buffer);
	mov	dptr,#_IntToStr_PARM_2
	mov	a,#_printpacketadd_buffer_10000_114
	movx	@dptr,a
	mov	a,#(_printpacketadd_buffer_10000_114 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r7
	mov	dph, r6
	lcall	_IntToStr
;	wiznet.c:614: transmitString(buffer);
	mov	dptr,#_printpacketadd_buffer_10000_114
	mov	b, #0x00
	lcall	_transmitString
;	wiznet.c:615: transmitString("\r\nPeer Message: ");
	mov	dptr,#___str_17
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:616: for (int i = 0; i < 24; i++) {
	mov	r6,#0x00
	mov	r7,#0x00
00111$:
	clr	c
	mov	a,r6
	subb	a,#0x18
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00113$
;	wiznet.c:617: if (message[i] != 0){
	mov	a,r6
	add	a, #_message
	mov	dpl,a
	mov	a,r7
	addc	a, #(_message >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	jz	00112$
;	wiznet.c:618: char msgChar[2] = {message[i], '\0'};  // Convert each byte to a character string
	mov	dptr,#_printpacketadd_msgChar_40002_121
	mov	a,r5
	movx	@dptr,a
	mov	dptr,#(_printpacketadd_msgChar_40002_121 + 0x0001)
	clr	a
	movx	@dptr,a
;	wiznet.c:619: transmitString(msgChar);
	mov	dptr,#_printpacketadd_msgChar_40002_121
	mov	b,a
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00112$:
;	wiznet.c:616: for (int i = 0; i < 24; i++) {
	inc	r6
	cjne	r6,#0x00,00111$
	inc	r7
	sjmp	00111$
00113$:
;	wiznet.c:622: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'updateSn_RX_RD'
;------------------------------------------------------------
;newPtr                    Allocated with name '_updateSn_RX_RD_newPtr_10000_122'
;ptrHighByte               Allocated with name '_updateSn_RX_RD_ptrHighByte_10000_123'
;ptrLowByte                Allocated with name '_updateSn_RX_RD_ptrLowByte_10000_123'
;test                      Allocated with name '_updateSn_RX_RD_test_10000_123'
;------------------------------------------------------------
;	wiznet.c:627: void updateSn_RX_RD(unsigned int newPtr) {
;	-----------------------------------------
;	 function updateSn_RX_RD
;	-----------------------------------------
_updateSn_RX_RD:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_updateSn_RX_RD_newPtr_10000_122
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:628: unsigned char ptrHighByte = (newPtr >> 8) & 0xFF;
	mov	dptr,#_updateSn_RX_RD_newPtr_10000_122
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
;	wiznet.c:629: unsigned char ptrLowByte = newPtr & 0xFF;
;	wiznet.c:630: unsigned char test[2] = {ptrHighByte, ptrLowByte};
	mov	r5,a
	mov	dptr,#_updateSn_RX_RD_test_10000_123
	movx	@dptr,a
	mov	dptr,#(_updateSn_RX_RD_test_10000_123 + 0x0001)
	mov	a,r6
	movx	@dptr,a
;	wiznet.c:631: sendByte(0x0028, 0b00000001, test, 2); // Update the Sn_RX_RD pointer.
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_updateSn_RX_RD_test_10000_123
	movx	@dptr,a
	mov	a,#(_updateSn_RX_RD_test_10000_123 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0028
;	wiznet.c:632: }
	ljmp	_sendByte
;------------------------------------------------------------
;Allocation info for local variables in function 'updateSn_RX_WR'
;------------------------------------------------------------
;newPtr                    Allocated with name '_updateSn_RX_WR_newPtr_10000_124'
;ptrHighByte               Allocated with name '_updateSn_RX_WR_ptrHighByte_10000_125'
;ptrLowByte                Allocated with name '_updateSn_RX_WR_ptrLowByte_10000_125'
;test                      Allocated with name '_updateSn_RX_WR_test_10000_125'
;------------------------------------------------------------
;	wiznet.c:633: void updateSn_RX_WR(unsigned int newPtr) {
;	-----------------------------------------
;	 function updateSn_RX_WR
;	-----------------------------------------
_updateSn_RX_WR:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_updateSn_RX_WR_newPtr_10000_124
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:634: unsigned char ptrHighByte = (newPtr >> 8) & 0xFF;
	mov	dptr,#_updateSn_RX_WR_newPtr_10000_124
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
;	wiznet.c:635: unsigned char ptrLowByte = newPtr & 0xFF;
;	wiznet.c:636: unsigned char test[2] = {ptrHighByte, ptrLowByte};
	mov	r5,a
	mov	dptr,#_updateSn_RX_WR_test_10000_125
	movx	@dptr,a
	mov	dptr,#(_updateSn_RX_WR_test_10000_125 + 0x0001)
	mov	a,r6
	movx	@dptr,a
;	wiznet.c:637: sendByte(0x0024, 0b00000001, test, 2); // Update the Sn_RX_RD pointer.
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_updateSn_RX_WR_test_10000_125
	movx	@dptr,a
	mov	a,#(_updateSn_RX_WR_test_10000_125 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0024
;	wiznet.c:638: }
	ljmp	_sendByte
;------------------------------------------------------------
;Allocation info for local variables in function 'sendResponse'
;------------------------------------------------------------
;sloc0                     Allocated with name '_sendResponse_sloc0_1_0'
;len                       Allocated with name '_sendResponse_PARM_2'
;message                   Allocated with name '_sendResponse_message_10000_126'
;tx_rd_ptr0                Allocated with name '_sendResponse_tx_rd_ptr0_10001_128'
;tx_rd_ptr1                Allocated with name '_sendResponse_tx_rd_ptr1_10001_128'
;tx_rd_ptr                 Allocated with name '_sendResponse_tx_rd_ptr_10001_128'
;i                         Allocated with name '_sendResponse_i_20001_129'
;send_command              Allocated with name '_sendResponse_send_command_10002_131'
;------------------------------------------------------------
;	wiznet.c:641: void sendResponse(unsigned char* message, unsigned int len) {
;	-----------------------------------------
;	 function sendResponse
;	-----------------------------------------
_sendResponse:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_sendResponse_message_10000_126
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:643: sendFlag = true;
	mov	dptr,#_sendFlag
	mov	a,#0x01
	movx	@dptr,a
;	wiznet.c:644: sendByte(0x000C, 0b00000001, peer_ip, 4);  // Destination IP
	mov	dptr,#_sendByte_PARM_2
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_peer_ip
	movx	@dptr,a
	mov	a,#(_peer_ip >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x000c
	lcall	_sendByte
;	wiznet.c:645: sendByte(0x0010, 0b00000001, peer_port, 2);  // Destination port
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_peer_port
	movx	@dptr,a
	mov	a,#(_peer_port >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0010
	lcall	_sendByte
;	wiznet.c:647: unsigned char tx_rd_ptr0 = sockReceive0(0x0022, 0b00000001); 
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0022
	lcall	_sockReceive0
	mov	r7, dpl
;	wiznet.c:648: unsigned char tx_rd_ptr1 = sockReceive0(0x0023, 0b00000001); 
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0023
	push	ar7
	lcall	_sockReceive0
	mov	r6, dpl
	pop	ar7
;	wiznet.c:649: unsigned int tx_rd_ptr = tx_rd_ptr0;
	mov	ar5,r7
;	wiznet.c:650: tx_rd_ptr = (tx_rd_ptr << 8) | tx_rd_ptr1;
	mov	ar7,r5
	clr	a
	mov	r5,a
	mov	r4,a
	mov	a,r6
	orl	a,r5
	mov	_sendResponse_sloc0_1_0,a
	mov	a,r4
	orl	a,r7
	mov	(_sendResponse_sloc0_1_0 + 1),a
;	wiznet.c:652: for (unsigned int i = 0; i < len; ++i) {
	mov	dptr,#_sendResponse_PARM_2
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	r2,#0x00
	mov	r3,#0x00
00103$:
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
	jnc	00101$
;	wiznet.c:653: message[0] = RTU;
	push	ar4
	push	ar5
	mov	dptr,#_sendResponse_message_10000_126
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_RTU
	movx	a,@dptr
	mov	dpl,r0
	mov	dph,r1
	mov	b,r5
	lcall	__gptrput
;	wiznet.c:654: sendByte(tx_rd_ptr + i, 0b00000010, &message[i], 1);  // Writing data to TX buffer
	mov	a,r2
	add	a, _sendResponse_sloc0_1_0
	mov	r4,a
	mov	a,r3
	addc	a, (_sendResponse_sloc0_1_0 + 1)
	mov	r7,a
	mov	a,r2
	add	a, r0
	mov	r0,a
	mov	a,r3
	addc	a, r1
	mov	r1,a
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r7
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	_sendByte
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
;	wiznet.c:652: for (unsigned int i = 0; i < len; ++i) {
	inc	r2
	cjne	r2,#0x00,00121$
	inc	r3
00121$:
	pop	ar5
	pop	ar4
	sjmp	00103$
00101$:
;	wiznet.c:656: updateSn_RX_WR(tx_rd_ptr + len);
	mov	a,r4
	add	a, _sendResponse_sloc0_1_0
	mov	r4,a
	mov	a,r5
	addc	a, (_sendResponse_sloc0_1_0 + 1)
	mov	r5,a
	mov	dpl, r4
	mov	dph, r5
	lcall	_updateSn_RX_WR
;	wiznet.c:657: unsigned char send_command = 0x20;  // SEND command
	mov	dptr,#_sendResponse_send_command_10002_131
	mov	a,#0x20
	movx	@dptr,a
;	wiznet.c:658: sendByte(0x0001, 0b00000001, &send_command, 1); 
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_sendResponse_send_command_10002_131
	movx	@dptr,a
	mov	a,#(_sendResponse_send_command_10002_131 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_sendByte
;	wiznet.c:660: sendFlag = false;
	mov	dptr,#_sendFlag
	clr	a
	movx	@dptr,a
;	wiznet.c:661: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handleDat'
;------------------------------------------------------------
;rx_rd0                    Allocated with name '_handleDat_rx_rd0_10001_134'
;rx_rd1                    Allocated with name '_handleDat_rx_rd1_10001_134'
;rx_rd                     Allocated with name '_handleDat_rx_rd_10001_134'
;rx_wr0                    Allocated with name '_handleDat_rx_wr0_10002_135'
;rx_wr1                    Allocated with name '_handleDat_rx_wr1_10002_135'
;rx_wr                     Allocated with name '_handleDat_rx_wr_10002_135'
;command                   Allocated with name '_handleDat_command_10003_136'
;cmdCheck                  Allocated with name '_handleDat_cmdCheck_10004_137'
;sizeValue                 Allocated with name '_handleDat_sizeValue_10005_139'
;------------------------------------------------------------
;	wiznet.c:666: void handleDat(){
;	-----------------------------------------
;	 function handleDat
;	-----------------------------------------
_handleDat:
;	wiznet.c:667: if (!dataReceived){
	mov	dptr,#_dataReceived
	movx	a,@dptr
	jnz	00102$
;	wiznet.c:668: return;
	ret
00102$:
;	wiznet.c:671: unsigned char rx_rd0 = sockReceive0(0x0028, 0b00000001);
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0028
	lcall	_sockReceive0
	mov	r7, dpl
;	wiznet.c:672: unsigned char rx_rd1 = sockReceive0(0x0029, 0b00000001);
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0029
	push	ar7
	lcall	_sockReceive0
	mov	r6, dpl
	pop	ar7
;	wiznet.c:673: unsigned int rx_rd = rx_rd0;
;	wiznet.c:674: rx_rd = (rx_rd << 8) | rx_rd1;
	mov	ar5,r7
	clr	a
	mov	r7,a
	mov	r4,a
	mov	a,r6
	orl	ar7,a
	mov	a,r4
	orl	ar5,a
;	wiznet.c:676: unsigned char rx_wr0 = sockReceive0(0x002A, 0b00000001);
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x002a
	push	ar7
	push	ar5
	lcall	_sockReceive0
	mov	r6, dpl
	pop	ar5
;	wiznet.c:677: unsigned char rx_wr1 = sockReceive0(0X002B, 1);
	mov	dptr,#_sockReceive0_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x002b
	push	ar6
	push	ar5
	lcall	_sockReceive0
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
;	wiznet.c:678: unsigned int rx_wr = rx_wr0;
;	wiznet.c:679: rx_wr = (rx_wr << 8) | rx_wr1;
	mov	ar3,r6
	clr	a
	mov	r6,a
	mov	r2,a
	mov	a,r4
	orl	ar6,a
	mov	a,r2
	orl	ar3,a
;	wiznet.c:682: readW55000(rx_rd, 0b00000011, rx_wr - rx_rd);
	mov	a,r6
	clr	c
	subb	a,r7
	mov	r2,a
	mov	a,r3
	subb	a,r5
	mov	r4,a
	mov	dptr,#_readW55000_PARM_2
	mov	a,#0x03
	movx	@dptr,a
	mov	dptr,#_readW55000_PARM_3
	mov	a,r2
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	mov	dpl, r7
	mov	dph, r5
	push	ar6
	push	ar3
	lcall	_readW55000
;	wiznet.c:684: transmitString("Processing packet...\r\n");
	mov	dptr,#___str_18
	mov	b, #0x80
	lcall	_transmitString
;	wiznet.c:685: printpacketadd();
	lcall	_printpacketadd
	pop	ar3
	pop	ar6
;	wiznet.c:686: updateSn_RX_RD(rx_wr);
	mov	dpl, r6
	mov	dph, r3
	lcall	_updateSn_RX_RD
;	wiznet.c:687: unsigned char command[1] = {0x40}; // RECV command
	mov	dptr,#_handleDat_command_10003_136
	mov	a,#0x40
	movx	@dptr,a
;	wiznet.c:688: sendByte(0x0001, 0b00000001, command, 1);
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_handleDat_command_10003_136
	movx	@dptr,a
	mov	a,#(_handleDat_command_10003_136 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_sendByte
;	wiznet.c:690: do {
00103$:
;	wiznet.c:691: cmdCheck = readInt(0x0001, 0b00000001);
	mov	dptr,#_readInt_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_readInt
	mov	a, dpl
;	wiznet.c:693: } while(cmdCheck != 0x00);
	jnz	00103$
;	wiznet.c:695: dataReceived = false;
	mov	dptr,#_dataReceived
	clr	a
	movx	@dptr,a
;	wiznet.c:696: unsigned int sizeValue = (get_size[0] << 8) | get_size[1];
	mov	dptr,#_get_size
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_get_size + 0x0001)
	movx	a,@dptr
	mov	r4,#0x00
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
;	wiznet.c:697: sendResponse(message, sizeValue);
	mov	dptr,#_sendResponse_PARM_2
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_message
	mov	b, #0x00
;	wiznet.c:700: }
	ljmp	_sendResponse
;------------------------------------------------------------
;Allocation info for local variables in function 'enableSocketInt'
;------------------------------------------------------------
;interruptMask             Allocated with name '_enableSocketInt_interruptMask_10000_140'
;interruptMask0            Allocated with name '_enableSocketInt_interruptMask0_10000_140'
;intmask                   Allocated with name '_enableSocketInt_intmask_10000_140'
;------------------------------------------------------------
;	wiznet.c:705: void enableSocketInt(){
;	-----------------------------------------
;	 function enableSocketInt
;	-----------------------------------------
_enableSocketInt:
;	wiznet.c:706: unsigned char interruptMask[1] = {0x14};
	mov	dptr,#_enableSocketInt_interruptMask_10000_140
	mov	a,#0x14
	movx	@dptr,a
;	wiznet.c:707: unsigned char interruptMask0[1] = {0x01};
	mov	dptr,#_enableSocketInt_interruptMask0_10000_140
	mov	a,#0x01
	movx	@dptr,a
;	wiznet.c:708: unsigned char intmask[1] = {0x00};
	mov	dptr,#_enableSocketInt_intmask_10000_140
	clr	a
	movx	@dptr,a
;	wiznet.c:709: sendByte(0x002C, 0b00000001, interruptMask, 1);
	mov	dptr,#_sendByte_PARM_2
	inc	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_enableSocketInt_interruptMask_10000_140
	movx	@dptr,a
	mov	a,#(_enableSocketInt_interruptMask_10000_140 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x002c
	lcall	_sendByte
;	wiznet.c:710: sendByte(0x0018, 0, interruptMask0, 1);
	mov	dptr,#_sendByte_PARM_2
	clr	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_enableSocketInt_interruptMask0_10000_140
	movx	@dptr,a
	mov	a,#(_enableSocketInt_interruptMask0_10000_140 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0018
	lcall	_sendByte
;	wiznet.c:711: sendByte(0x0002, 0b00000001, intmask, 1);
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_enableSocketInt_intmask_10000_140
	movx	@dptr,a
	mov	a,#(_enableSocketInt_intmask_10000_140 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0002
;	wiznet.c:712: }
	ljmp	_sendByte
;------------------------------------------------------------
;Allocation info for local variables in function 'externalInt10'
;------------------------------------------------------------
;intStatus                 Allocated with name '_externalInt10_intStatus_10000_141'
;clearInt                  Allocated with name '_externalInt10_clearInt_20001_143'
;clearInt                  Allocated with name '_externalInt10_clearInt_20000_144'
;------------------------------------------------------------
;	wiznet.c:716: void externalInt10() __interrupt(0){
;	-----------------------------------------
;	 function externalInt10
;	-----------------------------------------
_externalInt10:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	wiznet.c:718: unsigned char intStatus = readInt(0x0002, 0b00000001);
	mov	dptr,#_readInt_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#0x0002
	lcall	_readInt
;	wiznet.c:721: if ((intStatus & 0x04) && !sendFlag){
	mov	a,dpl
	mov	r7,a
	jnb	acc.2,00104$
	mov	dptr,#_sendFlag
	movx	a,@dptr
	jnz	00104$
;	wiznet.c:722: dataReceived = true;  //flag
	mov	dptr,#_dataReceived
	mov	a,#0x01
	movx	@dptr,a
;	wiznet.c:724: unsigned char clearInt = 0x14;
	mov	dptr,#_externalInt10_clearInt_20001_143
	mov	a,#0x14
	movx	@dptr,a
;	wiznet.c:725: sendByte(0x0002, 0b00000001, &clearInt, 1);
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_externalInt10_clearInt_20001_143
	movx	@dptr,a
	mov	a,#(_externalInt10_clearInt_20001_143 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0002
	lcall	_sendByte
;	wiznet.c:726: timeout = 0;
	mov	dptr,#_timeout
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	sjmp	00105$
00104$:
;	wiznet.c:729: else if(intStatus & 0x10){
	mov	a,r7
	jnb	acc.4,00105$
;	wiznet.c:730: unsigned char clearInt = 0x14;
	mov	dptr,#_externalInt10_clearInt_20000_144
	mov	a,#0x14
	movx	@dptr,a
;	wiznet.c:731: sendByte(0x0002, 0b00000001, &clearInt, 1);
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_externalInt10_clearInt_20000_144
	movx	@dptr,a
	mov	a,#(_externalInt10_clearInt_20000_144 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0002
	lcall	_sendByte
;	wiznet.c:733: timeout = 0;
	mov	dptr,#_timeout
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00105$:
;	wiznet.c:735: timeout += 1;
	mov	dptr,#_timeout
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_timeout
	mov	a,#0x01
	add	a, r6
	movx	@dptr,a
	clr	a
	addc	a, r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:736: if (timeout >= 5000){
	mov	dptr,#_timeout
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x88
	mov	a,r7
	subb	a,#0x13
	jc	00109$
;	wiznet.c:737: resetArrays(peer_ip, peer_port, get_size, message);
	mov	dptr,#_resetArrays_PARM_2
	mov	a,#_peer_port
	movx	@dptr,a
	mov	a,#(_peer_port >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_resetArrays_PARM_3
	mov	a,#_get_size
	movx	@dptr,a
	mov	a,#(_get_size >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_resetArrays_PARM_4
	mov	a,#_message
	movx	@dptr,a
	mov	a,#(_message >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_peer_ip
	mov	b,a
	lcall	_resetArrays
;	wiznet.c:738: timeout = 0;
	mov	dptr,#_timeout
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:739: enableSocketInt();
	lcall	_enableSocketInt
;	wiznet.c:740: dataReceived = false;
	mov	dptr,#_dataReceived
	clr	a
	movx	@dptr,a
;	wiznet.c:741: sendFlag = false;
	mov	dptr,#_sendFlag
	movx	@dptr,a
00109$:
;	wiznet.c:744: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'externalInt80'
;------------------------------------------------------------
;receivedChar              Allocated with name '_externalInt80_receivedChar_20000_147'
;------------------------------------------------------------
;	wiznet.c:746: void externalInt80() __interrupt(4){
;	-----------------------------------------
;	 function externalInt80
;	-----------------------------------------
_externalInt80:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	ar6
	push	psw
	mov	psw,#0x00
;	wiznet.c:747: if (RI == 1){
	jnb	_RI,00108$
;	wiznet.c:748: char receivedChar = SBUF;
	mov	dptr,#_externalInt80_receivedChar_20000_147
	mov	a,_SBUF
	movx	@dptr,a
;	wiznet.c:749: if (receivedChar == '\n' || receivedChar == '\r' || bufIndex >= bufferSize - 1){
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0a,00129$
	sjmp	00101$
00129$:
	cjne	r7,#0x0d,00130$
	sjmp	00101$
00130$:
	mov	dptr,#_bufIndex
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x18,00131$
00131$:
	jc	00102$
00101$:
;	wiznet.c:750: bufferM[bufIndex] = '\0';
	mov	dptr,#_bufIndex
	movx	a,@dptr
	add	a, #_bufferM
	mov	dpl,a
	clr	a
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
;	wiznet.c:751: strreceived = 1;
	mov	dptr,#_strreceived
	inc	a
	movx	@dptr,a
;	wiznet.c:752: bufIndex = 0; 
	mov	dptr,#_bufIndex
	clr	a
	movx	@dptr,a
	sjmp	00103$
00102$:
;	wiznet.c:755: bufferM[bufIndex] = receivedChar;
	mov	dptr,#_bufIndex
	movx	a,@dptr
	add	a, #_bufferM
	mov	dpl,a
	clr	a
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	mov	a,r7
	movx	@dptr,a
;	wiznet.c:756: bufIndex++;
	mov	dptr,#_bufIndex
	movx	a,@dptr
	inc	a
	movx	@dptr,a
00103$:
;	wiznet.c:758: RI = 0;
;	assignBit
	clr	_RI
00108$:
;	wiznet.c:760: }
	pop	psw
	pop	ar6
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'parseInp'
;------------------------------------------------------------
;sloc0                     Allocated with name '_parseInp_sloc0_1_0'
;sloc1                     Allocated with name '_parseInp_sloc1_1_0'
;sloc2                     Allocated with name '_parseInp_sloc2_1_0'
;iparr                     Allocated with name '_parseInp_PARM_2'
;inc                       Allocated with name '_parseInp_PARM_3'
;arrbuff                   Allocated with name '_parseInp_arrbuff_10000_150'
;num                       Allocated with name '_parseInp_num_10000_151'
;j                         Allocated with name '_parseInp_j_10000_151'
;------------------------------------------------------------
;	wiznet.c:761: void parseInp(char *arrbuff, unsigned char *iparr, int inc){
;	-----------------------------------------
;	 function parseInp
;	-----------------------------------------
_parseInp:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_parseInp_arrbuff_10000_150
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	wiznet.c:762: int num = 0;
	mov	dptr,#_parseInp_num_10000_151
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:764: arrbuff += inc;
	mov	dptr,#_parseInp_PARM_3
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_parseInp_arrbuff_10000_150
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_parseInp_arrbuff_10000_150
	mov	a,r6
	add	a, r3
	movx	@dptr,a
	mov	a,r7
	addc	a, r4
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
;	wiznet.c:765: while(*arrbuff){
	mov	dptr,#_parseInp_PARM_2
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
	mov	dptr,#_parseInp_arrbuff_10000_150
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
00110$:
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	_parseInp_sloc0_1_0,a
	jnz	00152$
	ljmp	00121$
00152$:
;	wiznet.c:766: if (*arrbuff >= '0' && *arrbuff <= '9'){
	mov	a,#0x100 - 0x30
	add	a,_parseInp_sloc0_1_0
	jnc	00107$
	mov	a,_parseInp_sloc0_1_0
	add	a,#0xff - 0x39
	jc	00107$
;	wiznet.c:767: num = num * 10 + (*arrbuff - '0');
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_parseInp_num_10000_151
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__mulint_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x000a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	__mulint
	mov	_parseInp_sloc1_1_0,dpl
	mov	(_parseInp_sloc1_1_0 + 1),dph
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	r5,_parseInp_sloc0_1_0
	mov	r7,#0x00
	mov	a,r5
	add	a,#0xd0
	mov	r5,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_parseInp_num_10000_151
	mov	a,r5
	add	a, _parseInp_sloc1_1_0
	movx	@dptr,a
	mov	a,r7
	addc	a, (_parseInp_sloc1_1_0 + 1)
	inc	dptr
	movx	@dptr,a
	pop	ar7
	pop	ar6
	pop	ar5
	ljmp	00108$
00107$:
;	wiznet.c:769: else if (*arrbuff == '.' || *(arrbuff + 1) == '\0'){
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x2e,00155$
	pop	ar7
	pop	ar6
	pop	ar5
	sjmp	00103$
00155$:
	mov	a,#0x01
	add	a, r0
	mov	r5,a
	clr	a
	addc	a, r1
	mov	r6,a
	mov	ar7,r2
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	pop	ar5
	jz	00156$
	ljmp	00108$
00156$:
00103$:
;	wiznet.c:770: if(*(arrbuff + 1) == '\0'){
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0x01
	add	a, r0
	mov	r5,a
	clr	a
	addc	a, r1
	mov	r6,a
	mov	ar7,r2
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	pop	ar5
	jnz	00102$
;	wiznet.c:771: num = num * 10 + (*arrbuff - '0');
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_parseInp_num_10000_151
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__mulint_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x000a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	__mulint
	mov	_parseInp_sloc1_1_0,dpl
	mov	(_parseInp_sloc1_1_0 + 1),dph
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	r7,#0x00
	add	a,#0xd0
	mov	r5,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_parseInp_num_10000_151
	mov	a,r5
	add	a, _parseInp_sloc1_1_0
	movx	@dptr,a
	mov	a,r7
	addc	a, (_parseInp_sloc1_1_0 + 1)
	inc	dptr
	movx	@dptr,a
;	wiznet.c:776: arrbuff++;
	pop	ar7
	pop	ar6
	pop	ar5
;	wiznet.c:771: num = num * 10 + (*arrbuff - '0');
00102$:
;	wiznet.c:773: iparr[j++] = num;
	push	ar0
	push	ar1
	push	ar2
	mov	a,r3
	add	a, r5
	mov	_parseInp_sloc2_1_0,a
	mov	a,r4
	addc	a, r6
	mov	(_parseInp_sloc2_1_0 + 1),a
	mov	(_parseInp_sloc2_1_0 + 2),r7
	inc	r3
	cjne	r3,#0x00,00158$
	inc	r4
00158$:
	mov	dptr,#_parseInp_num_10000_151
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,_parseInp_sloc2_1_0
	mov	dph,(_parseInp_sloc2_1_0 + 1)
	mov	b,(_parseInp_sloc2_1_0 + 2)
	mov	a,r1
	lcall	__gptrput
;	wiznet.c:774: num = 0;
	mov	dptr,#_parseInp_num_10000_151
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	wiznet.c:776: arrbuff++;
	pop	ar2
	pop	ar1
	pop	ar0
;	wiznet.c:774: num = 0;
00108$:
;	wiznet.c:776: arrbuff++;
	inc	r0
	cjne	r0,#0x00,00159$
	inc	r1
00159$:
	mov	dptr,#_parseInp_arrbuff_10000_150
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	ljmp	00110$
00121$:
	mov	dptr,#_parseInp_arrbuff_10000_150
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
;	wiznet.c:778: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;command0                  Allocated with name '_main_command0_10001_157'
;i                         Allocated with name '_main_i_40001_160'
;------------------------------------------------------------
;	wiznet.c:781: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	wiznet.c:782: UART_Init();
	lcall	_UART_Init
;	wiznet.c:783: configNetwork();
	lcall	_configNetwork
;	wiznet.c:784: enableSocketInt();
	lcall	_enableSocketInt
;	wiznet.c:785: IT0 = 1;
;	assignBit
	setb	_IT0
;	wiznet.c:786: EX0 = 1;
;	assignBit
	setb	_EX0
;	wiznet.c:787: EA = 1;
;	assignBit
	setb	_EA
;	wiznet.c:788: ES = 1;
;	assignBit
	setb	_ES
;	wiznet.c:791: unsigned char command0[1] = {0b00000010};
	mov	dptr,#_main_command0_10001_157
	mov	a,#0x02
	movx	@dptr,a
;	wiznet.c:793: sendByte(0, 0b00000001, command0, 1); // Initialize the socket
	mov	dptr,#_sendByte_PARM_2
	dec	a
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_main_command0_10001_157
	movx	@dptr,a
	mov	a,#(_main_command0_10001_157 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0000
	lcall	_sendByte
;	wiznet.c:795: sendByte(0x0004, 0b00000001, port, 2); // Set the socket port
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_port
	movx	@dptr,a
	mov	a,#(_port >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0004
	lcall	_sendByte
;	wiznet.c:796: openSocket(0x0001, 0b00000001, 1);
	mov	dptr,#_openSocket_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_openSocket_PARM_3
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_openSocket
;	wiznet.c:797: enableSocketInt();
	lcall	_enableSocketInt
;	wiznet.c:800: while (1) {
00128$:
;	wiznet.c:802: if (strreceived == 1){
	mov	dptr,#_strreceived
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00226$
	sjmp	00227$
00226$:
	ljmp	00125$
00227$:
;	wiznet.c:803: for(int i = 0; i < bufferSize; i++){
	mov	r6,#0x00
	mov	r7,#0x00
00131$:
	clr	c
	mov	a,r6
	subb	a,#0x19
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00228$
	ljmp	00123$
00228$:
;	wiznet.c:804: if (bufferM[i] == '?'){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3f,00121$
;	wiznet.c:805: PrintNetworkInfo();
	push	ar7
	push	ar6
	lcall	_PrintNetworkInfo
	pop	ar6
	pop	ar7
	ljmp	00132$
00121$:
;	wiznet.c:807: else if(bufferM[i] == 'I' && bufferM[i+2] == '='){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x49,00117$
	mov	ar5,r6
	inc	r5
	inc	r5
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r4
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3d,00117$
;	wiznet.c:808: transmitString("hi");
	mov	dptr,#___str_19
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
;	wiznet.c:809: parseInp(&bufferM[i], ip, 3);
	mov	a,r6
	add	a, #_bufferM
	mov	r4,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	r5,a
	mov	r3,#0x00
	mov	dptr,#_parseInp_PARM_2
	mov	a,#_ip
	movx	@dptr,a
	mov	a,#(_ip >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_parseInp_PARM_3
	mov	a,#0x03
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	mov	b, r3
	push	ar7
	push	ar6
	lcall	_parseInp
	pop	ar6
	pop	ar7
	ljmp	00132$
00117$:
;	wiznet.c:812: else if(bufferM[i] == 'G' && bufferM[i+4] == '='){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x47,00113$
	mov	ar5,r6
	mov	a,r5
	add	a,#0x04
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r4
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3d,00113$
;	wiznet.c:813: parseInp(&bufferM[i], gateway, 5);
	mov	a,r6
	add	a, #_bufferM
	mov	r4,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	r5,a
	mov	r3,#0x00
	mov	dptr,#_parseInp_PARM_2
	mov	a,#_gateway
	movx	@dptr,a
	mov	a,#(_gateway >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_parseInp_PARM_3
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	mov	b, r3
	push	ar7
	push	ar6
	lcall	_parseInp
	pop	ar6
	pop	ar7
	ljmp	00132$
00113$:
;	wiznet.c:816: else if(bufferM[i] == 'M' && bufferM[i+3] == '='){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x4d,00109$
	mov	ar5,r6
	inc	r5
	inc	r5
	inc	r5
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r4
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3d,00109$
;	wiznet.c:817: parseInp(&bufferM[i], mac, 4);
	mov	a,r6
	add	a, #_bufferM
	mov	r4,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	r5,a
	mov	r3,#0x00
	mov	dptr,#_parseInp_PARM_2
	mov	a,#_mac
	movx	@dptr,a
	mov	a,#(_mac >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_parseInp_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	mov	b, r3
	push	ar7
	push	ar6
	lcall	_parseInp
	pop	ar6
	pop	ar7
	ljmp	00132$
00109$:
;	wiznet.c:820: else if(bufferM[i] == 'S' && bufferM[i+3] == '='){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x53,00105$
	mov	ar5,r6
	inc	r5
	inc	r5
	inc	r5
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r4
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3d,00105$
;	wiznet.c:821: parseInp(&bufferM[i], subnet, 4);
	mov	a,r6
	add	a, #_bufferM
	mov	r4,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	r5,a
	mov	r3,#0x00
	mov	dptr,#_parseInp_PARM_2
	mov	a,#_subnet
	movx	@dptr,a
	mov	a,#(_subnet >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_parseInp_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl, r4
	mov	dph, r5
	mov	b, r3
	push	ar7
	push	ar6
	lcall	_parseInp
	pop	ar6
	pop	ar7
	sjmp	00132$
00105$:
;	wiznet.c:824: else if(bufferM[i] == 'R' && bufferM[i+3] == '='){
	mov	a,r6
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r7
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x52,00132$
	mov	ar5,r6
	inc	r5
	inc	r5
	inc	r5
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	a,r5
	add	a, #_bufferM
	mov	dpl,a
	mov	a,r4
	addc	a, #(_bufferM >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x3d,00132$
;	wiznet.c:825: transmitString("hi");
	mov	dptr,#___str_19
	mov	b, #0x80
	push	ar7
	push	ar6
	lcall	_transmitString
	pop	ar6
	pop	ar7
00132$:
;	wiznet.c:803: for(int i = 0; i < bufferSize; i++){
	inc	r6
	cjne	r6,#0x00,00251$
	inc	r7
00251$:
	ljmp	00131$
00123$:
;	wiznet.c:828: transmitString(bufferM);
	mov	dptr,#_bufferM
	mov	b, #0x00
	lcall	_transmitString
;	wiznet.c:830: openSocket(0x0001, 0b00000001, 0x10);
	mov	dptr,#_openSocket_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_openSocket_PARM_3
	swap	a
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_openSocket
;	wiznet.c:831: configNetwork();
	lcall	_configNetwork
;	wiznet.c:832: sendByte(0, 0b00000001, command0, 1); // Initialize the socket
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_main_command0_10001_157
	movx	@dptr,a
	mov	a,#(_main_command0_10001_157 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	inc	a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0000
	lcall	_sendByte
;	wiznet.c:834: sendByte(0x0004, 0b00000001, port, 2); // Set the socket port
	mov	dptr,#_sendByte_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_3
	mov	a,#_port
	movx	@dptr,a
	mov	a,#(_port >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sendByte_PARM_4
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x0004
	lcall	_sendByte
;	wiznet.c:835: openSocket(0x0001, 0b00000001, 1);
	mov	dptr,#_openSocket_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_openSocket_PARM_3
	movx	@dptr,a
	mov	dptr,#0x0001
	lcall	_openSocket
;	wiznet.c:836: enableSocketInt();
	lcall	_enableSocketInt
;	wiznet.c:837: strreceived = 0;
	mov	dptr,#_strreceived
	clr	a
	movx	@dptr,a
	ljmp	00128$
00125$:
;	wiznet.c:840: handleDat();
	lcall	_handleDat
;	wiznet.c:843: }
	ljmp	00128$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "CURRENT CONFIG:"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "          CHANGE CMD:"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "RTU Addr (0-9): "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "          RTU=#"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "IP Addr: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.ascii "."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_6:
	.ascii "   IP=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_7:
	.ascii "Subnet Mask: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_8:
	.ascii "   SUB=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_9:
	.ascii "Gateway: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_10:
	.ascii "    GATE=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_11:
	.ascii "MAC Addr: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_12:
	.ascii " "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_13:
	.ascii "    MAC=FF FF FF FF FF FF"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_14:
	.ascii "Peer IP: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_15:
	.db 0x0d
	.db 0x0a
	.ascii "Peer Port: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_16:
	.db 0x0d
	.db 0x0a
	.ascii "Data Packet Size: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_17:
	.db 0x0d
	.db 0x0a
	.ascii "Peer Message: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_18:
	.ascii "Processing packet..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_19:
	.ascii "hi"
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
__xinit__RTU:
	.db #0x03	; 3
__xinit__ip:
	.db #0xc0	; 192
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x98	; 152
__xinit__mac:
	.db #0xde	; 222
	.db #0x4f	; 79	'O'
	.db #0x3d	; 61
	.db #0x4f	; 79	'O'
	.db #0x5e	; 94
	.db #0x2d	; 45
__xinit__subnet:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
__xinit__gateway:
	.db #0xc0	; 192
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
__xinit__port:
	.db #0x13	; 19
	.db #0x88	; 136
__xinit__tmpgateway:
	.db #0xc0	; 192
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x6f	; 111	'o'
__xinit__tmpip:
	.db #0xc0	; 192
	.db #0xa8	; 168
	.db #0x01	; 1
	.db #0x98	; 152
__xinit__tmpmac:
	.db #0xde	; 222
	.db #0x4f	; 79	'O'
	.db #0x3d	; 61
	.db #0x4f	; 79	'O'
	.db #0x5e	; 94
	.db #0x2d	; 45
__xinit__tmpsubnet:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
__xinit__bufIndex:
	.db #0x00	; 0
__xinit__strreceived:
	.db #0x00	; 0
__xinit__sendFlag:
	.db #0x00	;  0
__xinit__timeout:
	.byte #0x00, #0x00	; 0
__xinit__polling:
	.db #0x00	;  0
__xinit__udp:
	.db #0x01	;  1
__xinit__dataReceived:
	.db #0x00	;  0
	.area CABS    (ABS,CODE)
