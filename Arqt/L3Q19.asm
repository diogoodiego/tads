.data
	dv: .asciiz "DV"
	no: .asciiz "NO"
	ne: .asciiz "NE"
	se: .asciiz "SE"
	so: .asciiz "SO"

.text
	addi $v0,$zero,5
	syscall
	add $t0,$zero,$v0
	# t0 = k
	#t9 = controle
	#t1 = n
	#t2 = m
	#t3 = x
	#t4 = y
	
while:		bgt $t9,$t1,endwhile

		addi $v0,$zero,5
		syscall
		add $t1,$zero,$v0	#lê n
		
		addi $v0,$zero,5
		syscall
		add $t2,$zero,$v0	#lê m
		
		addi $v0,$zero,5
		syscall
		add $t3,$zero,$v0	#lê x
		
		addi $v0,$zero,5
		syscall
		add $t4,$zero,$v0	#lê y
		
		
		#DV se a residência encontra-se em cima de uma das linhas divisórias (norte-sul ou leste-oeste);
		beq $t1,$t3,printdv
		beq $t2,$t4,printdv
		
		bgt $t3,$t1,if1	# eixo x
		j else1
		
if1:		bgt $t4,$t2,printne	# eixo y
		j printse
			
		
else1:		bgt $t4,$t2,printno	# eixo y
		j printso
		
		
printdv:	addi $v0,$zero,4
		la $a0,dv
		syscall	
		j end
		
printno:	addi $v0,$zero,4
		la $a0,no
		syscall	
		j end
		
printne:	addi $v0,$zero,4
		la $a0,ne
		syscall	
		j end
		
printse:	addi $v0,$zero,4
		la $a0,se
		syscall	
		j end
		
printso:	addi $v0,$zero,4
		la $a0,so
		syscall	
		j end
				
end:		addi $t9,$t9,1
		j while	
			
endwhile:	addi $v0,$zero,11
		addi $a0,$zero,32
		syscall			
