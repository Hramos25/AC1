    .eqv  SIZE, 5
    .eqv  read_int, 5
    .eqv  print_str, 4
    .data
str1: .asciiz "\nIntroduza um numero: "
      .align 2
lista: .space 20  # static int lista[5]
       
       .text
       .globl main

# Mapa de registos
# i: $t0
# lista: $t1
# lista + i: $t2

main: li  $t0, 0  # i= 0

while: bge $t0, SIZE, endw
       
       li $v0, print_str
       la $a0, str1 
         syscall  # print str1
       
       li $v0, read_int
            syscall  # read_int
       la $t1, lista    # $t1 = lista ( ou &lista[0])
       sll $t2, $t0, 2  # $t2 = i*4 
       addu $t2, $t1, $t2 # $t2 = lista + i*4
       sw $v0, 0($t2)  # lista[i] = read_int()
       addi $t0, $t0, 1 # i++
       
         j while

endw: jr $ra 