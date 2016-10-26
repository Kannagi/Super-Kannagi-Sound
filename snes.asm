;Initial settings for screen
.MACRO SNES_INIDISP ARGS arg
	lda #arg
	sta $2100
.ENDM

;OBJECT SIZE & OBJECT DATA AREA DESIGNATION
.MACRO SNES_OBJSEL ARGS arg
	lda #arg
	sta $2101
.ENDM

;ADDRESS FOR ACCESSING OAM (OBJECT ATTRIBUTE MEMORY)
.MACRO SNES_OAMADD ARGS arg
	ldy #arg
	sty $2102
.ENDM

;DATA FOR OAM WRITE
.MACRO SNES_OAMDATA ARGS arg
	lda #arg
	sta $2104
.ENDM

;BG MODE & CHARACTER SIZE SETTINGS
.MACRO SNES_BGMODE ARGS arg
	lda #arg
	sta $2105
.ENDM


;SIZE & SCREEN DESIGNATION FOR MOSAIC DISPLAY
.MACRO SNES_MOSAIC ARGS arg
	lda #arg
	sta $2106
.ENDM

;ADDRESS FOR STORING SC-DATA OF EACH BG & SC SIZE DESIGNATION
.MACRO SNES_BG1SC ARGS arg
	lda #arg
	sta $2107
.ENDM

.MACRO SNES_BG2SC ARGS arg
	lda #arg
	sta $2108
.ENDM

.MACRO SNES_BG3SC ARGS arg
	lda #arg
	sta $2109
.ENDM

.MACRO SNES_BG4SC ARGS arg
	lda #arg
	sta $210A
.ENDM

;BG CHARACTER DATA AREA DESTINATION
.MACRO SNES_BGNBA ARGS arg1,arg2
	lda #arg1
	sta $210B
	
	lda #arg2
	sta $210C
.ENDM

.MACRO SNES_BG12NBA ARGS arg
	lda #arg
	sta $210B
.ENDM

.MACRO SNES_BG34NBA ARGS arg
	lda #arg
	sta $210C
.ENDM

;H/V SCROLL VALUE DESIGNATION FOR BG-1,2,3,4
.MACRO SNES_BG1H0FS ARGS arg
	lda #arg
	sta $210D
.ENDM

.MACRO SNES_BG1V0FS ARGS arg
	lda #arg
	sta $210E
.ENDM

.MACRO SNES_BG2H0FS ARGS arg
	lda #arg
	sta $210F
.ENDM

.MACRO SNES_BG2V0FS ARGS arg
	lda #arg
	sta $2110
.ENDM

.MACRO SNES_BG3H0FS ARGS arg
	lda #arg
	sta $2111
.ENDM

.MACRO SNES_BG3V0FS ARGS arg
	lda #arg
	sta $2112
.ENDM

.MACRO SNES_BG4H0FS ARGS arg
	lda #arg
	sta $2113
.ENDM

.MACRO SNES_BG4V0FS ARGS arg
	lda #arg
	sta $2114
.ENDM

;VRAM ADRESS INCREMENT VALUE DESIGNATION
.MACRO SNES_VMAINC ARGS arg
	lda #arg
	sta $2115
.ENDM

;VRAM ADRESS INCREMENT VALUE DESIGNATION
.MACRO SNES_VMADD ARGS arg
	ldy #arg
	sty $2116
.ENDM

;DATA FOR VRAM WRITE
.MACRO SNES_VMDATA
	ldy #\1
	sty $2118
.ENDM

;INITIAL SETTING IN SCREEN MODE-7
.MACRO SNES_M7SEL ARGS arg
	lda #arg
	sta $211A
.ENDM

;ROTATION/ENLARGEMENT/REDUCTION/ IN MODE-7 , CENTER COORDINATE
;SETTINGS & MULTIPLICAND/MULTIPLIER SETTINGS OF COMPLEMENTARY
;MULTIPLICATION

