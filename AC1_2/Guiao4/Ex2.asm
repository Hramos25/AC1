		.data
		.eqv read_str, 8
		.eqv print_int, 1
		.eqv SIZE, 20
str:		.space SIZE		# static char str[21]
		.text
		.globl main
	
# Mapa de registos 
# num: $t0
# p: $t1
# *p: $t2

main:	
	li $t0, 0		# num = 0
	
	la $a0, str
	li $a1, SIZE
	li $v0, read_str
	syscall			# read_string(str, Size)
	
	la $t1, str		# p = str
while:	
	lb $t2, 0($t1)		# $t2 = *p
	beq $t2, '\0', endw	# while( *p != '\0' )

if:	
	blt $t2, '0', endif
	bgt $t2, '9', endif	# if( (*p >= '0') && (*p <= '9') )
	addi $t0, $t0, 1	# num++ 
	
	
endif:	
	addiu $t1, $t1, 1	# p++
	j while
	
endw:
	move $a0, $t0		# $a0 = num
	li $v0, print_int
	syscall			# print_int(num)
	
	jr $ra
	
			
