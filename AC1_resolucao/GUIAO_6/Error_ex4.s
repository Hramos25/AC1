        .eqv print_str, 4
        .eqv print_int10, 1
        .data
str1:    .asciiz "Nr. de parametros: "
str2:    .asciiz "\nP"
str3:    .asciiz ": "
        .text
        .globl main

main:   li $t0, 0

        la $a0, str1
        li $v0, print_str
        syscall

        move $t3, $a0       # $t3 = argc
        move $a0, $t3
        li $v0, print_int10
        syscall

for:    bge $t0, $t3, endfor

        la $a0, str2
        li $v0, print_str
        syscall

        move $a0, $t0
        li $v0, print_int10
        syscall

        la $a0, str3
        li $v0, print_str
        syscall

        move $t1, $a1       # $t1 = &argv[0]
        sll $t2, $t0, 2     # $t2 = i * 4
        addu $t1, $t1, $t2  # $t1 = &agrv[i]
        lb $t1, 0($t1)      # $t1 = argv[i]

        move $a0, $t1
        li $v0, print_str
        syscall

        addi $t0, $t0, 1

        j for

endfor: jr $ra
