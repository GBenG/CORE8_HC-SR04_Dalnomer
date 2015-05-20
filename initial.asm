
		.def	uBUF		= R18
		.def	aBUF		= R19
		.def	cBUF		= R20
		.def	Ra1			= R21
		.def	Ra2			= R22
		.def	Ra3			= R23.
		.def	COUNT		= R24
		.def	COUNT2		= R25
		.def	COUNT3		= R26




///////////////// инициализация UART /////////////////  

			.equ XTAL 			= 16000000 
			.equ baudrate 		= 9600
			.equ bauddivider 	= XTAL/(16*baudrate)-1

			
			OUTI 	UBRRL,low(bauddivider)
			OUTI 	UBRRH,high(bauddivider)
			OUTI 	UCSRA, 0
			OUTI 	UCSRB,(1<<RXEN)|(1<<TXEN)|(1<<RXCIE)|(0<<TXCIE)
			OUTI 	UCSRC,(1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1)

///////////////////////////////////////////////////// 


//************************************************************************

; Internal Hardware Init  ======================================

	SETB	TIMSK,TOIE0,R16	; Включаем прерывание по переполнению Т1

	LDI	R16,(1<<ISC00)	;
	OUT	MCUCR, R16		; Инициализация таймера

	LDI	R16,(1<<CS02|1<<CS00)	;
	OUT	TCCR0, R16		; Инициализация таймера


//************************************************************************
			
		SETB	DDRC,3,R16	; выход
		CLRB	PORTC,3,R16	; вход

		CLRB	DDRC,2,R16	; вход
		CLRB	PORTC,2,R16	; без подтяжко

//-------------------------------------------- PORTs

		SETB	DDRB,0,R16	; выход	[DB1]
		SETB	DDRB,1,R16	; выход	[RS]
		SETB	DDRB,2,R16	; выход	[E]
		SETB	DDRB,3,R16	; выход	[DB0]
		SETB	DDRD,2,R16	; выход	[DB7]
		SETB	DDRD,3,R16	; выход	[DB6]
		SETB	DDRD,4,R16	; выход	[DB5]
		SETB	DDRD,5,R16	; выход	[DB4]
		SETB	DDRD,6,R16	; выход	[DB3]
		SETB	DDRD,7,R16	; выход	[DB2]



PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
PUSH	R20
 
; End Internal Hardware Init ===================================




