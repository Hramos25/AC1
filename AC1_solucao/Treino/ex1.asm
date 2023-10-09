.eqv print_str,4
  .eqv read_int,5
  .eqv print_int10,1
  .eqv print_char,11
  .data
  

str1:  .asciiz "Digite ate 20 inteiros(zero para terminar):"

str2:  .asciiz "Máximo/mínimo são: "

str3:  .asciiz ":"
 
  .text
  .globl main

main: li $t1,0            #n = 0
      li $t2,0x7FFFFFFF   #min = 0x7FFFFFFF
      li $t3,0x80000000 

      li $v0,print_str
      la $a0, str1
      syscall              #print_string(str1)

do:	li $v0,read_int
       	syscall
       	move $t0,$v0               #val=read_int()

if: 	beq $t0, 0, endw


       	bgt $t0,$t3,if1               #if(val>max)
       	blt $t0,$t2,if2               #if(val<min)
	
	    

          
if1:  or $t3,$t0,$0                  #max=val

	j while
if2:  move $t2,$t0                 #min=val 
	j while


while: 	bge $t1,20,endw     #do(
       	beq $t0,0,endw
	addi $t1,$t1,1  
	j do
       



endw: li $v0,print_str
      la $a0, str2
      syscall                       #print_string(str2)

	move $a0,$t3
      	li $v0,print_int10
 	syscall                      #print_int10(max)

	
      li $v0,print_str
      la $a0, str3
      syscall                       #print_string(str3)


      move $a0,$t2
      li $v0,print_int10
      
      syscall                      #print_int10(min)

       jr     $ra 