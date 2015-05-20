; Инициализация LCD

.MACRO	INIT_LCD

			WR_CMD	0b00111000
			WR_CMD	0b00001100
			WR_CMD	0b00000001

.ENDM

;===============================================================================================
; Запись команды 

.MACRO	WR_CMD

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Запись данных

.MACRO	WR_DATA

			SETB	PORTB,1,R16	; [RS]	[1]	// данные

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Сдвиг курсора на сл. символ
.MACRO	SHIFT

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,0b00000110,R16
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Переход на начало второй строки
.MACRO	RETURN

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,0b11000000
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Отключить дисплей
.MACRO	DISP_OFF

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,0b00001000
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			DLOOP	100,100
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Включить дисплей
.MACRO	DISP_ON

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,0b00001100
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Вывод текста
.MACRO	PRINT

			SETB	PORTB,1,R16	; [RS]	[1]	// пичатаем символ

			LDI		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Отчистить дисплей
.MACRO	CLEAR

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			LDI		VP_REG,0b00000001
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Запись команды 

.MACRO	WR_CMD_REG

			CLRB	PORTB,1,R16	; [RS]	[0]	// команды

			MOV		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
;===============================================================================================
; Запись команды 

.MACRO	WR_DT_REG

			SETB	PORTB,1,R16	; [RS]	[1]	// печатаем символ

			MOV		VP_REG,@0
			RCALL	VRPort

			SETB		PORTB,2,R16	; [E]	[1]
			RCALL 	LCD_DEALY
			CLRB		PORTB,2,R16	; [E]	[1]

.ENDM
