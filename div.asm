// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/div.asm

// Divides R0 by R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


#CALL DIV

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
#RET

