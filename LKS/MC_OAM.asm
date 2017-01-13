
.MACRO LKS_OAM_Draw

	lda #\1
	sta LKS_OAM+_sprtile
	
	lda #\2
	sta LKS_OAM+_sprext
	
	lda #\3
	sta LKS_OAM+_sprsz
	
	jsl LKS_OAM_Draw
	
	
.ENDM

.MACRO LKS_OAM_Draw_Meta

	lda #\1
	sta LKS_OAM+_sprtile
	
	lda #\2
	sta LKS_OAM+_sprext
	
	lda #\3
	sta LKS_OAM+_sprsz
	
	jsl LKS_OAM_Draw_Meta
	
	
.ENDM

.MACRO LKS_OAM_position

	rep #$20
	
	lda #\1
	sta LKS_OAM+_sprx
	
	lda #\2
	sta LKS_OAM+_spry
	
	sep #$20
	
	
.ENDM

.MACRO  LKS_OAM_add

	rep #$20
	
	lda LKS_OAM+_sprx
	clc
	adc #\1
	sta LKS_OAM+_sprx
	
	lda LKS_OAM+_spry
	clc
	adc #\2
	sta LKS_OAM+_spry
	
	sep #$20
	
	
.ENDM

.MACRO LKS_OAM4_Clear

	sta MEM_OAML + $01 + (\1*$10)
	sta MEM_OAML + $05 + (\1*$10)
	sta MEM_OAML + $09 + (\1*$10)
	sta MEM_OAML + $0D + (\1*$10)
	
	stz MEM_OAMH + \1
.ENDM
