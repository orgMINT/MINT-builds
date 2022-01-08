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

;Intel Hex Loader

        .ORG    ROMSTART+$0d
         JP      hexloader

        .ORG     ROMSTART+$0120
hexloader:
        POP  HL      ;discard return address
        PUSH BC
;        PUSH IX
;        PUSH IY      ;save mint state
        CALL intelhex
        LD   H,$00
        LD   L,A     ;get returned flag
        POP  BC
        PUSH HL      ;return the flag
        JP  (IY)     ;return to mint

; Intel Hex file downloader
intelhex:
        XOR    A            ;clear
        LD     C,A          ;calculated checksum
; wait for the record mark ':'
waitmark:
        CALL  getchar       ;wait for the record mark
        CP    ':'          ;to be transmitted
        JR    NZ,waitmark
;get the record length
        CALL  GetByte
        LD   B,A              ;the number of data bytes
;get the address
        CALL  GetByte
        LD    H,A              ;the address high byte
        CALL  GetByte  
        LD    L,A              ;the address low byte
;get the record type
        CALL  GetByte
        JR    NZ,checksum      ;end of file record
        
;C=checksum
;B=number of data bytes
;hl=destination address

loadbytes:
        CALL  GetByte           ;get the record bytes
        LD    (HL),A            ;and save to RAM
        INC   HL                ;until there are
        DJNZ  loadbytes         ;no more
        CALL  checksum          ;checksum OK?
        JR    Z,intelhex        ;checksum OK, get next record
        RET                     ;checksum error A>0

;the sum of all the bytes (except record mark )
;including the checksum equals zero
checksum:  
        CALL  GetByte
        LD    A,C
        OR    $00               ;checksum ok  A=0
        RET

;get and convert two characters to byte
;--------------------------------------
GetByte:
        CALL   GetNybble        ;get the high nybble
        SLA    A
        SLA    A
        SLA    A
        SLA    A
        LD     D,A
        CALL   GetNybble        ;get the low nybble
        OR     D                ;make a byte
        PUSH   AF
        ADD    A,C              ;add to
        LD     C,A              ;the checksum
        POP    AF               ;and return the received byte
        RET
        
; get a nybble 
;-------------
GetNybble:
      CALL    getchar
      BIT     6,A          ;convert ascii A-F
      JR     Z,NotA2F        ;into lower
      ADD     A,09H        ;nybble hex
NotA2F: AND     0FH
      RET
