.data
	comma:	.asciiz ","
	# 	$t0 = soma
	#	$t9 = divisor
	#	$t8 = soma*10
	#	$t7 = soma*10/2
.text
	main:	addi $v0, $zero, 5
		syscall
		add $t1,$zero,$v0
		
		addi $v0, $zero, 5
		syscall
		add $t2,$zero,$v0
		
		addi $t9,$zero,2
		add $t0, $t1,$t2
		mul $t8,$t0,10
		div $t8,$t9
		mflo $t7
		addi $t9,$zero,10
		div $t7,$t9
		
		addi $v0,$zero,1
		mflo $a0
		syscall
		
		addi $v0,$zero,4
		la $a0,comma
		syscall
		
		addi $v0, $zero,1
		mfhi $a0
		syscall
		

		
