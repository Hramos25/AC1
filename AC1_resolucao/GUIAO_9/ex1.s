        .eqv    read_int, 5
        .eqv    print_float, 2
        .data
k1:     .float 2.59375
        .text
        .globl main

# Mapa de Registos
# res --> $f0
# val --> $t0


main:   

do:     li $v0, read_int        # val = read_int
        syscall             

        mtc1    $f0, $v0
        cvt.s.w $f0, $f0            # (float)val

        mul.s   $f0, $f0, k1        # res = (float)val * 2.59375
        mov.s   $f12, $f0       
        li      $v0, print_float    # print_float(res)
        syscall
        sub.s   $f2, $f2, $f2   # $f2 = 0.0

while:  c.eq.s  $f0, $f2        # while ( res != 0.0)
        bc1t    endw

        j do

endw:   li $v0, 0       # return 0
