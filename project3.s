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
	



addsLoop:
	sub $t2, $t2, $t2 
	add $t9, $t7, $t9
	addi $t3, 1 
	bgt $t3, $s4, unrecognize 
	beq $s0, $t1, exitfunction 
	jr $ra 


exitfunction: 
	


