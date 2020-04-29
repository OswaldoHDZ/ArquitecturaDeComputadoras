.586
.model flat
.stack 1000h
.data
arreglo  DB 1,5,5,9,7,8,5,9,10 ;16 bits
           ;[0,1,2,3,4,5,6,7,8]
contador DB 0
.code
inicio PROC
    MOV EBX, OFFSET arreglo ; 32 BITS Irse a primera pos del arreglo 
    MOV ECX,10              ; 16 BITS Cantidad de elementos del arreglo
    ;---------------------------------------------------
    ciclo: 
        MOV AL,[EBX] ; AL <- arreglo |||  AL = arreglo[pos]
        CMP AL,5 ; El número que queremos comparar
        JZ FUNCION_SUPREMA ; seguida de la instrucción JZ (salto si es cero) 5 - 5 = 0
        continua: INC EBX
    loop ciclo
    ;-----------------------------------------------------
    MOV AH,0
FUNCION_SUPREMA:
    INC contador
    JMP continua
inicio ENDP 
end