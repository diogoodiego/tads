# $t0 = ano, $t9 = divisor, $t1 =  mes, $t2 = dia
# $t1 = MOD($t0;19), $t2 = $t0\100, $t3 = MOD($t0;100), $t4 = $t2\4, $t5 = MOD($T2;4), $t6 = ($t2 + 8) \ 25
# $t6 = ($t2 - $t6 + 1) \ 3, $t6 = MOD((19 × $t1 + $t2 - $t4 - $t6 + 15);30), $t2 =  $t3 \ 4, $t3 = MOD($t3;4)
# $t4 = MOD((32 + 2 × $t5 + 2 × $t2 - $t6 - $t3);7), $t5 = ($t1+ 11 × $t6 + 22 × $t4) \ 451 
# $t1 = ($t6 + $t4 - 7 × $t5 + 114) \ 31, $t2 = MOD(($t6 + $t4 - 7 × $t5 + 114) \ 31) + 1

.text
	main:	addi $v0,$zero,5
		syscall
		add $t0,$zero,$v0
		
		addi $t9,$zero,19
		div $t0,$t9
		mfhi $t1
		
		addi $t9,$zero,100
		div $t0,$t9
		mflo $t2
		mfhi $t3
		
		addi $t9,$zero,4
		div $t2,$t9
		mflo $t4
		mfhi $t5
		
		addi $t9,$zero,25
		addi $t6,$t2,8
		div $t6,$t9
		mflo $t6
		
		addi $t9,$zero,3
		sub $t6,$t2,$t6
		addi $t6,$t6,1
		div $t6,$t9
		mflo $t6
		
		addi $t9,$zero,30
		mul $t7,$t1,19
		add $t7,$t7,$t2
		sub $t7,$t7,$t4
		sub $t7,$t7,$t6
		addi $t7,$t7,15
		div $t7,$t9
		mfhi $t6
		
		addi $t9,$zero,4
		div $t3,$t9
		mflo $t2
		mfhi $t3
		
		addi $t9,$zero,7
		mul $t4,$t5,2
		mul $t7,$t2,2
		addi $t4,$t4,32
		add $t4,$t4,$t7
		sub $t4,$t4,$t6
		sub $t4,$t4,$t3
		div $t4,$t9
		mfhi $t4
		
		addi $t9,$zero,451
		mul $t5,$t6,11
		mul $t7,$t4,22
		add $t5,$t5,$t1
		add $t5,$t5,$t7
		div $t5,$t9 
		mflo $t5
		
		addi $t9,$zero,31
		mul $t1,$t5,7
		sub $t1,$t4,$t1
		addi $t1,$t1,114
		add $t1,$t1,$t6
		div $t1,$t9
		mflo $t1
		mfhi $t2
		addi $t2,$t2,1
		
		addi $v0,$zero,1
		add $a0,$zero,$t2
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,48
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t1
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t0
		syscall
		
		#t0 = ano
		#t1 = mes
		#t2 = dia
		
		#t3 = dia do carnaval
		#t4 = mes do carnaval
		#$t5 = mes para caulculo
		#t8 =  var auxiliar
		#t9 = divisor
		
		
		addi $v0,$zero,11
		addi $a0,$zero,32
		syscall		
		
		addi $t3,$t2,-47
		addi $t9,$zero,2
		add $t4,$zero,$t1
		
		
for:		bge $t3,1,print1
		addi $t5,$t4,-1
		div $t5,$t9
		mfhi $t8
		slti $t8,$t8,1
		not $t8,$t8
		addi $t8,$t8,32
		
		
		bne $t5,2,if1
		j else1
		
if1:		blt $t3,-30,if2
		j else1
		
		
if2:		addi $t8,$t8,-2
	
else1:		add $t3,$t3,$t8
		addi $t4,$t4,-1
		j for

			
					
						
								
print1:		addi $v0,$zero,1
		add $a0,$zero,$t3
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,48
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t4
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t0
		syscall
		
		#t0 = ano
		#t1 = mes
		#t2 = dia
		
		#t3 = dia do carnaval
		#t4 = mes do carnaval
		#$t5 = mes para caulculo
		#t8 =  var auxiliar
		#t9 = divisor
		
		addi $t3,$t2,60
		add $t4,$zero,$t1
		
		addi $t9,$zero,2
for2:		div $t4,$t9
		mfhi $t8
		addi $t8,$t8,30
		bge $t3,$t8,sub1
		j print2
		
sub1:		sub $t3,$t3,$t8
		addi $t4,$t4,1
		j for2
		
print2: 	
		addi $v0,$zero,11
		addi $a0,$zero,32
		syscall	
		
		addi $v0,$zero,1
		add $a0,$zero,$t3
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,48
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t4
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,47
		syscall
		
		addi $v0,$zero,1
		add $a0,$zero,$t0
		syscall
		
		
		

		

		
		
		
		
		
		
		
		
