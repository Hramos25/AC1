# Mapa de registos
# ...
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7
 	.data
 	.eqv FALSE,0
 	.eqv TRUE,1
 	.eqv SIZE,10
 	.text
 	.globl main
main: 	la $ # código para leitura de valores
 	la $t6,lista #
do: 	# do {
 	li $t4,FALSE # houve_troca = FALSE;
 	li $t5,0 # i = 0;
for: 	blt $t5,SIZE-1,if # while(i < SIZE-1){
if: 	sll $t7,... # $t7 = i * 4
 	addu $t7,$t7,... # $t7 = &lista[i]
 	lw $t8,0(...) # $t8 = lista[i]
 	lw $t9,4(...) # $t9 = lista[i+1]
 	bgt $t8,$t9,endif # if(lista[i] > lista[i+1]){
 	sw $t8,4(...) # lista[i+1] = $t8
 	sw $t9,0(...) # lista[i] = $t9
 	li $t4,TRUE #
 	# }
endif: 	(...) # i++;
 	(...) ... # }
 	(...) # } while(houve_troca == TRUE);
 	(...) # codigo de impressao do
 	# conteudo do array
 	jr $ra # termina o programa 