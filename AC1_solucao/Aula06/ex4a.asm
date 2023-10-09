	.data
	
str1:	.asciiz	"Nr. de parametros: "
str2:	.asciiz	"\nP"
str3:	.asciiz	": "

	.text
	.globl	main
# Mapa de Registos
# $t0: i
# $t1: argv
main:	li	$t0,0			# i = 0
	move	$t3,$a0			# $t3 = argc
	
	li	$v0,4
	la	$a0,str1
	syscall					# print_string()
	
	li	$v0,1
	move	$a0,$t3
	syscall					# print_int10()
	
for:	bge	$t0,$t3,endf
	
	li	$v0,4
	la	$a0,str2
	syscall					# print_string()
	
	li	$v0,1
	move	$a0,$t0
	syscall					# print_int10()
	
	li	$v0,4
	la	$a0,str3
	syscall					# print_string()
	
	move	$t1,$a1			# $t1 = &argv[0]
	sll	$t2,$t0,2		# $t2 = i * 4
	addu	$t1,$t1,$t2		# $t1 = &argv[i]
	lw	$t1,0($t1)		# $t1 = argv[i]
	
	li	$v0,4
	move	$a0,$t1
	syscall				# print_string()
	
	addi	$t0,$t0,1			# i++
	j	for
		
endf:	jr	$ra