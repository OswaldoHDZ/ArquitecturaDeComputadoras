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
	MOV AX,0					; AX es de 16 bits
	MOV AX,WORD PTR dividendo	; EAX = 0AFF , donde FFh es 255
	MOV BL,divisor              ; EBX = 0A   , donde 0Ah es 10 (Divisor)

    MOV AH,0					; AH = 0            -> Contiene el residuo
	DIV BL                      ;                   -> 19h -> 25(Cociente) | 05h -> 5 (Residuo) | EAX = 00CF 0519
	MOV residuos,AH             ; 05 00 00          -> Residuos                              
    MOV cocientes,AL            ; 19 00 00          -> Cocientes
    MOV estaEnAX,AX             ; 19 05 00 00 00 00	-> Lo que esta en AX                        | EAX = 006F 0519

	MOV AH,0                    ;AH = 0             -> Contiene el residuo                      | EAX = 006F 0019
	DIV BL                      ;                   -> 02h -> 02(Cociente) | 05h -> 5 (Residuo) | EAX = 006F 0502
	MOV residuos+1,AH           ; 05 05 00          -> Residuos
    MOV cocientes+1,AL          ; 19 02 00          -> Cocientes
    MOV estaEnAX+2,AX           ; 19 05 02 05 00 00 -> Lo que esta en AX                        | EAX = 0093 0502

    MOV AH,0                    ;AH = 0             -> Contiene el residuo                      | EAX = 00BC 0002
	DIV BL                      ;                   -> 19h -> 00(Cociente) | 02h -> 2 (Residuo) | EAX = 00BC 0200
	MOV residuos+2,AH           ; 05 05 02          -> Residuos
    MOV cocientes+2,AL          ; 19 02 00          -> Cocientes
    MOV estaEnAX+4,AX           ; 19 05 02 05 00 02 -> Lo que esta en AX                        | EAX = 0093 0200

inicio ENDP 
end