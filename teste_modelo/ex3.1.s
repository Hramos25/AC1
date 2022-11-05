#Mapa de Registos
#n_even $t0
#n_odd #t1
#p1 $t2
#p2 $t3

    .data
    .eqv N,35
a:    .space 140
c:    .space 140

    .eqv print_int10,1
    .eqv read_int,5
    .text
    .globl main

main:    li $t0,0
    li $t1,0
    la $t2,a

    li   $t4,N
    addu $t4,$t2,$t4

for1:    bge $t2,$t4,endfor1
    li $v0,read_int
    syscall
    sw $v0,0($t2)
    addi $t2,$t2,4
    j for1

endfor1:
    la $t2,a
    la $t3,c

for2:    bge $t2,$t4,endfor2
    lw $t6,0($t2)
    rem $t7,$t6,2 

if:    beqz $t7,else
    sw $t6,0($t3)

    addi $t3,$t3,4
    addi $t1,$t1,1

    j endif
else:    addi $t0,$t0,1
endif:  addi $t2,$t2,4
    j for2

endfor2:    la $t3,c
        sll $t6,$t1,2
        add $t6,$t6,$t3

for3:    bge $t3,$t6,endfor3

    lw $a0,0($t3)
    li $v0,print_int10
    syscall

    li $a0,','
    li $v0,11
    syscall

    addi $t3,$t3,4
    j for3

endfor3: jr $ra