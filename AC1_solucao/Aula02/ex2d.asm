
	
	.data
	.text
	.globl main
main:	ori $t0,$0,13
	srl $t3,$t0,4
	xor $t1,$t3,$t0
	srl $t4,$t1,2
	xor $t1,$t4,$t1
	srl $t5,$t1,1
	xor $t2,$t1,$t5
	
	jr $ra
	