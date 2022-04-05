.data
	Array:
		.align 2
		.space 72
.text
	move $t0,$zero
	for1:
		beq $t0,64,efor1
		addi $v0,$zero,5
		syscall	
		sw $v0, Array($t0)
		addi $t0,$t0,4
		j for1
	efor1: 	
	
	move $t0,$zero	
	move $t1,$zero
	move $t2,$zero
	move $t3,$zero
	lw $t6, Array($t0)
	move $t9,$zero
	for2:
		beq $t0,4,efor2
		move $t1,$zero
		for3:
			beq $t1,16,efor3
			add $t3,$t1,$t2
			
			lw $t8,Array($t3)
			
			if1:
				bgt $t6,$t8,eif1
				move $t6,$t8
				add $t9,$zero,$t3
			eif1:
			
			addi $v0,$zero,1
			lw $a0,Array($t3)
			syscall
			
			addi $v0,$zero,11
			addi $a0,$zero,32
			syscall
			
			addi $t1,$t1,4
			j for3
		efor3:
		
		addi $v0,$zero,11
		addi $a0,$zero,10
		syscall
			
		addi $t2,$t2,16
		addi $t0,$t0,1
		j for2
	efor2:
	
	
	addi $v0,$zero,1
	add $a0,$zero,$t6
	syscall
	
	addi $v0,$zero,11
	addi $a0,$zero,10
	syscall
	
	addi $t1,$zero,4
	div $t9,$t9,4
	div $t9,$t1
	
	addi $v0,$zero,1
	mflo $a0
	syscall
	
	addi $v0,$zero,11
	addi $a0,$zero,44
	syscall
	
	addi $v0,$zero,1
	mfhi $a0
	syscall