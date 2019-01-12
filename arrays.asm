# Philip L. GeLinas
# philip.gelinas@wsu.edu
# 11572868
# CptS260 Homework 4

.data
list: .word 11, 12, -10, 13, 9, 12, 14, 15, -20, 0
max_msg: .asciiz "The maximum is "
sum_msg: .asciiz "The summation is "
newline: .asciiz "\n"

.text
.globl main

main:
	jal findMax
	jal findSum
	li $v0, 10
	syscall				# end program

findMax:
	la $t0, list			# array location
	li $t1, 0			# array index
	lw $t2, 0($t0)
	loop:
		addi $t0, 4
		addi $t1, 1
		lw $t3 0($t0)
		blt $t2, $t3, newMax
		beq $t1, 9, exit	# check to see if done
		j loop
	newMax:
		add $t2, $t3, $0
		j loop
	exit:
		la $a0, max_msg		
		li $v0, 4		
		syscall			# print the max message
		add $a0, $t2, $0
		li $v0, 1
		syscall			# print the max value
		li $v0, 4
		la $a0, newline		
		syscall			# print a newline char

findSum:
	la $t0, list
	li $t1, 0
	lw $t2, 0($t0)
	iterate:
		addi $t0, 4
		addi $t1, 1
		lw $t3, 0($t0)
		add $t2, $t2, $t3
		beq $t1, 9, quit	# check to see if finished
		j iterate		
	quit:
		la $a0, sum_msg
		li $v0, 4
		syscall			# print the sum message
		add $a0, $t2, $0
		li $v0, 1
		syscall			# print the sum

# EOF
