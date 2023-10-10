	.data
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv SIZE, 5
str:	.asciiz "\nIntroduza um número: "
	.align 2
lista:	.space 4	# SIZE*4
	
	.text
	.globl main

# Mapa de Registos
# i -> $t0
# lista -> $t1
# lista+i -> $t2

main:	li $t0, 0		# i=0
for:	bge $t0, SIZE, endw	# for (i<SIZE)
	
	la $a0, str
	li $v0, print_string
	syscall			# print_string(str)
	
	li $v0, read_int
	syscall			# read_int()= lista[i]
	
	la $t1, lista		# $t1 = &lista[0]
	mul $t3, $t0, 4		# offset = i*4
	addu $t2, $t1, $t3	# $t2 = &lista[i]
	sw $v0, 0($t2)		# lista[i] = read_int()
	
	addi $t0, $t0, 1	# i++
	
	j for
	
endw:	jr $ra