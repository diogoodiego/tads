.text
main:
lui $8, 0x1001 # $8 <= 0x10010000
addiu $9, $0, 0xff00
addi $10, $0, 4
lui $20, 0xffff
addi $21, $0, 'z'
addi $22, $0, 's'
addi $23, $0, 'd'

laco:sw $9, 0($8)
add $8, $8, $10
sub $11, $8, $10
# sw $0, 0($11)
lw $12, 0($20)
beq $12, $0, naodig
lw $13, 4($20)
beq $21, $13, fim
beq $13, $22, teclas
beq $13, $23, teclad
j naodig
teclas:
addi $10, $0, 256
j naodig
teclad:
addi $10, $0, 4

naodig: nop
j laco

fim: addi $2, $0, 10
syscall