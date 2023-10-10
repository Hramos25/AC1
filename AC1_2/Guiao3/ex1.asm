# Mapa de registos:
# soma: $t0
# value: $t1
# i: $t2

            .data

<<<<<<< HEAD
str1:       .asciiz "Introduza um número: "
str2:       .asciiz "Valor ignorado\n"
str3:       .asciiz "A soma dos positivos é: "
=======
str1:       .asciiz "Introduza um nÃºmero: "
str2:       .asciiz "Valor ignorado\n"
str3:       .asciiz "A soma dos positivos Ã©: "
>>>>>>> 997eda7255ab612c430adcf9ade57572c12a22fa

            .eqv print_str, 4
            .eqv read_int, 5
            .eqv print_int, 1

            .text
            .globl main
main:   li $t2, 0       # i = 0
<<<<<<< HEAD
	li $t1, 0	# value = 0
        li $t0, 0	# soma = 0
=======

        li $t0, 0
>>>>>>> 997eda7255ab612c430adcf9ade57572c12a22fa

for:    bge $t2, 5, endfor      # for(i<5)

        la $a0, str1
        li $v0, print_str
        syscall                 # print(str1)

<<<<<<< HEAD
        li $v0, read_int 
        syscall                 # read_int() 
	or $t1, $v0, $0
	
if:     ble $t1, $0, else       # if (value>0)

        add $t0, $t0, $t1       # soma = soma + value
	
	j endif
	
=======
        li $v0, read_int
        or $t1, $v0, $0 
        syscall                 # read_int() 

if:     ble $t1, $0, else       # if (value>0)

        add $t0, $t0, $t1       # soma = soma + value

        add $t2, $t2, $1       # i++

        j for

>>>>>>> 997eda7255ab612c430adcf9ade57572c12a22fa
else:   la $a0, str2
        li $v0, print_str
        syscall                 # print(str2)

<<<<<<< HEAD
endif:	addi $t2, $t2, 1	# i++
	j for
	
=======
        j for

>>>>>>> 997eda7255ab612c430adcf9ade57572c12a22fa
endfor: la $a0, str3
        li $v0, print_str
        syscall                # print(str3)

<<<<<<< HEAD
	move $a0, $t0
        li $v0, print_int
        syscall
	
        
        jr $ra
=======
        li $v0, print_int
        syscall
        or $t0, $v0, $0

        jr $ra
>>>>>>> 997eda7255ab612c430adcf9ade57572c12a22fa
