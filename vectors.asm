
			.ORG 	0x0000			; ���� �������� � ����, �� ������ ���� ������� 
			RJMP 	Reset			; ����������, ������� ������� ����� �� �������
									; �� ������ ���������. �� ����� Reset


; ��� ������������� ������� �������� ��������� ����. ���� ��� ��� ������, ��
; ����� ������� ����� ������������ �����, ��� ������ �����. ��� ��� �� ��������.
; � ��� ���� ���������� �� ����� m8def.inc � ������� ��� .equ �� .org, � �����
; ������� ����� ������� RETI. �� ������ ���� ���������� ����� �������, ����� 
; ��������� ���� �� ������ ����������. 

			.ORG	INT0addr		; External Interrupt Request 0
			RETI
			.ORG	INT1addr		; External Interrupt Request 1
			RETI
			.ORG	OC2addr			; Timer/Counter2 Compare Match
			RETI
			.ORG	OVF2addr		; Timer/Counter2 Overflow
			RETI
			.ORG	ICP1addr		; Timer/Counter1 Capture Event
			RETI
			.ORG	OC1Aaddr		; Timer/Counter1 Compare Match A
			RETI
			.ORG	OC1Baddr		; Timer/Counter1 Compare Match B
			RETI
			.ORG	OVF1addr		; Timer/Counter1 Overflow
			RETI
			.ORG	OVF0addr		; Timer/Counter0 Overflow
			RJMP	T0_OK
			.ORG	SPIaddr			; Serial Transfer Complete
			RETI
			.ORG	URXCaddr		; USART, Rx Complete
			RETI
			.ORG	UDREaddr		; USART Data Register Empty
			RETI
			.ORG	UTXCaddr		; USART, Tx Complete
			RETI
			.ORG	ADCCaddr		; ADC Conversion Complete
			RJMP	ADC_OK
			.ORG	ERDYaddr		; EEPROM Ready
			RETI
			.ORG	ACIaddr			; Analog Comparator
			RETI
			.ORG	TWIaddr			; 2-wire Serial Interface
			RETI
			.ORG	SPMRaddr		; Store Program Memory Ready
			RETI
