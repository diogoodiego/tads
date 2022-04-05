# Escreva uma função que gera um triângulo de altura e lados n e base 2 ? n ? 1.
# Entrada: $t0
# Usa: $t9, $t8, $t7. $t6,

.text
main:		addi $v0,$zero,5
		syscall
		add $t0,$zero,$v0
		
		add $t6,$zero,$t0
for1:		bge $t9,$t0,end


		li $t5,0
for2:		bgt $t5,$t6,efor2
		addi $v0,$zero,11
		addi $a0,$zero,32
		syscall	
		addi $t5,$t5,1
		j for2	
efor2:		addi $t6,$t6,-1


		li $t7,0
for3:		bgt $t7,$t8,efor3
		addi $v0,$zero,11
		addi $a0,$zero,42
		syscall	
		addi $t7,$t7,1
		j for3		
efor3:		addi $t8,$t8,2	
	
		addi $v0,$zero,11
		addi $a0,$zero,10
		syscall	
		addi $t9,$t9,1
		j for1
	
	
end:		addi $v0,$zero,10
		syscall
