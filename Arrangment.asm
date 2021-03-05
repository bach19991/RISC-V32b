.globl main
	#value
	.eqv NUM1, 23
	.eqv NUM2, 48
	.eqv NUM3, 9
	.eqv NUM4, 17
	.eqv NUM5, 10
	.eqv NUM6, 11
	.eqv NUM7, 17
	.eqv NUM8, 35
	.eqv NUM9, 14
	.eqv NUM10, 23
	
	#Address
	.eqv ADDR10, 0
	.eqv ADDR9, 4
	.eqv ADDR8, 8
	.eqv ADDR7, 12
	.eqv ADDR6, 16
	.eqv ADDR5, 20
	.eqv ADDR4, 24
	.eqv ADDR3, 28
	.eqv ADDR2, 32
	.eqv ADDR1, 36

	#NewAddress
	.eqv NEW_ADDR10, 44
	.eqv NEW_ADDR9, 48
	.eqv NEW_ADDR8, 52
	.eqv NEW_ADDR7, 56
	.eqv NEW_ADDR6, 60
	.eqv NEW_ADDR5, 64
	.eqv NEW_ADDR4, 68
	.eqv NEW_ADDR3, 72
	.eqv NEW_ADDR2, 76
	.eqv NEW_ADDR1, 80
		
		#NewAddress
	.eqv ST_ADDR10, 200
	.eqv ST_ADDR9, 204
	.eqv ST_ADDR8, 208
	.eqv ST_ADDR7, 212
	.eqv ST_ADDR6, 216
	.eqv ST_ADDR5, 220
	.eqv ST_ADDR4, 224
	.eqv ST_ADDR3, 228
	.eqv ST_ADDR2, 232
	.eqv ST_ADDR1, 236
main:
#Assign Data to DMEM
        add gp, zero, zero
	li t0, NUM1
	sw t0, ADDR10(gp)
	li t0, NUM2
	sw t0, ADDR9(gp)
	li t0, NUM3
	sw t0, ADDR8(gp)
	li t0, NUM4
	sw t0, ADDR7(gp)
	li t0, NUM5
	sw t0, ADDR6(gp)
	li t0, NUM6
	sw t0, ADDR5(gp)
	li t0, NUM7
	sw t0, ADDR4(gp)
	li t0, NUM8
	sw t0, ADDR3(gp)
	li t0, NUM9
	sw t0, ADDR2(gp)
	li t0, NUM10
	sw t0, ADDR1(gp)
	
#Arrange
	#Initial
		li t0, 9
		li s0, 9
		
LOOP:
		li t5, 10
		li s1, ADDR10
		lw t1, ADDR10(gp)
		j PRE_STORE_
		
NEXT9:
		li t5, 9
		li s1, ADDR9
		lw t1, ADDR9(gp)
		j PRE_STORE_
		
NEXT8:
		li t5, 8
		li s1, ADDR8
		lw t1, ADDR8(gp)
		j PRE_STORE_
		
NEXT7:
		li t5, 7
		li s1, ADDR7
		lw t1, ADDR7(gp)
		j PRE_STORE_
		
NEXT6:
		li t5, 6
		li s1, ADDR6
		lw t1, ADDR6(gp)
		j PRE_STORE_
		
NEXT5:
		li t5, 5
		li s1, ADDR5
		lw t1, ADDR5(gp)
		j PRE_STORE_
		
NEXT4:
		li t5, 4
		li s1, ADDR4
		lw t1, ADDR4(gp)
		j PRE_STORE_

NEXT3:
		li t5, 3
		li s1, ADDR3
		lw t1, ADDR3(gp)
		j PRE_STORE_	
		
NEXT2:
		li t5, 2
		li s1, ADDR2
		lw t1, ADDR2(gp)
		j PRE_STORE_		

NEXT1:
		li t5, 1
		li s1, ADDR1
		lw t1, ADDR1(gp)
	
	#
	#	T2 registor. Store value.
	#
