





#terminal
#dst:$a0
#src:$a1
#i: $t0
strcopy:	li $t0,0		#i=0
do:					#do {
		addu $t1,$a0,$t0	#t1= &dst[i]
		addu $t2,$a1,$t0	#t2= &src[i]
		lb $t3,0($t2)		#t3= src[i]
		sb $t3,0($t1)		#dst[i]= src[i]
		addi $t0,$t0,1		#i++
		bne $t3,'\0',do		# } while (src[i++] != '\0');
		move $v0, $a0		#return dst
		
		jr $ra