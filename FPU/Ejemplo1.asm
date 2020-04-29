.586
.model flat, stdcall
ExitProcess PROTO, dwExitCode:DWORD
WriteConsoleA PROTO,hConsoleOutput:dword,lpBuffer:DWORD,nNumberOfCharsToWrite: dword, lpNumberOfCharsWritten: dword,lpReserved:DWORD
ReadConsoleA PROTO, hConsoleInput: dword, lpBuffer:DWORD, nNumberOfCharsToRead: dword,lpNumberOfCharsRead: dword,lpReserved:DWORD
GetStdHandle PROTO,  :DWORD
Beep PROTO, :DWORD, :DWORD
.stack 200h
.data
h REAL8 6.63E-27
me REAL8 9.11E-31
L1 REAL8 1.75E-11
theta REAL8 1.0471975
mte REAL8 0.0
.code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;Expresión a implmentar:
;
;mte=sqrt( pow( (h/L1)*sen(thehta),2) + pow(me,2);
;a=h L1 / thetha sin();
;Notación potsfija
; me me * h LI/ thetha sin() * a * + sqrt 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


main PROC

FLD me
FLD ST(0)
FMUL       ;me*me
FLD h
FLD L1
FDIV       ;h/LI
FLD theta
FSIN       ;sin(theta)
FMUL       ; (h/l1)*sin(theha)
FLD ST(0)  
FMUL       ;[(h/l1)*sin(theha)] * [(h/l1)*sin(theha)]
FADD       ;[(h/l1)*sin(theha)] * [(h/l1)*sin(theha)]+ me*me
FSQRT      ;sqrt([(h/l1)*sin(theha)] * [(h/l1)*sin(theha)]+ me*me)
FST mte

INVOKE ExitProcess,0


main ENDP
END