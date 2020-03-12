.586
.model flat
.stack 1000h
.data
arreglo DW 1,2,3 ; 16 BITS
.code
inicio PROC
    MOV EBX,0
    MOV DX,0
    MOV DX,arreglo[EBX]
    MOV EBX,2
    ADD DX,arreglo[EBX]
    MOV EBX,4
    ADD DX,arreglo[EBX]
    MOV EBX,6
    MOV arreglo[EBX],DX
inicio ENDP
end
