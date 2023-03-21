;To implement bubble sort using ARM
/*
LDR R0,=A 
MOV R1,#8; Size of the array
MOV R2,#0
SUB R1,R1,#1

LOOP1:
    CMP R1,R2
    BEQ DONE

    MOV R3,#0
    LOOP2:
        MOV R4,R1
        SUB R4,R4,R2

        CMP R3,R4
        ADDEQ R2,R2,#1
        BEQ LOOP1

        MOV R7,R3
        ADD R7,R3,#1
        LDR R5,[R0,R3,LSL #2]
        LDR R6,[R0,R7,LSL #2]

        CMP R5,R6
        STRPL R5,[R0,R7,LSL #2]
        STRPL R6,[R0,R3,LSL #2]

        ADD R3,R3,#1
        B LOOP2


DONE:
    SWI 0X02
    SWI 0X11
A: .WORD 5,8,4,1,3,7,2,6
*/


;To swap first and last characters in an array

LDR R0,=A
MOV R1,#8 ; Length of the array
SUB R1,R1,#1

LDRB R2,[R0,#0]
LDRB R3,[R0,R1]
STRB R2,[R0,R1]
STRB R3,[R0,#0]

SWI 0X02
SWI 0X11

A: .ASCIZ "ABCDEFGH"
