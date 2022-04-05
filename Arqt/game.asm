# $t0 endereço de impressão 
# $t1 é salva a cor impressa
# $t2 posição da impressão na tela
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

.data
	plasmaPosition: .word 512 # posição do tiro
	
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

addi $t2,$zero,51712 # posição inicial
lui $t9, 0xffff # endereço do teclado


lui $t0, 0x1001
addi $t0,$t0,5120
jal mush


loop:

	#player moviment
	lui $t0, 0x1001
	add $t0,$t0,$t2
	jal spaceship
	lw $t8, 0($t9)
	#if
	beq $t8, $zero, naodig
		lw $t8, 4($t9)
		lui $t0, 0x1001
		add $t0,$t0,$t2
		jal spaceshipDelete
		
		addi $t5,$zero,0
		lw $t4, keys($t5)
		beq $t8,$t4,teclaA
		
		addi $t5,$zero,4
		lw $t4, keys($t5)
		beq $t8,$t4,teclaW
		
		addi $t5,$zero,8
		lw $t4, keys($t5)
		beq $t8,$t4,teclaD
		
		
		#tecla d pressionada
		teclaD:
			addi $t2, $t2, 32
			j naodig
			
		#tecla d pressionada
		teclaA:
			addi $t2, $t2, -32
			j naodig
			
		#tecla S precionada
		teclaW:
			addi $t3,$t2,-2048 
			sw $t3, plasmaPosition
			j naodig
	#end if
	
	
	#jal plasmaDelete
	#if
	#blt $t3,2048,naodig
		#addi $t3,$t3,-1024
		#sw $t3, plasmaPosition
	#endif
	
naodig:

	### PLASMA MOVIMENT ###
	jal plasmaDelete
	lw $t3, plasmaPosition
	#if
	blt $t3, 512, plasmaLimit
		lui $t0, 0x1001
		add $t0,$t0,$t3
		jal plasma
		addi $t3,$t3,-1024
		sw $t3, plasmaPosition
		jal plasmaDelete
	#endif
	
plasmaLimit: jal plasmaDelete

endloop: j loop


j end

plasma:
	#line 1
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1, $t0, 0x00D43636 #red
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	
	#line 3
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)

	#line 5
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	
	#return
	jr $ra
	
plasmaDelete:
	#line 1
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)

	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	
	#line 3
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)

	#line 5
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000 #black
	sw $t1, 0($t0)
	
	
	#return
	jr $ra

spaceship:
	#line 1
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00ff0000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00ff0000 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xF0F0F0
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xF0F0F0
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xD43636
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1, $t0, 0xD43636
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xEEEEEE
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xEEEEEE
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636
	sw $t1, 0($t0)	
	
	#line 5
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x3636D4 #blue
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xE1E1E1
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xD43636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x3636D4
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9
	sw $t1, 0($t0)	
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0x3636E1 #blue
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xe13636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xe13636 #red
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x3636E1 #blue
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xE1E1E1 #light-gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)	
	
	#line 9
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	#line 10
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)	
	
	
	#return
	jr $ra

spaceshipDelete:
	#line 1
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 3
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 4
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black636
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)	
	
	#line 5
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 6
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)	
	
	#line 7
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 8
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)	
	
	#line 9
	addi $t0,$t0,1024
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	#line 10
	addi $t0,$t0,1024
	add $t1, $t0, 0xC9C9C9 #gray
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x000000 #black
	sw $t1, 0($t0)	
	
	
	#return
	jr $ra

mush:
	#line 1
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00C165B2
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	#line 2
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00B647A3
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	

	#line 3
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)	
	
	#line 4
	addi $t0,$t0,1024
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00980C7E
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)	
	
	#line 5
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)

	#line 6
	addi $t0,$t0,1024
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00A13990
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	addi $t0,$t0,-4
	add $t1, $t0, 0x00000000
	sw $t1, 0($t0)
	
	#return
	jr $ra


end: 
addi $2, $0, 10
syscall
