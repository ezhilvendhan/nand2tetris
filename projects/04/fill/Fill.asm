// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  @KBD
  D=M
  
  @WHITE
  D;JEQ

  @BLACK
  0;JMP

(WHITE)
  @R0
  M=0

  @DRAW
  0;JMP

(BLACK)
  @R0
  M=-1

  @DRAW
  0;JMP

(DRAW)
  @8191
  D=A
  @R1
  M=D

  (NEXT)
    //Calc position
    @R1
    D=M
    @pos
    M=D
    @SCREEN
    D=A
    @pos
    M=M+D

    //Draw Black/White
    @R0
    D=M
    @pos
    A=M
    M=D

    //Dec counter
    @R1
    M=M-1
    D=M

    @NEXT
    D;JGE

@LOOP
0;JMP
    
    

