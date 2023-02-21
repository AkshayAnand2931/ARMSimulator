;Generate Fibonacci Series and store them in an array

/*
MOV R0,#10
LDR R1,=A
MOV R3,#0

FIB:
    CMP R3,R0
    BEQ DONE

    CMP R3,#0
    MOVEQ R2,#0
    STREQ R2,[R1,R3,LSL #2]
    ADDEQ R3,R3,#1
    BEQ FIB

    CMP R3,#1
    MOVEQ R2,#1
    STREQ R2,[R1,R3,LSL#2]
    ADDEQ R3,R3,#1
    BEQ FIB

    SUB R6,R3,#1
    SUB R7,R3,#2
    LDR R4,[R1,R6,LSL #2]
    LDR R5,[R1,R7,LSL #2] 
    ADD R2,R4,R5
    STR R2,[R1,R3,LSL#2]
    ADD R3,R3,#1
    B FIB   

DONE:
    SWI 0X11

A: .WORD 0,0,0,0,0,0,0,0,0,0
*/

;Write an ALP to find the smallest number in an array of n 32 bit numbers.

/*
MOV R0,#10
LDR R1,=A
MOV R2,#1000 ;The minimum value.
MOV R3,#0

LOOP:
    CMP R3,R0
    BEQ DONE

    LDR R4,[R1,R3,LSL #2]
    CMP R4,R2
    MOVMI R2,R4
    ADD R3,R3,#1
    B LOOP

DONE:
    SWI 0X11

A: .WORD 10,20,30,40,50,60,70,80,90,100
*/

;Write an ALP to find the greatest number in an array of n 32 bit numbers.

/*
MOV R0,#10
LDR R1,=A
MOV R2,#0 ;The maximum value.
MOV R3,#0

LOOP:
    CMP R3,R0
    BEQ DONE

    LDR R4,[R1,R3,LSL #2]
    CMP R4,R2
    MOVPL R2,R4
    ADD R3,R3,#1
    B LOOP

DONE:
    SWI 0X11

A: .WORD 10,20,30,40,50,60,70,80,90,100
*/

;Write an ALP to  count the number of 1's and 0's in a given 32 bit number.

/*
LDR R1,=A
LDR R2,[R1]
MOV R3,#32
MOV R4,#0

LOOP:
    CMP R4,R3
    BEQ DONE

    AND R5,R2,#1
    CMP R5,#1
    ADDEQ R6,R6,#1  ;The number of ones
    ADDNE R7,R7,#1  ;The number of zeroes

    MOV R2,R2,LSR #1
    ADD R4,R4,#1
    B LOOP


DONE:
    SWI 0X11

A: .WORD 100
*/

;Write an ALP to check whether the given number has odd or even number of 1's and display the result.(Even parity or odd parity).

/*
LDR R1,=A
LDR R2,[R1]
MOV R3,#32
MOV R4,#0

LOOP:
    CMP R4,R3
    BEQ DONE

    AND R5,R2,#1
    CMP R5,#1
    ADDEQ R6,R6,#1  ;The number of ones

    MOV R2,R2,LSR #1
    ADD R4,R4,#1
    B LOOP


DONE:
    AND R7,R6,#1
    CMP R7,#1
    LDREQ R0,=C
    LDRNE R0,=B
    SWI 0X02
    SWI 0X11

A: .WORD 100
B: .ASCIZ "EVEN PARITY"
C: .ASCIZ "ODD PARITY"
*/

;3X3 matrix addition

/*
MOV R0,#9
MOV R1,#3
MOV R5,#0

LDR R2,=A
LDR R3,=B
LDR R4,=C

LOOP:
    CMP R5,R0
    BEQ DONE

    LDR R6,[R2,R5,LSL #2]
    LDR R7,[R3,R5,LSL #2]
    ADD R8,R7,R6
    STR R6,[R4,R5,LSL #2]
    ADD R5,R5,#1
    B LOOP

DONE:
    SWI 0X11

A: .WORD 10,20,30,40,50,60,70,80,90
B: .WORD 10,20,30,40,50,60,70,80,90
C: .WORD 0,0,0,0,0,0,0,0,0
*/

;3X3 matrix multiplication


LDR R0,=A
LDR R1,=B
LDR R2,=C
MOV R3,#0
MOV R4,#0
MOV R5,#0

LOOP1:
    CMP R3,#3
    MOV R4,#0
    BEQ DONE

    LOOP2:
        CMP R4,#3
        MOV R6,#0
        ADDEQ R3,R3,#1
        MOV R5,#0
        BEQ LOOP1

        LOOP3:
            CMP R5,#3
            MOVEQ R7,#0
            ADDEQ R7,R3,R3,LSL #1
            ADDEQ R7,R7,R4
            STREQ R6,[R2,R7,LSL #2]
            ADDEQ R4,R4,#1
            BEQ LOOP2

            MOV R7,#0
            ADD R7,R3,R3,LSL #1
            ADD R7,R7,R5
            LDR R8,[R0,R7,LSL #2]
            MOV R7,#0
            ADD R7,R5,R5,LSL #1
            ADD R7,R7,R4
            LDR R9,[R1,R7,LSL #2]
            MLA R6,R8,R9,R6
            ADD R5,R5,#1
            B LOOP3


DONE:
    SWI 0X11

A: .WORD 10,20,30,40,50,60,70,80,90
B: .WORD 10,20,30,40,50,60,70,80,90
C: .WORD 0,0,0,0,0,0,0,0,0