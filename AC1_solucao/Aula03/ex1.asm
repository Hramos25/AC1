	.data	
str1:	.asciiz "Introduza um valor:"
str2:	.asciiz "Valor ignorado \n"
str3:	.asciiz "A soma é:"

	.text
	.globl main
	
# Mapa de registos:
# $t0 – soma
# $t1 – value
# $t2 - i 


main:	li $t0,0	#soma=0
	li $t2,0	#i=0

for:	bge $t2,5,endf	#while(i < 5)
	la $a0,str1
	li $v0,4
	syscall		#print_string("Introduza um valor:")
	li $v0,5
	syscall
	move $t1,$v0	#value=read_int()
	
if1:	ble $t1,$0,else	#if(value > 0) 
	add $t0,$t0,$t1	#soma += value
	j endif1
else:			#else
	la $a0,str2
	li $v0,4
	syscall 	#print_str("Valor ignorado")
endif1:
	addi $t2,$t2,1	#i++
	j for		#}
endf:
	la $a0,str3
	li $v0,4
	syscall		##print_string("A soma é")
	move $a0,$t0
	ori $v0,$0,1
	syscall
	jr $ra
