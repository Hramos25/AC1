# i : $t0
# j: $t1
# array[i][j]: $t3
 	.data
 	.eqv SIZE,3
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
str4:	.asciiz "\nString#"
str5: 	.asciiz ": "
 	.text
 	.globl main
 main: 	li $t0,0
 for:	bge $t0,SIZE,endf
 	la $a0,str4
 	li $v0,4
 	syscall
 	
 	move $a0,$t0
 	li $v0,1
 	syscall
 	
 	la $a0,str5
 	li $v0,4
 	syscall
 	li $t1,0

while:			
  	la $t3,array 		# $t3 = &array[0]
 	sll $t4,$t0,2 		#
	addu $t3,$t3,$t4	# $t3 = &array[i]
	lw $t3,0($t3) 		# $t3 = array[i] = &array[i][0]
	addu $t3,$t3,$t1 	# $t3 = &array[i][j]
	lb $a0,0($t3) 		# $a0 = array[i][j]
	beq $a0,'\0',endw
	li $v0,11
	move $a0,$t3
	syscall		
	li $v0,11
	li $a0,'-'
	syscall	
	addi $t1,$t1,1			# j++
	j while

endw:
	addi $t0,$t0, 1			# i++
	j for
endf:	jr $ra