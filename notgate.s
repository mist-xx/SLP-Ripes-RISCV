.data
xmat: .word 0,1
res: .zero 8
class: .zero 8
matsize: .word 2
.text
addi x20,x0,-1
la x1,xmat
la x3, res
la x4,class
addi x21,x0,0
addi x22,x0,1
lw x5,matsize
nextele:
    mv x7,x0
adding:
    lw x8, 0(x1)
    add x7,x8,x20
    addi x1,x1,4
    sw x7,0(x3)
    addi x3,x3,4
    addi x5,x5,-1
    beq x5,x0,skip
    j nextele
skip:
    lw x5,matsize
    addi x3,x3,-8
    mv x2,x0
classify:
    lw x11,0(x3)
    blt x11,x0,append
    sw x21,0(x4)
    addi x4,x4,4
    addi x3,x3,4
    addi x5,x5,-1
    bgt x5,x0,classify
    j endop
append:
    sw x22,0(x4)
    addi x3,x3,4
    addi x4,x4,4
    addi x5,x5,-1
    bgt x5,x0,classify
    j endop
endop:
    nop