.MACRO SNES_M7
	lda #\1&$FF
	sta $211B
	lda #\1/$100
	sta $211B
	
	lda #\2&$FF
	sta $211BC
	lda #\2/$100
	sta $211C
	
	lda #\3&$FF
	sta $211D
	lda #\3/$100
	sta $211D
	
	lda #\4&$FF
	sta $211E
	lda #\4/$100
	sta $211E
	
	lda #\5&$FF
	sta $211F
	lda #\5/$100
	sta $211F
	
	lda #\6&$FF
	sta $2120
	lda #\6/$100
	sta $2120
.ENDM

;ADDRES FOR CG-RAM READ AND WRITE
.MACRO SNES_CGADD ARGS arg
	lda #arg
	sta $2121
.ENDM

;DATA FOR CG-RAM WRITE
.MACRO SNES_CGDATA ARGS arg
	lda #arg
	sta $2122
.ENDM

;WINDOWS MASK SETTINGS BG1-BG4, OBJ COLOR)
.MACRO SNES_W12SEL ARGS arg
	lda #arg
	sta $2123
.ENDM

.MACRO SNES_W34SEL ARGS arg
	lda #arg
	sta $2124
.ENDM

.MACRO SNES_WOBJSEL ARGS arg
	lda #arg
	sta $2125
.ENDM

;WINDOWS POSITION DESIGNATION
.MACRO SNES_WH0 ARGS arg
	lda #arg
	sta $2126
.ENDM

.MACRO SNES_WH1 ARGS arg
	lda #arg
	sta $2127
.ENDM

.MACRO SNES_WH2 ARGS arg
	lda #arg
	sta $2128
.ENDM

.MACRO SNES_WH3 ARGS arg
	lda #arg
	sta $2129
.ENDM

;MAIN SCREEN DESIGNATION
.MACRO SNES_TM ARGS arg
	lda #arg
	sta $212C
.ENDM

;SUB SCREEN DESIGNATION
.MACRO SNES_TS ARGS arg
	lda #arg
	sta $212D
.ENDM

.MACRO SNES_TMW ARGS arg
	lda #arg
	sta $212E
.ENDM

;INITIAL SETTINGS FOR FIXED COLOR ADDITION OR SCREEN ADDITION
.MACRO SNES_CGSWSEL ARGS arg
	lda #arg
	sta $2130
.ENDM



;ADDITION/SUBTRACTION & SUBTRACTION DESIGNATION FOR EACH BG SCREEN OBJ & BACKGROUND COLOR
.MACRO SNES_CGADSUB ARGS arg
	lda #arg
	sta $2131
.ENDM



;FIXED COLOR DATA FOR FIXED COLOR ADDITION/SUBTRACTION
.MACRO SNES_COLDATA ARGS arg
	lda #arg
	sta $2132
.ENDM



;SCREEN INITIAL SETTINGS
.MACRO SNES_SETINI ARGS arg
	lda #arg
	sta $2133
.ENDM

.MACRO SNES_WMADD ARGS arg,arg2
	ldy #arg
	sty $2181
	
	lda #arg2
	sta $2183
.ENDM

;ENABLE FLAG FOR V-BLANK, TIMER INTERRUPT & STANDARD CONTROLLER
.MACRO SNES_NMITIMEN ARGS arg
	lda #arg
	sta $4200
.ENDM

;PROGRAMMABLE I/O PORT
.MACRO SNES_WRIO ARGS arg
	lda #arg
	sta $4201
.ENDM

;MULTIPLIER & MULTIPLICAND BY MULTIPLICATION
.MACRO SNES_WRMPYA ARGS arg
	lda #arg
	sta $4202
.ENDM

.MACRO SNES_WRMPYB ARGS arg
	lda #arg
	sta $4203
.ENDM


;DIVISOR & DIVIDEND BY DIVIDE
.MACRO SNES_WRDIVL ARGS arg
	lda #arg
	sta $4204
.ENDM

.MACRO SNES_WRDIVH ARGS arg
	lda #arg
	sta $4205
.ENDM

.MACRO SNES_WRDIVB ARGS arg
	lda #arg
	sta $4206
.ENDM



;DMA Enable Register
.MACRO SNES_MDMAEN ARGS arg
	lda #arg
	sta $420B
.ENDM



;HDMA Enable Register
.MACRO SNES_HDMAEN ARGS arg
	lda #arg
	sta $420C
.ENDM


