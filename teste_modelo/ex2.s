    .eqv    SIZE,8
    .eqv    print_string, 4
    .eqv    print_int10, 1
    .eqv    print_char, 11

    .data

lista:  .word 8, 4, 15, -1987, 327, -9, 27, 16
str:    .asciiz "Result is: "

    .text
    .globl main

# Mapa de registos
# i --> $t0
# v --> $t1
# &(val[0]) --> $t2

main:   li  $t0, 0      # i = 0
        la  $t2, lista

do:     sll $t3, $t0, 2         # address
        addu $t3, $t3, $t2      
        lw  $t1, 0($t3)         # load word do address

        # SIZE / 2
        li  $t4, SIZE       # $t4 = SIZE
        srl $t4, $t4, 1     # SIZE / 2
        addu $t4, $t4, $t0  # i + SIZE / 2
        sll  $t4, $t4, 2
        lw  $t5, 0($t4)

        sw  $t1, 0($t4)      #   val[i+SIZE/2] = v
        sw  $t5, 0($t3)      #   val[i] = val[i+SIZE/2]

        li  $t6, SIZE
        srl $t6, $t6, 1
        addiu $t0, $t0, 1

while:  bge $t0, $t6, endw
        j do

endw:   la $a0, str
        li $v0, print_string
            syscall
        
        li $t0, 0

do2:    sll $t2, $t2, 2
        addiu $t0, $t0, 1           # i++
        addu    $t3, $t1, $t2       # &val[i++]
        lw  $a0, 0($t3)             # val[i++]
        li $v0, print_int10
        syscall

        li $v0, print_char
        li $a0, ','
        syscall

while2: bge $t0, SIZE, endw2
        j do2

endw2:  jr  $ra