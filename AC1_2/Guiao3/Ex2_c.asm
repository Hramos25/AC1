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
	and $t4, $t0, $t3
	srl $t1, $t4, 31
	
if:	rem $t3, $t2, 4
	bne $t3, 0, endif
	
	li $v0, print_char
	li $a0, ' ' 
	syscall

endif:	addi $a0, $t1, '0'
	li $v0, print_char
	syscall

  	sll $t0, $t0, 1
        addi $t2, $t2, 1

        j for

endfor:  jr $ra