;MAIN SCREEN DESIGNATION
.MACRO SNES_MEMSEL ARGS arg
	lda #arg
	sta $420D
.ENDM


;QUOTIENT OF DIVIDE RESULT
.MACRO SNES_RDDIVL ARGS arg
	lda #arg
	sta $4214
.ENDM

.MACRO SNES_RDDIVH ARGS arg
	lda #arg
	sta $4215
.ENDM





;PRODUCT OF MULTIPLICATION RESULT OR REMAINDER OF DIVIDE RESULT
.MACRO SNES_RDMPYL ARGS arg
	lda #arg
	sta $4216
.ENDM

.MACRO SNES_RDMPYH ARGS arg
	lda #arg
	sta $4217
.ENDM




;DATA FOR STANDARD CONTROLLER I, II, III & IV




;PARAMETER FOR DMA TRANSFER
.MACRO SNES_DMAX ARGS arg
	lda #arg
	sta $4300
	sta $4310
	sta $4320
	sta $4330
	sta $4340
	sta $4350
	sta $4360
	sta $4370
.ENDM

.MACRO SNES_DMA0 ARGS arg
	lda #arg
	sta $4300
.ENDM

.MACRO SNES_DMA1 ARGS arg
	lda #arg
	sta $4310
.ENDM

.MACRO SNES_DMA2 ARGS arg
	lda #arg
	sta $4320
.ENDM

.MACRO SNES_DMA3 ARGS arg
	lda #arg
	sta $4330
.ENDM

.MACRO SNES_DMA4 ARGS arg
	lda #arg
	sta $4340
.ENDM

.MACRO SNES_DMA5 ARGS arg
	lda #arg
	sta $4350
.ENDM

.MACRO SNES_DMA6 ARGS arg
	lda #arg
	sta $4360
.ENDM

.MACRO SNES_DMA7 ARGS arg
	lda #arg
	sta $4370
.ENDM

;B-BUS ADRESS FOR DMA
.MACRO SNES_DMAX_BADD ARGS arg
	lda #arg
	sta $4301
	sta $4311
	sta $4321
	sta $4331
	sta $4341
	sta $4351
	sta $4361
	sta $4371
.ENDM


.MACRO SNES_DMA0_BADD ARGS arg
	lda #arg
	sta $4301
.ENDM

.MACRO SNES_DMA1_BADD ARGS arg
	lda #arg
	sta $4311
.ENDM

.MACRO SNES_DMA2_BADD ARGS arg
	lda #arg
	sta $4321
.ENDM

.MACRO SNES_DMA3_BADD ARGS arg
	lda #arg
	sta $4331
.ENDM

.MACRO SNES_DMA4_BADD ARGS arg
	lda #arg
	sta $4341
.ENDM

.MACRO SNES_DMA5_BADD ARGS arg
	lda #arg
	sta $4351
.ENDM

.MACRO SNES_DMA6_BADD ARGS arg
	lda #arg
	sta $4361
.ENDM

.MACRO SNES_DMA7_BADD ARGS arg
	lda #arg
	sta $4371
.ENDM



;TABLE ADDRESS OF A-BUS FOR DMA
.MACRO SNES_DMA0_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2 
    
     
    
    stx $4302
    sta $4304
    sty $4305    

.ENDM

.MACRO SNES_DMA1_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4312
    sta $4314
    sty $4315    

.ENDM

.MACRO SNES_DMA2_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4322
    sta $4324
    sty $4325    

.ENDM

.MACRO SNES_DMA3_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4332
    sta $4334
    sty $4335    

.ENDM

.MACRO SNES_DMA4_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4342
    sta $4344
    sty $4345    

.ENDM

.MACRO SNES_DMA5_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4352
    sta $4354
    sty $4355    

.ENDM

.MACRO SNES_DMA6_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4362
    sta $4364
    sty $4365    

.ENDM

.MACRO SNES_DMA7_ADD

	lda #:\1  
    ldx #\1        
    ldy #\2   
    
    stx $4372
    sta $4374
    sty $4375    

.ENDM

.MACRO SNES_DMA_ADD

	lda \1+2 
    ldx \1        
    ldy #\2   
    
    stx $4302+(\3*$10)
    sta $4304+(\3*$10)
    sty $4305+(\3*$10)   

