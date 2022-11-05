    .data
    .text
    .globl main

main:   ori     $t0,$0, 0xE543 # Valor a negar

        nor     $t1,$0,$t0 # ~ ( 0x0000 | $t0 ) --> Faz o mesmo que ~$t0


        jr      $ra 