


;$X bloc
LKS_DMA_VRAM1:

	ldx MEM_TEMP+2
	

	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	
    
	rep #$20
    
    
    lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
    
    
    
    
    clc
    lda LKS_DMA+_dmaSize1,x
    tay
    
    ldx MEM_TEMP
    
    ;--------------
    lda MEM_TEMPFUNC
    sta VMADDL
    
    lda MEM_TEMP+2
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    SNES_MDMAEN $01
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    

    SNES_MDMAEN $01
    
    sep #$20
    
    rts
    
;$X bloc2
LKS_DMA_VRAM1x2:

	ldx MEM_TEMP+2
	

	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	
    
	rep #$20
    
    
    lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
    
    
    
    
    clc
    lda LKS_DMA+_dmaSize1,x
    tay
    ldx MEM_TEMP
    
    
    
    ;--------------
    ;lda #$6000
    lda MEM_TEMPFUNC
    sta VMADDL
    
    lda MEM_TEMP+2
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    SNES_MDMAEN $03
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    SNES_MDMAEN $03
    
    sep #$20
    
    rts
    
LKS_DMA_VRAM1x3:

	ldx MEM_TEMP+2
	

	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	
    
	rep #$20
    
    
    lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
    
    
    
    
    clc
    lda LKS_DMA+_dmaSize1,x
    tay
    ldx MEM_TEMP
    
    ;--------------
    ;lda #$6000
    lda MEM_TEMPFUNC
    sta VMADDL
    
    lda MEM_TEMP+2
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$20
    sta DMA_ADDL+$20
    sty DMA_SIZEL+$20
    
    SNES_MDMAEN $07
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$20
    sta DMA_ADDL+$20
    sty DMA_SIZEL+$20
    
    SNES_MDMAEN $07
    
    sep #$20
    
    rts
    
    
LKS_DMA_VRAM1x4:

	ldx MEM_TEMP+2
	

	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	
    
	rep #$20
    
    
    lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
    
    
    
    
    clc
    lda LKS_DMA+_dmaSize1,x
    tay
    ldx MEM_TEMP
    
    ;--------------
    ;lda #$6000
    lda MEM_TEMPFUNC
    sta VMADDL
    
    lda MEM_TEMP+2
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$20
    sta DMA_ADDL+$20
    sty DMA_SIZEL+$20
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$30
    sta DMA_ADDL+$30
    sty DMA_SIZEL+$30
    
    SNES_MDMAEN $0F
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$10
    sta DMA_ADDL+$10
    sty DMA_SIZEL+$10
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$20
    sta DMA_ADDL+$20
    sty DMA_SIZEL+$20
    
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK+$30
    sta DMA_ADDL+$30
    sty DMA_SIZEL+$30
    
    SNES_MDMAEN $0F
    
    sep #$20
    
    rts
    
;$XLoop
LKS_DMA_VRAM2:

	
	ldx MEM_TEMP+2
	
	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	
	lda LKS_DMA+_dmaEnable,x
	sta MEM_TEMP+4
	stz MEM_TEMP+5
	rep #$20
	
	
	
	
	
	-:
	lda LKS_DMA+_dmaSize1,x
	tay
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
	
	lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
    sta VMADDL
    
    ;---------
    phx
    
    lda MEM_TEMP+2
    ldx MEM_TEMP
    
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    SNES_MDMAEN $01
    
    lda MEM_TEMPFUNC
    clc
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL
    
    SNES_MDMAEN $01
    
    plx
    
    txa
    clc
    adc #6
    tax
    
    
    
   
    
    
    
    
    
    dec MEM_TEMP+4
    lda MEM_TEMP+4
    cmp #0
    bne -
    
    sep #$20

	
	
    
    rts

LKS_DMA_VRAM3:

	ldx MEM_TEMP+2
	

	lda LKS_DMA+_dmaBank,x
	sta MEM_TEMP
	stz MEM_TEMP+1
	
	lda LKS_DMA+_dmaEnable,x
	sta MEM_TEMP+4
	stz MEM_TEMP+5
    
	rep #$20
    
    -:
    lda LKS_DMA+_dmaDst1,x
	sta MEM_TEMPFUNC
	
	
	lda LKS_DMA+_dmaSrc1,x
    sta MEM_TEMP+2
    
    
    
    
    clc
    lda LKS_DMA+_dmaSize1,x
    tay
    
    phx
    
    ldx MEM_TEMP
    
    ;--------------
    lda MEM_TEMPFUNC
    sta VMADDL
    
    lda MEM_TEMP+2
    
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    SNES_MDMAEN $01
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$100
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    

    SNES_MDMAEN $01
    
    ;--------------2
    lda MEM_TEMPFUNC
    adc #$200
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    
    SNES_MDMAEN $01
   
    ;--------------
    lda MEM_TEMPFUNC
    adc #$300
    sta VMADDL
    
    lda MEM_TEMP+2
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    adc MEM_TEMP+6
    
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL 
    

    SNES_MDMAEN $01
    
    plx
    
    txa
    clc
    adc #6
    tax
    

    dec MEM_TEMP+4
    lda MEM_TEMP+4
    cmp #0
    beq +
		jmp -
    +:
    
    sep #$20
    
    rts
