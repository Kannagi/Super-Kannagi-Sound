

LKS_Clear_RAM:
    /*
	ldy #$0000
	sty 0
	ldx #$0000
	-:
		sty 0,x
		inx
		inx
		
		sty 0,x
		inx
		inx
		
		cpx #$2000
	bne -
	*/
	
	
	
	
	rep #$20
	lda #0
	ldx #$00
	-:
		sta $7E0000,x
		inx
		inx
		
		sta $7E0000,x
		inx
		inx
		
		sta $7E0000,x
		inx
		inx
		
		sta $7E0000,x
		inx
		inx
		
		cpx #$8000
	bne -
	sep #$20
	
	
	
	rtl
	
	


LKS_Clear_VRAM:
    
    SNES_VMADD $0000
    
    ldy #$0000
	ldx #0
	-:
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		inx
		
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		sty VMDATAL
		inx
		
	cpx #$1000
	bne -

	rtl

LKS_Clear_OAM:
    
	SNES_OAMADD $0000
    
	ldy #$0000
	sty $0000
	ldx #$0000
	-:
		sty $0000,x
		inx
		
	cpx #$110
	bne -
	
	rtl





	
