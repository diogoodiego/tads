.text
main:		addi $v0,$zero,5
		syscall
		
		add $t0,$zero,$v0
		addi $t9,$zero,2	#var divisor
		addi $t8,$zero,1	#var contador
		
		
loop:		div $t0,$t9
		mfhi $t1
		mflo $t0
		mul $t1,$t1,$t8
		add $t2,$t2,$t1
		mul $t8,$t8,10		# aumentar casa decimal
		bge $t0,1,loop
		
		addi $v0,$zero,1
		add $a0,$zero,$t2
		syscall
		
