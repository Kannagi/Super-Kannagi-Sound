

.MACRO LKS_PortDMA_BG3_pas

	cmp #\1
	bne +
		ldx #LKS_BUF_BG3&$FFFF+($200*\1)
		ldy #$5800+($100*\1)
		inc s_lks+_lks_tmpbg3
	+:
.ENDM


LKS_DMA_BG3:

	
	lda #$7E
	sta DMA_BANK
	
	
	ldy #$200
	sty DMA_SIZEL
	
	
	ldx #LKS_BUF_BG3&$FFFF
	ldy #$5800
	lda s_lks+_lks_tmpbg3
	
	cmp #0
	bne +
		inc s_lks+_lks_tmpbg3
	+:
	
	LKS_PortDMA_BG3_pas 1
	LKS_PortDMA_BG3_pas 2
	LKS_PortDMA_BG3_pas 3
	cmp #3
	bne +
		stz s_lks+_lks_tmpbg3
	+:
	
	stx DMA_ADDL
	sty VMADDL
	
	
    SNES_MDMAEN $01
    
    
	rtl

LKS_DMA_OAM:

	ldx #$0000	
	stx OAMADDL

	SNES_DMA0 $00
	SNES_DMA0_BADD $04
	
    
	lda #$7E
	ldx #MEM_OAML
	ldy #$220
	
	sta DMA_BANK
	stx DMA_ADDL
	sty DMA_SIZEL
	
    SNES_MDMAEN $01

	rtl
	
LKS_DMA_PAL:

	
	
	lda s_palette+_pltype
	cmp #$0
	bne +
		rtl
	+:
	
	SNES_DMA0 $00
	SNES_DMA0_BADD $22
	
	SNES_CGADD $00
	ldx #LKS_BUF_PAL&$FFFF
	

	lda s_palette+_pltype
	cmp #$2
	bne +
		SNES_CGADD $80
		ldx #LKS_BUF_PAL&$FFFF+$100
	+:
    
	lda #$7E
	
	ldy #$100
	
	sta DMA_BANK
	stx DMA_ADDL
	sty DMA_SIZEL
	
    SNES_MDMAEN $01
    
    stz s_palette+_pltype

	rtl
	
	
rep #$20
LKS_DMA_VRAM_load:


	lda LKS_DMA+_dmaType1,x
	sta MEM_TEMP
	and #$03
	sta MEM_TEMP+4
	
	ldy #$1
	cmp #0
	beq +
	
	ldy #$3
	cmp #1
	beq +
	
	ldy #$7
	cmp #2
	beq +
	
	ldy #$F
	
	+:
	sty MEM_TEMP+10
	
	lda MEM_TEMP
	and #$0C
	lsr a
	lsr a
	sta MEM_TEMP+6
	
	
	
	
	
	

	
	lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMP+8
	
	
	lda LKS_DMA+_dmaSrc1,x
	sta MEM_TEMP+2
	
	lda MEM_TEMPFUNC+2
	tax

	
	
    lda MEM_TEMP
	and #$F0
	clc
	adc #$10
	asl a
	tay
	
	lsr a
	lsr a
	lsr a
	sta MEM_TEMP
    
    
   

