
;Write an ALP to find 1’s and 2’s complement of a 32 bit number

/*

LDR R0,=A
LDR R1,[R0]
MVN R2,R1 ; The 1's complement
ADD R3,R2,#1 ; The 2's complement

A: .WORD 10
*/

;Write an ALP to find the number of zero’s, positive and negative numbers in a given array.

/*
LDR R0,=A
MOV R2,#0

LOOP:
    CMP R2,#8
    BEQ DONE
    LDR R1,[R0,R2,LSL #2]
    CMP R1,#0
    ADDEQ R3,R3,#1 ;The number of zeros
    ADDPL R4,R4,#1 ;The number of positive
    ADDMI R5,R5,#1 ;The number of negative
    ADD R2,R2,#1
    B LOOP


DONE:
    SWI 0X11

A: .WORD 10,20,30,0,-15,-20,0,-1
*/

;Find the length of a string


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
