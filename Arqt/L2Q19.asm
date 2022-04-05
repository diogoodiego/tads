.text
main:		addi $v0,$zero,5
		syscall
		
		add $t0,$zero,$v0
		addi $t9,$zero,1	#var controlador
		addi $t8,$zero,10	#var divisor
		
convert:	div $t0,$t8
		mfhi $t1
		mflo $t0
		mul $t1,$t1,$t9
		add $t2,$t2,$t1
		mul $t9,$t9,2
		ble $t9,128,convert
		
		addi $v0,$zero,1
		add $a0,$zero,$t2
		syscall
		
		
		
