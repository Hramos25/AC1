	.data           #Data segment
	.text           #Code segment
	.globl main
main:	ori 	$t1,$0,0x1234		#t1= 0x1234
	ori 	$t0, $0, 0x56778	#$t0 =0x6578
	add	$t2,$t1,$t0	#t2=0x68AC
	
	sub 	$t2,$t0,$t1	#$t2= 0x4444
	sub 	$t2,$t1,$t0	#$t2= 0xFFFFBBBC	
	
	
	
	
	
	
	
	jr	$ra	#termina o programa
	