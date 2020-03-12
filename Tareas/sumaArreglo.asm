.586
.model flat
.stack 1000h
.data
arreglo DW 1,2,3 ; 16 BITS 
.code
inicio PROC
	;--------------------------------------------------------
	;
	;	El siguiente programa lo que realiza es				|
	;	Sumar los elementos de una palabra y el resultado	|
	;	lo pone en el ultimo elemento						|	
	;														|
	;--------------------------------------------------------
	
    ;Inicializamos el registro EBX y EBX en 0
    ;EBX = Lo vamos a utlizar para recorrer el arreglo (PALABRA)
    ;DX  = Lo vamos a utilizar para acomular las sumas
    ;arreglo = Recordemos que se ve la palabra así = [01 , 00 , 02 , 00 , 03 , 00]
    
	MOV EBX,0
	MOV DX,0
    ;Lo que haces es acceder a ka posicción de memmoria de la palabra para moverlo a DX
	MOV DX,arreglo[EBX]
	MOV EBX,2
    ;Lo que estubo en DX se lo sumamos a el valor de la posición de la palabra
	ADD arreglo[EBX],DX
	
	
	MOV DX,arreglo[EBX]
	MOV EBX,4
	ADD arreglo[EBX],DX

	MOV CX,arreglo[EBX]

inicio ENDP 
end