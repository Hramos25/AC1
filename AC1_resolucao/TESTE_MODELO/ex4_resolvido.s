# Mapa de registos:
# nv: $a0
# pt: $a1
# i: $t0
# j: $t1
# sum: $f0

    .data
    .text
    .globl func4
    
func4:
    sub.d    $f0, $f0, $f0                # double sum = 0.0
    li    $t0, 0                    # i = 0

for:
    bge    $t0, $a0, endfor            # for (int i = 0; i < nv; i++; pt++)
    li    $t1, 0                    # j = 0
    
do:
    addi    $t2, $a1, 16                # $t2 = &pt->quest[0]
    addu    $t2, $t2, $t1                # $t2 = &pt->quest[j]
    lb    $t2, 0($t2)                # $t2 = pt->quest[j]
    mtc1    $t2, $f2
    cvt.d.w    $f2, $f2                # (double) pt->quest[j]
    add.d    $f0, $f0, $f2                # sum += (double) pt->quest[j]
    addi    $t1, $t1, 1                # j++
    
    lb    $t2, 4($a1)                # $t2 = pt->nm
    blt    $t1, $t2, do                # while (j < pt->nm);
    
enddo:        
    l.d    $f2, 8($a1)                # $f2 = pt->grade
    div.d    $f2, $f0, $f2                # sum / pt->grade
    cvt.w.d    $f2, $f2                # (int) sum / pt->grade
    
    mfc1    $t2, $f2                # o que estava em $f2 passou para $t2 ou s.s $f2, 0($a1)
    sw    $t2, 0($a1)                # pt->acc = (int) sum / pt->grade
    
    addi    $t0, $t0, 1                # i++
    addi    $a1, $a1, 40                # pt++ temos que adicionar o valor do size máximo
    
    j    for
    
endfor:    
    lw    $t0, 32($a1)                # $t0 = pt->cq
    mtc1    $t0, $f0
    cvt.d.w    $f0, $f0                # $f0 = (double) pt->cq
    
    l.d     $f2, 8($a1)                # $f2 = pt->grade
    mul.d    $f0, $f2, $f0                # return (pt->grade * (double) pt->cq)
    
    jr    $ra