    .data
str:    .asciiz "ITED - orievA ed edadisrevinU"
    .text
    .globl main

main:   addiu $sp, $sp, -4      # prologo
        sw  $ra, 0($sp)

        la  $a0, str
        jal strrev
        move $a0, $v0
        li $v0, 4
        syscall

        lw $ra, 0($sp)
        addiu $sp, $sp, 4       # epilogo
        jr $ra

# Mapa de registos
# str: $a0 -> $s0
# p1 --> $s1
# p2 --> $s2

# Função intermédia

strrev: addiu $sp, $sp, -16
        sw  $ra, 0($sp)
        sw  $s0, 4($sp)
        sw  $s1, 8($sp)
        sw  $s2, 12($sp)

        move $s0, $a0
        move $s1, $a0
        move $s2, $a0
    
while:  lb  $t0, 0($s2)
        beq $t0, '\0', endw
        addiu $s2, $s2, 1
        j while

endw:   addiu $s2, $s2, -1

while2: bge $s1, $s2, endw2
        
        move $a0, $s1
        move $a1, $s2
        jal exchange
        addiu $s1, $s1, 1
        addiu $s2, $s2, -1

        j while2

endw2:  move $v0, $s0


        lw $ra, 0($sp)
        lw $s0, 0($sp)
        lw $s1, 0($sp)
        lw $s2, 0($sp)
        addiu $sp, $sp, 16
        jr $ra

# terminal
# c1 --> $a0
# c2 --> $a1

exchange:   lb  $t0, 0($a0)
            lb  $t1, 0($a1)

            sb  $t0, 0($a1)
            sb  $t1, 0($a0)
            jr $ra