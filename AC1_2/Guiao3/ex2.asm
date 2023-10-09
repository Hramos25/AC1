# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2

            .data
    
str1:       .asciiz " Introduza um número: "
str2:       .asciiz "\nO valor em binário é: "

            .eqv read_int, 5
            .eqv print_char, 11
            .eqv print_str, 4

            .text
            .globl main

main:   li $t2, 0
        li $t0, 0
        li $t1, 0

	la $a0, str1
        li $v0, print_str
        syscall

        li $v0, read_int
        syscall
        or $t0, $v0, $0

        la $a0, str2
        li $v0, print_str
        syscall

for:    bge $t2, 32, endfor

        li $t3, 0x80000000
	and $t1, $t0, $t3

if:     beq $t1, 0, else

        li $a0, '1'
        li $v0, print_char
        syscall


else:   li $a0, '0'
        li $v0, print_char
        syscall

endif:  sll $t0, $t0, 1
        addi $t2, $t2, 1

        j for

endfor:  jr $ra

