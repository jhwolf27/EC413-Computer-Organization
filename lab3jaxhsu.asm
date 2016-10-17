############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello Jackson! \n "  # declare a zero terminated string
AnInt:	.word	17		# a word initialized to 17
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10,0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
NewLine:.asciiz " \n "
 
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
    la		$a0,Hello		# address of string to print
    li		$v0,4			# syscall code for print_str
    syscall         		# print the string
#
# Code for Item 3 -- 
# Print the integer value of AnInt
#
	lw		$a0, AnInt		# load word
	li		$v0, 1			# syscall code for print_int
	syscall					# print the string

#NEWLINE MAKE IT CLEAN
	la		$a0,NewLine
	li		$v0,4
	syscall
	
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#

	lw 		$s0, InLenB		# Constant to mark end of loop
	li 		$s1, 0			# counter for loop
	la 		$s2, Input1		# pointer to Input1 address
Loop:
	bge 	$s1, $s0, Finish	# Check condition for loop end 
	lb 		$a0, 0($s2)		# Get value from pointer
	li 		$v0, 1			# syscall code for print_int
	syscall
	la 		$a0, space		# Load space into the argument
	li 		$v0, 4			# syscall code for print_str
	syscall
	addi 	$s1, $s1, 1		# incrementing the counter
	addi 	$s2, $s2, 1		# Incrementing the address 1 byte
	j 		Loop			# repeat loop
Finish:	

#NEWLINE GIVE YOURSELF EYE RELIEF
	la		$a0,NewLine
	li		$v0,4
	syscall
	
#	
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#
	li  	$s3, 0			# counter for loop
	lw		$s2, InLenW		# constant to mark number of words in Input2
	la 		$s4, Input2		# load pointer to input2
	la 		$s5, Copy		# load pointer to copy
Loop1:
	bge 	$s3, $s2, End 	# check condition to end loop 
	lw 		$t0, 0($s4)		# load s4(input2) into t0
	sw 		$t0, 0($s5)		# storing t0 into s5(copy)
	addi	$s3, $s3, 1		# increment loop counter
	addi	$s4, $s4, 4		# increment input2 address by 4
	addi 	$s5, $s5, 4 	# increment copy address by 4
	j 		Loop1			# repeat loop
End:
	
#PRINT TEST TO SEE RESULTS
	li		$t6, 4
	la		$t5, Copy
Print_Out3:
	lw		$a0, ($t5)
	li		$v0, 1
	syscall
	la		$a0, space
	li		$v0, 4
	syscall
	add		$t5, 4
	add		$t6, -1
	bgtz	$t6, Print_Out3
	
	
#Clean new line
	la		$a0,NewLine
	li		$v0,4
	syscall
	
#
# Code for Item 6 -- 
# Print the integer average of the contents of array Input2
#

	la		$s3, Input2 	# load address of Input2
	lw		$s1, InLenW		# constant to mark loop
	li	 	$s2, 1			# counter for loop
	lw		$t2, 0($s4)		# holds the sum
	lw		$t1, InLenW		# constant for divider
Loop2:
	bge 	$s2, $s1, End1	# check condition for loop end
	addi 	$s3, $s3, 4		# increment input2 address by 4
	lw 		$t0, 0($s3)		# load input2 to t0
	add 	$t2, $t2, $t0	# add t0(input2) to sum(t2)
	addi 	$s2, $s2, 1		# Increment counter
	j 		Loop2
End1:
	div 	$t2, $t1		# divide sum by divider constant to get average
	mflo 	$a0				# load the result into argument
	li 		$v0, 1			# syscall code for print_int
	syscall	

#NEWLINE CLEAN UP
	la		$a0,NewLine
	li		$v0,4
	syscall

	
#
# Code for Item 7 -- 
# Display the first 25 integers that are divisible by either 11 and 17 (with spaces)
#

	li 		$s2, 0			# load initial value for 11 loop
	li 		$s5, 0			# load initial value for 17 loop
	li 		$s3, 0			# counter for loop
	li 		$s4, 24			# constant for number of integers allowed
	li 		$a0, 0			# load first number 0 into argument
	li 		$v0, 1			# syscall code for print_int
	syscall					# print out first number 0
	la 		$a0, space		# load space 
	li 		$v0, 4			# syscall code for print_str
	syscall					# print space
	li 		$s6, 0			# next number for 17 loop
	li 		$s7, 0			# next number for 11 loop
