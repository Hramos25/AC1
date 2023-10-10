		.data
		
		.eqv read_str, 8
		.eqv print_int, 1
		.eqv SIZE, 20
str:		.space 21		# static char str[21]
		.text
		.globl main
	
# Mapa de registos
# num: $t0
# i: $t1
# str: $t2
# str+i: $t3
# str[i]: $t4

				
main:	la $a0, str
	li $a1, SIZE
	li $v0, read_str
	syscall
	
	li $t0, 0			# num = 0
	li $t1, 0			# i = 0
	
while:  la $t2, str			# $t2 = &str[0]
	addu $t3, $t2, $t1		# $t3 = &str[i]
	lb $t4, 0($t3)			# $t4 = str[i]

	beq $t4, '\0', endw		# while(str[i] != '\0')
	
if:	blt $t4, '0', else 
	bgt $t4, '9', else		# if( (str[i] >= '0') && (str[i] <= '9') )
	addi $t0, $t0, 1		# num++

else:	addi $t1, $t1, 1		# i++
	j while
	
endw:	move $a0, $t0			# $a0 = num
	li $v0, print_int
	syscall				# print_int10(num)
	
	jr $ra