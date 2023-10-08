        .data

        .text
        .globl atoi

# Mapa de registos
# res --> $v0
# s --> $a0
# *s --> $t0
# digit --> $t1

atoi:   li  $v0, 0      # res = 0

while:  lb  $t0, 0($a0)
        blt $t0, '0', endw
        bgt $t0, '9', endw

        sub   $t1, $t0, '0' # digit = *s - '0'
        addiu $t0, $t0, 1
        mul   $v0, $v0, 10  # res = 10*res
        add   $v0, $v0, $t1 # res = 10*res + digit

        j   endw

endw:   move  $v1, $v0
        jr  $ra
