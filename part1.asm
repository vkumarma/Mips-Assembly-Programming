# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	addi $t0,$zero,15 # A = 15
	addi $t1,$zero,10 # B = 10
	addi $t2,$zero,7 # C = 7
	addi $t3,$zero,2 # D = 2
	addi $t4,$zero,18 # E = 18
	addi $t5,$zero,-3 # F = -3
	
	add $t6,$t0,$t1 #(A+B)
	sub $t7,$t2,$t3 #(C-D)
	add $t8,$t4,$t5 #(E+F)
	sub $t9,$t0,$t2 #(A-C)
	
	add $s0,$t6,$t7 #(A+B) + (C-D)
	sub $s1,$t8,$t9 #(E+F) - (A-C)
	
	add $s2,$s0,$s1 # Z = (A+B) + (C-D) + (E+F) - (A-C);
	sw $s2,Z
	
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
	Z:	.word 0
