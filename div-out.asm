// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/div.asm

// Divides R0 by R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


@15
M=M+1
D=A
A=D+M
D=A
@14
M=D
@STACK1
D=A
@14
A=M
M=D
@DIV
0;JMP
(STACK1)


@ENDLOOP
(ENDLOOP)
0;JMP


(DIV)
@0
D=A
@2
M=D

(BEGIN)
@1
D=M

@0
M-D;JLT

@2
M=M+1

@0
M=M-D
D=M
@BEGIN
D;JGT
@15
D=M
M=M-1
A=A+D
A=M
0;JMP


