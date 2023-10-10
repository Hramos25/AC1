	.eqv MAX_STUDENTS,4
	.data
st:	.space 176
media: 	.space 4

str1:	.asciiz "\nMedia: "
str2:	.asciiz	"N. Mec: "
str3:	.asciiz	"Primeiro Nome: "
str4:	.asciiz	"Ultimo Nome: "
str5:	.asciiz	"Nota: "
max_grade:	.float -20.0
sum:	.float 0.0
	.text
	.globl main
	
# Mapa de Registos
# $t0 -> media
# $t1 -> pmax

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,st
	li $a1,MAX_STUDENTS
	jal read_data			#read_data( st_array, MAX_STUDENTS )
	
	la $a0,st
	li $a1,MAX_STUDENTS
	la $a2,media
	jal max				#max( st_array, MAX_STUDENTS, &media )
	move $t1,$v0			#pmax = max( st_array, MAX_STUDENTS, &media )
	
	la $a0,str1
	li $v0,4
	syscall				#print_string("\nMedia: ")
	
	la $t0,media
	l.s $f12,0($t0)
	li $v0,2
	syscall				#print_float( media )
	
	move $a0,$t1
	jal print_student		#print_student( pmax )
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra
	
	
read_data:
	li $t0,0			#i=0
	move $t3,$a0
	move $t4,$a1
	
	bge $t0,$t4,endfor1		
		
for1:
	mul $t1,$t0,44			
	addu $t1, $t1, $t3		#st[i]

	la $a0,str2
	li $v0,4
	syscall				#print_string("N. Mec: ")
	
	li $v0,5			#read_int()
	syscall
	sw $v0,0($t1)			#st[i].id_number = read_int()
	
	la $a0,str3
	li $v0,4
	syscall				#print_string("Primeiro Nome: ")
	
	addiu $a0,$t1,4
	li $a1,17
	li $v0,8
	syscall				#read_string(st[i].first_name, 17)
	
	la $a0,str4
	li $v0,4
	syscall				#print_string("Ultimo Nome: ")
	
	addiu $a0,$t1,22
	li $a1,14
	li $v0,8
	syscall				#read_string(st[i].last_name, 14)
	
	la $a0,str5
	li $v0,4
	syscall				#print_string("Nota: ")
	
	addiu $a0,$t1,40
	li $v0,6
	syscall				#read_float()
	s.s $f0,0($t1)
	
	addiu $t0,$t0,1
	j for1
					
endfor1:	
	jr $ra	
	

max:
# Mapa de Registos
# $t0 -> *p
# $t1 -> *pmax
# $f0 -> max_grade
# f1 -> sum

	la $t0,max_grade
	l.s $f0,0($t0)			#max_grade = -20.0
	la $t0,sum
	l.s $f1,0($t0)			#sum = 0.0
	
	move $t0,$a0
	mul $t2,$a1,44
	addu $t2,$t2,$a0
for2:
	bge $t0,$t2,endfor2
	l.s $f2,40($t0)
	add.s $f1,$f1,$f2		#sum += p->grade
if1:
	c.le.s $f2,$f0
	bc1t endif1
	
	mov.s $f0,$f2			#max_grade = p->grade
	move $t1,$t0			#pmax = p
endif1:
	addiu $t0,$t0,44		#p++
	j for2
endfor2:
	mtc1	$a1, $f6
	cvt.s.w	$f6, $f6
	div.s	$f6, $f1, $f6
	s.s	$f6, 0($a2)
	
	move	$v0, $t1
	jr	$ra
	
	
print_student:
	move $t0,$a0
	li $v0,1
	lw $a0,0($t0)
	syscall
	
	li $v0,4
	addiu $a0,$t0,4
	syscall
	
	li $v0,4
	addiu $a0,$t0,22
	syscall
	
	li $v0,2
	addiu $a0,$t0,40
	syscall
	