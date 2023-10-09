# Mapa de registos:
# soma: $t0
# value: $t1
# i: $t2

            .data

str1:       .asciiz "Introduza um número: "
str2:       .asciiz "Valor ignorado\n"
str3:       .asciiz "A soma dos positivos é: "

            .eqv print_str, 4
            .eqv read_int, 5
            .eqv print_int, 1

            .text
            .globl main
main:   li $t2, 0       # i = 0

        li $t0, 0

for:    bge $t2, 5, endfor      # for(i<5)

        la $a0, str1
        li $v0, print_str
        syscall                 # print(str1)

        li $v0, read_int
        or $t1, $v0, $0 
        syscall                 # read_int() 

if:     ble $t1, $0, else       # if (value>0)

        add $t0, $t0, $t1       # soma = soma + value

        add $t2, $t2, $1       # i++

        j for

else:   la $a0, str2
        li $v0, print_str
        syscall                 # print(str2)

        j for

endfor: la $a0, str3
        li $v0, print_str
        syscall                # print(str3)

        li $v0, print_int
        syscall
        or $t0, $v0, $0

        jr $ra