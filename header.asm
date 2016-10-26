.MEMORYMAP
	SLOTSIZE $8000 ; The slot is $8000 bytes in size. More details on slots later.
	DEFAULTSLOT 0 ; There's only 1 slot in SNES, there are more in other consoles.
	SLOT 0 $8000 ; Defines Slot 0's starting address.
.ENDME


.ROMBANKSIZE $8000
.ROMBANKS 16

; R/BANK ko
; 9/16  512
; A/32  1024
; B/64  2048
; C/128 4096
; D/256 8192

.SNESHEADER
	ID    "SNES"
	NAME  "The World of Demon   "
	;     "123456789012345678901"
	LOROM
	SLOWROM
	CARTRIDGETYPE $02
	ROMSIZE $09 ;size rom 09-0c
	SRAMSIZE $03
	COUNTRY $01 ;0 = japan , 1 = US , 2 = Europe
	LICENSEECODE $01
	VERSION 00
.ENDSNES

;65816
.SNESNATIVEVECTOR
	COP    $0000
	BRK    $0000
	ABORT  $0000
	NMI    VBlank
	UNUSED Main
	IRQ    Timer
.ENDNATIVEVECTOR

;6502
.SNESEMUVECTOR
	COP    $0000
	UNUSED $0000
	ABORT  $0000
	NMI    $0000
	RESET  Main
	IRQBRK $0000
.ENDEMUVECTOR



.MACRO header
/*
	;Extension
	.db $00,$00 ;Maker Code
	.db "SNES"  ;Game Code ASCII
	.db $00,$00,$00,$00,$00,$00,$00 ;Fixed Value
	.db $00 ; RAM Size
	.db $00 ; Special Version
	.db $00 ; Cartridge Type Sub-Number
	
	;Header old
	.db "Fighter Fury         " ;Game Title
	;   "123456789012345678901"
	.db $20 ; Mode Map
	.db $00 ; Cartridge Type
	.db $09 ; ROM Size
	.db $00 ; RAM Size
	.db $01 ; Destination Code
	.db $00 ; Fixed Value
	.db $00 ; Mask ROM Value
	.db $E8 , $DC ; Complement Check
	.db $17 , $23 ; Check sum
	
	.db $00,$00,$00,$00
	.dw $0000  ; COP
	.dw $0000  ; BRK
	.dw $0000  ; ABORT
	.dw VBlank ; NMI
	.dw Main   ; RESET
	.dw Timer  ; IRQ
	
	.db $00,$00,$00,$00
	.dw $0000  ; COP
	.dw $0000  ; BRK
	.dw $0000  ; ABORT
	.dw VBlank ; NMI
	.dw Main   ; RESET
	.dw Timer  ; IRQBRK
	*/
.ENDM

