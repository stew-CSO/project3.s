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


addsLoop:
	sub $t2, $t2, $t2 
	add $t9, $t7, $t9
	addi $t3, 1 
	bgt $t3, $s4, unrecognize 
	beq $s0, $t1, exitfunction 
	jr $ra 


exitfunction: 
	li $v0


