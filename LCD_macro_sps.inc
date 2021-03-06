; ������������� LCD

.MACRO	INIT_LCD

			WR_CMD	0b00111000
			WR_CMD	0b00001100
			WR_CMD	0b00000001

.ENDM

;===============================================================================================
; ������ ������� 

.MACRO	WR_CMD

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ������ ������

.MACRO	WR_DATA

			SETB	PORTB,1,R16	; [RS]	[1]	// ������

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ����� ������� �� ��. ������
.MACRO	SHIFT

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,0b00000110,R16
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ������� �� ������ ������ ������
.MACRO	RETURN

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,0b11000000
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ��������� �������
.MACRO	DISP_OFF

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,0b00001000
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			DLOOP	100,100
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; �������� �������
.MACRO	DISP_ON

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,0b00001100
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ����� ������
.MACRO	PRINT

			SETB	PORTB,1,R16	; [RS]	[1]	// �������� ������

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ��������� �������
.MACRO	CLEAR

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			LDI		VP_REG,0b00000001
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ������ ������� 

.MACRO	WR_CMD_REG

			CLRB	PORTB,1,R16	; [RS]	[0]	// �������

			MOV		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; ������ ������� 

.MACRO	WR_DT_REG

			SETB	PORTB,1,R16	; [RS]	[1]	// �������� ������

			MOV		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
