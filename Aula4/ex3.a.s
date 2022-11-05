# Mapa de registos
# soma = $t0
# p = $t1
# *p = $t2
# *pult = $t3

    .eqv print_int10, 1
    .eqv SIZE, 4

    .data
array: .word    7692, 23, 5, 234

    .text
    .globl main

main:   li  $t0, 0     # soma = 0
        la  $t1, array  # p = array

        li  $t4, SIZE   # $t4 = SIZE
        sub $t4, $t4, 1   # SIZE = SIZE - 1
        mul $t3, $t1, $t4   # $t4 = (SIZE - 1)*4 ---> Ponteiro de ints

        addu $t1, $t0, $t4      # pultimo = array + SIZE - 1

while:  bgtu $t1, $t3, endw
        lw  $t1, 0($t2)     # $t2 = *p
        add $t0, $t0, $t2
        addiu $t0, $t0, 4   # p++
        j   while

endw:   move $a0, $t3
        li   $v0, print_int10
            syscall
        
        jr  $ra
