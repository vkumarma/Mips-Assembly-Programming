# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:	
	la $s0, A # s0 = &A[0]
	la $s1, B # s1 = &B[0]
	addi $s2, $zero, 0 # i = 0
	addi $t0, $zero, 5 # for the loop 
	
	for: bge $s2, $t0, endfor # exit condition
	     add $t1, $s2, $s2 # 2 * i
	     add $t1, $t1, $t1 # 4 * i or 4 bytes * i
	     add $s3, $s0, $t1 # (A + i)
	     add $s4, $s1, $t1 # (B + i)
	     lw $t2, 0($s4) # *(B + i)
	     addi $t3, $t2, 12 # temp = B[i] + C 
	     sw $t3, 0($s3) # A[i] = temp
	     addi $s2, $s2, 1 # i++
	     j for
	
	endfor: 
	sub $s2, $s2, 1 # i--
		
	while: blt $s2, $zero, endwhile # exit condition
	       add $t4, $s2, $s2 # 2 * i
	       add $t4, $t4, $t4 # 4 * i or 4 bytes * i
	       add $s5, $s0, $t4 # (A + i)
	       lw $t5, 0($s5) # *(A + i)
	       add $s6, $t5, $t5 # A[i] * 2
	       sw $s6, 0($s5) # A[i] = A[i] * 2
	       sub $s2, $s2, 1 # i--
	       j while

	endwhile:
	
	       
	       
	
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
	A:	.space 20 # 5 * 4(size of an integer in bytes)
	B:	.word 1, 2, 3, 4, 5
