.586
.model FLAT, STDCALL
ExitProcess PROTO, dwExitCode:DWORD
FlushConsoleInputBuffer PROTO,hConsoleOutput:dword
WriteConsoleA PROTO,hConsoleOutput:dword,lpBuffer:DWORD,nNumberOfCharsToWrite:dword, lpNumberOfCharsWritten:dword,lpReserved:DWORD
ReadConsoleA PROTO, hConsoleOutput:dword, IpBuffeer:DWORD,nNumberofCharsToWrite:dword, IpNumberOfCharsWritten:dword,IpReserved:DWORD
GetStdHandle PROTO, :DWORD
Beep PROTO, :DWORD, :DWORD
.stack 1000h
.data
mensaje DB "Escribe un digito: "    
radio DB 0                          
diametro DWORD 0                       
digito DB 0                         
num DD 0                            
numCL DB 0                          
numCE DB 0                          
perimetro  DD 0                     
result REAL4 0.0
.code
inicio PROC
	; Este programa solo lee en consola el radio de un circulo y calcula 
	; su perimetro, el perimetro lo coloca en el tope de la pila
    ; PERIMETRO = 3.1416 * Diametro
	; 3.1416 Diametro *
	MOV EBX,SIZEOF mensaje		; Tamanio del mensaje 
	MOV num,EBX
	CALL escribeCaracteres		; Imprimir mensaje
	MOV num,1
	CALL lecturaCaracteres		; Leer primer digito
	CALL charAint				; Se convierte el digito leido a valor numerico
	MOV radio,CL				; Se guarda el digito leido (valor numerico)
    MOV EAX,2
    MUL CL						; En CL tenemos el radio
	FLDPI						; Aqui metemos PI 
	MOV diametro, EAX
	FILD DWORD PTR diametro
	FMUL						; Aqui multimplamos el PI por el diametro
	INVOKE ExitProcess, 0
inicio ENDP
;----------------------------------------------------------------------------------
lecturaCaracteres PROC
    PUSH -10
    CALL GetStdHandle
    
    PUSH 0
    PUSH OFFSET numCL
    PUSH num
    PUSH OFFSET digito
    PUSH EAX

    CALL ReadConsoleA
    RET
lecturaCaracteres ENDP

escribeCaracteres PROC
	PUSH -11
	CALL GetStdHandle
		
	PUSH 0
	PUSH OFFSET numCE
	PUSH num
	PUSH OFFSET mensaje
	PUSH EAX

	CALL WriteConsoleA
	RET
escribeCaracteres ENDP

charAint PROC
	SUB digito,'0'
	MOV CL,digito
	RET
charAint ENDP

END