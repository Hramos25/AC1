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
str5:   .asciiz ": "

        .text
        .globl  main

# Mapa de registos
# i --> $t0
# j --> $t1

main:   li  $t0, 0
        la  $t2, array

for:  bge $t0, SIZE, endfor

        li      $v0, print_string
        la      $a0, str4
        syscall

        li      $v0, print_int10
        move    $a0, $t0
        syscall

        li      $v0, print_string
        la      $a0, str5
        syscall

        li      $t1, 0

while:  sll     $t3, $t0, 2
        addu    $t3, $t2, $t3
        lw      $t3, 0($t3)
        addu    $t3, $t3, $t1
        lb      $a0, 0($t3)
        beq     $a0 '\0', endw

        li      $v0, print_char
        syscall

        li      $a0, '-'
        syscall

        addiu   $t1, $t1, 1

        j       while


endw:   addiu   $t0, $t0, 1
        j       for

endfor: jr      $ra
