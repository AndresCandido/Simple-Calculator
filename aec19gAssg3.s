#################################################################
#							     	                            #
#	Name: Andres Candido				     	                #
#	Class: CDA 3100					     	                    #
#	Assignment:6 - Read 2 matrices and calculate 		        #
#		       their product.				                    #
#                    					  	                    #
#								                                #
#################################################################


	.data
MSG0:	.asciiz	"Author: Andres Candido\nTitle: Assignment #6\nDescription: This program will read 2 matrices from the user and calculate their product.\n\n"

MSG1:	.asciiz "Please enter the size of the matrix 2-6:\n"
MSG2:	.asciiz "Enter in the matrix one number at a time:\n" 

MSG3:	.asciiz	"Print matrix A:\n"
MSG4:	.asciiz	"Print matrix B:\n"
MSG5:	.asciiz	"Print matrix C: (The result of A*B)\n"

MSG6:	.asciiz "\n"
MSG7:	.asciiz "\n\n"
MSG8:	.asciiz " "

MSG9:	.asciiz "Error: invalid input, try again.\n\n"

MSG10:	.asciiz "The program has ended... Goodbye!"

A:	.space	144
B:	.space	144
C:	.space	144

	.text
	.globl main

main:
	li	$v0,4			#Print MSG0 (introduction)
	la	$a0,MSG0		#Load address of string
	syscall				#Execute the print


#Input matrix size
InputSize:

	li	$v0,4			#Print MSG1
	la	$a0,MSG1		#Load address of string
	syscall				#Execute the print


	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s0,$v0			#save the read integer
	move	$t0,$s0			#move number to $t0	

	mul	$s1,$t0,$t0		#mult size*size to get number of elements

	beq	$s0,2,SetCounters	#if correct input, Jump to SetCounters
	beq	$s0,3,SetCounters	#if correct input, Jump to SetCounters
	beq	$s0,4,SetCounters	#if correct input, Jump to SetCounters
	beq	$s0,5,SetCounters	#if correct input, Jump to SetCounters
	beq	$s0,6,SetCounters	#if correct input, Jump to SetCounters

	j	Error			#if incorrect input, Jump to Error


SetCounters:

	li	$s2,0			#Set $s2 as loop counter 
	li	$s3,0			#Set $s3 as matrix index 

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	j	MatrixA_Input		# Jump to MatrixA_Input


MatrixA_Input:

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$t0,$v0			#save the read integer
	sw	$t0,A($s3)		#store number in matrix

	addi	$s2,$s2,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrix index by 4

	beq	$s1,$s2,SetCounters2	#if loop counter == number of elements, Jump to SetCounters2

	j	MatrixA_Input		# Jump to MatrixA_Input (next iteration of loop)


SetCounters2:

	li	$s2,0			#Reset $s2 as loop counter 
	li	$s3,0			#Reset $s3 as matrix index
	li	$s4,0			#Set $s4 as elements per row counter 

	li	$v0,4			#Print MSG3
	la	$a0,MSG3		#Load address of string
	syscall				#Execute the print

	j	MatrixA_Print		# Jump to MatrixA_Print


MatrixA_Print:

	li	$v0,1			#tell syscall to print an integer
	lw	$t0,A($s3)		#load number to $t0
	move	$a0,$t0			#move number to $a0
	syscall				#Print the integer

	li	$v0,4			#Print MSG8 ( prints space )
	la	$a0,MSG8		#Load address of string
	syscall				#Execute the print

	addi	$s2,$s2,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrix index by 4
	addi	$s4,$s4,1		#increase elements per row counter by 1

	beq	$s0,$s4,MatrixA_NextRow	#if elements in row == matrix size, Jump to Next_Row
	j	MatrixA_Print		#if elements in row != matrix size, Jump MatrixA_Print


MatrixA_NextRow:

	li	$v0,4			#Print MSG6 ( prints new line )
	la	$a0,MSG6		#Load address of string
	syscall				#Execute the print

	li	$s4,0			#Reset $s4 as elements per row counter 

	beq	$s2,$s1,SetCounters3	#if loop counter == number of elements, Jump to SetCounters3
	j	MatrixA_Print		#if loop counter != number of elements, Jump MatrixA_Print


SetCounters3:

	li	$s2,0			#Set $s2 as loop counter 
	li	$s3,0			#Set $s3 as matrix index 

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	j	MatrixB_Input		# Jump to MatrixB_Input


MatrixB_Input:


	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$t0,$v0			#save the read integer
	sw	$t0,B($s3)		#store number in matrix

	addi	$s2,$s2,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrix index by 4

	beq	$s1,$s2,SetCounters4	#if loop counter == number of elements, Jump to SetCounters4

	j	MatrixB_Input		# Jump to MatrixB_Input (next iteration of loop)


SetCounters4:

	li	$s2,0			#Reset $s2 as loop counter 
	li	$s3,0			#Reset $s3 as matrix index
	li	$s4,0			#Set $s4 as elements per row counter 

	li	$v0,4			#Print MSG4
	la	$a0,MSG4		#Load address of string
	syscall				#Execute the print

	j	MatrixB_Print		# Jump to MatrixB_Print


