# i:    $t0
# 
    .eqv    SIZE, 3
    .eqv    print_string, 4
    .eqv    print_char, 11
    .data
array: .word str1, str2, str3
str1:   .asciiz "Array"
str2:   .asciiz "de"
str3:   .asciiz "ponteiros"

    .text
    .globl main

main:   li  $t0, 0
        la  $t1, array

for:    bge $t0, SIZE, endfor

        addi $t0, $t0, 1
        sll   $t2, $t0, 2
        addu  $t2, $t2 $t1     # &array[i]
        lw    $a0, 0($t2)      # $a0 = array[i]
        
        li    $v0, print_string
        syscall

        li  $a1, '\n'
        li  $v0, print_char
        syscall

        addiu $t0, $t0, 1
	    j for

endfor: jr  $ra
