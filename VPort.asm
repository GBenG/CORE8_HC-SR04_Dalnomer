
//////////////////////////
//	MOV		VP_REG,X	//
//	RCALL	VRPort		//
//////////////////////////

;====================================
; Virtual Port ==== Virtual Port
;====================================
.def	VP_REG	= R16
 
.equ	VPort0 	= PORTB
.equ	VPort1 	= PORTB
.equ	VPort2 	= PORTD
.equ	VPort3 	= PORTD
.equ	VPort4 	= PORTD
.equ	VPort5 	= PORTD
.equ	VPort6 	= PORTD
.equ	VPort7 	= PORTD

.equ	VDDR0	= DDRB
.equ	VDDR1	= DDRB
.equ	VDDR2	= DDRD
.equ	VDDR3	= DDRD
.equ	VDDR4	= DDRD
.equ	VDDR5	= DDRD
.equ	VDDR6	= DDRD
.equ	VDDR7	= DDRD
 
.equ	VPIN0	= PINB
.equ	VPIN1	= PINB
.equ	VPIN2	= PIND
.equ	VPIN3	= PIND
.equ	VPIN4	= PIND
.equ	VPIN5	= PIND
.equ	VPIN6	= PIND
.equ	VPIN7	= PIND
 
.equ	VP0	= 3
.equ	VP1	= 0
.equ	VP2	= 7
.equ	VP3	= 6
.equ	VP4	= 5
.equ	VP5	= 4
.equ	VP6	= 3
.equ	VP7	= 2

;===================================================================================
VRPort:		SBRS	VP_REG,0
			CBI		VPORT0,VP0
			SBRC	VP_REG,0
			SBI		VPORT0,VP0

			SBRS	VP_REG,1
			CBI		VPORT1,VP1
			SBRC	VP_REG,1
			SBI		VPORT1,VP1

			SBRS	VP_REG,2
			CBI		VPORT2,VP2
			SBRC	VP_REG,2
			SBI		VPORT2,VP2

			SBRS	VP_REG,3
			CBI		VPORT3,VP3
			SBRC	VP_REG,3
			SBI		VPORT3,VP3

			SBRS	VP_REG,4
			CBI		VPORT4,VP4
			SBRC	VP_REG,4
			SBI		VPORT4,VP4

			SBRS	VP_REG,5
			CBI		VPORT5,VP5
			SBRC	VP_REG,5
			SBI		VPORT5,VP5

			SBRS	VP_REG,6
			CBI		VPORT6,VP6
			SBRC	VP_REG,6
			SBI		VPORT6,VP6

			SBRS	VP_REG,7
			CBI		VPORT7,VP7
			SBRC	VP_REG,7
			SBI		VPORT7,VP7
			RET

VRDDR:		SBRS	VP_REG,0
			CBI		VDDR0,VP0
			SBRC	VP_REG,0
			SBI		VDDR0,VP0

			SBRS	VP_REG,1
			CBI		VDDR1,VP1
			SBRC	VP_REG,1
			SBI		VDDR1,VP1

			SBRS	VP_REG,2
			CBI		VDDR2,VP2
			SBRC	VP_REG,2
			SBI		VDDR2,VP2

			SBRS	VP_REG,3
			CBI		VDDR3,VP3
			SBRC	VP_REG,3
			SBI		VDDR3,VP3

			SBRS	VP_REG,4
			CBI		VDDR4,VP4
			SBRC	VP_REG,4
			SBI		VDDR4,VP4

			SBRS	VP_REG,5
			CBI		VDDR5,VP5
			SBRC	VP_REG,5
			SBI		VDDR5,VP5

			SBRS	VP_REG,6
			CBI		VDDR6,VP6
			SBRC	VP_REG,6
			SBI		VDDR6,VP6

			SBRS	VP_REG,7
			CBI		VDDR7,VP7
			SBRC	VP_REG,7
			SBI		VDDR7,VP7
			RET

VRPIN:		CLR		VP_REG
			SBIC	VPIN0,VP0
			SBR		VP_REG,1

			SBIC	VPIN1,VP1
			SBR		VP_REG,2

			SBIC	VPIN2,VP2
			SBR		VP_REG,4

			SBIC	VPIN3,VP3
			SBR		VP_REG,8

			SBIC	VPIN4,VP4
			SBR		VP_REG,16

			SBIC	VPIN5,VP5
			SBR		VP_REG,32

			SBIC	VPIN6,VP6
			SBR		VP_REG,64

			SBIC	VPIN7,VP7
			SBR		VP_REG,128
			RET