.ENDM

.MACRO SNES_DMA_ADDM

	lda #:\1
    ldx #\1+\4      
    ldy #\2   
    
    stx $4302+(\3*$10)
    sta $4304+(\3*$10)
    sty $4305+(\3*$10)   

.ENDM

;DATA ADDRESS STORE BY H-DMA & NUMBER OF BYTE TO BE TRANSFERRED SETTINGS BY GENERAL PURPOSE DMA
.MACRO SNES_HDMA0_ADD

	ldy #\1   
	lda #:\1       
    sty $4302
    sta $4304
	
.ENDM

.MACRO SNES_HDMA1_ADD

	ldy #\1   
	lda #:\1       
    sty $4312
    sta $4314
	
.ENDM


.MACRO SNES_HDMA_ADD

    ldx #\1 
    lda #\2
    
    stx $4302+(\7*16)
    sta $4304+(\7*16)
    
    
    ldx #\3 
    lda #\4
    
    stx $4305+(\7*16)
    sta $4307+(\7*16)
    
    
    ldx #\5
    stx $4308+(\7*16)

	lda #\6
    sta $430A+(\7*16)
    
.ENDM


.MACRO SNES_HDMA1_ADD2

	ldx #\1        
    lda #\2 
    ldy #\3
    
    sty $4312
    stz $4314
    stx $4315
    sta $4317 
    
    stz $4318
    stz $4319
    stz $431A 

.ENDM

;SNES INIT
.MACRO SNES_INIT


	lda #$80
	sta $2100
	stz $2101
	stz $2102
	stz $2103
	;stz $2104
	stz $2105
	stz $2106
	stz $2107
	stz $2108
	stz $2109
	stz $210A
	stz $210B
	stz $210C
	stz $210D
	stz $210E
	stz $210F
	
	stz $2110
	stz $2111
	stz $2112
	stz $2113
	stz $2114
	stz $2115 
	stz $2116
	stz $2117
	;stz $2118 
	;stz $2119 
	stz $211A
	stz $211B 
	stz $211C
	stz $211D
	stz $211E 
	stz $211F
	
	stz $2120
	stz $2121
	;stz $2122 
	stz $2123
	stz $2124 
	stz $2125
	stz $2126
	stz $2127
	stz $2128
	stz $2129
	stz $212A
	stz $212B
	stz $212C
	stz $212D
	stz $212E
	stz $212F
	
	stz $2130
	stz $2131
	stz $2132 
	stz $2133
	
	
		
	stz $4200
	stz $4201
	/*
	stz $4202
	stz $4203
	stz $4204 
	stz $4205
	stz $4206
	*/
	stz $4207
	stz $4208
	stz $4209
	stz $420A
	stz $420B
	stz $420C
	stz $420D
	
	stz $4016
	stz $4017
	;lda $4210
.ENDM


;---------------------------------------------
.DEFINE INIDISP $2100
.DEFINE OBJSEL 	$2101
.DEFINE OAMADDL $2102
.DEFINE OAMADDH $2103
.DEFINE OAMDATA $2104
.DEFINE BGMODE 	$2105
.DEFINE MOSAIC 	$2106
.DEFINE BG1SC 	$2107
.DEFINE BG2SC 	$2108
.DEFINE BG3SC 	$2109
.DEFINE BG4SC 	$210A
.DEFINE BG12NBA $210B
.DEFINE BG34NBA $210C
.DEFINE BG1H0FS $210D
.DEFINE BG1V0FS $210E
.DEFINE BG2H0FS $210F
.DEFINE BG2V0FS $2110
.DEFINE BG3H0FS $2111
.DEFINE BG3V0FS $2112
.DEFINE BG4H0FS $2113
.DEFINE BG4V0FS $2114
.DEFINE VMAINC 	$2115
.DEFINE VMADDL 	$2116
.DEFINE VMADDH 	$2117
.DEFINE VMDATAL $2118
.DEFINE VMDATAH $2119
.DEFINE M7SEL 	$211A
.DEFINE M7A 	$211B
.DEFINE M7B 	$211C
.DEFINE M7C 	$211D
.DEFINE M7D 	$211E
.DEFINE M7X 	$211F
.DEFINE M7Y 	$2120
.DEFINE CGADD 	$2121
.DEFINE CGDATA 	$2122
.DEFINE W12SEL  $2123
.DEFINE W34SEL  $2124
.DEFINE WOBJSEL $2125
.DEFINE WH0 	$2126
.DEFINE WH1 	$2127
.DEFINE WH2 	$2128
.DEFINE WH3 	$2129
.DEFINE WBGLOG 	$212A
.DEFINE WOBJLOG $212B
.DEFINE TM 		$212C
.DEFINE TS 		$212D
.DEFINE TMW		$212E
.DEFINE TSW		$212F
.DEFINE CGSWSEL $2130
.DEFINE CGADSUB $2131
.DEFINE COLDATA $2132
.DEFINE SETINI 	$2133
.DEFINE MPYL 	$2134
.DEFINE MPYM 	$2135
.DEFINE MPYH 	$2136
.DEFINE SLHV 	$2137

