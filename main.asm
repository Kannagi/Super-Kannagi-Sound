.include "header.asm"
.include "snes.asm"
.include "SPC/spc.asm"

.include "MC_libks.asm"

.define select $400
.define select2 $408

.define spitch $401
.define svolume $402
.define ssrcn $403
.define smvolume $404

Int:
	
	rti
	
Main:
	
	sei
	clc
	xce

	
	rep #$10	;16 bit xy
	sep #$20	; 8 bit a

	
	SNES_INIDISP $80
	SNES_NMITIMEN $00
	LKS_Clear_RAM
	
	SPC_Procedure1
	;-------------------
	SPC_Procedure2 SPCRAM
	SPC_Procedure3 SPCROM
	
	SPC_Procedure5 SPCRAM
	
	lda #0
	sta LKS_SPC_VAR
	
	
Reset:
	rep #$10	;16 bit xy
	sep #$20	; 8 bit a
	
	SNES_INIDISP $80
	SNES_NMITIMEN $00
	LKS_Clear_RAM
	
	
	
Begin:

    SNES_INIT
    
    jsr music_load1
	LKS_SPC_Set LKS_SPC_VOLUME,$30,$30
	LKS_SPC_Set LKS_SPC_BRR_VOLUME,$20,$20
	LKS_SPC_Set LKS_SPC_PLAY,LKS_SPC_LOOP,0
    
	
    ;INITIAL SETTINGS

	;background
	SNES_BGMODE $01 ; mode 1

	SNES_BG3SC $58 ; address data BG3 $5800
	
	SNES_BGNBA $00 $04; address BG1,2,3,4 (2,1 / 4,3)
	
	;general init
	SNES_SETINI $00
	SNES_MEMSEL $00
	SNES_WRIO $FF
    SNES_TM $04 ; bg 3 enable
    SNES_COLDATA $E0
    
    SNES_VMAINC $80

    LKS_Clear_VRAM
    
    ;load font
    LKS_LOAD_VRAM $4000,$00,bpp_font,$400
    LKS_LOAD_CG $00,pallette_fontm,$10
	lda #$70
	sta spitch
	
	lda #$20
	sta svolume
	
	lda #5
	sta ssrcn
	
	
	lda	RDNMI
	SNES_INIDISP $00 ;  brigtness 0
	SNES_NMITIMEN $81 ; Enable NMI , enable joypad
	wai
	SNES_INIDISP $0F
   
	Game:
	
		jsl LKS_Joypad
		
		;control select
		lda LKS_STDCTRL+_UP
		cmp #1
		bne +
			dec select
		+:
		
		lda LKS_STDCTRL+_DOWN
		cmp #1
		bne +
			inc select
		+:
		
		lda select
		cmp #$FF
		bne +
			stz select
		+:
		
		
		lda select
		cmp #4
		bmi +
			stz select
		+:
		
		
		
		lda LKS_STDCTRL+_LEFT
		cmp #2
		bne +
			lda select
			cmp #0
			bne ++
				dec spitch
			++:
			cmp #1
			bne ++
				dec svolume
			++:
		+:
		
		lda LKS_STDCTRL+_RIGHT
		cmp #2
		bne +
			lda select
			cmp #0
			bne ++
				inc spitch
			++:
			cmp #1
			bne ++
				inc svolume
			++:
		+:
		
		lda LKS_STDCTRL+_LEFT
		cmp #1
		bne +
			lda select
			cmp #2
			bne ++
				dec ssrcn
			++:
			cmp #3
			bne ++
				dec select2
			++:
		+:
		
		lda LKS_STDCTRL+_RIGHT
		cmp #1
		bne +
			lda select
			cmp #2
			bne ++
				inc ssrcn
			++:
			
			cmp #3
			bne ++
				inc select2
			++:
		+:
		
		lda select2
		cmp #$FF
		bne +
			stz select2
		+:
		
		
		lda select2
		cmp #3
		bmi +
			stz select2
		+:
		
		lda svolume
		sta APUIO2
		sta APUIO3
		LKS_SPC_Set_var LKS_SPC_BRR_VOLUME
		
		lda spitch
		sta APUIO2
		
		lda ssrcn
		sta APUIO3
		
		lda LKS_STDCTRL+_START
		cmp #1
		bne +
			lda select
			cmp #3
			beq ++
				
				LKS_SPC_Set_var LKS_SPC_BRR_PLAY
				bra +
			++:
		
		
			jsr fselect2
			
		+:
		
		
		jsr Text_draw
		wai

    jmp Game
    
fselect2
	lda select2
	cmp #0
	bne ++
		LKS_SPC_Set LKS_SPC_PLAY,LKS_SPC_ON,0
	++:
	
	cmp #1
	bne ++
		LKS_SPC_Set LKS_SPC_PLAY,LKS_SPC_OFF,0
	++:
	
	cmp #2
	bne ++
		LKS_SPC_Set LKS_SPC_PLAY,LKS_SPC_LOOP,0
	++:

	rts
    
