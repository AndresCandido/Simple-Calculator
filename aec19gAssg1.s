#################################################################
#							     	                            #
#	Name: Andres Candido				     	                #
#	Class: CDA 3100					     	                    #
#	Assignment:4-First Program in MIPS Assembly Language 	    #
#								                                #
#################################################################

	.data
MSG0:	.asciiz	"Author: Andres Candido\nTitle: Assignment #4\nDescription: This program will read in three numbers and work with sum, difference, product, division and shifting.\n\n"

MSG1:	.asciiz "Enter the first number: "
MSG2:	.asciiz "Enter the second number: "
MSG3:	.asciiz "Enter the third number: "

MSG4:	.asciiz "Sum: "
MSG5:	.asciiz "Difference: "
MSG6:	.asciiz "Product: "
MSG7:	.asciiz "Quotient: "
MSG8:	.asciiz "Remainder: "
MSG9:	.asciiz "NUM1 shifted left by 1: "
MSG10:	.asciiz "NUM2 shifted right by 1: "

MSG11:	.asciiz "The program has ended... Goodbye!"

MSG12:	.asciiz "\n*ERROR CODE SIGMA* The number is below 1. "

MSG13:	.asciiz "\n\n"

	.text
	.globl main
main:
	li	$v0,4			#Print MSG0 (introduction)
	la	$a0,MSG0		#Load address of string
	syscall				#Execute the print


#Input NUM1
	li	$v0,4			#Print MSG1
	la	$a0,MSG1		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s0,$v0			#save the read integer
	move	$t0,$s0			#move number to $t0
	blt	$t0,1,Error		#Jump to Error if input<1

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

#Input NUM2
	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s1,$v0			#save the read integer
	move	$t1,$s1			#move number to $t1
	blt	$t1,1,Error		#Jump to Error if input<1

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

#Input NUM3
	li	$v0,4			#Print MSG3
	la	$a0,MSG3		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s2,$v0			#save the read integer
	move	$t2,$s2			#move number to $t2
	blt	$t2,1,Error		#Jump to Error if input<1

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print
	
	j	Addition		#Jump to Addition

Addition:

	li	$v0,4			#Print MSG4
	la	$a0,MSG4		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	add	$t3,$t0,$t1		#adds NUM1 and NUM2
	add	$a0,$t3,$t2		#adds (NUM1+NUM2) and NUM3
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	Subtraction		#Jump to Subtraction

Subtraction:

	li	$v0,4			#Print MSG5
	la	$a0,MSG5		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	sub	$a0,$t0,$t1		#computes NUM1 - NUM2
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	Multiplication		#Jump to Multiplication

Multiplication:

	li	$v0,4			#Print MSG6
	la	$a0,MSG6		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	mul	$t3,$t0,$t1		#computes NUM1 * NUM2
	mul	$a0,$t3,$t2		#computes (NUM1*NUM2) * NUM3
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	Division		#Jump to Division

Division:

	div	$t1,$t2			#computes NUM2 / NUM3

 #quotient
	li	$v0,4			#Print MSG7
	la	$a0,MSG7		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	mflo	$a0			#Move quotient into $a0 
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

 #remainder
	li	$v0,4			#Print MSG8
	la	$a0,MSG8		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	mfhi	$a0			#Move remainder into $a0 
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	ShiftLeft		#Jump to ShiftLeft 

ShiftLeft:

	li	$v0,4			#Print MSG9
	la	$a0,MSG9		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	sll	$a0,$t0,1		#Shift NUM1 by 1 bit to the left
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	ShiftRight		#Jump to ShiftRight

ShiftRight:

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	srl	$a0,$t1,1		#Shift NUM2 by 1 bit to the left
	syscall				#Print the integer

	li	$v0,4			#Print MSG13 ( prints empty line )
	la	$a0,MSG13		#Load address of string
	syscall				#Execute the print

	j	End			#Jump to End (stop the program)



Error:
	li	$v0,4			#Print MSG12 (error message)
	la	$a0,MSG12		#Load address of string
	syscall				#Execute the print
	
	j	End			#Jump to End (stop the program)

End:
	li	$v0,4			#Print MSG11 (exit message)
	la	$a0,MSG11		#Load address of string
	syscall				#Execute the print
	jr	$ra			#Stop the program