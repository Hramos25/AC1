	.eqv read_int,5
	.eqv print_str,4
	.eqv print_char,11
	
	.data	
str1:	.asciiz "Introduza um valor:"
str2:	.asciiz "O valor em binário é:"
	.text
	.globl main
	
	
# Mapa de registos:
# $t0- valor
# $t1 – bit
# $$t2 - i
# $t3 - resto
# $t4 - flag


main:	li $t0,0		#valor=0
	li $t1,0		#bit=0
	li $t2,0		#i=0
	
	li $v0,print_str
	la $a0,str1
	syscall			#print(str1)
	
	li $v0,read_int
	syscall 
	or $t0,$v0,$0		#read_int
	
	li $v0,print_str
	la $a0,str2
	syscall 		#print(str2)
	
for:	bge	$t2, 32, endf
	andi	$t1, $t0, 0x80000000	# bit = value & 0x80000000
	srl	$t1,$t1,31
	
	
if1:	rem $t3,$t2,4		#resto=i%4
	bnez $t3,endif1
	li $v0,print_char
	li $a0, ' '
	syscall			#print(" ")


endif1:
	addi $a0,$t1,'0'
	li $v0,print_char
	syscall		
	sll $t0,$t0,1
	addi $t2,$t2,1
	j for		#}
endf:
	jr $ra