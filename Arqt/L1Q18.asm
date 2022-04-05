.text
	main:	addi $v0,$zero,5
		syscall
		add $t1,$zero,$v0
		
		addi $v0,$zero,5
		syscall
		add $t2,$zero,$v0
		
		slt $t9,$t1,$t2
		sle $t8,$t2,$t1
		
		mul $t1,$t1,$t9
		mul $t2,$t2,$t8
		
		addi $v0, $zero,1
		add $a0,$t1,$t2
		syscall
		
		
		
