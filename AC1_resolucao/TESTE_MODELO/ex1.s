        .eqv    Size, 8
        .eqv    read_int, 5
        .eqv    print_int10, 1
        .eqv    print_string, 4
        .data
list:   .space 32
str:    .asciiz "Media invalida!\n"
        .text
        .globl main

# Mapa de Registos
# rv -> $t0
# n -> $t1
# sum -> $t2
# nit -> $t3
# pt -> $t4

main:   