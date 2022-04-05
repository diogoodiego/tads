.text
main:		addi $v0,$zero,5
		syscall
		
		addi $t9,$zero,10
		addi $t8,$zero,2
		add $t0,$zero,$v0
		add $t6,$zero,$v0
		
		
firstd:		div $t0,$t9		
		mfhi $t1		
		mflo $t0		
		mul $t7,$t1,$t8		
		add $t2,$t2,$t7		
		addi $t8,$t8,1				
		ble $t8,10,firstd
	
		mul $t2,$t2,10
		addi $t9,$zero,11
		div $t2,$t9
		mfhi $t2
		addi $t9,$zero,10
		slt $t3,$t2,$t9
		mul $t2,$t2,$t3
		
		addi $v0,$zero,1
		add $a0,$zero,$t6
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t2
		syscall
		
		add $t0,$zero,$t6
		mul $t2,$t2,2
		
		addi $t9,$zero,10
		addi $t8,$zero,3
		
secondd:	div $t0,$t9		
		mfhi $t1		
		mflo $t0
		mul $t7,$t1,$t8	
		add $t2,$t2,$t7		
		addi $t8,$t8,1				
		ble $t8,11,secondd
		
		mul $t2,$t2,10
		addi $t9,$zero,11
		div $t2,$t9
		mfhi $t2
		addi $t9,$zero,11
		slt $t3,$t2,$t9
		mul $t2,$t2,$t3
		
		addi $v0,$zero,1
		add $a0,$zero,$t2
		syscall
		
		
		
				
		
		
		
		
		
		
		
		
		
		
