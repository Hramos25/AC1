        .eqv    Size, 8
        .data

        .text
        .globl func4

# Mapa de Registos
# nv -> $a0 
# pt -> $a1
# i ->  $t0
# j ->  $t1
# sum -> $f0

func4:  sub.d $f0, $f0, $f0     # sum = 0.0

        li $t0, 0               # i = 0

for:    bge $t0, $a0, endF      # for(i<nv)

        li $t1, 0               # j = 0

do:     sll $t2, $a1, 4         # $t2 = &pt->quest[0]
    	addu $t2, $t2, $t1      # $t2 = &pt->quest[j]
        lb $t2, 0($t2)          # $t2 = pt->quest[j]
        mtc1 $t2, $f2           
        cvt.d.w $f2, $f2        # (double) pt->quest[j]
        add.d $f0, $f0, $f2     # sum += (double) pt->quest[j]

        addi $t1, $t1, 1

        lb $t2, 4($a1)          # $t2 = pt->nm
        blt $t1, $t2, do
enddo:  
        
        l.d $f2, 8($a1)         # $f2 = pt->grade
        div.d $f2, $f0, $f2     # $f2 = sum/pt->grade
        cvt.w.d $f2, $f2
        mfc1 $t2, $f2           # (int) (sum/pt->grade) 

        sw $t2, 0($a1)          # pt->acc = (int) (sum/pt->grade)

        addi $t0, $t0, 1        # i++
        addi $a1, $a1, 40       # pt++

        j for

endF: lw $t2, 32($a1)         # $t2 = pt->cq

        mtc1 $t2, $f2
        cvt.d.w $f2, $f2        # $f2 = (double) pt->cq

        # lw $t2, 8($a1)          # $t2 = pt->grade

        l.d $f0, 8($a1)
        mul.d $f0, $f0, $f2     # return (pt->grade * (double)pt->cq)

        jr $ra
