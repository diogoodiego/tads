# $t0 endereço de impressão 
# $t1 é salva a cor impressa
# $t2 posicao auxiliar
# $t3 posicao dinamica
# $t6 usado para verificação

# $t4 teclas
# $t5 indice das telcas
# $t7 verifica qual tecla foi pressionada
# $t8 verifica se alguma tecla foi pressionada
# $t9 endereço do teclado

# keys(0) tecla a
# keys(4) tecla w
# keys(8) tecla d
# keys(12) tecla z
.data
	generalDelay: .word 0 # delay geral
	plasmaDelay: .word 0 # delay para atirar
	snakeDelay: .word 0 # delay para atirar
	snakeSpeed: .word 4 # delay para atirar
	
	plasmaPosition: .word 0 # posição do tiro
	playerPosition: .word 113152 # posição do player
	snakePosition: .word 10240 # posição do player
	
	keys: 
		.align 2
		.space 16 # gardar caractere a
		
.text
main:
#### SAVING KEYS ###
	add $t4,$zero,'a'
	addi $t5,$zero,0
	sw $t4, keys($t5)
	
	add $t4,$zero,'w'
	addi $t5,$zero,4
	sw $t4, keys($t5)
	
	add $t4,$zero,'d'
	addi $t5,$zero,8
	sw $t4, keys($t5)
	
	add $t4,$zero,'z'
	addi $t5,$zero,12
	sw $t4, keys($t5)
	
### KEYBOARD ###
lui $t9, 0xffff # endereço do teclado
	
### GENERATE SCENARIO ###
scenario:
	lui $t0, 0x1001
	add $t0,$t0,21248
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,31428
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,31368
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,35976
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,36728
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,46228
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,46848
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,51316
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,52016
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,56832
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,56896
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,61632
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,66712
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,66944
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,67200
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,71936
	jal mush # CALL FUNCTION TO RENDER MUSHROOM
	
	lui $t0, 0x1001
	add $t0,$t0,72428
	jal mush # CALL FUNCTION TO RENDER MUSHROOM

### GENERATE SCENARIO ###

### GENERATE SCORE ###
	lui $t0, 0x1001
	add $t0,$t0,1536
	jal score # CALL FUNCTION TO RENDER SCORE
	
	lui $t0, 0x1001
	add $t0,$t0,1128
	jal life # CALL FUNCTION TO RENDER SCORE
### GENERATE SCORE ###

### MAIN LOOP ###
loop:			
	
	### GENERATE SNAKE ###
	lw $t3, snakePosition # GET SNAKE POSITION	
	
	lw $t2, snakeDelay # GET SNAKE DELAY
	bne $t2,3,snakeDontMove
	
		lui $t0, 0x1001
		add $t0,$t0,$t3
		jal snakeDelete # CALL FUNCTION TO RENDER SNAKE
		
		li $t2,0
		sw $t2,snakeDelay 
		addi $t6,$zero,1024
		div $t3, $t6
		mfhi $t6
		### MOVE DOWN ###
		bgt $t6,0, normalMove
			addi $t3,$t3,10240
		### MOVE DOWN ###
		normalMove:
		addi $t3,$t3,16
	
	snakeDontMove:
	lui $t0, 0x1001
	add $t0,$t0,$t3
	jal snake # CALL FUNCTION TO RENDER SNAKE	
	sw $t3, snakePosition 
	
	lw $t2,snakeDelay
	addi $t2,$t2,1
	sw $t2,snakeDelay
	
	### GENERATE SNAKE ###
	
	### GENERATE PLAYER ###
	lw $t3, playerPosition # GET PLAYER POSITION
	lui $t0, 0x1001
	add $t0,$t0,$t3
	jal player # CALL FUNCTION TO RENDER PLAYER
	
	### IF KEY HAS PRESSED ###
	lw $t8, 0($t9)
	beq $t8, $zero, naodig
		lw $t8, 4($t9)
		### GENERATE PLAYER ###
		lw $t3, playerPosition # GET PLAYER POSITION
		lui $t0, 0x1001
		add $t0,$t0,$t3
		jal playerDelete # CALL FUNCTION TO DELETE PLAYER
		
		addi $t5,$zero,0
		lw $t4, keys($t5)
		beq $t8,$t4,teclaA
		
		addi $t5,$zero,4
		lw $t4, keys($t5)
		beq $t8,$t4,teclaW
		
		addi $t5,$zero,8
		lw $t4, keys($t5)
		beq $t8,$t4,teclaD
		
		addi $t5,$zero,12
		lw $t4, keys($t5)
		beq $t8,$t4,endgame
		
		#tecla a pressionada
		teclaA:
			addi $t3, $t3, -32
			sw $t3,playerPosition
			j naodig
			
		#tecla a pressionada
		teclaW:
			lw $t3, plasmaPosition # GET PLASMA POSITON
			bgt $t3, 512, naodig
			lw $t2, playerPosition # GET PLAYER POSITION
			addi $t3,$t2,-6132
			sw $t3,plasmaPosition
						
			j naodig
			
		#tecla d pressionada
		teclaD:
			addi $t3, $t3, 32
			sw $t3,playerPosition
			j naodig
			
		### ENDGAME ###
		endgame:
			j end
	naodig: nop
	### IF KEY HAS PRESSED ###
	
	### PLASMA SHOOT ###
	lw $t3, plasmaPosition
	blt $t3, 512, plasmaDel
		lui $t0, 0x1001
		add $t0,$t0,$t3
		jal plasma
		
	plasmaDel:	
	### PLASMA DELAY ###
	li $v0, 32
	li $a0, 4
	syscall	
	### PLASMA DELAY ###
	blt $t3, 512, noplasma
		lw $t3, plasmaPosition
		lui $t0, 0x1001
		add $t0,$t0,$t3
		jal plasmaDelete
		
		addi $t3,$t3,-1024
		sw $t3, plasmaPosition
	noplasma:
	### PLASMA SHOOT ###
	
	
	### WINCONDITION ###
	lw $t2, snakePosition
	lw $t3, plasmaPosition
	addi $t3,$t3,20
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	### LINHA 2 ###
	lw $t2, snakePosition
	lw $t3, plasmaPosition
	addi $t2,$t2,1024
	
	addi $t3,$t3,20
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	### LINHA 3 ###
	lw $t2, snakePosition
	lw $t3, plasmaPosition
	addi $t2,$t2,2048
	
	addi $t3,$t3,20
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	### LINHA 4 ###
	lw $t2, snakePosition
	lw $t3, plasmaPosition
	addi $t2,$t2,3072
	
	addi $t3,$t3,20
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	addi $t3,$t3,-4
	beq $t2,$t3, win
	
	
	
	### LOSECONDITION ###
	lw $t2, snakePosition
	lw $t3, playerPosition
	
	addi $t2,$t2,-6144
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover
	
	addi $t2,$t2,1024
	beq $t2,$t3, gameover

