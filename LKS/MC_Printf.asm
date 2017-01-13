

.MACRO LKS_cycle8
	nop
	nop
	nop
	nop
	
	nop
	nop
	nop
	nop
.ENDM

.MACRO LKS_printfc

	ldx #(\1*2 + \2*64)
	
	rep #$20
	lda LKS_PRINTPL-1
	and #$FF00
	clc
	adc #\3
	sta LKS_BUF_BG3+0,x
	sep #$20
.ENDM

.MACRO LKS_printf_setpal 
	
	
	lda #\1<<2
	sta LKS_PRINTPL
	
.ENDM

.MACRO LKS_printfs

	txy
	ldx #(\1*2 + \2*64)
	
	
	
	jsl LKS_printfs
	
	
	
.ENDM

.MACRO compute_digit_for_base16 ARGS _base
	; [input] registre A sur 16 bits qui contient le nombre dans la bonne tranche par rapport à _base
	;     Autrement dit, _base <= A < (10 * _base)
	; [output]
	;     [X] le registre X contient le chiffre pour la _base
	;     [A] contient le reste (module _base) ==> donc 0 <= A < _base
	;
	; _base vaut une puissance non nul de 10
	; On détermine les chiffres les uns après les autres depuis le plus grand avec _base = 10000
	; Puis ainsi de suite avec _base = 1000, _base = 100 et enfin _base = 10
	; Les uns, après les autres, on obtient alors les 5 chiffres qui compose le nombre sur 16 bits.
 	
 	.IF _base != 10000
 	cmp #5 * _base
	bcc +
		ldx #5
		sec
		sbc #5 * _base
		bra ++
	+:
 		ldx #0
	++:
	.ELSE
	ldx #0
	.ENDIF
	
 	-:
	cmp #_base
	bcc +
		inx
		sec
		sbc #_base
		bra -
	+:
	
	
.ENDM

.MACRO compute_digit_for_base8 ARGS _base
	; [input] registre A sur 16 bits qui contient le nombre dans la bonne tranche par rapport à _base
	;     Autrement dit, _base <= A < (10 * _base)
	; [output]
	;     [X] le registre X contient le chiffre pour la _base
	;     [A] contient le reste (module _base) ==> donc 0 <= A < _base
	;
	; _base vaut une puissance non nul de 10
	; On détermine les chiffres les uns après les autres depuis le plus grand avec _base = 10000
	; Puis ainsi de suite avec _base = 1000, _base = 100 et enfin _base = 10
	; Les uns, après les autres, on obtient alors les 5 chiffres qui compose le nombre sur 16 bits.
 	
 	.IF _base != 100
 	cmp #5*_base
	bmi +
		ldx #5
		sec
		sbc #5*_base
		bra ++
	+:
 		ldx #0
	++:
	.ELSE
		ldx #0
	.ENDIF
	
 	-:
	cmp #_base
	bmi +
		inx
		sec
		sbc #_base
		bra -
	+:
	
	
.ENDM


.MACRO LKS_printf16
	
	ldx #(\1*2 + \2*64)
	stx MEM_TEMPFUNC
	
	jsl LKS_printf16_draw
.ENDM

.MACRO LKS_printfu16
	
	ldx #(\1*2 + \2*64)
	stx MEM_TEMPFUNC
	
	jsl LKS_printfu16_draw
.ENDM

.MACRO LKS_printf8

	ldx #(\1*2 + \2*64)
	stx MEM_TEMPFUNC
	
	jsl LKS_printf8_draw

.ENDM

.MACRO LKS_printh8
	
	ldx #(\1*2 + \2*64)
	stx MEM_TEMPFUNC
	
	jsl LKS_printh8_draw
.ENDM

.MACRO LKS_printh16
	
	ldx #(\1*2 + \2*64)
	stx MEM_TEMPFUNC
	
	jsl LKS_printh16_draw
.ENDM
