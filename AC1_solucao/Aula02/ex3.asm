	.data
str1:	.asciiz "AC1-2022"
str2:	.asciiz "P18"
	.text
 	.globl main
main:	la $a0, str1
	la $a1,str2
	
	jr $ra