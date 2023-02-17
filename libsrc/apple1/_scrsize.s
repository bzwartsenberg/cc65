;
; Ullrich von Bassewitz, 26.10.2000
;
; Screen size variables
;

        .export	      	screensize

        .include        "apple1.inc"

screensize:
        ldx	#40
        ldy	#24
        rts