PRE_STORE_:
				bne t0, s0, SOSANH2
				slti t6, t5, 10
				bnez t6, SOSANH1
				mv t2, t1
				mv s2, s1
				j NEXT9
		SOSANH1:
				blt t1, t2, RETURN
				mv t2, t1
				mv s2, s1
				j RETURN
		SOSANH2:
				beqz s5, OTHERS
				blt t1, t4, ACCEPT
				bne t1, t4, RETURN				
				j SCAN_1
		ACCEPT:
				mv t2, t1
				mv s2, s1
				li s5, 0
				j RETURN
		OTHERS:
				blt t1, t4, ACCEPT2
				bne t1, t4, RETURN				
				j SCAN_1
		ACCEPT2:
				blt t1, t2, RETURN
				mv t2, t1
				mv s2, s1
		RETURN:
				slti t6, t5, 10
				beqz t6, NEXT9
				slti t6, t5, 9
				beqz t6, NEXT8
				slti t6, t5, 8
				beqz t6, NEXT7
				slti t6, t5, 7
				beqz t6, NEXT6
				slti t6, t5, 6
				beqz t6, NEXT5
				slti t6, t5, 5
				beqz t6, NEXT4
				slti t6, t5, 4
				beqz t6, NEXT3
				slti t6, t5, 3
				beqz t6, NEXT2
				slti t6, t5, 2
				beqz t6, NEXT1
				j STORE	
#######################################	
	#
	#Store the value following the rule
	#
STORE:
		#
		#Old value
		#
		mv t4, t2			# old value in array.
		
		slti t6, t0, 9
		bnez t6, NETX_2ND
		sw t2, NEW_ADDR1(gp)
		sw s2, ST_ADDR1(gp)
		j EXIT_STORAGE
NETX_2ND:
		slti t6, t0, 8
		bnez t6, NEXT_3RD
		sw t2, NEW_ADDR2(gp)
		sw s2, ST_ADDR2(gp)
		j EXIT_STORAGE
NEXT_3RD:
		slti t6, t0, 7
		bnez t6, NEXT_4TH
		sw t2, NEW_ADDR3(gp)
		sw s2, ST_ADDR3(gp)
		j EXIT_STORAGE
NEXT_4TH:
		slti t6, t0, 6
		bnez t6, NEXT_5TH
		sw t2, NEW_ADDR4(gp)
		sw s2, ST_ADDR4(gp)
		j EXIT_STORAGE
NEXT_5TH:
		slti t6, t0, 5
		bnez t6, NEXT_6TH
		sw t2, NEW_ADDR5(gp)
		sw s2, ST_ADDR5(gp)
		j EXIT_STORAGE
NEXT_6TH:
		slti t6, t0, 4
		bnez t6, NEXT_7TH
		sw t2, NEW_ADDR6(gp)
		sw s2, ST_ADDR6(gp)
		j EXIT_STORAGE
NEXT_7TH:
		slti t6, t0, 3
		bnez t6, NEXT_8TH
		sw t2, NEW_ADDR7(gp)
		sw s2, ST_ADDR7(gp)
		j EXIT_STORAGE
NEXT_8TH:
		slti t6, t0, 2
		bnez t6, NEXT_9TH
		sw t2, NEW_ADDR8(gp)
		sw s2, ST_ADDR8(gp)
		j EXIT_STORAGE
NEXT_9TH:
		slti t6, t0, 1
		bnez t6, NEXT_10TH
		sw t2, NEW_ADDR9(gp)
		sw s2, ST_ADDR9(gp)
		j EXIT_STORAGE
NEXT_10TH:
		sw t2, NEW_ADDR10(gp)
		sw s2, ST_ADDR10(gp)
EXIT_STORAGE:
		beqz t0, ENDTASK
		addi t0, t0, -1
		li s5, 1
		j LOOP
#######################################
SCAN_1:
		slti t6, t0, 8
		lw s4, ST_ADDR1(gp)
		bne s1, s4, SCAN_21
		j RETURN
SCAN_21:
				bnez t5, JUMP21
				beqz t6, ACCEPT2
				j NEXT21
		JUMP21:
				beqz t6, ACCEPT
		NEXT21:
				slti t6, t0, 7
				lw s4, ST_ADDR2(gp)
				bne s1, s4, SCAN_321
				j RETURN
