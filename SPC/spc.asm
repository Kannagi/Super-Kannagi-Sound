
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
.DEFINE LKS_SPC_BRR_INIT	$23

;-----------------
.DEFINE LKS_SPC_OFF 	$00
.DEFINE LKS_SPC_ON 		$01
.DEFINE LKS_SPC_LOOP  	$02

;-----------------

.DEFINE LKS_SPC_SPLDIR $1100
.DEFINE LKS_SPC_HEADER $1500
.DEFINE LKS_SPC_TRACK  $1600 ;size $2A00
.DEFINE LKS_SPC_SAMPLE $4000
.DEFINE LKS_SPC_SZSPL  $00BD

.MACRO WaitAPUIO
	-:
		cmp APUIO0+\1
	bne -
.ENDM

.MACRO LKS_SPC_WAIT
	lda LKS_SPC_VAR
	sta APUIO0
	-:
		cmp APUIO0
	beq -
	lda APUIO0
	sta LKS_SPC_VAR
	stz APUIO1
.ENDM


.MACRO LKS_SPC_Get

	
	lda #\1
	sta APUIO1
	
	
	LKS_SPC_WAIT
.ENDM

.MACRO LKS_SPC_Set_var

	
	lda #\1
	sta APUIO1
	
	LKS_SPC_WAIT
.ENDM

.MACRO LKS_SPC_Set

	
	lda #\1
	sta APUIO1
	
	lda #\2
	sta APUIO2
	
	lda #\3
	sta APUIO3
	
	LKS_SPC_WAIT
.ENDM

.MACRO LKS_SPC_Set2

	
	lda #\1
	sta APUIO1
	
	ldx #\2
	stx APUIO2
	
	LKS_SPC_WAIT
.ENDM


.MACRO LKS_SPC_Set3


	
	
	

	ldx #0
	--:
		lda #\1
		sta APUIO1
		
		
		
		lda.l \2,x
		sta APUIO2
		
		
		LKS_SPC_WAIT
		
		
		
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
		
		lda LKS_SPC_VAR
		sta APUIO0
		
		LKS_SPC_WAIT
		
		
		
		inx
		cpx #\3
	bcc --
	
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
		cpx #$1300
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
