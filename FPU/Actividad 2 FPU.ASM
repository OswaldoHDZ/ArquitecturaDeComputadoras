; Realizar un programa que calcule la media, 
; la moda y la desviación estandar de un conjunto de 20 datos reales almacenados en memoria,
;  además debe calcular el número de valores que son mayores a la media.

; Media = Elemento 1 + Elemento 2 + Elemento 3 + Elemento 4 / Cantidad de elementos (4)
; Moda  = 
            ;Encuentre la moda del conjunto {2, 3, 5, 5, 7, 9, 9, 9, 10, 12}.

            ;El 2, 3, 7, 10 y 12 aparecen una vez cada uno.

            ;El 5 aparece dos veces y el 9 aparece tres veces.

            ;Así, el 9 es la moda.

; --------------------------------------------------------------------------
.586
.model flat, stdcall
ExitProcess PROTO :DWORD
.stack 100h
.data
conjuntoNum  REAL4 9.0,5.0,5.0,9.0,9.0,8.0,5.0
sumaElementos  REAL4 0.0
media REAL4 0.0
cantidadElementos  DWORD  6 ; Cantidaad de elementos del conjunto - 1
divisor REAL4 7.0
cte DWORD 7
result REAL4 0.0
numeroAComparar  REAL4 0.0
.code
inicio PROC
    MOV ECX,cantidadElementos
    MOV EBX,0
    FLD REAL4 PTR conjuntoNum[EBX*4] ; Metemos el primer elemento a la pila
    INC EBX
    
    ;------------------------------------------------
    ; Este ciclo suma todos los elementos del conjunto
    ciclo: 
        FLD REAL4 PTR conjuntoNum[EBX*4]    ; Metemos el segunto elemento
        FADD                                ; Sumamos los elementos y se encuentran en el tipe de la pila
        INC EBX                             ; Incrementamos el contador
    loop ciclo

    FSTP  REAL4 PTR media ; SACAMOS LA SUMATORIA DE ELEMENTOS
    FLD REAL4 PTR divisor ; METEMOS EL VIDISOR
    FLD REAL4 PTR media   ; METEMOS LA SUMATORIA
    FDIVR
    FSTP  REAL4 PTR media ; SACAMOS LA MEDIA DE ELEMENTOS
    ;===============================================================================================================


    salir: INVOKE ExitProcess,0
inicio ENDP
END
; --------------------------------------------------------------------------

; FTS
;   La instrucción FST almacena una copia de la parte superior
;   de la pila en la posición de memoria
;   o en el registro del coprocesador que indique el operando.

; FLD
;   La instrucción FLD carga datos de punto flotante de la memoria hacia la parte interna de la pila
;   interna, conocida como ST (parte superior de la pila).