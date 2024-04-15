#################################################################
#							     	                            #
#	Name: Andres Candido				     	                #
#	Class: CDA 3100					     	                    #
#	Assignment:5-Calculates the sum, mean, min, max and         #
#                    variance of a series of five numbers.  	#
#								                                #
#################################################################

	.data
MSG0:	.asciiz	"Author: Andres Candido\nTitle: Assignment #5\nDescription: This program will calculate the sum, mean, min, max and variance of a series of five numbers.\n\n"

MSG1:	.asciiz "Enter 5 integer numbers:\n"
MSG2:	.asciiz "Enter a number: "

MSG3:	.asciiz "Floating Point List:\n"

MSG4:	.asciiz "The Sum of the numbers is: "
MSG5:	.asciiz "The Smallest number is: "
MSG6:	.asciiz "The Largest number is: "
MSG7:	.asciiz "The Mean of the numbers is: "
MSG8:	.asciiz "The Variance of the numbers is: "

MSG9:	.asciiz "\n"
MSG10:	.asciiz "\n\n"

MSG11:	.asciiz "The program has ended... Goodbye!"

ARRAY:	.space 20
 

	.text
	.globl main
main:
	li	$v0,4			#Print MSG0 (introduction)
	la	$a0,MSG0		#Load address of string
	syscall				#Execute the print

	li	$v0,4			#Print MSG1
	la	$a0,MSG1		#Load address of string
	syscall				#Execute the print

#Input NUM1

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s0,$v0			#save the read integer
	move	$t0,$s0			#move number to $t0


#Input NUM2

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s1,$v0			#save the read integer
	move	$t1,$s1			#move number to $t1


#Input NUM3

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s2,$v0			#save the read integer
	move	$t2,$s2			#move number to $t2


#Input NUM4

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s3,$v0			#save the read integer
	move	$t3,$s3			#move number to $t3


#Input NUM5

	li	$v0,4			#Print MSG2
	la	$a0,MSG2		#Load address of string
	syscall				#Execute the print

	li	$v0,5			#Tell syscall to read an integer
	syscall				#read the integer
	move	$s4,$v0			#save the read integer
	move	$t4,$s4			#move number to $t4

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print


	j	MakeFloat		#Jump to MakeFloat


MakeFloat:

	li	$v0,4			#Print MSG3
	la	$a0,MSG3		#Load address of string
	syscall				#Execute the print

	li	$v0,4			#Print MSG9
	la	$a0,MSG9		#Load address of string
	syscall				#Execute the print

#NUM1
	mtc1	$s0,$f1			#Put number into floating point register
	cvt.s.w	$f1,$f1			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f1		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

#NUM2
	mtc1	$s1,$f2			#Put number into floating point register
	cvt.s.w	$f2,$f2			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f2		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

#NUM3
	mtc1	$s2,$f3			#Put number into floating point register
	cvt.s.w	$f3,$f3			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f3		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

#NUM4
	mtc1	$s3,$f4			#Put number into floating point register
	cvt.s.w	$f4,$f4			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f4		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

#NUM5
	mtc1	$s4,$f5			#Put number into floating point register
	cvt.s.w	$f5,$f5			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f5		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print


	j	Addition		#jump to Addition


Addition:

	li	$v0,4			#Print MSG4
	la	$a0,MSG4		#Load address of string
	syscall				#Execute the print

	add	$t5,$t0,$t1		#adds numbers
	add	$t5,$t5,$t2		#adds numbers
	add	$t5,$t5,$t3		#adds numbers
	add	$t5,$t5,$t4		#adds numbers
	mtc1	$t5,$f6			#Put number into floating point register
	cvt.s.w	$f6,$f6			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f6		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10 ( prints empty line )
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

	j	PutInArray		#Jump to PutInArray


