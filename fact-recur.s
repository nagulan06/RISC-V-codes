 .file	"factorial.s"
	.option nopic
	.text
	.align	2
	.globl	fact
	.type	fact, @function
fact:
	addi	sp,sp,-16
	sw	ra,8(sp)
	sw	a0,4(sp)
	addi	s0,sp,16
	li	a2,1
	li	a3,2
	beq	a0,a2,.one
	beq	a0,zero,.zero
	beq	a0,a3,.L2
	addi	a0,a0,-1
	call	fact
	lw	a1,4(sp)
	call	mult
.L2:
	lw	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	fact, .-fact
	.align	2
	.globl	mult
	.type	mult, @function
mult:
	addi	sp,sp,-16
	sw	ra,8(sp)
	li	a4,0
	li	a5,0
.loop:
	bge	a4,a1,.done
	add	a5,a5,a0
	addi	a4,a4,1
	j	.loop
.done:
	mv	a0,a5
	lw	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	fact, .-fact
	.align	2
	.globl	main
	.type	main, @function
.zero:
	li	a0,1
	jr	ra
.one:
	li	a0,1
	jr	ra
main:
	addi	sp,sp,-16
	sw	ra,8(sp)
	addi	s0,sp,16
	li	a5,5
	sw	a5,4(sp)
	lw	a0,4(sp)
	call	fact
	mv	a5,a0
	mv	a0,a5
	lw	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"