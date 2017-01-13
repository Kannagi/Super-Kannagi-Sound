

LKS_OAM4_Clear:
	
	lda #-32
	
	sta MEM_OAML + 1,x
	sta MEM_OAML + 5,x
	sta MEM_OAML + 9,x
	sta MEM_OAML + 13,x
	
	rtl
	

LKS_OAM_Clear:

	stz LKS_OAM
	stz LKS_OAM+1
	
	

	;Clear OAM
	stz MEM_OAMH +$00
	stz MEM_OAMH +$01
	stz MEM_OAMH +$02
	stz MEM_OAMH +$03
	stz MEM_OAMH +$04
	stz MEM_OAMH +$05
	stz MEM_OAMH +$06
	stz MEM_OAMH +$07
	stz MEM_OAMH +$08
	stz MEM_OAMH +$09
	stz MEM_OAMH +$0A
	stz MEM_OAMH +$0B
	stz MEM_OAMH +$0C
	stz MEM_OAMH +$0D
	stz MEM_OAMH +$0E
	stz MEM_OAMH +$0F
	
	stz MEM_OAMH +$10
	stz MEM_OAMH +$11
	stz MEM_OAMH +$12
	stz MEM_OAMH +$13
	stz MEM_OAMH +$14
	stz MEM_OAMH +$15
	stz MEM_OAMH +$16
	stz MEM_OAMH +$17
	stz MEM_OAMH +$18
	stz MEM_OAMH +$19
	stz MEM_OAMH +$1A
	stz MEM_OAMH +$1B
	stz MEM_OAMH +$1C
	stz MEM_OAMH +$1D
	stz MEM_OAMH +$1E
	stz MEM_OAMH +$1F
	
	lda #-32
	
	LKS_OAM4_Clear $00
	LKS_OAM4_Clear $01
	LKS_OAM4_Clear $02
	LKS_OAM4_Clear $03
	LKS_OAM4_Clear $04
	LKS_OAM4_Clear $05
	LKS_OAM4_Clear $06
	LKS_OAM4_Clear $07
	LKS_OAM4_Clear $08
	LKS_OAM4_Clear $09
	LKS_OAM4_Clear $0A
	LKS_OAM4_Clear $0B
	LKS_OAM4_Clear $0C
	LKS_OAM4_Clear $0D
	LKS_OAM4_Clear $0E
	LKS_OAM4_Clear $0F
	
	LKS_OAM4_Clear $10
	LKS_OAM4_Clear $11
	LKS_OAM4_Clear $12
	LKS_OAM4_Clear $13
	LKS_OAM4_Clear $14
	LKS_OAM4_Clear $15
	LKS_OAM4_Clear $16
	LKS_OAM4_Clear $17
	LKS_OAM4_Clear $18
	LKS_OAM4_Clear $19
	LKS_OAM4_Clear $1A
	LKS_OAM4_Clear $1B
	LKS_OAM4_Clear $1C
	LKS_OAM4_Clear $1D
	LKS_OAM4_Clear $1E
	LKS_OAM4_Clear $1F
	
	rtl
	

