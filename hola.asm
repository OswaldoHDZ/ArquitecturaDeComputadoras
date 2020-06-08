.586
.model flat

.XMM
.data

valores DW 0A56h,0000h,8989h,1213h
valoresF REAL4 95.36,2.8,6.1,2.3,0.58,3.2,6.5,8.1,63.5
valoresF1 REAL4 52.36,2.8,69.1,2.93,0.5,36.2,6.58,8.15,6.5
division REAL4 0
otro db 5

.code
inicio PROC

MOVUPS  XMM0,valoresF
MOVUPS  XMM2,valoresF
MOVSS   XMM1,valoresF1
MOVHLPS XMM0,XMM1
MOVLPS  XMM3,QWORD PTR valoresF
ADDPS   XMM0,XMM1
ADDSS   XMM1,XMM0
MINPS   XMM0,XMM1               ; Minimos 
MAXSS   XMM0,XMM2				; Maximon

DIVSS XMM0,XMM2
MOVSS division,XMM0
FLD division
FLD division+4

MOV AX,BX;

inicio ENDP
END