# Copiar o código dos exercicios anteriores !!

# Mapa de registos
# p --> $t0
# *p --> $t1
# lista + SIZE --> $t2
# SIZE --> $t3
# houve_troca --> $t4
# i --> $t5
# lista[i] --> $t6
# lista[i+1] --> $t7

    .eqv    SIZE, 10
    .eqv    TRUE, 1
    .eqv    FALSE, 0
    .eqv    print_int10, 1
    .eqv    print_str, 4
    .eqv    read_int, 5

    .data
str1:   .asciiz "\nIntroduza um numero: "
str2:   .asciiz "\nConteudo do array:\n"
str3:   .asciiz ";"
        .align  2
lista:  .space  40

    .text
    .globl main

main:   li  $t5, 0      # i = 0

while:  bge $t5, SIZE, endw
        
        li  $v0, print_str
        la  $a0, str1
            syscall
        
        li  $v0, read_int
            syscall
        
        la  $t6, lista
        sll $t7, $t5, 2
        addu $t7, $t6, $t7
        
        sw  $v0, 0($t2)
        addi $t5, $t5, 1

        j   while
    
endw:

do:     li  $t4, FALSE      # houve_troca = false
        li  $t5, 0          # i = 0
        li  $t3, SIZE       # $t3 = SIZE
        subu $t3, $t3, 1    # SIZE = SIZE - 1

for:    bge $t5, $t3, endfor

if:     ...