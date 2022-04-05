.text
	main:	addi $v0,$zero,5
		syscall			#lê inteiro
		
		addi $t9,$zero,10
		
		add $t0,$zero,$v0	#transfere o valor de v0 para t0
		div $t0,$t9		#divide o t0 por 10
		
		mfhi $t4		#pega o ultimo digito e passa para t4 
		mflo $t0		#move os demais digitos para t0
		
		div $t0,$t9		#divide o t0 por 10
		
		mfhi $t3		#pega o ultimo digito e passa para t3 
		mflo $t0		#move os demais digitos para t0
		
		div $t0,$t9		#divide o t0 por 10
		
		mfhi $t2		#pega o ultimo digito e passa para t2 
		mflo $t0		#move os demais digitos para t0
		
		div $t0,$t9		#divide o t0 por 10
		
		mfhi $t1		#pega o ultimo digito e passa para t1 
		
		div $t1, $t1		#divide o numero por ele mesmo; se > 0 = 1; senão = 0 
		mflo $t0	
		addi $t1, $t1, 16	#soma numero com 16
		mul $t1,$t0,$t1		#mutiplica pela divisão
		addi $t0, $zero,0
		
		addi $v0,$zero,11
		addi $a0,$t1,32 
		syscall			#imprime o caratere 
		
		mtlo $zero		#reseta o LO
		div $t2, $t2		#divide o numero por ele mesmo; se > 0 = 1; senão = 0 
		mflo $t0	
		addi $t2, $t2, 16	#soma numero com 16
		mul $t2,$t0,$t2		#mutiplica pela divisão
		addi $t0, $zero,0
		
		addi $v0,$zero,11
		addi $a0,$t2,32 
		syscall			#imprime o caratere 
		
		mtlo $zero		#reseta o LO
		div $t3, $t3		#divide o numero por ele mesmo; se > 0 = 1; senão = 0 
		mflo $t0	
		addi $t3, $t3, 16	#soma numero com 16
		mul $t3,$t0,$t3		#mutiplica pela divisão
		addi $t0, $zero,0
		
		addi $v0,$zero,11
		addi $a0,$t3,32 
		syscall			#imprime o caratere 
		
		mtlo $zero		#reseta o LO
		div $t4, $t4		#divide o numero por ele mesmo; se > 0 = 1; senão = 0 
		mflo $t0	
		addi $t4, $t4, 16	#soma numero com 16
		mul $t4,$t0,$t4		#mutiplica pela divisão
		addi $t0, $zero,0
		
		addi $v0,$zero,11
		addi $a0,$t4,32 
		syscall			#imprime o caratere 
		
		 
