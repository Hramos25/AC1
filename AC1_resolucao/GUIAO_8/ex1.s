        .eqv    print_int10, 1
        .data
str:    .word "2020 e 2024 sao anos bissextos"
        .text
        .globl main

main:   addiu $sp, $sp, -4      
        sw  $ra, 0($sp)

        la  $a0, str          # $a0, str
        
        jal atoi              # atoi(str)

        move $a0, $v0         # $a0 = $v0
        li $v0, print_int10   # print_int10( atoi(str) ) 
        syscall 

        li $v0, 0           # return 0

        lw  $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra              # terminar programa

# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx 

atoi:   li $v0, 0                # res = 0

while:  lb  $t0, 0($a0)
        blt $t0, '0', endw
        bgt $t0, '9', endw

        addiu $a0, $a0, 1        # *s = *s + 1
        subu $t1, $t0, '0'       # digit = *s++ - '0'
        mulu  $v0, $v0, 10       # res = res * 10
        addu  $v0, $v0, $t1      # return (10*res) + digit        

        jr $ra                   # terminal sub-rotina