MatrixB_Print:

	li	$v0,1			#tell syscall to print an integer
	lw	$t0,B($s3)		#load number to $t0
	move	$a0,$t0			#move number to $a0
	syscall				#Print the integer

	li	$v0,4			#Print MSG8 ( prints space )
	la	$a0,MSG8		#Load address of string
	syscall				#Execute the print

	addi	$s2,$s2,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrix index by 4
	addi	$s4,$s4,1		#increase elements per row counter by 1

	beq	$s0,$s4,MatrixB_NextRow	#if elements in row == matrix size, Jump to Next_Row
	j	MatrixB_Print		#if elements in row != matrix size, Jump MatrixB_Print

MatrixB_NextRow:

	li	$v0,4			#Print MSG6 ( prints new line )
	la	$a0,MSG6		#Load address of string
	syscall				#Execute the print

	li	$s4,0			#Reset $s4 as elements per row counter 

	beq	$s2,$s1,SetCounters5	#if loop counter == number of elements, Jump to SetCounters5
	j	MatrixB_Print		#if loop counter != number of elements, Jump MatrixB_Print



SetCounters5:

	li	$s2,4
	mul	$t4,$s0,$s2		#make $t4 4*size, to move down a column of elements

	li	$t0,0			#$t0 will store the sum element in C 

	li	$s2,0			#Reset $s2 as element counter 
	li	$s3,0			#Set $s3 as matrixA index
	li	$s4,0			#Set $s4 as matrixB index 
	li	$s5,0			#Set $s5 as matrixC index
	li	$s6,0			#Set $s6 as loop counter 
	li	$s7,0			#Set $s7 as column counter 
	li	$t7,0			#Set $t7 as row counter 
	li	$t6,0			#Set $t6 as current row

	j	MatrixC_Compute		# Jump to MatrixC_Compute


MatrixC_Compute:

	lw	$t1,A($s3)		#load number to $t1
	lw	$t2,B($s4)		#load number to $t2

	mul	$t3,$t1,$t2		#multiply element in A by element in B
	add	$t0,$t0,$t3		#sum the products of (A's row)*(B's column) 

	addi	$s6,$s6,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrixA index by 4
	add	$s4,$s4,$t4		#increase matrixB index by 4*size (move down colummn)

	beq	$s7,$s0,NextRowA_ResetColumnB	#if column counter == matrix size, do next row
	beq	$s6,$s0,ResetRowA_NextColumnB	#if loop counter == matrix size, do next column

	j	MatrixC_Compute		#Jump to MatrixC_Compute, next loop iteration


ResetRowA_NextColumnB:

	sw	$t0,C($s5)		#store number in matrixC
	addi	$s5,$s5,4		#increase matrixC index by 4

	li	$t0,0			#Reset $t0, will store the next element in C
	li	$s6,0			#Reset $s6 as loop counter 
 
	addi	$s7,$s7,1		#increase column counter by 1

	li	$s4,4			#Reset matrixB index to 4
	mul	$s4,$s4,$s7		#Move column, make initial matrixB by 4*(column counter) 

	move	$s3,$t6			#Reset $s3 as matrixA index to first element in row


	j	MatrixC_Compute			#jump back to MatrixC_Compute loop


NextRowA_ResetColumnB:

	beq	$t7,$s0,SetCounters6	#if row counter == size, exit loop


	li	$t0,0			#Reset $t0, will store the next element in C
	li	$s6,0			#Reset $s6 as loop counter
	li	$s7,0			#Reset column counter 
 
	addi	$t7,$t7,1		#increase row counter by 1

	add	$t6,$t6,$t4		#make current row = 1st element of row under itself
	move	$s3,$t6			#Reset $s3 as matrixA index to first element in new row

	li	$s4,0			#Reset $s4 as matrixB index


	j	MatrixC_Compute		#jump back to MatrixC_Compute loop


SetCounters6:

	li	$s2,0			#Reset $s2 as loop counter 
	li	$s3,0			#Reset $s3 as matrix index
	li	$s4,0			#Set $s4 as elements per row counter 

	li	$v0,4			#Print MSG5
	la	$a0,MSG5		#Load address of string
	syscall				#Execute the print

	j	MatrixC_Print		# Jump to MatrixB_Print


MatrixC_Print:

	li	$v0,1			#tell syscall to print an integer
	lw	$t0,C($s3)		#load number to $t0
	move	$a0,$t0			#move number to $a0
	syscall				#Print the integer

	li	$v0,4			#Print MSG8 ( prints space )
	la	$a0,MSG8		#Load address of string
	syscall				#Execute the print

	addi	$s2,$s2,1		#increase loop counter by 1
	addi	$s3,$s3,4		#increase matrix index by 4
	addi	$s4,$s4,1		#increase elements per row counter by 1

	beq	$s0,$s4,MatrixC_NextRow	#if elements in row == matrix size, Jump to Next_Row
	j	MatrixC_Print		#if elements in row != matrix size, Jump MatrixC_Print

MatrixC_NextRow:

	li	$v0,4			#Print MSG6 ( prints new line )
	la	$a0,MSG6		#Load address of string
	syscall				#Execute the print

	li	$s4,0			#Reset $s4 as elements per row counter 

	beq	$s2,$s1,End		#if loop counter == number of elements, Jump to End
	j	MatrixC_Print		#if loop counter != number of elements, Jump MatrixC_Print



Error:
	li	$v0,4			#Print MSG9 (error message)
	la	$a0,MSG9		#Load address of string
	syscall				#Execute the print
	
	j	InputSize		#Jump to InputSize until correct input 

End:
	li	$v0,4			#Print MSG10 (exit message)
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print
	jr	$ra			#Stop the program

