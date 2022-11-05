    .eqv    N, 35
    .eqv    read_int, 5
    .eqv    print_int10, 1

    .data

a:  .space 140
ba:  .space 140

    .text
    .globl main

# Mapa de registos
# n_even --> $t0
# n_odd --> $t1
# p1 --> $t2
# p2 --> $t3

main:   li  $t0, 0
        li  $t1, 0

        la  $t2, a
        
        addi $t4, $t2, N 

for:    bge $t2, $t4, endfor

        li $v0, read_int
        syscall

        sw  $v0, 0($t2)     # *p1 = read_int()
        addi $t2, $t2, 4
        j   for

endfor: la  $t2, a
        la  $t3, ba

        addiu $t4, $t2, N

for2:   bge $t2, $t4, endfor2

        lw  $t5, 0($t2)     # $t5 = *p1
        rem $t6, $t5, 2     # *p1 % 2
        lb  $t7, 0($t3)     # $t7 = *p2

if:     beq $t6, 0, endif
        sw  $t5, 0($t1)
        addi    $t3, $t3, 4
        addi    $t1, $t1, 1
        addi    $t2, $t2, 4
        
        j   endif

endif:  addi    $t0, $t0, 1
        j   for2

endfor2:    la $t3, ba
            sll $t6, $t1, 2
            add $t4, $t3, $t6
            
            

for3:   bge $t3, $t4, endfor3
        
        
        lw $a0, 0($t3)
        li $v0, print_int10
        syscall

        addi $t3, $t3, 4
        j for3
    
endfor3:    jr  $ra
