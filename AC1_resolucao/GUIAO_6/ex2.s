        .eqv SIZE, 3
        .eqv print_str, 4
        .eqv print_char, 11

        .data
array: .word str1, str2, str3
str1:  .asciiz "Array"
str2:  .asciiz "de"
str3:  .asciiz "ponteiros"

        .text
        .globl main
    
main:   la $t1, array   # t1 = &array[0]
        li $t3, SIZE
        sll $t3, $t3, 2
        addu $t2, $t1, $t3

for:    bge $t1, $t2, endfor

        lw $a0, 0($t1)
        li $v0, print_str
        syscall

        li $a0, '\n'
        li $v0, print_char
        syscall

        addi $t1, $t1, 4

        j for

endfor: jr $ra