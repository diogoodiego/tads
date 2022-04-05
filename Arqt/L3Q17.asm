#$t6 = primeiro numero, $t7 = segundo numero, $t8 = $t1*$t2, $t9 = divisor
#$t1 = 4º digito, $t1 = 5º digito, $t3 = 6º digito, $t0 = varival de auxilio

.text
main:	addi $t6,$zero,999
	addi $t7,$zero,999
	addi $t9,$zero,10
	j multp
	
for:	addi $t7,$t7,-1	
multp:	mul $t8,$t6,$t7
	div $t8,$t9
	
	mfhi $t3
	mflo $t8
	div $t8,$t9
	
	mfhi $t2
	mflo $t8
	div $t8,$t9
	
	mfhi $t1
	mflo $t8
	
	
	div $t8,$t9
	mfhi $t0
	mflo $t8
	
	bne $t1, $t0, for
	div $t8,$t9
	mfhi $t0
	mflo $t8
	
	bne $t2, $t0, for
	div $t8,$t9
	mfhi $t0
	mflo $t8
	
	bne $t1, $t0, for
	
	addi $v0,$zero,5
	add $a0,$zero,$t6
	syscall
	
	addi $v0,$zero,11
	addi $a0,$zero,42
	syscall
	
	addi $v0,$zero,5
	add $a0,$zero,$t7
	syscall
	
	addi $v0,$zero,11
	addi $a0,$zero,61
	syscall
	
	addi $v0,$zero,5
	mul $a0,$t6,$t7
	syscall
	
	
	
	
	
	
	
	
	
		