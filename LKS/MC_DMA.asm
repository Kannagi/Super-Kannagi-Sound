

.MACRO LKS_DMA_PORTX 


	lda #1
	sta LKS_DMA+_dmaEnable,x
	
	
	lda \1
	sta LKS_DMA+_dmaBank,x
	
	rep #$20
	
	lda #\2
	sta LKS_DMA+_dmaSrcR,x
	
	lda \3
	sta LKS_DMA+_dmaSrc1,x
	
	lda #\4
	sta LKS_DMA+_dmaDst1,x
	
	sep #$20
	
	lda #\5
	sta LKS_DMA+_dmaType1,x
	
	
	
.ENDM

.MACRO LKS_DMA_VRAM


	lda LKS_DMAT
	bit #$80
	bne +
	
	lda LKS_DMA+_dmaEnable+$20*\1
	cmp #0
	beq +
	
		
		ldx #$20*\1
		stx MEM_TEMP+2
		
		
		
		
		rep #$20
		
		lda LKS_DMA+_dmaSrcR+$20*\1
		sta MEM_TEMP+6
		
		lda LKS_DMA+_dmaFunc+$20*\1
		sta 0
		sep #$20
		ldx #0
		jsr (0,x)
		
		
		
		lda #0
		sta LKS_DMA+_dmaEnable+$20*\1
	
		lda LKS_DMAT
		adc LKS_DMA+_dmat+$20*\1
		sta LKS_DMAT
	+:
	
	
	
.ENDM

