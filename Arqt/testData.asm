.data	
	keys: 
		.align 2
		.space 16 # gardar caractere a

.text
main:
gameover:
	lui $t0, 0x1001
	add $t1,$zero, 0x00FF0000
	### IMPRESSION ###
	for:
		bgt $t0, 268632064, end
		sw $t1, 0($t0)
		addi $t0,$t0, 4
	j for
	### IMPRESSION ###
	
	j gameover
	
end: 
### FINAL DELAY ###
li $v0, 32
li $a0, 1000
syscall	
### FINAL DELAY ###
addi $2, $0, 10
syscall

