    .data
str1: .asciiz "Introduza 2 numeros:\n"
str2: .asciiz "A soma dos dois numeros é: "
    .eqv    print_string, 4
    .eqv    read_int, 5
    .eqv    print_int10, 1

    .text
    .globl main
main: la $a0, str1
    ori $v0, $0, print_string
    syscall     # print_string(str1)
    ori $v0, $0, read_int
    syscall     # valor lido é retornado em $v0
    or $t0, $v0, $0  # $t0 = read_int()

    li $v0, read_int
    syscall     # valor lido é retornado em $v0
    or $t1, $v0, $0 # $t1 = read_int()

    la $a0, str2
    ori $v0, $0, print_string
    syscall    # print_string(str2)
    add $a0, $t0, $t1 # $a0 = $t0 + $t1
    ori $v0, $0, print_int10
    syscall   # print_int10($a0)

    jr $ra