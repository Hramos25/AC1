        .eqv    SIZE, 3
        .eqv    print_string, 4
        .eqv    print_char, 11

        .data
array:  .word str1, str2, str3

str1:   .asciz "Array"
str2:   .asciz "de"
str3:   .asciz "ponteiros"

        .text
        .globl main

# Mapa de registos
# SIZE*4 --> $t0
# p --> $t1
# pultimo --> $t2

main:   la  $t1, array
        li  $t0, SIZE
        sll $t0, $t0, 2
        addu $t2, $t1, $t0

for:    bge $t1, $t2, endfor
        
        lw      $a0, 0($t1)
        li      $v0, print_string
        syscall

        li      $v0, print_char
        li      $a0, '\n'
        syscall

        addiu   $t1, $t1, 4
        j       for
        
endfor: jr $ra
