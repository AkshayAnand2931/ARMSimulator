;BINARY SEARCH

/*
LDR R5,=A
MOV R2,#70 ;KEY
MOV R3,#10 ;LENGTH
MOV R4,#10; COUNT
MOV R6, #0; CHECK

MOV R3,R3 ,LSR #1
L1:
    ADD R6,R6,#1
    CMP R6,R4
    BEQ L3
    LDR R1,[R5,R3 ,LSL#2]
    CMP R2,R1
    BEQ L2
    MOVMI R3,R3 ,LSR #1
    BMI L1
    ADDPL R3,R3,R3 ,LSR #1
    BPL L1 

L2:
    LDR R0,=B
    SWI 0X02
    SWI 0X11

L3:
    LDR R0,=C
    SWI 0X02
    SWI 0X11

A: .WORD 10,20,30,40,50,60,70,80,90,100
B: .ASCIZ "Successful Search"
C: .ASCIZ "Unsuccessful Search"

*/

;Find the substring

LDR R1,=A
LDR R2,=B

LOOP:
    LDRB R3,[R1]
    LDRB R4,[R2]
    CMP R4,#0
    BEQ L1
    CMP R3,#0
    BEQ L2
    CMP R3,R4
    ADDEQ R2,R2,#1
    ADD R1,R1,#1
    B LOOP

L1:
    LDR R0,=C
    SWI 0X02
    SWI 0X11    

L2:
    LDR R0,=D
    SWI 0X02
    SWI 0X11   

A: .ASCIZ "Hello, my name is John"
B: .ASCIZ "not"
C: .ASCIZ "Substring Present"
D: .ASCIZ "Substring Absent"