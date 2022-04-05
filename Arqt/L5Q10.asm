.data
	Array:
		.align 2
		.space 40

.text
	move $t0, $zero
	li $t2, 40
	
	for1:
		beq $t0, $t2, efor1
		addi $v0,$zero,5
		syscall	
		sw $v0, Array($t0)
		addi $t0, $t0, 4
		j for1
	efor1:
	
	move $t0, $zero
	
	for2:
		beq $t0, $t2, efor2
		lw $t6, Array($t0)
		addi $t1,$t0,4
		for3:
			beq $t1,$t2,efor3
			lw $t7, Array($t1)
			if1:
				bne $t6,$t7,eif1
				sw $zero, Array($t1)
				
			eif1:
			addi $t1,$t1,4
			j for3
			
		efor3:
		addi $t0,$t0,4	
		j for2
	efor2:
	move $t0, $zero
	imprime:
		beq $t0, $t2, eimprime
		lw $a0, Array($t0)
		if2:
			beq $a0,$zero, eif2
			li $v0,1
			lw $a0, Array($t0)
			syscall
		eif2:
		addi $t0, $t0, 4
		j imprime
	eimprime:
