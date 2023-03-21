LDR R5,=TAB
MOV R2,#16


UPCOUNTER:
    LDR R0,[R5],#4
    SWI 0X200
    SUB R2,R2,#1
    CMP R2,#0
    BEQ DOWNCOUNTER
    B DELAYU


DOWNCOUNTER:
    LDR R0,[R5,#-4]!
    SWI 0X200
    ADD R2,R2,#1
    CMP R2,#16
    BEQ DONE
    B DELAYD

DONE:
    SWI 0X11

DELAYU:
    LDR R3,=Z
    LDR R4,[R3]
    LOOP2U:
        SUB R4,R4,#1
        CMP R4,#0
        BEQ UPCOUNTER
        B LOOP2U

DELAYD:
    LDR R3,=Z
    LDR R4,[R3]
    LOOP2D:
        SUB R4,R4,#1
        CMP R4,#0
        BEQ DOWNCOUNTER
        B LOOP2D

.EQU A, 0X80
.EQU B, 0X40
.EQU C, 0X20
.EQU D, 0X08
.EQU E, 0X04
.EQU F, 0X02
.EQU G, 0X01
.EQU P, 0X10

Z: .WORD 100000
TAB: 
    .WORD A|B|C|D|E|G|P
    .WORD B|C|P
    .WORD A|B|F|E|D|P
    .WORD A|B|F|C|D|P
    .WORD G|F|B|C|P
    .WORD A|G|F|C|D|P
    .WORD A|G|E|F|C|D|P
    .WORD A|B|C|P
    .WORD A|B|C|D|E|F|G|P
    .WORD A|B|C|F|G|P
    .WORD A|B|G|F|E|C
    .WORD A|B|C|D|E|F|G
    .WORD A|G|E|D
    .WORD A|B|C|D|E|G
    .WORD A|G|F|E|D
    .WORD A|G|F|E