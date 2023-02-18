;
; Ullrich von Bassewitz, 06.08.1998
;
; void __fastcall__ cputcxy (unsigned char x, unsigned char y, char c);
; void __fastcall__ cputc (char c);
;

        .export         _cputcxy, _cputc
        .import         popa, _gotoxy

        .include        "apple1.inc"

        .code

; Plot a character - also used as internal function

_cputcxy:
        pha                     ; Save C
        jsr     popa            ; Get Y
        jsr     _gotoxy
        pla                     ; Restore C

_cputc:
	jmp	ECHO
