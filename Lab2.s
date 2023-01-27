; Write a program to find if a key is present in the list or not.
/*
LDR R0,=A 
LDR R1, =KEY
LDR R2,[R1]
MOV R3,#6
L1:
LDR R4,[R0],#4
CMP R4,R2
ADDEQ R5,R5,#1
SUBS R3,R3,#1
BNE L1
SWI 0X11

A: .WORD 10,20,30,40,50,60
KEY: .WORD 20
*/

;Store the parameters in the stack and perform the multiplication using the functions.
/*
MOV R0,#10
MOV R1,#20
STMFA R13!,{R0,R1}
B FUN
L1:
LDMFA R13!,{R2}
SWI 0X11

FUN:
LDMFA R13!,{R0,R1}  
MUL R3,R0,R1
STMFA R13!,{R3}
B L1
*/

;Write a program to display a string using software interrupts
/*
LDR R0,=A
SWI 0X02
SWI 0X11

A: .ASCIZ "HELLO"
*/

;Write a program to display a single character.

LDR R1,=A
LOOP:
LDRB R0,[R1],#1
CMP R0,#0
SWINE 0X00
BNE LOOP
SWI 0X11

A: .ASCIZ "HELLO"