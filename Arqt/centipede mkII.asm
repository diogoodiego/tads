# $14 = position
# $12 = keyboard state

.text
main:	
	add $9, $0,$0
	#addi $10, $0,30720
	
	lui $20, 0xffff
	addi $21, $0, 'a'
	addi $22, $0, 'd'
	
	#gerar placar
	lui $8,0x1001
	addi $8,$8,1088
	jal spaceship
	
	lui $8,0x1001
	addi $8,$8,1128
	jal spaceship
	
	lui $8,0x1001
	addi $8,$8,1536
	jal score
	
	
	
	
	
	
	
	#gerar player
	lui $8,0x1001
	addi $14,$0,118272
	add $8,$8,$14
	jal spaceship
	
	#gerar cobra
	lui $8,0x1001
	addi $15,$0,16384
	add $8,$8,$15
	jal snake
	
	moviment:
	
		#gerar cenario
		lui $8,0x1001
		addi $8,$8,21248
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,31428
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,31368
		jal cogumeloAlternative

		lui $8,0x1001
		addi $8,$8,35976
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,36728
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,46228
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,46848
		jal cogumeloAlternative

		lui $8,0x1001
		addi $8,$8,51316
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,52016
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,56832
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,56896
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,61632
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,66712
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,66944
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,67200
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,71936
		jal cogumeloAlternative
	
		lui $8,0x1001
		addi $8,$8,72428
		jal cogumeloAlternative
	
		#delay
		li $v0, 32
		li $a0, 300
		syscall
		
		
		
		
		#mover cobra	
		lui $8,0x1001
		add $8,$8,$15
		jal deleteSnake
		
		#gerar cenario alternativo
		lui $8,0x1001
		addi $8,$8,21248
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,31428
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,31368
		jal cogumelo

		lui $8,0x1001
		addi $8,$8,35976
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,36728
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,46228
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,46848
		jal cogumelo

		lui $8,0x1001
		addi $8,$8,51316
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,52016
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,56832
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,56896
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,61632
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,66712
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,66944
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,67200
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,71936
		jal cogumelo
	
		lui $8,0x1001
		addi $8,$8,72428
		jal cogumelo
		
		
		#descer cobra
		
		addi $10,$0,1024
		div $15,$10
		mfhi $11
		if1:
			bgt $11,0,endif1
			addi $15,$15,10240
		endif1:

		lui $8,0x1001
		addi $15,$15,-16
		add $8,$8,$15
		jal snake

		#delay
		li $v0, 32
		li $a0, 300
		syscall
		
		#player moviment
		
		
		lw $12, 0($20)
		beq $12,$0,notdigt
		
		
		lui $8,0x1001
		
		lw $13, 4($20)
		beq $13,$21,teclaA
		beq $13,$22,teclaD
		
		teclaA:
		lui $8,0x1001
		add $8,$8,$14
		jal deleteSpaceship
		addi $14,$14,-16
		lui $8,0x1001
		add $8,$8,$14
		jal spaceship
		j moviment
		
		teclaD:
		lui $8,0x1001
		add $8,$8,$14
		jal deleteSpaceship
		addi $14,$14,16
		lui $8,0x1001
		add $8,$8,$14
		jal spaceship
		j moviment
		
	notdigt: nop
	j moviment
		
	j fim
	
	score:
		#linha 1
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		
		#linha 2
		addi $8,$8,1016
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		# linha 3
		addi $8,$8,1012
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		# linha 4
		addi $8,$8,1012
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		# linha 5
		addi $8,$8,1012
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		# linha 6
		addi $8,$8,1016
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ffffff
		sw $24, 0($8)
		
		jr $ra
	
	
	
	cogumelo:
	
		#linha 1
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 2
		addi $8,$8,1008
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 3
		addi $8,$8,1000
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 4
		addi $8,$8,996
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 4
		addi $8,$8,996
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1004
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1012
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1012
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee0000
		sw $24, 0($8)

		jr $ra
		
	cogumeloAlternative:
	
		#linha 1
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4 
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 2
		addi $8,$8,1008
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 3
		addi $8,$8,1000
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 4
		addi $8,$8,996
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 4
		addi $8,$8,996
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1004
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1012
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x0000ee00
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		#linha 5
		addi $8,$8,1012
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)
	
		addi $8,$8,4
		add $24, $0, 0x00ee00ee
		sw $24, 0($8)

		jr $ra
	
	snake:
		#linha 1
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 2
		addi $8,$8,1024
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		#linha 3
		addi $8,$8,1012
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		#linha 4
		addi $8,$8,1008
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		#linha 5
		addi $8,$8,1004
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1012
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x0000ee00
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1016
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		jr $ra
		
	deleteSnake:
		#linha 1
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 2
		addi $8,$8,1024
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 3
		addi $8,$8,1012
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 4
		addi $8,$8,1008
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 5
		addi $8,$8,1004
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1012
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1016
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		jr $ra
		
	spaceship:
		#linha 1
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		#linha 2
		addi $8,$8,1024
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		#linha 3
		addi $8,$8,1024
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 4
		addi $8,$8,1020
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 5
		addi $8,$8,1012
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1004
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ee0000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 7
		addi $8,$8,1004
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 8
		addi $8,$8,1012
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		#linha 8
		addi $8,$8,1016
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00ffffff
		sw $24, 0($8)
		
		jr $ra
		
	deleteSpaceship:
		#linha 1
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 2
		addi $8,$8,1024
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 3
		addi $8,$8,1024
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 4
		addi $8,$8,1020
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 5
		addi $8,$8,1012
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 6
		addi $8,$8,1004
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 7
		addi $8,$8,1004
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 8
		addi $8,$8,1012
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		#linha 8
		addi $8,$8,1016
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		addi $8,$8,4
		add $24,$0, 0x00000000
		sw $24, 0($8)
		
		
		jr $ra
		
		
	fim: 
		
		addi $2, $0, 10
		syscall
		
