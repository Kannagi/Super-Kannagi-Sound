
LKS_NMI_Joypad:
	
	lda JOYSER0
	sta LKS_STDCTRL+_J1C
	cmp #$0
	bne +
		
		rtl
	+:
	
	
	lda JOYSER1
	sta LKS_STDCTRL+_J2C
	cmp #$0
	bne +
		
		rtl
	+:
	
	
	ldx STDCONTROL1L
	stx LKS_STDCTRL+_STDCONTROL1L+_J1
	
	ldx STDCONTROL2L
	stx LKS_STDCTRL+_STDCONTROL1L+_J2
	
	
	
	
	
	rtl
	
LKS_Joypad:
	
	joypad_event $80 $00 LKS_STDCTRL+_STDCONTROL1L ; A
	joypad_event $40 $03 LKS_STDCTRL+_STDCONTROL1L ; X
	joypad_event $20 $04 LKS_STDCTRL+_STDCONTROL1L ; L
	joypad_event $10 $05 LKS_STDCTRL+_STDCONTROL1L ; R
	
	joypad_event $10 $06 LKS_STDCTRL+_STDCONTROL1H ; START
	joypad_event $20 $07 LKS_STDCTRL+_STDCONTROL1H ; SELECT
	joypad_event $40 $02 LKS_STDCTRL+_STDCONTROL1H ; Y
	joypad_event $80 $01 LKS_STDCTRL+_STDCONTROL1H ; B
	
	joypad_event $01 $08 LKS_STDCTRL+_STDCONTROL1H ; RIGHT
	joypad_event $02 $09 LKS_STDCTRL+_STDCONTROL1H ; LEFT
	joypad_event $04 $0A LKS_STDCTRL+_STDCONTROL1H ; DOWN
	joypad_event $08 $0B LKS_STDCTRL+_STDCONTROL1H ; UP
	
	rtl
	
	joypad_event $80 $00 STDCONTROL1L ; A
	joypad_event $40 $03 STDCONTROL1L ; X
	joypad_event $20 $04 STDCONTROL1L ; L
	joypad_event $10 $05 STDCONTROL1L ; R
	
	joypad_event $10 $06 STDCONTROL1H ; START
	joypad_event $20 $07 STDCONTROL1H ; SELECT
	joypad_event $40 $02 STDCONTROL1H ; Y
	joypad_event $80 $01 STDCONTROL1H ; B
	
	joypad_event $01 $08 STDCONTROL1H ; RIGHT
	joypad_event $02 $09 STDCONTROL1H ; LEFT
	joypad_event $04 $0A STDCONTROL1H ; DOWN
	joypad_event $08 $0B STDCONTROL1H ; UP
	
	;lda JOYSER0
	;sta LKS_STDCTRL+_J1C
	
	;lda JOYSER1
	;sta LKS_STDCTRL+_J2C
	
	rtl
	
	

	
