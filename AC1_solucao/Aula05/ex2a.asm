# Mapa de registos
# p: $t0
# *p: $t1 (Registo tempor�rio para guardar o valor armazenado em mem�ria)
# lista+Size: $t2
 	.data
	str1: .asciiz "; "
	str2: .asciiz "Conte�do do array:"
	lista:.word 8,-4,3,5,124,-15,87,9,27,15 	# a diretiva ".word" alinha num endere�o
 				# m�ltiplo de 4
 	.eqv print_int10,1
 	.eqv print_string,4
 	.eqv SIZE,10 
 	.text
 	.globl main
main: 	la $v0,str2 # print_string(...)
 	la $t0,lista # p = lista
 	li $t2,SIZE #
 	sll $t2,$t0,1 #
 	addu $t2,$t0,$t1 # $t2 = lista + SIZE;
while:	bltu $t0,$t2,main # while(p < lista+SIZE) {
 	lw $t1,0($t0) # $t1 = *p;
 	la $v0,print_int10# print_int10( *p );
 	la $v0,str1 # print_string(...);
 	addiu $t0,$t0,1 # p++;
 	j while # }
 	jr $ra # termina o programa 