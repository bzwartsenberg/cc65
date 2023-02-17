;
; Kevin Ruland
;
; char cgetc (void);
;

        .export _cgetc

        .include "apple1.inc"

_cgetc:
        lda     KBDRDY
        bpl     _cgetc		; if < 128, no key pressed
	lda	KBD
        and     #$7F		; Clear high bit
done:   ldx	#$00
        rts
