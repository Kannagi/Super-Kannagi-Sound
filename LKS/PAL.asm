
LKS_PAL_Anim:

	
	
	
	inc s_palette+_pll
	lda s_palette+_pll
	cmp MEM_TEMPFUNC+6
	bmi +
		lda s_palette+_pli
		clc
		adc #2
		cmp MEM_TEMPFUNC+2
		bmi ++
			lda #0
		
		++:
		sta s_palette+_pli
		stz s_palette+_pll
	+:
	
	rep #$20
	lda MEM_TEMPFUNC
	clc
	adc s_palette+_pli
	tax
	sep #$20  
	
	ldy MEM_TEMPFUNC+2 
	lda MEM_TEMPFUNC+4

	 
	
	stx $4302+$30
	sta $4304+$30
	sty $4305+$30

	SNES_MDMAEN $08

	rtl
	
