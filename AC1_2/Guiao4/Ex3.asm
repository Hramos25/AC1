	.data
	.eqv print_int, 1
	.eqv SIZE, 4
	
array:	.word 7692,23,5,234

	.text
	.globl main
	
# Mapa de Registos
# p -> $t0
# pultimo -> $t1
# soma -> $t2
	
main:
	li $t0, 0		# p = 0
	li $t1, 0		# pultimo = 0
	li $t2, 0		# soma = 0
	
	li $t4, SIZE		# $t4 = SIZE
	li $t9, 1		# $t9 = 1
	sub $t4, $t4, $t9	# $t4 = SIZE - 1
	mul $t4, $t4, 4 	# offset = nº posicao * 4
	
	la $t0, array		# p = array
	addu $t1, $t0, $t4	# pultimo = array + SIZE - 1 
	
while:	bgt $t0, $t1, endw	# while (p <= pultimo)
	lw $t3, 0($t0)		# *p
	add $t2, $t2, $t3	# soma = soma + (*p)
	addiu $t0, $t0, 4	# p++
	j while
	
endw:	move $a0, $t2		
	li $v0, print_int
	syscall			# print_int10(soma)
	
	 jr $ra 