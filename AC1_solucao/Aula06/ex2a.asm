# p : $t1
# pultimo: $t2

 	.eqv SIZE,3
 	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
 	.text
 	.globl main
main:
 	la $t1,array
 	li $t3,SIZE
 	sll $t3,$t3,2
 	addu $t2,$t1,$t3
	
for: 	bge $t1,$t2,endf	#while (p<pultimo)
	lw $a0,0($t1)
 	li $v0,4
 	syscall			#print_str(str1)
 	
 	li $a0,'\n'
 	li $v0,11
 	syscall
 	
 	addi $t1,$t1,4		#p++
 	j for			#}
 	
endf:	 jr $ra