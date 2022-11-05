# mapa de registos:
# $t0 - soma
# $t1 - value
# $t2 - i

.data
    str1: .asciiz "Introduza um número: "
    str2: .asciiz "Valor ignorado\n"
    str3: .asciiz "A soma dos positivos é: "
          .eqv print_string, 4
          .eqv print_int, 1

.text
.globl main

main: li    $t0, 0  #soma = 0

      li   $t2      #i = 0
for: ble   $t2, 5, endfor   # while(i < 5) {
                         # print_string("...");
    $t1                  # value=read_int();
    ble    $t1,$0,else      # if(value > 0)
    add    $t0,$t0,$t1          #   soma += value
    j      endif              #
else:                  # else
        str2                    #   print_string("...");
endif: addi $t2,1         # i++
       j    for             # }

endfor:
       str3                # print_string("...");
       $t1                # print_int10(soma);
       jr   $ra             