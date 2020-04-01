.586
.model flat
.stack 1000h
.data
dato1 DB '5'
dato2 DB '2'
res   DB 0
.code
inicio PROC
    ; Este ejemplo es para un solo digito
	MOV BL,0
	AND dato1,0Fh
	AND dato2,15d
	MOV BL,dato2
	ADD BL,dato1
	OR  BL,30h
	MOV res,BL
inicio ENDP 
end