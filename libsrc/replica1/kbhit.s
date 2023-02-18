;
; Kevin Ruland
; Ullrich von Bassewitz, 2005-03-25
;
; unsigned char kbhit (void);
;

        .export _kbhit

        .include "apple1.inc"

_kbhit:
        lda     KBDRDY          ; Reading KBDRDY checks for keypress
        rol                     ; if high bit is set, key was pressed
        lda     #$00
        tax
        rol
        rts
