#Date: 11/18/2024
#Names: Lucia Maturino Iniguez and Roman Sailes
#File Handling in MIPS - Read Existing, Write New
# To do:
# 1) Read "gradedItems.txt" 
# 2) Copy "gradedItems.txt" 
# 3) Close "gradedItems.txt"
# 4) Output "gradedItems.txt"
# 5) Create new .txt file

.data
fileName: .asciiz "gradedItems.txt"
buffer: .space 300
message: .asciiz "Hello!"

.text
main: 
	#open file
	li $v0, 13
	la $a0, fileName
	li $a1, 0
	syscall
	move $s0, $v0
	
	#read file
	li $v0, 14
	move $a0, $s0
	la $a1, buffer
	la $a2, 300
	syscall
	
	#print file
	li $v0, 4
	la $a0, buffer
	syscall
	
	#close file
	li $v0, 16
	move $a0, $s0
	syscall
	
	#open file again to write
	li $v0, 13
	la $a0, fileName
	la $a1, 1
	syscall
	move $s1, $v0
	
	#write
	li $v0, 15
	move $a0, $s1
	la $a1, message
	la $a2, 6
	syscall
	
	#close file again
	li $v0, 16
	move $a0, $s1
	syscall
	
	#exit program
	li $v0, 10
	syscall
