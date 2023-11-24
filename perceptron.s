.data
mat1:  .word 0,0,1,1
mat2:  .word 0,1,0,1
 .equ row1, 4
 .equ row2, 1
 .equ col2, 4
res: .zero 16
final: .zero 16

.text
       li x12,row1
       la x1,mat1
       la x3,res
       la x4,final
       addi x20,x20,-1 #weight is -1 for OR and -2 for AND
       addi x21,x21,1
       addi x22,x22,0
nextrow:li x5,col2
        la x2,mat2
nextcol:li x6,row2
        mv x7,x0
    
adding:lw x8,0(x1)
        lw x9,0(x2)
        add x10,x8,x9
       add x7,x20,x10
       addi x1,x1,4
       addi x2,x2,4
       addi x6,x6,-1
       sw x7,0(x3)
       addi x3,x3,4
       
       addi x5,x5,-1
       beq x5,x0,skip
       j nextcol

skip:
       addi x3,x3,-16
classify:
       lw x11,0(x3)
       blt x11,x0,append
       sw x21,0,(x4)
       addi x12,x12,-1
       addi x4,x4,4
       addi x3,x3,4
       bgt x12,x0,classify
       j endop
append:
       sw x22,0(x4)
       addi x3,x3,4
       addi x4,x4,4
       addi x12,x12,-1
       bgt x12,x0,classify
       j endop
endop:
      nop