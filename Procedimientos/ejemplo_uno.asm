.586
.Model flat
.stack 1000h
.data
.code
inicio PROC
    MOV AL,6    ; AL = 8
    MOV BL,7    ; BL = 7
    CALL SUMA   ; 

inicio ENDP 

SUMA PROC
    ADD AL,BL   ; AL = AL + BL
SUMA ENDP

ENP