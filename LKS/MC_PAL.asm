
.MACRO LKS_PAL_ANIM
	SNES_WMADD LKS_BUF_PAL&$FFFF+($20*\1),0
	
	phx
	ldx s_palette+_bgpl1+(3*\1)
	stx MEM_TEMPFUNC
	
	ldx s_palette+_bgpl1+(3*\1)+2
	stx MEM_TEMPFUNC+4
	
	ldx #\2
	stx MEM_TEMPFUNC+2
	
	ldx #\3
	stx MEM_TEMPFUNC+6
	
	plx
	
	jsl LKS_PAL_Anim
	
	
.ENDM
