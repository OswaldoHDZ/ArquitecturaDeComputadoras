.586
.model flat, stdcall
ExitProcess PROTO :DWORD
.stack 100h
.data
temperaturas  REAL8 30.5,27.8,16.8,20.89,32.0,26.4,22.78 
tempMayor  REAL8  0.0
tempMenor REAL8 0.0
prom REAL8 0.0
n  DWORD  2
cte DWORD 7
result REAL8 0.0
.code

inicio PROC

mov ECX,n
mov EBX,0
FLD REAL8 PTR temperaturas[EBX*8]
FST REAL4 PTR tempMayor
FST REAL4 PTR tempMenor


INC EBX
;30.5,27.8,16.8,20.89,32.0,26.4,22.78 
ciclo: FLD REAL8 PTR temperaturas[EBX*8]
       FADD 
       FLD  REAL8 PTR temperaturas[EBX*8]
       FICOMP REAL4 PTR tempMayor
       JB cambiaMa
sigue: FLD  REAL8 PTR temperaturas[EBX*8]
       FICOMP REAL4 PTR tempMenor
       JA cambiaMe
 sigue1:      INC EBX
       loop ciclo
       FILD cte
       FDIVR
       FST prom
       JMP salir

cambiaMa:  FLD  REAL8 PTR temperaturas[EBX*8]
           FSTP REAL4 PTR tempMayor
           JMP sigue
cambiaMe:  FLD  REAL8 PTR temperaturas[EBX*8]
           FSTP REAL4 PTR tempMenor
           JMP sigue1
       
    
salir: INVOKE ExitProcess,0
inicio ENDP
END
