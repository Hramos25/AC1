        .eqv    print_string, 4
        .eqv    print_int10, 1
        .eqv    STR_MAX_SIZE, 30
        .data
str:    .asciiz "I serodatupmoC ed arutetiuqrA"

        .text
        .globl main

main:   




# Mapa de Registos
# dst --> $a0
# src --> $a1
# i --> $t0

# terminal

strcpy: li $t0, 0       # i=0

do: addu $t1, $a0, $t0  # t1 = &dst[i]
    addu $t2, $a1, $t0  # t2 = &src[i]
    lb $t3, 0($t2)      # t3 = src[i]
    sb $t3, 0($t1)      # dst[i] = src[i]
    addi $t0, $t0, 1    # i++
while:  addu $t2, $a1, $t0      # t2 = &src[i++]
        lb $t3, 0($t2)          # t3 = src[i++] 

        beq $t3, '\0', do
        move $v0, $a0   # return dst

    jr $ra