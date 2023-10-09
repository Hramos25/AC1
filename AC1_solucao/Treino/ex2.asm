# Mapa de registos
# i: $t0
# v: $t1
# &(val[0]): $t2

	.eqv SIZE,8
	.eqv print_str,4
	.eqv print_int10,1
	.eqv print_char,11
	
	.data
lista:	.word 8,4,15,-1987,327,-9,27,16

str1: 	.asciiz "Result is: "
str2: 	.asciiz ";"
	
	.text
	.globl main

main:	ori $t0,$0,0		#i=0
	la $t2, lista		#&(val[0]) = $t2

do:	sll $t3,$t0,2		#do{		
	addu $t3,$t3,$t2	
	lw $t1,0($t3)		#v=val[i]	
	
	li $t4,SIZE		#$T4= SIZE
	srl $t4,$t4,1		#SIZE/2
	addu $t4,$t0,$t4		#i+ SIZE/2
	sll $t4,$t4,2
	addu $t4,$t4,$t2
	lw $t5,0($t4)		
	sw $t5,0($t3)		#val[i]= val[i+size/2]
	sw $t1, 0($t4)		#val[i+size/2] = v
	
while1:	addiu $t0,$t0,1			#++i
	li $t3,SIZE			#$t3=SIZE
	srl $t3,$t3,1			#SIZE/2
	bge $t0,$t3,endw		#++i<(size/2)
	j do



endw:	la $a0,str1
	li $v0,print_str
	syscall			#print_string(str1)
	
	li $t0,0		#i=0

do2:	sll $t1,$t0,2
	addiu $t0,$t0,1
	addu $t1,$t1,$t2	#&val[i++]
	li $v0,print_int10	
	lw $a0,0($t1)		#val[i++]
	syscall

	li $v0,print_char
	la $a0,str2
	syscall			#print_string(str2)

while2:	li $t4,SIZE
	bge $t0,$t4,endw2	#(while i<size)
	j do2
	
endw2:	jr $ra










