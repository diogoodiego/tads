.text
	main:	addi $v0,$zero,5
		syscall
		add $t1,$zero,$v0
		
		sle $t0,$t1,7
		add $t1,$t1,$t0
		andi $t0,$t1,1
		not $t0,$t0
		
		addi $v0,$zero,1
		addi $a0,$t0,32
		syscall