# i:    $t0

    .eqv    SIZE, 3
    .data
array: .word str1, str2, str3
str1:   .asciiz "Array"
str2:   .asciiz "de"
str3:   .asciiz "ponteiros"

    .text
    .globl main

main:   