### BACK TO TOP ###
endloop: j loop
	
### END PROGRAM ###
	j end

player:
	### LINE1 ###
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00ff0000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00ff0000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE2 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE3 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	### LINE4 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	### LINE5 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	### LINE6 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x002800FF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x002800FF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	### LINE7 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x002800FF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x002800FF
	sw $t1, 0($t0)
	
	### LINE8 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	### LINE9 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00E6E6E6
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	### LINE10 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00BFBFBF
	sw $t1, 0($t0)
	
	# RETURN
	jr $ra	
	
playerDelete:
	### LINE1 ###
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE2 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE3 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE4 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE5 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE6 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE7 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE8 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE9 ###
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINE10 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	# RETURN
	jr $ra	
	
plasma:
	#line 1
	add $t1,$zero, 0x00D43636 #red
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00D43636 #red
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1,$zero, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0xD43636 #red
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)

	#line 5
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x001F0A0A #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)

	#return
	jr $ra
	
plasmaDelete:
	#line 1
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)

	#line 5
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 #black
	sw $t1, 0($t0)

	#return
	jr $ra
	
snake:
	#line 1
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00D61108 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00D61108 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00D61108
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	#line 5
	addi $t0,$t0,1024
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00D61108 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x0006F504 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00D61108
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00D61108
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	
	
	#return
	jr $ra
	
snakeDelete:
	#line 1
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 5
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000 
	sw $t1, 0($t0)
	
	
	
	#return
	jr $ra

mush:
	#line 1
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	

	#line 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)	
	
	#line 4
	addi $t0,$t0,1024
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)	
	
	#line 5
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)

	#line 6
	addi $t0,$t0,1024
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1,$zero, 0x00000000
	sw $t1, 0($t0)
	
	#return
	jr $ra

score:
	### LINHA 1 ###
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	### LINHA 2 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 3 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 4 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 5 ###
	addi $t0,$t0,1024
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $zero, 0x00000000
	sw $t1, 0($t0)
		
	#return
	jr $ra
	
life:
	#linha 1
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	#linha 2
	addi $t0,$t0,1024
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	#linha 3
	addi $t0,$t0,1024
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	#linha 4
	addi $t0,$t0,1020
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	#linha 5
	addi $t0,$t0,1012
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	#linha 6
	addi $t0,$t0,1004
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ee0000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	#linha 7
	addi $t0,$t0,1004
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	#linha 8
	addi $t0,$t0,1012
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	#linha 8
	addi $t0,$t0,1016
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1,$zero, 0x00ffffff
	sw $t1, 0($t0)
	
	jr $ra	

win:
	### LINHA 1 ###
	lui $t0, 0x1001
	
	add $t0,$t0,61924
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 2 ###
	
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 3 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 4 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 5 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 6 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 7 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 8 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 9 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 10 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 11 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 12 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FF0000
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,-4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	### LINHA 13 ###
	add $t0,$t0,1024
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	
	add $t0,$t0,4
	add $t1,$zero, 0x00FFFFFF
	sw $t1, 0($t0)
	j end
	
gameover:
	lui $t0, 0x1001
	add $t1,$zero, 0x00FF0000
	### IMPRESSION ###
	for:
		bgt $t0, 268632064, end
		sw $t1, 0($t0)
		addi $t0,$t0, 4
		sw $t1, 0($t0)
		addi $t0,$t0, 4
	j for
	### IMPRESSION ###
	
	j gameover
	
end: 
addi $2, $0, 10
syscall
