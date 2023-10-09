.eqv	PRINT_10, 1
	.eqv	SIZE, 4
	
	.data
array:	.word	7692,23,5,234

	.text
	.globl 	main

# Mapa de registos
# $t0 -> p
# $t1 -> pultimo
# $t2 -> *p
# $t3 -> soma

main:	li	$t3, 0			# soma = 0

	li	$t4, SIZE
	sub	$t4, $t4, 1		# $t4 = SIZE - 1
	mul	$t4, $t4, 4		# $t4 = (SIZE - 1) * 4 -----> Ponteiro de ints, ocupa 4 posições de memória
	
	la	$t0, array		# p = array
	addu	$t1, $t0, $t4		# pultimo = array + SIZE - 1

while:	bgtu	$t0, $t1, endw
	lw	$t2, 0($t0)		# $t2 = *p
	add	$t3, $t3, $t2		# soma += *p
	addiu	$t0, $t0, 4		# p++
	j	while

endw:	move	$a0, $t3
	li	$v0, PRINT_10
	syscall

	jr	$ra