PutInArray:

	li	$s5,0
	sw	$s0,ARRAY($s5)		# put num1 in array
	addi	$s5,$s5,4
	
	sw	$s1,ARRAY($s5)		# put num2 in array
	addi	$s5,$s5,4

	sw	$s2,ARRAY($s5)		# put num3 in array
	addi	$s5,$s5,4

	sw	$s3,ARRAY($s5)		# put num4 in array
	addi	$s5,$s5,4

	sw	$s4,ARRAY($s5)		# put num5 in array

	li	$s5,0			# reset array position
	lw	$s6,ARRAY($s5)		# use first element as max start point
	move	$t9,$s6			# use same element as min start point
	li	$s7,1			# loop counter

Maximum:

	beq	$s7,5,EndLoop		#Exit loop after 5 interations
	addi	$s5,$s5,4
	lw	$t8,ARRAY($s5)

	bge	$s6,$t8,NoChange	#if current max is bigger then no change
	move	$s6,$t8			# otherwise, update new max

NoChange:
	ble	$t9,$t8,Nexti		# if current min is less then no change
	move	$t9,$t8			# otherwise, update new min
Nexti:	
	addi	$s7,$s7,1		#increase loop counter by 1
	j	Maximum			#run loop again

EndLoop:

	li	$v0,4			#Print MSG5
	la	$a0,MSG5		#Load address of string
	syscall				#Execute the print

	mtc1	$t9,$f10		#Put number into floating point register
	cvt.s.w	$f10,$f10		# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f10		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print


	li	$v0,4			#Print MSG6
	la	$a0,MSG6		#Load address of string
	syscall				#Execute the print

	mtc1	$s6,$f9			#Put number into floating point register
	cvt.s.w	$f9,$f9			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f9		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print
	
	j		Mean		#jump to Mean


Mean:

	addi	$t6,$t6,5		#Make $t6 the number of inputs(5 in this case)
	div	$t5,$t6			#computes NUM2 / NUM3

 #quotient
	li	$v0,4			#Print MSG7
	la	$a0,MSG7		#Load address of string
	syscall				#Execute the print
	li	$v0,1			#tell syscall to print an integer
	mflo	$a0			#Move quotient into $a0 
	mtc1	$a0,$f7			#Put number into floating point register
	cvt.s.w	$f7,$f7			# convert int to floating point single
		
	li	$v0,2			#Print a float
	mov.s	$f12,$f7		#Put float in $f12
	syscall

	li	$v0,4			#Print MSG10 ( prints empty line )
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

	j	Variance		#Jump to Variance


Variance:

	li	$v0,4			#Print MSG8
	la	$a0,MSG8		#Load address of string
	syscall				#Execute the print

	sub.s	$f15,$f1,$f7		# num - mean
	sub.s	$f16,$f2,$f7		# num - mean
	sub.s	$f17,$f3,$f7		# num - mean
	sub.s	$f18,$f4,$f7		# num - mean
	sub.s	$f19,$f5,$f7		# num - mean

	mul.s	$f15,$f15,$f15		#get (num - mean)^2
	mul.s	$f16,$f16,$f16		#get (num - mean)^2
	mul.s	$f17,$f17,$f17		#get (num - mean)^2
	mul.s	$f18,$f18,$f18		#get (num - mean)^2
	mul.s	$f19,$f19,$f19		#get (num - mean)^2

	add.s	$f20,$f15,$f16		#adds (num - mean)^2
	add.s	$f20,$f20,$f17		#adds (num - mean)^2
	add.s	$f20,$f20,$f18		#adds (num - mean)^2
	add.s	$f20,$f20,$f19		#adds (num - mean)^2

	li.s	$f21,1.0		#makes $f21 = 1.0

	mtc1	$t6,$f22		#Put number into floating point register
	cvt.s.w	$f22,$f22		# convert int to floating point single

	sub.s	$f12,$f22,$f21		# 5.0 - 1.0

	div.s	$f23,$f20,$f12		#Divide to get variance

	li	$v0,2			#Print a float
	mov.s	$f12,$f23		#Put float in $f12
	syscall


	li	$v0,4			#Print MSG10
	la	$a0,MSG10		#Load address of string
	syscall				#Execute the print

	j	End			#Jump to Variance


End:
	li	$v0,4			#Print MSG11 (exit message)
	la	$a0,MSG11		#Load address of string
	syscall				#Execute the print
	jr	$ra			#Stop the program


