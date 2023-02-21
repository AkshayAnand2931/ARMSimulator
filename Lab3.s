;Multiply elements of two arrays and add them.

/*
LDR R0,=A
LDR R1,=B
MOV R2,#4

LOOP:
    CMP R2,#0
    BEQ DONE
    SUB R2,R2,#1
    LDR R4,[R0],#4
    LDR R5,[R1],#4
    MLA R3,R4,R5,R3
    B LOOP

DONE:
    SWI 0X11

A: .WORD 10,20,30,40
B: .WORD 30,40,50,60
*/


;Count the number of substrings in a given string.

LDR R1,=A
LDR R2,=B
MOV R5,R2

LOOP:
    LDRB R3,[R1]
    LDRB R4,[R2]
    CMP R4,#0
    BEQ L1
    CMP R3,#0
    BEQ L2
    CMP R3,R4
    ADDEQ R2,R2,#1
    MOVNE R2,R5
    ADD R1,R1,#1
    B LOOP

L1:
    ADD R6,R6,#1
    MOV R2,R5
    B LOOP    

L2:
    SWI 0X11

A: .ASCIZ "RERED"
B: .ASCIZ "RED"

;Find the length of a string

/*
LDR R0,=A

LOOP:
    LDRB R1,[R0],#1
    CMP R1,#0
    BEQ DONE
    ADDNE R2,R2,#1
    B LOOP

DONE:
    SWI 0X11

A: .ASCIZ "HELLO WORLD"
*/