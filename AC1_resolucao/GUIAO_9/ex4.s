        .eqv    Size, 10
        .eqv    read_int, 5
        .eqv    print_double, 3
        .data
a:      .space 80
        .text
        .globl main

# Mapa de Registos
# i --> $t0

main:   addiu $sp, $sp, -4
        sw  $ra, 0($sp)
        li  $t0, 0          # i = 0

for:    bge $t0, Size, endf
        
        li $v0, read_int    # read_int()
        syscall     
        mtc1    $v0, $f0
        cvt.d.w $f0, $f0    # $f0 = (double)read_int()
        
        la $t2, a
        sll $t1, $t0, 3
        addu $t2, $t2, $t1  # $t1 = &a[i]
        
        s.d $f0, 0($t2)     # $t1 = a[i]

        addi $t0, $t0, 1    # i++
        j for

endf:   la $a0, a
        li $a1, Size
        jal average

        mov.d $f12, $f0         # $f12 = sum/ (double)n
        li $v0, print_double    # print_double(average(a, Size))
        syscall

        li $v0, 0               # return 0

        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra


# Mapa de Registos
# array --> $a0
# n --> $a1
# i --> $t0
# sum --> $f0

average:    move $t0, $a1           # i = n
            sub.d $f0, $f0, $f0     # sum = 0.0

for1:        ble $t0, $0, endf1       # for ( i > 0; i--)

            sub $t1, $t0, 1
            sll $t1, $t1, 3

            addu $t1, $a0, $t1      # $t1 = &array[i-1]
            l.d $f2, 0($t1)         # $f2 = array[i-1]

            add.d $f0, $f0, $f2     # sum += array[i-1]

            sub $t0, $t0, 1

            j for1

endf1:       mtc1    $a1, $f2
            cvt.d.w $f2, $f2        # (double)n

            div.d $f0, $f0, $f2   # return sum / (double)n

            jr $ra


# Mapa de Registos
# p --> $t0
# *p --> $a0
# n --> $a1
# u --> $t1
# *u --> $t2
# max --> $f0
max:    addu $t2, $a0, $a1       # $t2 = p+n
        subu $t2, $t2, 1         # *u = p+n-1

        addu $a0, $a0, 1         # *p++

        l.d $f0, 0($a0)          # max = *p++

for2:    bgt $a0, $t2, endf       # for (p<=u)

        l.d $f4, 0($a0)

if:     c.le.d $f4, $f0
        bc1t    endif

        mov.d $f0, $f4      # max = *p

endif:  addui $t0, $t0, 1
        j for

endf2:   mov.d $f0, $v0      # return max

        jr $ra

