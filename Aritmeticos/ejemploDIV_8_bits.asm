.586
.model flat
.stack 1000h
.data
dividendo DB 255
divisor   DB 10
residuos  DB 3 DUP(0)
cocientes DB 3 DUP(0)
estaEnAX  DW 6 DUP(0)
.code
inicio PROC
	; AX se divide entre BL -> En este caso seria -> 255/10
	; AH Contien el residuo
	; AL Contiene el cociente con el signo
	MOV AX,WORD PTR dividendo
	MOV BL,divisor

    MOV AH,0
	DIV BL
	MOV residuos,AH
    MOV cocientes,AL
    MOV estaEnAX,AX

	MOV AH,0
	DIV BL
	MOV residuos+1,AH
    MOV cocientes+1,AL
    MOV estaEnAX+1,AX

    MOV AH,0
	DIV BL
	MOV residuos+2,AH
    MOV cocientes+2,AL
    MOV estaEnAX+2,AX

inicio ENDP 
end