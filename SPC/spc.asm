
.DEFINE SPCRAM $200

.DEFINE LKS_SPC_CONTROL $10
.DEFINE LKS_SPC_ADDR	$11
.DEFINE LKS_SPC_DATA	$12
.DEFINE LKS_SPC_PLAY  	$13
.DEFINE LKS_SPC_VOLUME  $14
.DEFINE LKS_SPC_TICKS   $15
.DEFINE LKS_SPC_RVOLUME $16
.DEFINE LKS_SPC_RDATA	$17
.DEFINE LKS_SPC_DATA2	$18

.DEFINE LKS_SPC_BRR_VOLUME	$20
.DEFINE LKS_SPC_BRR_PLAY	$21
.DEFINE LKS_SPC_BRR_PITCH	$22

;-----------------
.DEFINE LKS_SPC_OFF 	$00
.DEFINE LKS_SPC_ON 		$01
.DEFINE LKS_SPC_LOOP  	$02

;-----------------
.DEFINE LKS_SPC_track0 $1B00 ;size $600
.DEFINE LKS_SPC_track1 $2100 ;size $600
.DEFINE LKS_SPC_track2 $2700 ;size $500
.DEFINE LKS_SPC_track3 $2C00 ;size $500
.DEFINE LKS_SPC_track4 $3100 ;size $400
.DEFINE LKS_SPC_track5 $3500 ;size $400
.DEFINE LKS_SPC_track6 $3900 ;size $300
.DEFINE LKS_SPC_track7 $3C00 ;size $300

.DEFINE LKS_SPC_HEADER0 $3F00
.DEFINE LKS_SPC_HEADER1 $3F10
.DEFINE LKS_SPC_HEADER2 $3F20
.DEFINE LKS_SPC_HEADER3 $3F30
.DEFINE LKS_SPC_HEADER4 $3F40
.DEFINE LKS_SPC_HEADER5 $3F50
.DEFINE LKS_SPC_HEADER6 $3F60
.DEFINE LKS_SPC_HEADER7 $3F70

.DEFINE LKS_SPC_INFO	$3F80

.DEFINE LKS_SPC_SAMPLE	$4000

.DEFINE LKS_SPC_SZSPL	$BD

.MACRO WaitAPUIO
	-:
		cmp APUIO0+\1
	bne -
.ENDM

.MACRO LKS_SPC_Get

	
	lda #\1
	sta APUIO1
	
	
	
	lda $7E2001
	sta APUIO0
	
	-:
		cmp APUIO0
	bne -
	stz APUIO1
	lda $7E2001
	inc a
	sta $7E2001
.ENDM

.MACRO LKS_SPC_Set

	
	lda #\1
	sta APUIO1
	
	lda #\2
	sta APUIO2
	
	lda #\3
	sta APUIO3
	
	lda $7E2001
	sta APUIO0
	
	-:
		cmp APUIO0
	bne -
	stz APUIO1
	lda $7E2001
	inc a
	sta $7E2001
.ENDM

.MACRO LKS_SPC_Set2

	
	lda #\1
	sta APUIO1
	
	ldx #\2
	stx APUIO2
	
	lda $7E2001
	sta APUIO0
	
	-:
		cmp APUIO0
	bne -
	stz APUIO1
	lda $7E2001
	inc a
	sta $7E2001
.ENDM


.MACRO LKS_SPC_Set3


	
	
	

	ldx #0
	--:
		lda #\1
		sta APUIO1
		
		
		
		lda.l \2,x
		sta APUIO2
		
		
		lda $7E2001
		sta APUIO0
		
		-:
			cmp APUIO0
		bne -
		stz APUIO1
		lda $7E2001
		inc a
		sta $7E2001
		
		
		
		inx
		cpx #\3
	bne --
.ENDM


.MACRO LKS_SPC_Set3_2


	
	
	
	

	ldx #0
	--:
		lda #\1
		sta APUIO1
		
		
		
		lda.l \2,x
		sta APUIO2
		inx
		lda.l \2,x
		sta APUIO3
		
		lda $7E2001
		sta APUIO0
		
		-:
			cmp APUIO0
		bne -
		stz APUIO1
		lda $7E2001
		inc a
		sta $7E2001
		
		
		
		inx
		cpx #\3
	bne --
.ENDM


.MACRO SPC_Procedure1

	lda #$AA
	WaitAPUIO 0
	sta APUIO0 
	lda #$BB
	WaitAPUIO 1

.ENDM

.MACRO SPC_Procedure2


	ldx #\1
	stx APUIO2
	
	lda #$CC
	sta APUIO1
	sta APUIO0
	WaitAPUIO 0

.ENDM

.MACRO SPC_Procedure3

	ldx #0
	--:
		lda.l \1,x
		sta APUIO1
		
		txa
		sta APUIO0
		
				
		WaitAPUIO 0
		
		inx
		cpx #\2
	bne --
	
	

.ENDM

.MACRO SPC_Procedure4

	stz APUIO1

	ldx #\1
	stx APUIO2
	
	lda APUIO0
	clc
	adc #$22
	sta APUIO0
	WaitAPUIO 0
.ENDM

.MACRO SPC_Procedure5

	stz APUIO1

	ldx #\1
	stx APUIO2
	
	lda APUIO0
	clc
	adc #$2
	cmp #0
	bne +
		clc
		adc #$2
	+:
	
	sta APUIO0
	WaitAPUIO 0
.ENDM
