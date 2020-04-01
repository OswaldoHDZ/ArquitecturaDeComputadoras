.586
.model flat
.stack 1000h
.data
dato1 DB '9';  0000 1001     09h
dato2 DB '9';  0000 1001     09h
            ; -----------   -----
            ;  0001 0010     12h
res   DB 0
.code
inicio PROC
	MOV BL,0
	AND dato1,06h
	AND dato2,06d
	MOV BL,dato2
	ADD BL,dato1
	OR  BL,30h
	MOV res,BL
inicio ENDP 
end