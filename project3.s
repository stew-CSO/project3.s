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



addsLoop:
	sub $t2, $t2, $t2 
	add $t9, $t7, $t9
	addi $t3, 1 
	bgt $t3, $s4, unrecognize 
	beq $s0, $t1, exitfunction 
	jr $ra 


exitfunction: 
	


