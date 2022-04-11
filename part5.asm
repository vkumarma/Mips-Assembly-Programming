# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	la $s0, string # &string[0]
	lw $s1, result # *result = NULL
	
	li $v0, 8 # take an input string
	la $a0, string # memory address of string input buffer
	li $a1,256
	syscall
	
	addi $t0, $zero,0 # i = 0 
	add $t1, $s0, $t0 #(string + i)
	
	lb $s2, 0($t1) # *(string + i)
	li $t2, 'e' # storing character 'e'
	
	
	while: beq $s2, $zero, endwhile # exit condition
	       beq $s2, $t2,label # string[i] == 'e'
	       addi $t0, $t0,1 # i++
	       add $t1, $s0, $t0 # (string + i)
	       lb $s2, 0($t1) # *(string + i)
	       j while
	
	label:
		move $s1, $t1 # result = &string[i]
		sw $s1, result # storing value from register to memory
		j endwhile
	
	endwhile:
		
	beq $s1, $zero, else # if result == NULL then exit or go to else statement.
		# printing first match at address
		li $v0, 4 
       	la $a0, str  
       	syscall 
       	
       	# printing the actual address.
       	li $v0, 1
       	move $a0, $s1 
        	syscall
        	
        	
        	# Print \n
		li $v0,4
		la $a0, newline
		syscall
       	
       	#The matching character is.
       	li $v0, 4 
       	la $a0, str1  
       	syscall
        	
        	#printing the actual character.
        	li $v0, 11        
       	lb $a0, ($s1)  
       	syscall
       	
       	#printing newline.
        	li $v0, 4 
       	la $a0, newline
       	syscall
       	
        	j end
        
        	
       else:
       	li $v0, 4        
       	la $a0, str2  
        	syscall 
        	 
	end:
	
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
	string:	.space 256 # 256 bytes
	result:	.word 0 # binary zero
	newline:   .asciiz	"\n"
	str:	.asciiz "First match at address "
	str1:	.asciiz "The matching character is "
	str2:	.asciiz "No match found\n"
