    .eqv read_int, 5
    .eqv print_str, 4
    .eqv print_char, 11

    .data
str1:   .asciiz "Introduza um numero: "
str2:   .asciiz "\nO valor em binário é: "

    .text
    .globl main

# Mapa de registos:
# $t0 - value
# $t1 - bit
# $t2 - i

main: