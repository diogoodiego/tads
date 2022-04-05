.text
	addi $v0,$zero,5
	syscall
	add $t2,$zero,$v0 		#lê b
	addi $t1,$zero,1	
	addi $t0,$zero,1
	j for1
	
for3:	addi $t1,$t1,1	
	bgt $t1,$t2,end
	j for1
	
for2:	addi $t4,$zero,1	
for1:	addi $t0,$t0,1
	bge $t0,$t1,signal
	div $t1,$t0
	mfhi $t3
	beq $t3,0,for2
	blt $t0,$t1 for1
	
signal:	addi $t9,$zero,1
	slt $t4,$t4,$t9
	add $t5,$t5,$t4
	j for3
	
end:	addi $v0,$zero,1
	add $a0,$zero,$t5
	syscall
	
	
