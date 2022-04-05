.text
	main:	addi $v0,$zero,5
		syscall
		add $t1,$zero,$v0
	
		andi $t2,$t1,1
		not $t2,$t2
	
		addi $v0,$zero,1
		addi $a0,$t2,1
		syscall 
		
		
		
		
