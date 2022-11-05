# Mapa de registos
# val --> $t0
# n --> $t1
# min --> $t2
# max --> $t3

.eqv  print_string, 4
.eqv  print_int10, 1
.eqv  print_char, 11
.eqv  read_int, 5

.data
str1: .asciiz "Digite ate 20 inteiros (zero para terminar):"
str2: .asciiz "Máximo/mínimo são:"
str3: .asciiz ":"

.text
.globl main

main:  li $t1, 0
       li $t2, 0x7FFFFFFF
       li $t3, 0x80000000

       la $a0, str1
       li $v0, print_string
         syscall

do:  
     li $v0, read_int
        syscall
     move $t4, $v0

if: beq $t0, 0, endif

if1: ble $t0, $t3, if2
     li $t3, $t0

if2: bge $t0, $t2, endif
     li $t2, $t0

endif:  addi  $t1, $t1, 1

while: bge $t1, 20, endw
       beq $t0, 0, endw
       j  do

endDo: la $a0, str2
       li $v0, print_string
           syscall

       move $v0, $t3
       li $v0, print_int10
          syscall
    
       la $a0, str3
       li $v0, print_char
          syscall
       
       move $v0, $t2
       li  $v0, print_int10
          syscall

        jr    $ra
       