


	
	
rep #$20
LKS_DMA_VRAM_load8:


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
    
    
   

LKS_DMA_VRAM_load_loop8: 


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


.MACRO LKS_DMA_VRAM4


	lda MEM_DMAT
	bit #$80
	beq +
	
		rtl
	+:
	
	lda MEM_TEMPFUNC
    sta VMADDL

	
	

    lda MEM_TEMPFUNC+2
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL
	
	
	lda MEM_TEMPFUNC+4
    sta MDMAEN
.ENDM


.MACRO LKS_DMA_VRAM3


	lda MEM_DMAT
	bit #$80
	beq +
	
		rtl
	+:
	

	ldx #$16*\1
	
	lda LKS_DMA+_dmaEnable+$16*\1
	cmp #0
	bne +
		jml LKS_DMA_PORT_END
	+:
	lda #0
	sta LKS_DMA+_dmaEnable+$16*\1
		
	rep #$20
	
	lda LKS_DMA+_dmaDst1+$16*\1
    sta VMADDL

	lda LKS_DMA+_dmaBank+$16*\1
	and #$FF
	tax
	
	
	
	
	ldy #$40
    lda LKS_DMA+_dmaSrc1+$16*\1
    
    lda #Randi
    ldx #:Randi
    stx DMA_BANK
    sta DMA_ADDL
    sty DMA_SIZEL
	
	
	
	
	sep #$20
	
	lda #1
    sta MDMAEN
	
	
.ENDM

	
LKS_DMA_VRAM3:

	rtl
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

	/*
LKS_DMA_PORT:
	
	LKS_DMA_VRAM 0
	
	
LKS_DMA_PORT_END:
	rtl
*/
