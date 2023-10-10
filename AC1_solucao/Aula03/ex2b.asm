	.eqv read_int,5
	.eqv print_str,4
	.eqv print_char,11
	
	.data	
str1:	.asciiz "Introduza um valor:"
str2:	.asciiz "O valor em bin�rio �:"
	.text
	.globl main
	
	
# Mapa de registos:
#$t0- valor
#$t1 � bit
# $t2 - i
#t3 - resto


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
	
	li $t3, 0x80000000
	and	$t1, $t0, $t3	# bit = value & 0x80000000
	
	ori $v0,$0,1
	
if1:	rem $t3,$t2,4		#resto=i%4
	bne $t3, 0, if2
	li $v0,print_char
	li $a0, ' '
	syscall			#print(" ")

if2:	beq $t1, 0, else
	li $v0,print_char
	li $a0, '1'
	syscall			#print("1")
	j endif1
else:			#else
	li $v0,print_char
	li $a0, '0'
	syscall			#print("0")
endif1:
	sll $t0,$t0,1 		#value= value << 1
	addi $t2,$t2,1		#i++
	j for		#}
endf:
	jr $ra