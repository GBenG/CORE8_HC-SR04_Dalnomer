;=========== LCD Define ==================================================================
	
			.equ	DATA_PORT	= PORTD	; LCD Data Port
			.equ	DATA_PIN	= PIND
			.equ	DATA_DDR	= DDRD

			.equ	CMD_PORT	= PORTC	; LCD Control Port
			.equ	CMD_PIN		= PINC
			.equ	CMD_DDR		= DDRC

			.equ	E		= 6
			.equ	RS		= 7

;================================================================================

LCD_DEALY:

DLOOP	100,100

RET
