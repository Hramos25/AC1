# Mapa de registos
# ...
# houve_troca: $t4
# p: $t5
# pUltimo: $t6
 	.data
 	.eqv SIZE,10
 	.text
 	.globl main
main: 	(...) # codigo para leitura de valores
 	la $t5,lista # $t5 = &lista[0]
 	li $t6,SIZE #
 	subu $t6,$t6,1 # $t6 = SIZE – 1
 	sll $t6,$t6,4 # $t6 = (SIZE – 1) * 4
 	addu $t6,$t6,$t5 # $t6 = lista + (SIZE – 1)
do: 	li $t4,FALSE # do {
 	li $t5,0 # i = 0;