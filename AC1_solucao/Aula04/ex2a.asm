	.eqv	PRINT_10, 1
	.eqv	READ_STR, 8
	.eqv	SIZE, 20
	
	.data
str:	.space 21			# static char str[21]

	.text
	.globl 	main
	
# Mapa de registos
# $t0 - num
# $t1 - p
# $t2 - *p

main: 
	la $t1,str	#p=str

while:
	lb $t2,... #
 	b?? $t2,0,endw # {
	b?? $t2,'0',endif # if(str[i] >='0' &&
	b?? $t2,'9',endif # str[i] <= '9')
 	addi $t0,... # num++;
endif:
 	addiu $t1,... # p++;
 	(...) # }
endw: 	(...) # print_int10(num);
 	jr $ra # termina o programa 
