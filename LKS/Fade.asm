
LKS_Fade_in:
	
	lda LKS_FADE +_fdphase
	cmp #0
	beq +
		rtl
	+:

	lda LKS_FADE +_fdbrg
	sta INIDISP
		
	ldy LKS_FADE +_fdtimer
	cpy #2
	bne +
		ina
		stz LKS_FADE +_fdtimer
		bra ++
	+:
		inc LKS_FADE +_fdtimer
	++:
	cmp #$10
	bne +
		lda #$0F
		sta INIDISP
		inc LKS_FADE +_fdphase
		stz LKS_FADE +_fdtimer
		
		rtl
	+:
	sta LKS_FADE +_fdbrg

	rtl
	
	
LKS_Fade_out:
	
	lda LKS_FADE +_fdphase
	cmp #0
	bne +
		rtl
	+:

	lda LKS_FADE +_fdbrg
	sta INIDISP
		
	ldy LKS_FADE +_fdtimer
	cpy #2
	bne +
		dea
		stz LKS_FADE +_fdtimer
		bra ++
	+:
		inc LKS_FADE +_fdtimer
	++:
	cmp #-$1
	bne +
		lda #$00
		sta INIDISP
		inc LKS_FADE +_fdphase
		stz LKS_FADE +_fdtimer
	
		rtl
	+:
	sta LKS_FADE +_fdbrg

	rtl
	

