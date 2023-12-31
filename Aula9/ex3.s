    .data
    .eqv SIZE, 10
a:  .space 80
    .text
    .globl main

# i : $t0

main:   addiu $sp, $sp, -4
        sw  $ra, 0($sp)
        li  $t0, 0          # i = 0

for:    bge $t0, SIZE, endfor

        li $v0,5
        syscall # read_int()

        mtc1 $v0, $f0
        cvt.d.w $f0, $f0 # $f0= (double)read_int()

        la $t2, q
        sll $t1, $t0, 3
        addu $t2, $t2, $t1 # $t2 = $a[i]
        
        s.d $f0, 0($t2) # a[i] = (double)read_int()

        addi $t0, $t0, 1    # i++

        j for

endfor: la $a0, a
        li $a1, SIZE
        jal average

        mov.d $f12, $f0
        li $v0,3
        syscall

        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra


# array: $a0
# n: $a1
# i: $t0
# sum: $f0

average: move $t0, $a1 # i = n
         mtc1 $0, $f0
         ctv.d.w $f0, $f0  # sum = 0.0

afor: ble $t0, 0, aendfor
      
      addi $t1, $t0, -1  # $t1 = i-1
      sll $t1, $1, 3
      addu $t1, $a0, $t1  # $t1 = &array[i-1]

      l.d $f2, 0($t1) # $f2 = array[i-1]
      add.d $f0, $f0, $f2 # sum +=array[i-1]

      addi $t0, $t0, -1 # i--
      j afor

aendfor: mtc1 $a1, $f2
         cvt.d.w $f2, $f2
         div.d $f0, $f0, $f2  # return sum/(double) n

         jr $ra
