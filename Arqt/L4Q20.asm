# Escreva uma função que receba n, linha e coluna de uma matriz quadrada e retorne o índice do vetor correspondente.
# Entrada :  n = $t0, linha = $t1, coluna $t2
# Saída: $t3 

.text
main:		addi $v0,$zero,5
		syscall
		add $t0, $zero, $v0
		
		addi $v0,$zero,5
		syscall
		add $t1, $zero, $v0
		
		addi $v0,$zero,5
		syscall
		add $t2, $zero, $v0
		
		mul $t3,$t0,$t1
		add $t3,$t3,$t2
		
		addi $v0,$zero,1
		add $a0,$zero,$t3
		syscall