eleveninc:
	addi 	$s2, $s2, 11 	# increment by 11
	addi 	$a0, $s2, 0		# load multiple of 11 into argument
	li 		$v0, 1			# syscall code for print_int
	syscall					# print next mult of 11
	la		$a0, space		# print space code
	li		$v0, 4
	syscall
	addi 	$s7, $s2, 11	# calculate next mult of 11 
	addi 	$s3, $s3, 1		# increment loop counter
	bge 	$s3, $s4, End2	# check condition for loop end
	bgt 	$s6, $s7 eleveninc	# check condition for reloop, if next 17-mult > next 11-mult, reloop 11-mult
seventeeninc:
	addi 	$s5, $s5, 17 	# increment by 17
	addi 	$a0, $s5, 0		# load multiple of 17 into argument
	li 		$v0, 1			# syscall code for print_int
	syscall					# print next mult of 17
	la		$a0, space		# print space code
	li		$v0, 4
	syscall
	addi 	$s3, $s3, 1		# increment loop counter
	addi 	$s6, $s5, 17 	# calculate next mult of 17
	bge 	$s3, $s4, End2	# check condition for loop end
	j eleveninc				# if not end jump back to eleveninc
End2:

#NEWLINE CLEAN
	la		$a0,NewLine
	li		$v0,4
	syscall
		
#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 5 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#

	li 		$s2, 0			# load initial value for 11 loop
	li 		$s5, 0			# load initial value for 17 loop
	li 		$s3, 0			# counter for loop
	li 		$s4, 24			# constant for number of integers allowed
	li 		$a0, 0			# load first number 0 into argument
	li 		$v0, 1			# syscall code for print_int
	syscall					# print out first number 0
	la 		$a0, space		# load space 
	li 		$v0, 4			# syscall code for print_str
	syscall					# print space
	li 		$s6, 0			# next number for 17 loop
	li 		$s7, 0			# next number for 11 loop
	li 		$s1, 1			# seperate counter for new line
	li 		$s0, 5			# constant for number of words per line
eleveninc1:
	addi 	$s2, $s2, 11 	# increment by 11
	addi 	$a0, $s2, 0		# load multiple of 11 into argument
	li $v0, 1				# syscall code for print_int
	syscall					# print next mult of 11
	la		$a0, space		# print space code
	li		$v0, 4
	syscall
	addi 	$s7, $s2, 11	# calculate next mult of 11 
	addi 	$s3, $s3, 1		# increment loop counter
	addi 	$s1, $s1, 1		# increment new line counter
	bge 	$s1, $s0, fifthline	 	# check condition for new line
return:	
	bge 	$s3, $s4, End3	# check condition for loop end
	bgt 	$s6, $s7 eleveninc1		# check condition for reloop, if next 17-mult > next 11-mult, reloop 11-mult
seventeeninc1:
	addi 	$s5, $s5, 17 	# increment by 17
	addi 	$a0, $s5, 0		# load multiple of 17 into argument
	li 		$v0, 1			# syscall code for print_int
	syscall					# print next mult of 17
	la		$a0, space		# print space code
	li		$v0, 4
	syscall
	addi 	$s3, $s3, 1		# increment loop counter
	addi 	$s6, $s5, 17 	# calculate next mult of 17
	addi 	$s1, $s1, 1		# increment new line counter 
	bge 	$s1, $s0, fifthline2	# check condition for new line
return2:	
	bge 	$s3, $s4, End3	# check condition for loop end
	j 		eleveninc1		# if not end jump back to eleveninc
fifthline:
	la		$a0,NewLine		# code to print new line
	li		$v0,4
	syscall
	li		$s1, 0			# reset new line counter 
	j 		return			# jump back to loop
fifthline2:
	la		$a0,NewLine		# code to print new line
	li		$v0,4
	syscall
	li		$s1, 0			# reset new line counter
	j 		return2			# jump back to loop 
End3:


