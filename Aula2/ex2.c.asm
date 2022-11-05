    .data
    .text
    .globl main

main:  ori  $t0, $0, 6  # valor em binário

       srl $t1, $t0, 1  # deslocamento de 1 bit para a direita (bin >> 1)
       xor $t1, $t0, $t1 # Xor (bin ^ (bin >> 1))


       jr   $ra