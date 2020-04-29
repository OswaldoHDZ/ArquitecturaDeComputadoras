.586
.model flat, stdcall
.stack 100h
.data
vL  REAL4  0.001
vC  REAL4  4.7E-5
dos  DWORD  2
result REAL4 0.0
.code
inicio PROC
    ;1/((2*PI)* sqrt(L*C))
    ;1/(2*(PI* sqrt(L*C)))
    ; L C *  SQRT PI 2 * * 1 /
    FLD vL
    FLD vC
    FMUL
    FSQRT
    FLDPI
    FILD DWORD PTR dos
    FMUL
    FMUL
    FLD1
    FDIVR ;st(0)/st(1)
    FST result
inicio ENDP
END