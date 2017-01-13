
.DEFINE MEM_TEMP 		$0
.DEFINE MEM_TEMPFUNC 	$10
.DEFINE LKS_TMP_ARGS 	$20
.DEFINE LKS_TMP	 		$26
.DEFINE LKS_TMP_RETURN 	$36
.DEFINE LKS_TEMPVBL 	$38

.DEFINE LKS_VBLANK 		$40
.DEFINE LKS_PRINTPL		$4B
.DEFINE LKS_CPU			$4C
.DEFINE LKS_VCPU		$4D
.DEFINE LKS_DMAT   		$4E
.DEFINE LKS_OAM 		$50
.DEFINE LKS_FADE 		$80
.DEFINE LKS_BG			$90

.DEFINE s_lks 			$F0

;s_lks
.DEFINE	_lks_tmpbg3 	$00

.DEFINE s_palette $200


.DEFINE MEM_OAML $D80
.DEFINE MEM_OAMH $F80
;FA0-FB0 free
.DEFINE LKS_STDCTRL $FB0

.DEFINE LKS_SPC_VAR $7E2000

.DEFINE MODE7S $1100
.DEFINE MODE7A $1400
.DEFINE MODE7D $1700
.DEFINE MODE7B $1A00
.DEFINE MODE7C $1D00

.DEFINE LKS_BUF_MODE7 $7E5000
/*
.DEFINE MODE7S $0100+$7E5000
.DEFINE MODE7A $0400+$7E5000
.DEFINE MODE7D $0700+$7E5000
.DEFINE MODE7B $0A00+$7E5000
.DEFINE MODE7C $0D00+$7E5000
*/

.DEFINE LKS_DMA   	  $7E6700
.DEFINE LKS_BUF_OAM   $7E7000
.DEFINE LKS_BUF_OAML  $7E7000
.DEFINE LKS_BUF_OAMH  $7E7200
.DEFINE LKS_BUF_BGS1  $7E7300
.DEFINE LKS_BUF_BGS2  $7E7400
.DEFINE LKS_BUF_PAL   $7E7600
.DEFINE LKS_BUF_BG3   $7E7800

.DEFINE LKS_BUF_COL   $7E8000
.DEFINE LKS_BUF_BG1   $7F0000
.DEFINE LKS_BUF_BG2   $7F8000



;-----------------------

;LKS_DMA
.DEFINE _dmaEnable	$00
.DEFINE _dmaBank	$01
.DEFINE _dmaSrcR	$02


.DEFINE _dmaSrc1	$04
.DEFINE _dmaDst1	$06
.DEFINE _dmaSize1	$08

.DEFINE _dmaSrc2	$0A
.DEFINE _dmaDst2	$0C
.DEFINE _dmaSize2	$0E

.DEFINE _dmaSrc3	$10
.DEFINE _dmaDst3	$12
.DEFINE _dmaSize3	$14

.DEFINE _dmaFunc	$16
.DEFINE _dmat		$18

;LKS_FADE
.DEFINE	_fdbrg		$00
.DEFINE	_fdtimer	$01 
.DEFINE	_fdphase	$03
.DEFINE	_fdvin		$04
.DEFINE	_fdvout		$05

;LKS_VBLANK
.DEFINE	_vblset		$00
.DEFINE	_vblenable	$01
.DEFINE	_vbltime	$02
.DEFINE	_vbltimemin	$04

;LKS_BG
.DEFINE	_bg1x		$00
.DEFINE	_bg1y		$02
.DEFINE	_bg2x		$04
.DEFINE	_bg2y		$06
.DEFINE	_bg3x		$08
.DEFINE	_bg3y		$0A
.DEFINE	_bg4x		$0C
.DEFINE	_bg4y		$0E

.DEFINE	_bg2Haddsc	$10
.DEFINE	_bg2Vaddsc	$12
.DEFINE	_bg2add1	$14
.DEFINE	_bg2add2	$16
.DEFINE	_bg1Haddsc	$18
.DEFINE	_bg1Vaddsc	$1A
.DEFINE	_bg1add1	$1C
.DEFINE	_bg1add2	$1E

.DEFINE	_bgH		$20
.DEFINE	_bgV		$22
.DEFINE	_bgEnableX	$24
.DEFINE	_bgEnableY	$25
.DEFINE	_bgaddyr	$26
.DEFINE	_bgaddy		$28
.DEFINE	_bglimitex	$2A
.DEFINE	_bglimitey	$2C

;LKS_OAM
.DEFINE _zorderadr  $0
.DEFINE _sprn1      $2
.DEFINE _sprn2	    $3
.DEFINE _sprx	    $4
.DEFINE _spry	    $6
.DEFINE _sprtile	$8
.DEFINE _sprext		$9
.DEFINE _sprsz		$A
.DEFINE _sprtmp1	$C
.DEFINE _sprtmp2	$E
.DEFINE _zorder     $10 ;$10-$2F
.DEFINE _nperso1    $2E 
.DEFINE _nperso2    $2F 

;s_palette
.DEFINE	_pleffect	$00
.DEFINE	_pltype		$01
.DEFINE	_pli		$02 ;2-3
.DEFINE	_pll		$04

.DEFINE	_bgpl1		$10
.DEFINE	_bgpl2		$13
.DEFINE	_bgpl3		$16
.DEFINE	_bgpl4		$19
.DEFINE	_bgpl5		$1C
.DEFINE	_bgpl6		$1F
.DEFINE	_bgpl7		$22
.DEFINE	_bgpl8		$25

.DEFINE	_spl1		$28
.DEFINE	_spl2		$2B
.DEFINE	_spl3		$2E
.DEFINE	_spl4		$31
.DEFINE	_spl5		$34
.DEFINE	_spl6		$37
.DEFINE	_spl7		$3A
.DEFINE	_spl8		$3D


