

.MACRO joypad_event
	lda \3	; read joypad
	bit #\1
	bne +
		stz LKS_STDCTRL + \2
		bra ++
	+:
		lda LKS_STDCTRL + \2
		cmp #$00
		bne +
			lda #01
			sta LKS_STDCTRL + \2
			bra ++
		+:
		
		lda #02
		sta LKS_STDCTRL + \2
	++:
.ENDM

.DEFINE	_A			$00
.DEFINE	_B			$01
.DEFINE	_Y			$02
.DEFINE	_X			$03

.DEFINE	_L			$04
.DEFINE	_R			$05

.DEFINE	_START		$06
.DEFINE	_SELECT		$07

.DEFINE	_RIGHT		$08
.DEFINE	_LEFT		$09
.DEFINE	_DOWN		$0A
.DEFINE	_UP 		$0B

.DEFINE	_J1C 		$0C
.DEFINE	_J2C 		$1C
.DEFINE	_STDCONTROL1L 		$0E
.DEFINE	_STDCONTROL1H 		$0F

.DEFINE	_J1 		$00
.DEFINE	_J2 		$10
.DEFINE	_J3 		$20
.DEFINE	_J4 		$30

.DEFINE	LKS_DOWN	$01
.DEFINE	LKS_DOWNS	$02	
.DEFINE	LKS_UP		$03


	