SCAN_321:
				bnez t5, JUMP321
				beqz t6, ACCEPT2
				j NEXT321
		JUMP321:
				beqz t6, ACCEPT
		NEXT321:
				slti t6, t0, 6
				lw s4, ST_ADDR3(gp)
				bne s1, s4, SCAN_4321
				j RETURN
SCAN_4321:
				bnez t5, JUMP4321
				beqz t6, ACCEPT2
				j NEXT4321
		JUMP4321:
				beqz t6, ACCEPT
		NEXT4321:
				slti t6, t0, 5
				lw s4, ST_ADDR4(gp)
				bne s1, s4, SCAN_54321
				j RETURN
SCAN_54321:
				bnez t5, JUMP54321
				beqz t6, ACCEPT2				
				j NEXT54321
		JUMP54321:
				beqz t6, ACCEPT
		NEXT54321:
				slti t6, t0, 4
				lw s4, ST_ADDR5(gp)
				bne s1, s4, SCAN_654321
				j RETURN
SCAN_654321:
				bnez t5, JUMP654321
				beqz t6, ACCEPT2				
				j NEXT654321
		JUMP654321:
				beqz t6, ACCEPT
		NEXT654321:
				slti t6, t0, 3
				lw s4, ST_ADDR6(gp)
				bne s1, s4, SCAN_7654321
				j RETURN				
SCAN_7654321:
				bnez t5, JUMP7654321
				beqz t6, ACCEPT2				
				j NEXT7654321
		JUMP7654321:
				beqz t6, ACCEPT
		NEXT7654321:
				slti t6, t0, 2
				lw s4, ST_ADDR7(gp)
				bne s1, s4, SCAN_87654321
				j RETURN		
SCAN_87654321:
				bnez t5, JUMP87654321
				beqz t6, ACCEPT2				
				j NEXT87654321
		JUMP87654321:
				beqz t6, ACCEPT
		NEXT87654321:
				slti t6, t0, 1
				lw s4, ST_ADDR8(gp)
				bne s1, s4, SCAN_987654321
				j RETURN				
SCAN_987654321:
				bnez t5, JUMP987654321
				beqz t6, ACCEPT2				
				j NEXT987654321
		JUMP987654321:
				beqz t6, ACCEPT
		NEXT987654321:
				slti t6, t0, 0
				lw s4, ST_ADDR9(gp)
				bne s1, s4, SCAN_10987654321
				j RETURN
SCAN_10987654321:
				bnez t5, JUMP10987654321
		JUMP10987654321:
				beqz t6, ACCEPT							
#######################################
ENDTASK:
#######################################
######### FIBONANCI ###################
  	andi t0, t0, 0
  	andi t1, t0, 0
  	addi t1, t1, 1
  
  #Transmit value
  	lw	t3,44(zero)
  	addi    t3, t3, -1
  # fibonnaci program
fib:
  	beq t3, zero, finish_fi
  	add t2, t1, t0
  	mv t0, t1
  	mv t1, t2
  	addi t3, t3, -1
  	j fib
finish_fi:

  	# ends the program and store value
  	sw t2,88(zero)
#######################################
######### FACTORIAL ###################
	lw	a0, 44(zero)
	addi	a1,zero,1
	addi	a2,zero,1
	beq	a0,a1,SAVE_FAC
LOOP_FAC:
	addi	a1,a1,1
	addi	t1,a1,0
	addi	t2,a2,0
	jal	ra,MUL_FAC
	add	a2,zero,t0
	bne	a1,a0,LOOP_FAC
SAVE_FAC:
	sw	a2,92(zero)
	jal	x0,DONE_FAC
MUL_FAC:
	andi	t0,t0,0
LOOP_MUL_FAC:
	add	t0,t0,t2
	addi	t1,t1,-1
	bne	t1,zero,LOOP_MUL_FAC
	jalr	zero,ra,0
DONE_FAC:
	add	zero,zero,zero