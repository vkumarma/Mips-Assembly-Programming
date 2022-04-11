# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	lw $s0, Z # Z = 2
	lw $s1, i # i = 0
	addi $t0,$zero,20 # storing 20 in temporary register
	
	while:
		bgt $s1, $t0, endwhile # if i > 20
		addi $s0, $s0, 1 # Z++
		addi $s1, $s1, 2 # i += 2
		j while
		
	endwhile:
	
	addi $t1,$zero, 100 # storing 100 in temporary register.
	dowhile: bge $s0, $t1, endofdowhile # checking for exit condition
		 addi $s0, $s0, 1 # Z++
		 j dowhile
	
	endofdowhile: 
	 
	while2: ble $s1, $zero,end # exit statement. i <= 0
	       sub $s0, $s0, 1 # Z--
	       sub $s1, $s1, 1 # i--
	       j while2
	end:
		#storing values from registers to memory.
		sw $s0, Z 
		sw $s1, i
		
	
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
	Z:	.word 2
	i:	.word 0
	
