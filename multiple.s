/*
LDR R0, =A
LDR R1, =B
LDMIA R0,{R2,R3,R4}
STMIA R1,{R2,R3,R4}

A: .WORD 100,200,300
B: .WORD 0
*/

A: .WORD 100,200,300,400,500,600,700,800
.TEXT

LDR R0, =A
LDMDA R0!,{R1,R8,R9,R10}
SWI 0X11
.END