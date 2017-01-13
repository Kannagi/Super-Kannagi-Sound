


	
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
	lda LKS_VBLANK
	cmp #$00
	bne +
		
		ply
		plx
		pla
		plb
		
		plp
		pld
		
		rti
	+:
    
    lda #1
	sta LKS_VBLANK+_vblenable
	
	
	
	;lda	TIMEUP
	
	
	
	jsl LKS_DMA_OAM
	
	
	
	;VBLANK pour le Mode7
	lda LKS_VBLANK
	cmp #$01
	bne +
		jsr VBlankMode7
		
		bra ++
	+:
	;VBLANK pour le Mode1
	
	cmp #$02
	bne +
		jsr VBlank0
		
		bra ++
	+:

	++:
	
	
	;--------------------
	
	LKS_BG1_update
	LKS_BG2_update
	LKS_BG3_update
	LKS_BG4_update
	;--------------------
	
	
	
	
	/*
	-:
		lda HVBJOY
		and #$01
    bne -
    */
    /*
    -:
			ldx.w	HVBJOY			; MUST do 8 bit read on HVJOY
			txa
			lsr
	bcs -
	
	*/
	
	;SNES_DMAX $00
	;SNES_DMAX_BADD $80
	
	-:
		lda HVBJOY
		and #$01
    bne -
	
	
    jsl LKS_NMI_Joypad
    
    ldy #0
	sty LKS_VBLANK+_vbltime
    -:
		iny
		
		lda	HVBJOY
		and #$80		
	bne -
	sty LKS_VBLANK+_vbltime
	
	
	
	
	
	;inc	MEM_VBLANK+3
	
	;lda	TIMEUP
	
	
    ply
	plx
	pla
	plb
	
	plp
	pld
    
	
    rti
    
    
VBlank0:
	
	LKS_BG1_cpy_BG2
	
	SNES_DMAX $01
	SNES_DMAX_BADD $18
	
	
	stz LKS_DMAT
	
	
	jsl LKS_DMA_BG3
	
	
	;---------------------------
	jsl Background1Y
	jsl Background1X  
	
	jsl Background2Y  
	jsl Background2X 
	;---------------------------    
	
	
	LKS_DMA_VRAM 8
    LKS_DMA_VRAM 9
    LKS_DMA_VRAM 10
	LKS_DMA_VRAM 11
	
	LKS_DMA_VRAM 12
	LKS_DMA_VRAM 13
	LKS_DMA_VRAM 14
	LKS_DMA_VRAM 15
	
	LKS_DMA_VRAM 0
	LKS_DMA_VRAM 1
	LKS_DMA_VRAM 2
	LKS_DMA_VRAM 3
	
	LKS_DMA_VRAM 4
	LKS_DMA_VRAM 5
	LKS_DMA_VRAM 6
	LKS_DMA_VRAM 7
	
	LKS_DMA_VRAM 16
	LKS_DMA_VRAM 17
	
		

	
	
	
	
	
	    
    ;---------------------------
    
	
	jsl LKS_DMA_PAL
	
	
	
	
	
	;lda	$4210
	;---------------------------
	;---------------------------
	
    rts
    
	.include "VBlankmode7.asm"
    
    
	.include "LKS/DMA_spd.asm"
	
