.586
.Model flat
.stack 100h
.data
.code

inicio PROC
    MOV AL,6
    MOV BL,7
    call suma
inicio ENDP 

suma PROC
    ADD AL,BL 
SUMA ENDP

ENP