
.MACRO LKS_LOAD_CG

	SNES_CGADD \1
	
	SNES_DMA0 $00
	SNES_DMA0_BADD $22
	
	lda #:\2
    ldx #\2
    ldy #\3
    
     
    
    stx DMA_ADDL
    sta DMA_BANK
    sty DMA_SIZEL  
    
	SNES_MDMAEN $01
	
.ENDM

.MACRO LKS_LOAD_VRAM

	
	SNES_DMA0 $01
	SNES_DMA0_BADD $18
	
	SNES_VMADD \1
    
	lda #:\3 
    ldx #\3+\2
    ldy #\4
    
     
    
    stx DMA_ADDL
    sta DMA_BANK
    sty DMA_SIZEL 
    
	
	SNES_MDMAEN $01
	
.ENDM

.MACRO LKS_LOAD_WRAM

	
	SNES_DMA0 $00
	SNES_DMA0_BADD $80
	
	SNES_WMADD \1,0
    
	lda #:\2
    ldx #\2
    ldy #\3
    
     
    
    stx DMA_ADDL
    sta DMA_BANK
    sty DMA_SIZEL 
    
	
	SNES_MDMAEN $01
	
.ENDM
