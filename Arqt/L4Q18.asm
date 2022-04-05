# Questão 18 - Triangulo de Floyd
# Entrada: $t0
# Saida $t1
# Usa: $t9 e $t8

.text
main:		addi $v0,$zero,5
		syscall
		add $t0,$zero,$v0
		
		addi $t1,$zero,1
		addi $t9,$zero,1
		
for1:		bgt $t9,$t0,end

		addi $t8,$zero,1
for2:		bgt $t8,$t9,efor1

		addi $v0,$zero,1
		add $a0,$zero,$t1
		syscall
		
		addi $v0,$zero,11
		addi $a0,$zero,32
		syscall
		
		addi $t1,$t1,1
		addi $t8,$t8,1
		j for2
		
efor1:		addi $v0,$zero,11
		addi $a0,$zero,10
		syscall

		addi $t9,$t9,1
		j for1
		
end:		addi $v0,$zero,10
		syscall	
