	.data
	.text
	.globl main
main:	ori $t0,$0,2
	srl $t3,$t0,1
	xor $t1,$t3,$t0
	