Text_draw:


	
	;pitch
	lda select
	cmp #0
	bne +
		LKS_printf_setpal 1
		bra ++
	+:
		LKS_printf_setpal 0
	++:
	
	ldx	#text_s1
	LKS_printfs 1,3
	lda spitch
	LKS_printh8 18,3
	
	;volume
	lda select
	cmp #1
	bne +
		LKS_printf_setpal 1
		bra ++
	+:
		LKS_printf_setpal 0
	++:
	
	ldx	#text_s2
	LKS_printfs 1,4	
	lda svolume
	LKS_printh8 18,4
	
	;srcn
	lda select
	cmp #2
	bne +
		LKS_printf_setpal 1
		bra ++
	+:
		LKS_printf_setpal 0
	++:
	
	ldx	#text_s3
	LKS_printfs 1,5	
	lda ssrcn
	LKS_printh8 18,5
	
	;control
	lda select
	cmp #3
	bne +
		LKS_printf_setpal 1
		bra ++
	+:
		LKS_printf_setpal 0
	++:
	
	ldx	#text_s7
	LKS_printfs 1,6	
	
	lda select2
	cmp #0
	bne +
		ldx	#text_s4
	+:
	
	lda select2
	cmp #1
	bne +
		ldx	#text_s5
	+:
	
	lda select2
	cmp #2
	bne +
		ldx	#text_s6
	+:
	
	LKS_printfs 16,6	
	
	
	
	;-------------------------------
	LKS_printf_setpal 0
	LKS_SPC_Get LKS_SPC_TICKS
	ldy APUIO2
	LKS_printf16 6,1
		
	ldx	#text_ticks
	LKS_printfs 1,1
	
	ldx	#text_start
	LKS_printfs 5,14
	rts
	
text_s1:
	.db "sound brr pitch",0

text_s2:
	.db "sound brr volume",0
	
text_s3:
	.db "sound brr srcn",0
	
text_s7:
	.db "sound control",0
	
text_s4:
	.db "play",0
	
text_s5:
	.db "stop",0	
	
text_s6:
	.db "loop",0
	
text_ticks:
	.db "tick",0
    
    
text_start:
	.db "press the start button",0
    

VBlank:
	phd
	php
	phb
	pha
    phx
    phy
    
    rep #$10	;16 bit xy
	sep #$20	; 8 bit a
    
    lda RDNMI

	SNES_DMAX $01
	SNES_DMAX_BADD $18

	
	jsl LKS_DMA_BG3

	-:
		lda HVBJOY
		and #$01
    bne -
	
	
    jsl LKS_NMI_Joypad
    
	ply
	plx
	pla
	plb
	
	plp
	pld

	rti

Timer:

	rti
	
music_load0:

	
	;track
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_TRACK
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music2_pattern,$1204
	
	;header
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_HEADER
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music2_header2,$100
	
	;sample
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Piano,BRR_PianoEOF-BRR_Piano
	
	
	;sample dir
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SPLDIR
	LKS_SPC_Set3_2 LKS_SPC_DATA2,SPLDIR,$400
	
	
	
	rts
	
music_load1:
	
	;track
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_TRACK
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music2_pattern,$1204
	
	;header
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_HEADER
	LKS_SPC_Set3_2 LKS_SPC_DATA2,Music2_header2,$100
	
	;sample
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Piano,BRR_PianoEOF-BRR_Piano
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$1000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Strings,BRR_StringsEOF-BRR_Strings
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$3000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Flute,BRR_FluteEOF-BRR_Flute
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$4000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Voice,BRR_VoiceEOF-BRR_Voice
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$5000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_BassGuitar,BRR_BassGuitarEOF-BRR_BassGuitar
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$5800
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_ClosedHiHat,BRR_ClosedHiHatEOF-BRR_ClosedHiHat
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$6000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_OpenHiHat,BRR_OpenHiHatEOF-BRR_OpenHiHat
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$8000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_BassDrum,BRR_BassDrumEOF-BRR_BassDrum
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$9000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_HeavySnare,BRR_HeavySnareEOF-BRR_HeavySnare
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$B000
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Oboe,BRR_OboeEOF-BRR_Oboe
	
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SAMPLE+$B800
	LKS_SPC_Set3_2 LKS_SPC_DATA2,BRR_Xylophone,BRR_XylophoneEOF-BRR_Xylophone
	
	;sample dir
	LKS_SPC_Set2 LKS_SPC_ADDR,LKS_SPC_SPLDIR
	LKS_SPC_Set3_2 LKS_SPC_DATA2,SPLDIR,$400
	
	
	
	rts
	
	
SPCROM:
	.incbin "driver.spc"
	

	.include "music2_data.asm"
	
	.include "libks.asm"
	
bpp_font:
	.include "DATA/fontm.asm"
	
.bank 1 slot 0
.org 0
	
BRR_Strings:
	.incbin "music/brr/Strings.brr"
BRR_StringsEOF:

BRR_Voice:
	.incbin "music/brr/Voice.brr"
BRR_VoiceEOF:

BRR_OpenHiHat:
	.incbin "music/brr/OpenHiHat.brr"
BRR_OpenHiHatEOF:

BRR_Oboe:
	.incbin "music/brr/Oboe.brr"
BRR_OboeEOF:

BRR_HeavySnare:
	.incbin "music/brr/HeavySnare.brr"
BRR_HeavySnareEOF:

BRR_Flute:
	.incbin "music/brr/Flute.brr"
BRR_FluteEOF:

BRR_ClosedHiHat:
	.incbin "music/brr/ClosedHiHat.brr"
BRR_ClosedHiHatEOF:

BRR_BassGuitar:
	.incbin "music/brr/BassGuitar.brr"
BRR_BassGuitarEOF:

BRR_BassDrum:
	.incbin "music/brr/BassDrum.brr"
BRR_BassDrumEOF:

BRR_Xylophone:
	.incbin "music/brr/Xylophone.brr"
BRR_XylophoneEOF:
	

