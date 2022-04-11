# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	# loading values from memory to registers.
	lw $s0, A # A = 10 
	lw $s1, B # B = 15
	lw $s2, C # C = 6
	
	bgt $s0,$s1,label1 # if A > B
	addi $t0, $zero,5 # to store temporary value 5.
	blt $s2, $t0,label1 # if C < 5

	bgt $s0,$s1,label # if A > B and label 
	label0: 
	
	addi $s3,$zero,3 # else Z = 3
	j label4
	
	label:	addi $t2,$s2,1 # C + 1 
		addi $t1, $zero,7 # to store temporary value 7.
		beq $t2, $t1,label2 # if (C+1) == 7
		j label0
	
	label1: addi $s3,$zero,1 # Z = 1
	j label4
	
	label2: addi $s3,$zero,2 # Z = 2
	j label4
	
	label4: addi $t3,$zero, 1 # for case 1
		addi $t4,$zero, 2 # for case 2
		
		beq $s3, $t3, label5 # if Z == 1
		beq $s3, $t4, label6 # if Z == 2
		addi $s4, $zero, 0 # if Z == 3 or default statement executed.
		j end
		
	label5:addi $s4, $zero, -1 # setting Z = -1
	j end
	
	label6:addi $s4, $zero, -2 # setting Z = -2
	j end
	
	end: 	
		sw $s0, A # storing values from registers to memory.
		sw $s1, B
		sw $s2, C
		sw $s4 ,Z
		
	
	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"

	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit

	# All memory structures are placed after the
	# .data assembler directive
	.data

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
	#For example:
	#value:	.word 12
	A:	.word 10
	B:	.word 15
	C:	.word 6
	Z:	.word 0
