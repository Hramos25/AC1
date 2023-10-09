    .data
str1:   .asciiz "Arquitetura de computadores I"

    .text
    .globl main

main:   addiu $sp, $sp, -4
        sw $ra, 0($sp)

        la $a0, str1
        jal strlen
        move $a0, $t0
        li $v0, 1
        syscall

        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra


# Mapa de Registos
# len --> $t0
# s --> $t1

strlen: li $t0, 0
while:  lb $t1, 0($a0)
        addiu $a0, $a0, 1
        beq $t1, '\0', endw
        addi $t0, $t0, 1
        j while

endw: jr $ra