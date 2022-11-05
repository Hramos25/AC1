
# ????????

# Mapa de registos
# soma = $t0
# p = $t1
# *p = $t2
# *pult = $t3
# array+i = $t4
# array[i] = $t5 // valor

    .eqv print_int10, 1
    .eqv SIZE, 4

    .data
array: .word    7692, 23, 5, 234

    .text
    .globl main

main:   li  $t0, 0     # soma = 0
        la  $t1, array  # p = array
        li  $t0, 0  # i=0

while:  bgtu $t1, SIZE, endw
        sll  $t5, $t0, 2
        addu $t2, $t1, $t5
        lw   $t3, 0($t2)
        add  $t4, $t4, $t3
        addi $t0, $t0, 1
        j     while

endw:   move $a0, $t0
        li   $v0, print_int10
            syscall
        
        jr  $ra
