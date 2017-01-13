

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
	


	


	
	
