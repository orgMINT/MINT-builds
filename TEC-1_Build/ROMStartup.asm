; *************************************************************************
;
;       MINT Minimal Interpreter for the Z80 
;
;       Ken Boak, John Hardy and Craig Jones. 
;
;       GNU GENERAL PUBLIC LICENSE                   Version 3, 29 June 2007
;
;       see the LICENSE file in this repo for more information 
;
; *****************************************************************************

; ROM  startup code

        .ORG ROMSTART

RSTVEC:
        JP	RESET
;RST 1
    	.ORG	ROMSTART+$08
    	PUSH	HL
    	LD	HL,(RST08)
    	JP	(HL)
    
;RST 2
        .ORG ROMSTART+$10
    	PUSH	HL
    	LD	HL,(RST10)
    	JP	(HL)

;RST 3
        .ORG ROMSTART+$18 
    	PUSH	HL
    	LD	HL,(RST18)
    	JP	(HL)
    
;RST 4
        .ORG ROMSTART+$20
    	PUSH	HL
    	LD	HL,(RST20)
    	JP	(HL)

;RST 5
    	.ORG ROMSTART+$28
    	PUSH	HL
    	LD	HL,(RST28)
    	JP	(HL)

;RST 6
    	.ORG ROMSTART+$30
        PUSH	HL
    	LD	HL,(RST30)
    	JP	(HL)

;RST 7 Interrupt
    	.ORG	ROMSTART+$38
    	PUSH	HL
    	LD	HL,(INTVEC)
    	JP	(HL)
        RETI

;RST 8  Non Maskable Interrupt
        .ORG ROMSTART+$66
        PUSH	HL
        LD	HL,(NMIVEC)
        JP	(HL)

RESET:   
        ld SP,stack
        LD HL,IntRet
    	LD (RST08),HL
    	LD (RST10),HL
    	LD (RST18),HL
    	LD (RST20),HL
    	LD (RST28),HL
    	LD (RST30),HL
        LD (INTVEC),HL
        LD (NMIVEC),HL
