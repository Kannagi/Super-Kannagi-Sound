

SPLDIR:
	.include "music/dir.asm"
	
Music2_pattern:
	.incbin "music/manafort1.sks"
Music2_patternEOF:

Music2_header:
	.incbin "music/manafort1_header.sks"
Music2_headerEOF:


BRR_Piano:
	.incbin "music/brr/Piano.brr"
BRR_PianoEOF:



BRRsin:
.db $C3

.db $03
.db $56
.db $75
.db $3E

.db $B9
.db $98
.db $9B
.db $E0

Music2_header2:
.db $00 ;flg
.db $01 ;kon
.db $00 ;esa
.db $00 ;edl

.db $00 ;efb
.db $00 ;evoll
.db $00 ;evolr
.db $00 ;firc0

.db $00 ;firc1
.db $00 ;firc2
.db $00 ;firc3
.db $00 ;firc4

.db $00 ;firc5
.db $00 ;firc6
.db $00 ;firc7
.db $00 ;emusic
.db $41 ;emusic+1
.db $00,$00,$00,$00,$00,$00,$00 ;unused

.db $16 ;track 0
.db $1A ;track 1
.db $1C ;track 2
.db $1E ;track 3

.db $1F ;track 4
.db $20 ;track 5
.db $24 ;track 6
.db $26 ;track 7


;INDEX
.db $00 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $00 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $01 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $02 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $03 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $04 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $05 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $06 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $07 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $08 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $09 ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $0A ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $0B ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $0C ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain

.db $0D ;srcn
.db $FF ;adsr1
.db $E0 ;adsr2
.db $7F ;gain
