	.eqv	PRINT_10, 1
	.eqv	SIZE, 4
	
	.data
array:	.word	7692,23,5,234

	.text
	.globl 	main

# Mapa de registos
# $t0 -> i
# $t1 -> array
# $t2 -> array+i
# $t3 -> array[i] // valor
# $t4 -> soma

main:	li	$t4, 0			# soma = 0

	la	$t1, array		# $t1 = array
	li	$t0, 0			# i = 0

while:	bgeu	$t0, SIZE, endw		# while (i <= SIZE) {
	sll	$t5, $t0, 2		#   offset = i * 4
	addu	$t2, $t1, $t5		#   mem = array + i
	lw	$t3, 0($t2)		#   valor = &mem (equivalente a array[i])
	add	$t4, $t4, $t3		#   soma = soma + valor
	addi	$t0, $t0, 1		#   i++
	j	while			# }

endw:	move	$a0, $t4
	li	$v0, PRINT_10
	syscall

	jr	$ra
