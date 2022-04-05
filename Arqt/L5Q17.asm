.data
	Array:
		.align 2
		.space 20
.text
	move $t0,$zero
	addi $t2,$zero,1
	for1:
		beq $t0,20,efor1
		
			move $t1,$zero
			for2:
				beq $t1,20,efor2
				sw $zero, Array($t1)
				
				if1:
					bne $t0,$t1,eif1
					sw $t2,Array($t1)
				eif1:
				
				addi $v0,$zero,1
				lw $a0,Array($t1)
				syscall 	#print digit
			
				addi $v0,$zero,11
				addi $a0,$zero,32
				syscall		#print space
				
				addi $t1,$t1,4	
				j for2
			efor2:
			
		addi $v0,$zero,11
		addi $a0,$zero,10
		syscall		#print breakline
		
		addi $t0,$t0,4	
		
		j for1
	efor1:
