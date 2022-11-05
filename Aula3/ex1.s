# mapa de registos:
# $t0 - soma
# $t1 - value
# $t2 - i

.data
    str1: .asciiz "Introduza um número: "
    str2: .asciiz "Valor ignorado\n"
    str3: .asciiz "A soma dos positivos é: "
          .eqv print_string, 4
          .eqv read_int, 5 
          .eqv print_int10, 1

.text
.globl main

# $t0 -> soma
# $t1 -> value
# $t2 -> i

main: li    $t0, 0  # soma = 0
      li    $t2, 0  # i = 0
      li    $t1, 0  # value = 0

for: bge   $t2, 5, endfor   # while(i < 5) {
      li    $v0, print_str                   # print_string("...");
      la  $a0, str1                  # value=read_int();
      syscall
      
      li   $v0, read_int

      or    $t1, $v0, $0      # read_int()

if:  ble    $t1, 0, else
     add  $t0, $t0, $t1 # soma += value
      j    endif

else: la $a0, str2
      li $v0, print_string
      syscall     # print_string("Valor ignorado\n");

endif: addi $t2, $t2, 1 # i++
      j for

end for: la $a0, str3
         li $v0, print_string
            syscall     # print_string("A soma dos positivos é: ");
         li $v0, print_int10
         move $a0, $t0
            syscall     # print_int10(soma);
         jr $ra
    