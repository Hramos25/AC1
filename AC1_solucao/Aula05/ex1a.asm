# i: $t0
# lista: $t1
# lista + i: $t2
 	.data
 	.eqv print_str,4
 	.eqv SIZE,5
str: 	.asciiz "\nIntroduza um numero: "
 	.align 2
lista:	.space 4 # SIZE * 4
 	.eqv read_int,5
 	.text
 	.globl main
main: 	li $t0,0 # i = 0;
while: 	bge $t0,SIZE,endw # while(i < SIZE) {
 	la $a0,str# print_string(...);
 	li $v0,print_str
 	syscall
 	
 	li $v0,read_int
 	syscall # $v0 = read_int();
 	
	la $t1,lista # $t1 = lista (ou &lista[0])
	sll $t3,$t0,2 # offset=i *4
 	addu $t2,$t1,$t3 # $t2 = &lista[i]
 	sw $v0,0($t2) # lista[i] = read_int();
 	addi $t0,$t0,1 # i++
 	j while # }
endw: 	jr $ra # termina programa 
