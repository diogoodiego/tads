# Calcular fatorial
# Entrada: $t0
# Saida $t1
# Usa: $t9

main:	addi $v0,$zero,5
	syscall
	add $t0,$zero,$v0
	jal fat
	
	addi $v0,$zero,1
	add $a0,$zero,$t1
	syscall
	addi $v0,$zero,10
	syscall
	
fat: 	add $t1,$zero,$t0
	addi $t9,$t1,-1
mtl:	mul $t1,$t1,$t9
	addi $t9,$t9,-1
	bne $t9,$zero, mtl
	jr $ra
	
	