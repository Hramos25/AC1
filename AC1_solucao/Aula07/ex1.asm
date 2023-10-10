	.data
str1:	.asciiz "Arquitetura de computadores I"
	.text
	.globl main

main:	addiu $sp,$sp,-4	#prologo
	sw $ra,0($sp)

	la $a0,str1
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall			#print_int10

	lw $ra,0($sp)
	addiu $sp,$sp,4		#epilogo
	jr $ra
# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx
#len: $v0
strlen: 	li $v0,0 		# len = 0;
while: 		lb $t0,0($a0)		# while(*s++ != '\0')
 		addiu $a0,$a0,1 	#
 		beq $t0,'\0',endw 	# {
 		addi $v0,$v0,1		# len++;
		j while			# }

endw:		jr $ra 			# 
