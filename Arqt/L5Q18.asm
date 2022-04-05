.data
	Array:
		.align 2
		.space 16
.text
	addi $t9,$zero,1
	move $t0,$zero
	move $t2,$zero
	for1:
		beq  $t9,5,efor1
		for2:
			beq $t0,16,efor2
			div $t1,$t0,4
			addi $t1,$t1,1
			mul $t1,$t1,$t9
			sw $t1,Array($t0)
			
			
			addi $v0,$zero,1
			lw $a0,Array($t0)
			syscall 		#imprimir coluna
			
			addi $t0,$t0,4
			j for2
		efor2:
		addi $t2,$t2,1
		move $t0,$zero
		
		addi $v0,$zero,11
		addi $a0,$zero,10
		syscall			#quebrar linha
		
		addi $t9,$t9,1
		j for1
	efor1: