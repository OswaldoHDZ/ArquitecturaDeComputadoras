.586
.MMX
.model flat,stdcall
ExitProcess PROTO, :DWORD
CreateFileA PROTO, :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
WriteFile PROTO, :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ReadFile PROTO, :DWORD,:DWORD,:DWORD,:DWORD,:DWORD

.stack 100h
.data
entrada DB "flor.raw",0
salida DB "florEscalada.raw",0
handleE DD 0
handleS DD 0
contE DD 0
imagenO DB 3250 dup(0)
imagenE DB 6500 dup(0)



.code

inicio PROC
call leerArchivo


MOV EBX,0

MOV EDX,0

MOV ECX,50  ;Se inicializa el contador en 50 para recorrer las 50 columnas de la imagen
;inicia ciclo externo

ciclo1: MOV contE,ECX    ;Esta instruccion respalda el valor de ECX que controla el ciclo externo

MOV ECX,8  ; Se inicializa en 8 el contador para recorre los 65 datos por columna de la imagen
;inicia cilo interno
ciclo: 
    MOVQ MM0,QWORD PTR imagenO[EBX]
	MOVQ MM1,MM0
	PUNPCKLBW MM0,MM1
	MOVQ MM2,MM1
	PUNPCKHBW MM1,MM2
	MOVQ QWORD PTR imagenE[EDX],MM0
	MOVQ QWORD PTR imagenE[EDX+8],MM1
	ADD EBX,8             ;EBX avanza de 8 en 8 porque procesa paquetes de 8 pixeles a la vez
	ADD EDX,16            ;EDX avana de 16 en 16 porque como resultado tenemos 16 pixeles por cada 8 procesados
	loop ciclo   ;fin del ciclo interno
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Estas intrucciones procesan el bit 65, ya que en el ciclo solo se procesaron 64 pixeles 8 en cada iteración

	MOV AL,imagenE[EBX]  
	MOV imagenE[EDX],AL
	MOV imagenE[EDX+1],AL
	INC EBX
	ADD EDX,2
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MOV ECX,contE  ;Se restablece el valor del contador para el ciclo externo
loop ciclo1    ;Fin del ciclo externo

;;;;;;;;;;;;;;;;;;;;;;;;;
;Este código genera el archivo de salida
CALL creaArchivo
CALL escribirArchivo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




INVOKE ExitProcess,0
inicio ENDP

;;;;;;;;Subrutinas para el manejo de archivos;;;;;;;;;;;;;;;;

creaArchivo proc
	push 0
	push 20H
	push 2
	push 0
	push 3
	push 0C0000000h
	push offset salida
	call CreateFileA
	mov handleS,eax

ret
creaArchivo endp

abrirArchivo proc
	push 0
	push 20H
	push 3
	push 0
	push 3
	push 0C0000000h
	push offset entrada
	call CreateFileA
	mov handleE,eax

ret
abrirArchivo endp

escribirArchivo proc
	push 0
	push 0
	push 6500 
	;push 13000 ;Numero de caracteres a escribir
	push offset imagenE
	push handleS
	call WriteFile
ret
escribirArchivo endp

leerArchivo proc
	call abrirArchivo
	push 0
	push 0
	push 3250
	push offset imagenO
	push handleE
	call ReadFile
ret
leerArchivo endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

END