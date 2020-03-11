# Name:   Kyle O'Dell
# Email:  ko1041449@swccd.edu
# ID:     1041449


#********************************************************
.data
intPrompt:	.asciiz "Enter a year between 1800 and 2199: "
fail:		.asciiz "Not a valid year. "
monday:		.asciiz "Doomsday for that year is: Monday (1)"
tuesday:	.asciiz "Doomsday for that year is: Tuesday (2)"
wednesday:	.asciiz "Doomsday for that year is: Wednesday (3)"
thursday:	.asciiz "Doomsday for that year is: Thursday (4)"
friday:		.asciiz "Doomsday for that year is: Friday (5)"
saturday:	.asciiz "Doomsday for that year is: Saturday (6)"
sunday:		.asciiz "Doomsday for that year is: Sunday (0)"
#********************************************************* end .data

# TODO: Modify registers to be conventional
#*******************************************************
.text
#-------------------------------------------------------
prompt:
	la	$a0, intPrompt   # stores string
	li	$v0, 4           # syscall command to display .asciiz
	syscall                  # displays .asciiz stored in $a0
	
	li	$v0, 5  # syscall command for read integer
	syscall		# reads input from user, stores in $v0
	
	# Immediately loading in values needed for calculations
	add	$a0, $v0, $zero
	li	$a1, 12
	li	$a2, 4
	li	$t5, 7
#-------------------------------------------------------
#--------------------------------------
# boolean logic to determine anchorday
	slti	$a3, $a0, 1800
	bne	$a3, $zero, failNote
	slti	$a3, $a0, 1900
	bne	$a3, $zero, fri
	slti	$a3, $a0, 2000
	bne	$a3, $zero, wed
	slti	$a3, $a0, 2100
	bne	$a3, $zero, tue
	slti	$a3, $a0, 2200
	bne	$a3, $zero, sun
#--------------------------------------
#--------------------------------------
failNote:	# Catches numbers out of range and jumps back to user prompt
	la	$a0, fail
	li	$v0, 4
	syscall
	j	prompt
#--------------------------------------
#--------------------------------------------------------
# Loads registers with anchor day of specific year
fri:	li	$a3, 5
	j	main
wed:	li	$a3, 3
	j	main
tue:	li	$a3, 2
	j	main
sun:	li	$a3, 0
	j	main
#--------------------------------------------------------
#--------------------------------------------------------
main:
# NOTE: FOLLOWING COMMENTS WILL USE 66 AS THE EXAMPLE
# Takes year and extracts last two digits ie: 1966 -> 66
	li	$t0, 100
	div	$a0, $t0
	mfhi	$a0

	div	$a0, $a1	# hi: 66 % 12  lo: 66 / 12
	mflo	$t0		# tmp0 = 66 / 12
	mfhi	$t1		# tmp1 = 66 % 12
	div	$t1, $a2	# hi: (66 % 12) % 4  lo: (66 % 12) / 4
	mflo	$t2		# tmp2 = (66 % 12) / 4

	add	$s1, $t0, $t1   # i = tmp0 + tmp1
	add	$s1, $s1, $t2   # i += tmp2

	div	$s1, $t5	# hi: i % 7  lo: i / 7
	mfhi	$s1		# i %= 7
	
	add	$s2, $s1, $a3	# j = i + anchorday
	div	$s2, $t5	# hi: j % 7  lo: j / 7
	mfhi	$s2		# j = j % 7 (should contain doomsday)
	
# Boolean logic to determine which string will be loaded for final display
	slti	$t0, $s2, 1
	bne	$t0, $zero, zero
	slti	$t0, $s2, 2
	bne	$t0, $zero, one
	slti	$t0, $s2, 3
	bne	$t0, $zero, two
	slti	$t0, $s2, 4
	bne	$t0, $zero, three
	slti	$t0, $s2, 5
	bne	$t0, $zero, four
	slti	$t0, $s2, 6
	bne	$t0, $zero, five
	slti	$t0, $s2, 7
	bne	$t0, $zero, six
	j	print
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
# Lables load the desired string to be displayed
zero:	la	$a0, sunday
	j	print
one:	la	$a0, monday
	j	print
two:	la	$a0, tuesday
	j	print
three:	la	$a0, wednesday
	j	print
four:	la	$a0, thursday
	j	print
five:	la	$a0, friday
	j	print
six:	la	$a0, saturday
	j	print
#--------------------------------------------------------------------------
print:
	li	$v0, 4
	syscall
#************************************************************************* end .text



