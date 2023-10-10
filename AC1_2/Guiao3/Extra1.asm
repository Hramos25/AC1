	.data
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int16, 34
str:	.asciiz "Introduza um número: "
str1:	.asciiz "\nValor em código Gray: "
str2:	.asciiz "\nValor em binário: "
	.text
	.globl main
	
# Mapa de Registos
# gray -> $t0
# bin -> $t1
# mask -> $t2

main:	
	li $t0, 0			# gray = 0
	li $t1, 0			# bin = 0
	li $t2, 0			# mask = 0
	
	la $a0, str
	li $v0, print_string
	syscall				# print_string(str)

	li $v0, read_int
	syscall				# read_int()
	move $t0, $v0			# gray = read_int()
	
	srl $t2, $t0, 1			# mask = gray >> 1
	
	move $t1, $t0			# bin = gray

while:	bne $t2, 0, endw		# while(mask!=0)

	xor	$t1, $t1, $t2		# bin = bin ^ mask
	srl	$t2, $t2, 1		# mask = mask >> 1
	
	j while
	
endw:	la $a0, str1
	li $v0, print_string
	syscall				# print_string(str1)
		
	
	li $v0, print_int16
	syscall				# print_int16(gray)
	move $a0, $t0
	
	la $a0, str2
	li $v0, print_string
	syscall				# print_string(str2)
	
	li $v0, print_int16
	syscall				# print_int16(bin)
	move $a0, $t1
	
	jr $ra