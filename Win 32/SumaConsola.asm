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
resultado DB 0
digito DB 0
num DD 0
numCL DB 0
numCE DB 0

.code
inicio PROC
	MOV EBX,SIZEOF mensaje		; Tamanio del mensaje 
	MOV num,EBX
	CALL escribeCaracteres		; Imprimir mensaje
	MOV num,1
	CALL lecturaCaracteres		; Leer primer digito
	CALL charAint				; Se convierte el digito leido a valor numerico
	MOV resultado,CL			; Se guarda el digito leido (valor numerico)

	MOV num,EBX
	MOV numCE,0
	CALL escribeCaracteres		; Imprimir mensaje
	

	limpiarBuffer:					; Loop hasta que el usuario escribe un digito
		MOV numCL,0
		MOV num,1
		CALL lecturaCaracteres
		CMP digito,'0'
		JL limpiarBuffer			; Si es menor que ascii 48 (0) limpiarBuffer
		CMP digito,'9'
		JG limpiarBuffer			; Si es mayor que ascii 57 (9) limpiarBuffer
	
	
	CALL charAint				; Se guarda en CL el segundo digito (valor numerico)
	ADD CL,resultado			; Se suman los dos digitos
	CALL printResultado			; Imprimir resultado

	INVOKE ExitProcess, 0
inicio ENDP

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

printResultado PROC NEAR
	MOV EAX,0
	MOV AL,CL				; Se almacena valor numerico

	MOV num,1
	ADD CL,'0'
	MOV mensaje,CL
	CMP AL,0Ah
    JL print				; Si es menor que 10 imprimir

	MOV num,2			
	MOV CL,10				; Se separan los dos digitos
	DIV CL
	ADD AL,'0'				; Se convierte el primer digito a ascii
	MOV mensaje,AL
	ADD AH,'0'				; Se convierte el segundo digito a ascii
	MOV mensaje+1,AH

	print:	
		CALL escribeCaracteres	; Imprimir resultado
		RET
printResultado ENDP


END