.DEFINE OAMDATAREAD $2138
.DEFINE VMDATALREAD $2139
.DEFINE VMDATAHREAD $213A
.DEFINE CGDATAREAD  $213B

.DEFINE OPHCT 	$213C
.DEFINE OPVCT 	$213D
.DEFINE STAT77 	$213E
.DEFINE STAT78 	$213F

.DEFINE APUIO0  $2140
.DEFINE APUIO1  $2141
.DEFINE APUIO2  $2142
.DEFINE APUIO3  $2143
.DEFINE WMDATA  $2180
.DEFINE WMADDL  $2181
.DEFINE WMADDM  $2182
.DEFINE WMADDH  $2183

.DEFINE JOYSER0	$4016
.DEFINE JOYSER1	$4017

.DEFINE NMITIMEN 	 $4200
.DEFINE WRIO 		 $4201
.DEFINE WRMPYA 		 $4202
.DEFINE WRMPYB 		 $4203
.DEFINE WRDIVL 		 $4204
.DEFINE WRDIVH 		 $4205
.DEFINE WRDIVB 		 $4206
.DEFINE HTIMEL 		 $4207
.DEFINE HTIMEH 		 $4208
.DEFINE VTIMEL 		 $4209
.DEFINE VTIMEH 		 $420A
.DEFINE MDMAEN 		 $420B
.DEFINE HDMAEN 		 $420C
.DEFINE MEMSEL 		 $420D

.DEFINE RDNMI 		 $4210
.DEFINE TIMEUP 		 $4211
.DEFINE HVBJOY 		 $4212
.DEFINE RDIO 		 $4213

.DEFINE RDDIVL 		 $4214
.DEFINE RDDIVH 		 $4215
.DEFINE RDMPYL 		 $4216
.DEFINE RDMPYH  	 $4217
.DEFINE STDCONTROL1L $4218
.DEFINE STDCONTROL1H $4219
.DEFINE STDCONTROL2L $421A
.DEFINE STDCONTROL2H $421B
.DEFINE STDCONTROL3L $421C
.DEFINE STDCONTROL3H $421D
.DEFINE STDCONTROL4L $421E
.DEFINE STDCONTROL4H $421F
.DEFINE DMA 		 $4300
.DEFINE DMA_BADD 	 $4301
.DEFINE DMA_ADDL 	 $4302
.DEFINE DMA_ADDH 	 $4303
.DEFINE DMA_BANK 	 $4304
.DEFINE DMA_SIZEL 	 $4305
.DEFINE DMA_SIZEH 	 $4306
.DEFINE HDMA_BANK 	 $4307
.DEFINE HDMA_ADDL	 $4308
.DEFINE HDMA_ADDH	 $4309
.DEFINE HDMA_LINE	 $430A

.DEFINE CHANNEL0 	 $00
.DEFINE CHANNEL1 	 $10
.DEFINE CHANNEL2 	 $20
.DEFINE CHANNEL3 	 $30
.DEFINE CHANNEL4 	 $40
.DEFINE CHANNEL5 	 $50
.DEFINE CHANNEL6 	 $60
.DEFINE CHANNEL7 	 $70

