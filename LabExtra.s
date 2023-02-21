LDR R1,=A
LDR R3,=B
MOV R4, #3
L1:
    CMP R4, #0
    LDR R0, [R1]
    LDR R2, [R3]
    BEQ L2
    MUL R5, R0, R2
    ADD R6, R6, R5
    ADD R4, R4, #-1
    ADD R1, R1, #4
    ADD R3, R3, #4
    B L1
L2: 
    SWI 0X11


A: .WORD 10,20,30
B: .WORD 10,20,30

