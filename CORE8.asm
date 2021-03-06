			.include "m8def.inc"	; ���������� ATMega8
			.include "macro.asm"	; ��� ������� � ��� ���
			.include "LCD_macro_sps.inc"	; ������� ������� � LCD

; RAM =====================================================
			.DSEG					; ���������� 

; FLASH ===================================================
			.CSEG

			.include "vectors.asm"	; ��� ������� ���������� �������� � ���� �����
			.ORG	INT_VECTORS_SIZE

			
			.include "ints.asm"


Reset:		ldi r16, high(RAMEND); Main program start
 			out  SPH,r16 ; Set Stack Pointer to top of RAM
 			ldi r16,  low(RAMEND)
 			out SPL,r16
			
			.include "initial.asm"			; ��� ������������� ���.

			sei ; Enable interrupts

	    //	OUTU '+'

//////////////////////////////////////////////////////////////////////////////
////////////                    ������ ���������                 /////////////
//////////////////////////////////////////////////////////////////////////////
INIT_LCD
/////////////////////////////////////////////////////////////////////
// �����������

CLEAR

	//==== ������ ������ =====

	PRINT	0x53	;[S]
	PRINT	0x50	;[P]
	PRINT	0x53	;[S]
	PRINT	0x3A	;[:]
	PRINT	0x54	;[T]
	PRINT	0x45	;[E]
	PRINT	0x43	;[C]
	PRINT	0x48	;[H]

//==== ������ ������ =====

	RETURN	; �� ��������� ������

	PRINT	0x3C	;[<]
	PRINT	0xC8	;[<<]
	PRINT	0x32	;[2]
	PRINT	0x30	;[0]
	PRINT	0x31	;[1]
	PRINT	0x35	;[5]
	PRINT	0xC9	;[>>]
	PRINT	0x3E	;[>]

	DDLOOP 100,255,255
/////////////////////////////////////////////////////////////////////
// ������� �����

CLEAR

//==== ������ ������ =====

	PRINT	0x2D	;[-]
	PRINT	0x20	;[]
	PRINT	0xE0	;[�] E3
	PRINT	0x61	;[�]
	PRINT	0xBB	;[�]
	PRINT	0xC4	;[�]
	PRINT	0x20	;[]
	PRINT	0x2D	;[-]


//==== ������ ������ =====

	RETURN	; �� ��������� ������

	PRINT	0x20	;[]
	PRINT	0x20	;[]
	PRINT	0x5F	;[_]
	PRINT	0x5F	;[_]
	PRINT	0x5F	;[_]
	PRINT	0x20	;[]
	PRINT	0x63	;[c]
	PRINT	0xBC	;[m]

/////////////////////////////////////////////////////////////////////
	
	CLR		cBUF
	CLR		COUNT2
	CLR		COUNT3

while1:

	SETB	PORTC,3,R16	; ���� [1]

	DDLOOP 1,255,255

	CLRB	PORTC,3,R16	; ���� [0]

wait:
	
	NOP

	SBIC	PINC,2
	RJMP	cont
	RJMP	wait

cont:

	CLR	cBUF

	LDI	R16,(1<<CS01)	;
	OUT	TCCR0, R16		; ������������� �������

incrm:
	
	SBIS	PINC,2
	RJMP	outd
	RJMP	incrm

outd:

	LDI	R16,(0<<CS01)	;
	OUT	TCCR0, R16		; ������������� �������

	INC	cBUF

	ADD	COUNT3,cBUF

	INC	COUNT2
	CPI	COUNT2,4
	BREQ	outsr
	RJMP 	while1


outsr:

	MOV	cBUF,COUNT3


	LSR	cBUF
//	LSR	cBUF

	RCALL 	OUT_CIK		; ����� �������� ����������

	CLR		COUNT2
	CLR		COUNT3

	DDLOOP 10,255,255


RJMP while1

//////////////////////////////////////////////////////////////////////////////
////////////                	����� ����������   	   	         /////////////
//////////////////////////////////////////////////////////////////////////////
OUT_CIK:

	RCALL	CONV

	RETURN	; �� ��������� ������

	PRINT	0x20	;[]
	PRINT	0x20	;[]
	PRINT	0x20	;[]
	WR_DT_REG	Ra2
	WR_DT_REG	Ra3

RET
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
////////////            	������������� �������� 	   	         /////////////
//////////////////////////////////////////////////////////////////////////////
CONV:
	CLR		COUNT
	CLR		Ra1
	CLR		Ra2
	CLR		Ra3

sch:

	CP		COUNT,cBUF
	BREQ	exits

	INC		COUNT

//--------------------------

	INC		Ra3
	CPI		Ra3,10
	BRNE	sch
	CLR		Ra3

//--------------------------

	INC		Ra2
	CPI		Ra2,10
	BRNE	sch
	CLR		Ra2

//--------------------------

	INC		Ra1
	CPI		Ra1,10
	BRNE	sch
	CLR		Ra1

//--------------------------

	RJMP	sch

exits:		; �������� �� ������� �������� LCD

	LDI	R16,48
	ADD	Ra1,R16
	ADD	Ra2,R16
	ADD	Ra3,R16

RET
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
////////////               	      ����������                     /////////////
//////////////////////////////////////////////////////////////////////////////

	.include "VPort.asm"	 ; ���������� ������������ �����
	.include "LCD_sps.asm"	; ���������� LCD

	
; EEPROM ==================================================
		.ESEG			; ������� EEPROM  
