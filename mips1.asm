# nonLeaf.asm
# function branches off to another, clobbering $ra
.data

.text
	li $v0, 31
	li $a0, 100
	li $a2, 22
	li $a3, 44
	li $a1, 3000
	syscall

.globl main
main:

exit: