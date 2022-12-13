#(03045858 % 11) 
#26+2 = 28 = N
#M = 28-10 = 18


.data
input: .space 11 
 

.text
.globl main 


main:


li $v0, 8 
la $a0, input 
li $a1, 1001 
syscall 


addi $s1, $zero, 32


addi $sp, $sp, -16 
sw $t0, 12($sp)#for suprogram a 
sw $t0, 4($sp) # for supprogram b


#unconditional jump to sub-program a

jal sub_a



sub_a:
	sw $ra, 8($sp)
	lw $t0, 12($sp)


loopa:
	lb $t1, ($t0)
	beq $t1, 10, exit_first 
	beq $t1, 0, exit_first 
	beq $t1, 44, exit_function
	beq $t1, 9, tab
	beq $t1, 32, tab


	#add intermediate 
	addi $t0, $t0, 1
	addi $t2, $t2, 1 
	j loopa

#separate spaces and tabs in program 

separateSP:
	lb $t1, ($t0)
	beq $t1, 10, exit_function 
	bet $t1, 0, exit_function 
	beq $t1, 44, exit_function 
	addi $t0, $t0, 1

	beq $t1, 9, separateSP
	beq $t1, 32, separateSP
	j loopa
	
	
	
tab:
	bge $t2, 1, separateSP
	addi $t3, $t3, 1
	addi $t0, $t0, 1 
	j loopa


exit_a:
	move $s3, $t0 #last legal input 
	lw $s2, 4($sp) 
	add $s2, $s2, $t3 
	




sub_b:
	lw $t0, 4($sp) 


loopb:
	lb $t1, ($t0)
	beq $t1, 44, end_comma
	beq $t1, 10, end_enter 
	beq #t1, 0, end_enter  
	addi $t0, $t0, 1 


#uses a counter that tells the program that the loop can end here if there is an enter 

end_enter:
	addi $s8, zero, 1

end_comma:
	beq $s2, $t0, lastStep 
	addi $t0, $t0, -1
	lb $t1, ($t0)
	bgt $t1, 47, num
	bgt $t1, 96, lowerCaseChar
	bgt $t1, 64, upperCaseChar 
	beq $s2, $t0, lastStep 
	j bug 

bug:  
	addi $s6, $zero, 1
	li $v0, 4 #prints character
	addi $t4, $zero, 63 
	sw $t4, 0($sp) 
	jr $ra 


lowerCaseChar:
	bgt $t1, 114, outOfBounds
	sub $t1, $t7, 87
	j base28


num:
	bgt $t1, 57, outOfBounds  
	sub $t1, $t1, 48
	j base28 

base28:
	beq $t5, $t, addsLoop
	multu $t1, $s1
	mflo $t1
	add $t1, $t7, $t5
	addi $t5, 1
	bne $t5, $t6, base28

addsLoop:
	sub $t5, $t5, $t25 
	add $t8, $t1, $t8
	addi $t6, 1 
	bgt $t6, $a4, bug 
	j end_comma 


lastStep:
	#if $t6 is 0 then we go to bug 

	beq $t6, 0, bug 
	li $v0, 1
	add $t4, $t8, $zero #what variable holds the result 
	sw $t4, 0($sp) #store word in register $t4 into 0
	jr $ra #jump back to the last unconditional jump 

	



exitfunction: 
	


