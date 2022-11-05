    .data
str1: .asciiz "Uma string qualquer"
str2: .asciiz "AC1 - P"
      .eqv PRINT_STR, 4
    .text
    .globl main

main: la    $a0, str1
      ori   $v0, $0, PRINT_STR
      syscall

     la   $a0, str2
     ori $v0, $0, PRINT_STR
        syscall
        

      jr   $ra