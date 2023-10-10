	.data
	
	.eqv	print_string, 4
	.eqv 	print_int, 1
	.eqv 	SIZE, 10
lista:	.word 8,-4,3,5,124,-15,87,9,27,15
str:	.asciiz "\nConteúdo do array:\n"
str1:	.asciiz ";"
	.text
	.globl main
	
# Mapa de Registos
# p -> $t0
# *p -> $t1


main:	la $a0, str
	li $v0, print_string
	syscall				# print_string(str)
	
	la $t0, lista			# p = lista
	li $t2, SIZE			# $t2 = size
	mul $t2, $t2, 4			# $t2 = size*4
	add $t2, $t2, $t0		# $t2 = lista + SIZE
	
for:	bge $t0, $t2, endw		# while(p<lista+SIZE)

 	lw $t1, 0($t0)			# $t1 = *p
 	move $a0, $t1
 	li $v0, print_int
 	syscall				# print_int(*p)
 	
 	la $a0, str1
 	li $v0, print_string
 	syscall				# print_string(;)
 	
 	addiu $t0, $t0, 4		# p++
 	
 	j for
 	
endw:	jr $ra
	
   
