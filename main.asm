.include "header.asm"
.include "snes.asm"
.include "SPC/spc.asm"




Main:
	sei
	clc
    xce

	rep #$10	;16 bit xy
	sep #$20	; 8 bit a
	
	;-------------------
    SNES_INIT
    
    
    ;SPC INIT
    SPC_Procedure1
	
	SPC_Procedure2 SPCRAM
	SPC_Procedure3 SPCROM,$1900
	
	SPC_Procedure5 SPCRAM
	
	;init variable for driver
	lda #0
	sta $7E2001
	;Enable Driver
	LKS_SPC_Set LKS_SPC_CONTROL,LKS_SPC_ON,0
	
	;Volume
	LKS_SPC_Set LKS_SPC_VOLUME,$30,$30
	
	;partition track 0
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_track0
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music0_track0,874
	
	;header track 0
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_HEADER0
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music0_track0_info,$10
	
	;info music
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_INFO
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music0_info,$14
	
	
	;sample
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRRsin,10
    
    
    ;Play Music
    LKS_SPC_Set LKS_SPC_PLAY,LKS_SPC_ON,0
    
	Game:	
		

		
		wai

    jmp Game
    
    

VBlank:

	rti

Timer:

	rti
	
SPCROM:
	.incbin "SKSdriver.spc"
	
Music0_track0:
	.incbin "music/track0.sns"
	
Music0_track0_info:
.db $00 ;srcn
.db $89 ;adsr1
.db $1F ;adsr2
.db $CF ;gain

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

Music0_info:
.db $00 ;flg
.db $01 ;kon
.db $00 ;pmon
.db $00 ;non

.db $00 ;esa
.db $00 ;edl
.db $00 ;eon
.db $00 ;efb

.db $00 ;evoll
.db $00 ;evolr
.db $00 ;c0
.db $00 ;c1

.db $00 ;c2
.db $00 ;c3
.db $00 ;c4
.db $00 ;c5

.db $00 ;c6
.db $00 ;c7
.db $00 ;end music
.db $41 ;end music+1
