        .eqv    SIZE, 3
        .eqv    print_string, 4
        .eqv    print_int10, 1
        .eqv    print_char, 11

        .data

array:  .word str1, str2, str3
str1:   .asciz  "Array"
str2:   .asciz  " de"
str3:   .asciz  " ponteiros"
str4:   .asciz  "\nString # "

        .text
        .globl  main

# Mapa de registos
# i --> $t0
# j --> $t1
# array[i][j] --> $t3

main:   li  $t0, 0
        la  $t3, array

while:  bge $t0, SIZE, endw

        sll $t2, $t0, 2
        addu $t3, $t3, $t2  # $t3 = &array[i]
        lw  $t3, 0($t3)     # $t3 = array[i] = &array[i][0]
        addu $t3, $t3, $t1  # $t3 = &array[i][j]
        lb  $t3, 0($t3)     # $t3 = array[i][j]

endw:   beq $t3, 0, endw2

        li  $v0, print_char
        syscall
        move $a0, $t3

        li $a1, '-'
        li  $v0, print_char
        syscall

        addi $t1, $t1, 1
        j while
endw2: jr $ra
       
# ERROR!!!!!!!