#####################################################################
#t0 = endereco inicial da tela
#t1 = cor
#t2 = posiçao em que começa a desenhar na tela
#t3 = direção do movimento
#$t4 = guarda letra s
#t9 = teclado - guarda endereço do teclado
#t8 = tecla digitada - verifica se alguma tecla foi pressionada
#t7 = tecla digitada - verifica qual tecla foi pressionada


#####################################################################

.text
main:
lui $t0, 0x1001
lui $t9, 0xffff
addi $t4, $zero, 's'
addi $t2, $zero, 1024

loop:
lui $t0, 0x1001
add $t0, $t0, $t2
jal nave


lw $t8, 0($t9)
#delay para verifica se tecla foi pressionada
	li $v0, 32
	li $a0, 100
	syscall
beq $t8, $zero, naodig
lw $t7, 4($t9)

addi $t2, $t2, 1024

naodig:
j loop

fim:
addi $v0, $t0, 10
syscall

nave:
#line1
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x0000B6EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x0000B6EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
#line2
	addi $t0, $t0, 512 #soma-pra-descer
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
#line3
	addi $t0, $t0, 512 #soma-pra-descer
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x006038FF
	sw $t1, 0($t0)
	
#line4
	addi $t0, $t0, 512 #soma-pra-descer
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x003000EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, -4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
#line5
	addi $t0, $t0, 512 #soma-pra-descer
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x0000B6EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma	
	add $t1, $t0, 0x0000B6EF
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0, $t0, 4 #soma
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
#retornar
	jr $ra
