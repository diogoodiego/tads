.data
	msgtrue:	.asciiz "É congruente"
	msgfalse:	.asciiz "Nao é congruente"

.text
main:		addi $v0,$zero,5 	#lê I
		syscall
		add $t1,$zero,$v0	# I
	
		addi $v0,$zero,5	#lê M
		syscall
		add $t2,$zero,$v0	# M
	
		addi $v0,$zero,5	#lê J
		syscall
		add $t3,$zero,$v0	# J
	
		div $t1,$t2
		mfhi $t4
		div $t3,$t2
		mfhi $t5
	
		beq $t4,$t5, true
		j false

true:		addi $v0,$zero,4
		la $a0,msgtrue
		j end

false:		addi $v0,$zero,4
		la $a0,msgfalse
		j end

end:		syscall