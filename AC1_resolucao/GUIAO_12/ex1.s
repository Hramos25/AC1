#                             Align      Size       Offset
# unsigned int id_number    |   4     |   4     |   0
# char first_name[18]       |   1     |   18    |   4
# char last_name[15]        |   1     |   15    |   22
# float grade               |   4     |   4     |   37 -> 40
# student                   |   4     |   44    |xxxxxxxxxxx

        .eqv    print_string, 4
        .eqv    print_float, 2
        .eqv    read_int, 5
        .eqv    MAX_STUDENTS, 4
        .data
st:     .space 176          # 4*44 = 176
media:  .space 4            
str:    .asciiz "\nMedia: "
str1:   .asciiz "N. Mec: "
str2:   .asciiz "Primeiro Nome: "
str3:   .asciiz "Ultimo Nome: "
str4:   .asciiz "Nota: "
max_grade: .float -20.0
sum:    .float 0.0

        .text
        .globl main

# Mapa de Registos
# media --> $t0
# pmax --> $t1

main:   addiu $sp, $sp, -4
        sw $ra, 0($sp)

        la $a0, st
        li $a1, MAX_STUDENTS
        jal read_data           # read_data( st_array, MAX_STUDENTS )

        la $a0, st
        li $a1, MAX_STUDENTS
        la $a2, media
        jal max                 # max( st_array, MAX_STUDENTS, &media )
        move $t1, $v0           # pmax = max( st_array, MAX_STUDENTS, &media )

        la $a0, str
        li $v0, print_string
        syscall                 # print_string ("\nMedia: ")

        la $t0, media
        l.s $f12, 0($t0)
        li $v0, print_float
        syscall                 # print_float( media )

        move $a0, $t1
        jal print_student       # print_student( pmax )

        lw $ra, 0($sp)
        addiu $sp, $sp, 4

        jr $ra



# Mapa de Registos
# st --> $a0
# ns --> $a1
# i --> $t0

read_data:  li  $t0, $0     # i = 0
            move $t3, $a0
            move $t4, $a1

for1:    bge $t0, $a1, endf1

        la $a0, str1
        li $v0, print_string        # print_string ("N. Mec: ")
        syscall

        mul $t1, $t0, 44
        addu $t1, $t1, $t3      # st[i]

        li $v0, read_int
        syscall
        sw $v0, 0($t1)      # st[i].id_number = read_int()

        la $a0, str2
        li $v0, print_string            # print_string("Primeiro Nome: ")
        syscall

        addiu $a0, $t1, 4
        li $a1, 17
        li $v0, 8               # read_string(st[i].first_name, 17)
        syscall         
        sw  $v0, 0($t1)

        la $a0, str3
        li $v0, print_string    # print_string("Ultimo Nome: ")
        syscall 

        addiu $a0, $t1, 22
        li $a1, 14
        li $v0, 8               # read_string(st[i].last_name, 14)
        syscall
        sw $v0, 0($t1)

        la $a0, str4
        li $v0, print_string    # print_string("Nota: ")
        syscall

        addiu $a0, $t1, 40
        li $v0, 6               # st[i].grade = read_float()
        syscall

        addiu $t0, $t0, 1

        j for1

endf1:  jr $ra

# Mapa de Registos
# st --> $a0
# ns --> $a1
# media --> $a2
# p --> $t0
# pmax --> $t1
# max_grade --> $f0
# sum --> $f2

max:    la $t0, max_grade
        l.s $f0, 0($t0)     # max_grade = -20.0
        la $t0, sum         
        l.s $f2, 0($t0)     # sum = 0.0

        move $t0, $a0           # p = st
        mul $t2, $a1, 44        # $t2 = st
        addu $t2, $t2, $a1      # $t2 = st + ns

for2:   bge $t0, $t2, endf2

        l.s $f4, 40($t0)
        add.s $f2, $f2, $f4     # sum += p->grade

if:     c.le.s $f4, $f0         # if (p->grade > max_grade)
        bc1t   endif

        mov.s $f0, $f4          # max_grade = p->grade
        move  $t1, $t0          # pmax = p

endif:  addiu $t0, $t0, 44      # p++
        j for2

endf2:  mtc1    $a1, $f4
        cvt.s.w $f4, $f4        # (float)ns
        div.s $f4, $f0, $f4     # $f4 = sum / (float)ns
        s.s $f4, 0($a2)         # media = sum / (float)ns

        move $v0, $t1           # return pmax
        jr $ra  

# Mapa de Registos
# p --> $a0

print_student:  move $t0, $a0
                li $v0, 1
                lw $a0, 0($t0)
                syscall                 # print_intu10(p->id_number)

                li $v0, print_string
                addiu $a0, $t0, 4
                syscall                 # print_string(p->first_name)

                li $v0, print_string
                addiu $a0, $t0, 22
                syscall                 # print_string(p->last_name)

                li $v0, print_float
                addiu $a0, $t0, 40
                syscall                 # print_float(p->grade)