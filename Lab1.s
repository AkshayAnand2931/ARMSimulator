
;mvs stores negation of number
/*
MOV R0,#10
MOV R1,#10
CMP R0,R1
*/

;addition of 64-bit
/*
ADDS R2,R2,R0
ADC R3,R3,R1
*/

;Write an assembly language program to compare the values of register R0 and R1, add if the values are same, else subtract.
/*
MOV R0,#10
MOV R1,#10
CMP R0,R1
ADDEQ R2,R1,R0
SUBNE R2,R0,R1
SWI 0X11
*/

;Write the above program using branch statements
/*
MOV R0,#10
MOV R1,#10
CMP R0,R1
BEQ L1
SUB R2,R0,R1
B L2
L1: ADD R2,R0,R1
L2: SWI 0X11
*/

;Write a program to check if a number stored in a register is even or odd. If it is even, store 0 in R0,
;Else store ff in R0
/*
MOV R1,#11
MOV R2,#1
ANDS R3,R1,R2
BEQ L1
MOV R0,#0XFF
B L2
L1: MOV R0,#0
L2: SWI 0X11
*/

;Based on the value stored in the register R0, write a program to check whether the number is positive, negative or zero.
/*
MOVS R0,#10
BEQ L1
BMI L2
MOV R1,#100
B L3
L1: MOV R1,#0
B L3
L2: MOV R1,#-100
L3: SWI 0X11
*/

;Write a program to add 2 16-bit numbers loaded from the memory and store the result back to the memory.
/*
LDR R0, =A
LDR R1, =B
LDR R2, =C
LDRH R3,[R0]
LDRH R4,[R1]
ADD R5,R4,R3
STRH R5,[R2]

A: .HWORD 100
B: .HWORD 200
C: .HWORD 0
*/

;Write a program to find factorial of a given number.
/*
MOV R0,#5
MOV R2,#1
L1: MUL R2,R0,R2
SUBS R0,R0,#1
BNE L1
SWI 0X11
*/

;Write a program to find sum of n numbers stored in memory. Also store the result back to memory.
/*
MOV R2,#5
LDR R0,=A
L1: LDR R1,[R0]
ADD R3,R1,R3
ADD R0,R0,#4
SUBS R2,R2,#1
BNE L1

A: .WORD 10,20,30,40,50
SWI 0X11
*/

;Write a program to find GCD of two numbers.

MOV R0,#10
MOV R1,#50
L1:
CMP R0,R1
SUBPLS R0,R0,R1
SUBMIS R1,R1,R0
BNE L1
CMP R0,#0
MOVEQ R2,R1
CMP R1,#0
MOVEQ R2,R0
SWI 0X11