LKS_DMA_VRAM_load_loop: 


	lda MEM_TEMPFUNC
	adc #$8
	adc MEM_TEMP
	sta MEM_TEMPFUNC
		
	lda MEM_TEMP+8
    sta VMADDL

	
	

    lda MEM_TEMP+2
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    
    lda MEM_TEMP+4
    cmp #0
    beq +
    
	cmp #1
    beq +++
    
    cmp #2
    beq ++
    
    lda MEM_TEMP+14
    asl a
    clc
    adc MEM_TEMP+2
	adc MEM_TEMP+14
	
	
	stx DMA_BANK+$30
	sta DMA_ADDL+$30
	sty DMA_SIZEL +$30
	
	lda MEM_TEMPFUNC
	adc MEM_TEMP
	sta MEM_TEMPFUNC
    
	++:
	lda MEM_TEMP+14
    asl a
    clc
    adc MEM_TEMP+2
	
	stx DMA_BANK+$20
	sta DMA_ADDL+$20
	sty DMA_SIZEL +$20
	
	
	
	lda MEM_TEMPFUNC
	adc MEM_TEMP
	sta MEM_TEMPFUNC
	
	+++:
	lda MEM_TEMP+2
	clc
	adc MEM_TEMP+14
	
	stx DMA_BANK+$10
	sta DMA_ADDL+$10
	sty DMA_SIZEL +$10
	
	
	
	lda MEM_TEMPFUNC
	adc MEM_TEMP
	sta MEM_TEMPFUNC
	
	+:
    
    
    lda MEM_TEMP+10
    sta MDMAEN
    
    
    lda MEM_TEMP+8
    clc
    adc #$100
	sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+12
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    
    lda MEM_TEMP+4
    cmp #0
    beq +
    
	cmp #1
    beq +++
    
    cmp #2
    beq ++
    
    lda MEM_TEMP+14
    asl a
    clc
    adc MEM_TEMP+2
	adc MEM_TEMP+14
	adc MEM_TEMP+12
	
	stx DMA_BANK+$30
	sta DMA_ADDL+$30
	sty DMA_SIZEL +$30
	
    
	++:
	lda MEM_TEMP+14
    asl a
    clc
    adc MEM_TEMP+2
	adc MEM_TEMP+12
	
	stx DMA_BANK+$20
	sta DMA_ADDL+$20
	sty DMA_SIZEL +$20
	

	
	+++:
	lda MEM_TEMP+2
	clc
	adc MEM_TEMP+14
	adc MEM_TEMP+12
	
	stx DMA_BANK+$10
	sta DMA_ADDL+$10
	sty DMA_SIZEL +$10
	
	+:
   
    
    
    lda MEM_TEMP+10
    sta MDMAEN

	
	


    /*
    lda MEM_TEMP+6
    cmp #0
    beq +
		dec MEM_TEMP+6
		
		lda MEM_TEMP+8
		clc
		adc #$200
		sta MEM_TEMP+8
		
		lda MEM_TEMP+2
		adc MEM_TEMP+14
		sta MEM_TEMP+2
		
	
		
		
		jml LKS_DMA_VRAM_load_loop
    +:
    */
   
    
	rtl
sep #$20


.MACRO LKS_DMA_VRAM


	lda MEM_DMAT
	bit #$80
	beq +
	
		rtl
	+:
	

	ldx #$16*\1
	
	lda LKS_DMA+_dmaEnable,x
	cmp #0
	beq +
		jsl LKS_DMA_VRAM
	
	+:
	
	
	
.ENDM

	
LKS_DMA_VRAM:

	
	stx MEM_TEMPFUNC+6
	
	dec a
	sta MEM_TEMPFUNC+4
	stz MEM_TEMPFUNC+5
	
	lda #0
	sta LKS_DMA+_dmaEnable,x
	
	
	rep #$20
	
	stz MEM_TEMPFUNC
	
	lda LKS_DMA+_dmaSrcR,x
	sta MEM_TEMP+12
	asl a
	sta MEM_TEMP+14
	
	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMPFUNC+2
	
	;Begin---------------
	
	
	
	jsl LKS_DMA_VRAM_load
	
	
	lda MEM_TEMPFUNC+4
	cmp #0
    beq +
    
	cmp #1
    beq ++
    
    lda MEM_TEMPFUNC+6
    clc
    adc #12
    tax
    jsl LKS_DMA_VRAM_load
    
    ++:
    
    lda MEM_TEMPFUNC+6
    clc
    adc #6
    tax
    jsl LKS_DMA_VRAM_load
    
    
    
    +:
    
	
	;End-----------------
	sep #$20
	
	lda MEM_DMAT
    adc MEM_TEMPFUNC
    sta MEM_DMAT
    
    
    
	
    

    
	rtl

	
LKS_DMA_PORT:
	
	LKS_DMA_VRAM 0
	LKS_DMA_VRAM 1
	LKS_DMA_VRAM 2
	LKS_DMA_VRAM 3
	LKS_DMA_VRAM 4
	LKS_DMA_VRAM 5
	;LKS_DMA_VRAM 6
	;LKS_DMA_VRAM 7
	
	;LKS_DMA_VRAM 8
	;LKS_DMA_VRAM 9
	LKS_DMA_VRAM 10
	LKS_DMA_VRAM 11
	LKS_DMA_VRAM 12
	LKS_DMA_VRAM 13
	LKS_DMA_VRAM 14
	LKS_DMA_VRAM 15
	

	rtl