LKS_OAM_Draw:

	;Y
	rep #$20
	lda LKS_OAM+_sprsz
	and #$FE
	clc
	adc LKS_OAM+_spry
	sta LKS_OAM+_sprtmp1
	sep #$20
	
	lda LKS_OAM+_sprtmp1+1
	cmp #$00
	beq +
		iny
		iny
		iny
		iny
		rtl
	+:
	
	;X droite
	lda LKS_OAM+_sprx+1
	cmp #$01
	bmi +
		iny
		iny
		iny
		iny
		rtl
	+:
	
	;X gauche
	rep #$20
	lda LKS_OAM+_sprsz
	and #$FE
	clc
	adc LKS_OAM+_sprx
	sta LKS_OAM+_sprtmp1
	sta LKS_OAM+_sprtmp2
	sep #$20
		
	lda LKS_OAM+_sprtmp1+1
	cmp #$0
	bpl +
		iny
		iny
		iny
		iny
		rtl
	+:

	rep #$20
	tya
	phy
	
	sta LKS_OAM+_sprtmp1
	
	lsr
	lsr
	lsr
	lsr
	
	tay
	sep #$20
	
	lda LKS_OAM+_sprtmp1
	and #$0F
	cmp #$00
	bne +
		lda #$01
		bra ++
	+:
	cmp #$04
	bne +
		lda #$04
		bra ++
	+:
	cmp #$08
	bne +
		lda #$10
		bra ++
	+:
	cmp #$0C
	bne +
		lda #$40
		bra ++
	+:
	++:
	sta LKS_OAM+_sprtmp1
	asl
	sta LKS_OAM+_sprtmp1+1
	
	lda LKS_OAM+_sprsz
	bit #1
	beq +
		lda MEM_OAMH,y
		ora LKS_OAM+_sprtmp1+1
		sta MEM_OAMH,y
	+:
	
	lda LKS_OAM+_sprtmp2+1
	cmp #$1
	beq +
	;clipping
	lda LKS_OAM+_sprsz
	and #$FE
	clc
	adc LKS_OAM+_sprx
	bcc +
		lda MEM_OAMH,y
		ora LKS_OAM+_sprtmp1
		sta MEM_OAMH,y
	+:
	
	ply
	;--------
	
	lda LKS_OAM+_sprx
	sta MEM_OAML,y
	iny
	
	
	lda LKS_OAM+_spry
	sta MEM_OAML,y
	iny
	
	lda LKS_OAM+_sprtile
	sta MEM_OAML,y
	iny
	
	lda LKS_OAM+_sprext
	sta MEM_OAML,y
	iny
	
	rtl
	
	
;-------------------------------------------------
LKS_OAM_Draw_Meta:

	;Y
	rep #$20
	lda LKS_OAM+_sprsz
	and #$F0
	lsr a

	
	clc
	adc LKS_OAM+_spry
	sta LKS_OAM+_sprtmp1
	sep #$20
	
	lda LKS_OAM+_sprtmp1+1
	cmp #$00
	beq +
		iny
		iny
		iny
		iny
		rtl
	+:
	
	;X droite
	lda LKS_OAM+_sprx+1
	cmp #$01
	bmi +
		iny
		iny
		iny
		iny
		rtl
	+:
	
	;X gauche
	rep #$20
	lda LKS_OAM+_sprsz
	and #$0E
	inc a
	asl a
	asl a
	asl a
	clc
	adc LKS_OAM+_sprx
	sta LKS_OAM+_sprtmp1
	sta LKS_OAM+_sprtmp2
	sep #$20
		
	lda LKS_OAM+_sprtmp1+1
	cmp #$0
	bpl +
		iny
		iny
		iny
		iny
		rtl
	+:

	rep #$20
	tya
	phy
	
	sta LKS_OAM+_sprtmp1
	
	lsr
	lsr
	lsr
	lsr
	
	tay
	sep #$20
	
	lda LKS_OAM+_sprtmp1
	and #$0F
	cmp #$00
	bne +
		lda #$01
		bra ++
	+:
	cmp #$04
	bne +
		lda #$04
		bra ++
	+:
	cmp #$08
	bne +
		lda #$10
		bra ++
	+:
	cmp #$0C
	bne +
		lda #$40
		bra ++
	+:
	++:
	sta LKS_OAM+_sprtmp1
	asl
	sta LKS_OAM+_sprtmp1+1
	
	lda LKS_OAM+_sprsz
	bit #1
	beq +
		lda MEM_OAMH,y
		ora LKS_OAM+_sprtmp1+1
		sta MEM_OAMH,y
	+:
	
	lda LKS_OAM+_sprtmp2+1
	cmp #$1
	beq +
	;clipping
	lda LKS_OAM+_sprsz
	and #$FE
	clc
	adc LKS_OAM+_sprx
	bcc +
		lda MEM_OAMH,y
		ora LKS_OAM+_sprtmp1
		sta MEM_OAMH,y
	+:
	
	ply
	;--------
	



	lda LKS_OAM+_sprx
	sta MEM_OAML,y
	iny
	
	
	lda LKS_OAM+_spry
	sta MEM_OAML,y
	iny
	
	lda LKS_OAM+_sprtile
	sta MEM_OAML,y
	iny
	
	lda LKS_OAM+_sprext
	sta MEM_OAML,y
	iny
	
	
	
	
	rtl
	

LKS_OAM_Draw_Meta2x1:
		

		rtl
