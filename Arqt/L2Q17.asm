.text
main:		addi $v0,$zero,5
		syscall
		add $t0,$zero,$v0
		
		addi $t8,$zero,1	#contador
		addi $t9,$zero,10	#divisor
		
opr1:		div $t0,$t9
		mfhi $t1
		mflo $t0
		andi $t2,$t8,1
		beq $t2,1,bypass1
		j mult1
mult1:		mul $t1,$t1,3		
bypass1:	add $t3,$t3,$t1
		addi $t8,$t8,1
		ble $t8,3,opr1
		
		
		
		addi $v0,$zero,1
		add $a0,$zero,$t3
		syscall
		
		
	
	
