
.MACRO LKS_BG1_update

	lda LKS_BG+_bg1x
	sta BG1H0FS
	lda LKS_BG+_bg1x+1
	sta BG1H0FS
	
	lda LKS_BG+_bg1y
	sta BG1V0FS
	lda LKS_BG+_bg1y+1
	sta BG1V0FS
	
.ENDM

.MACRO LKS_BG3_update

	lda LKS_BG+_bg3x
	sta BG3H0FS
	lda LKS_BG+_bg3x+1
	sta BG3H0FS
	
	lda LKS_BG+_bg3y
	sta BG3V0FS
	lda LKS_BG+_bg3y+1
	sta BG3V0FS
	
.ENDM

.MACRO LKS_BG4_update

	lda LKS_BG+_bg4x
	sta BG4H0FS
	lda LKS_BG+_bg4x+1
	sta BG4H0FS
	
	lda LKS_BG+_bg4y
	sta BG4V0FS
	lda LKS_BG+_bg4y+1
	sta BG4V0FS
	
.ENDM

.MACRO LKS_BG2_update

	lda LKS_BG+_bg2x
	sta BG2H0FS
	lda LKS_BG+_bg2x+1
	sta BG2H0FS
	
	lda LKS_BG+_bg2y
	sta BG2V0FS
	lda LKS_BG+_bg2y+1
	sta BG2V0FS
	
.ENDM

.MACRO LKS_BG1_cpy_BG2

	ldx LKS_BG+_bg1x
	stx LKS_BG+_bg2x
	
	ldx LKS_BG+_bg1y
	stx LKS_BG+_bg2y
	
.ENDM

.MACRO LKS_BG1_set

	ldx \1
	stx LKS_BG+_bg1x
	
	ldx \2
	stx LKS_BG+_bg1y
	
.ENDM

.MACRO LKS_BG2_set

	ldx \1
	stx LKS_BG+_bg2x
	
	ldx \2
	stx LKS_BG+_bg2y
	
.ENDM
