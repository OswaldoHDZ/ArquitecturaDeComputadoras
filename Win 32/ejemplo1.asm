.586
.model flat, stdcall
ExitProcess PROTO, dwExitCode:DWORD
WriteConsoleA PROTO,hConsoleOutput:dword,lpBuffer:DWORD,nNumberOfCharsToWrite: dword, lpNumberOfCharsWritten:dword,lpReserved:DWORD
ReadConsoleA PROTO, hConsoleInput: dword, lpBuffer:DWORD, nNumberOfCharsToRead: dword,lpNumberOfCharsRead: dword,lpReserved:DWORD
GetStdHandle PROTO, :DWORD
Beep PROTO, :DWORD, :DWORD
.stack 200h
.data
cad db "Prueba de salida", 0
cadDest db 256 dup(0), 0
num DD 10
num1 DD 10
.code
inicio PROC
	PUSH -11 ; Porque hace referencia a la salida estandar
	CALL GetStdHandle
	MOV EBX,EAX
	PUSH 0
	PUSH OFFSET num1
	PUSH num
	PUSH OFFSET cad
	PUSH EBX
	CALL WriteConsoleA
	;Terminar El programa
	INVOKE ExitProcess,0
inicio ENDP
END