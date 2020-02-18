	.file	"multiplication.c"
	.option nopic
	.text
	.align	2
	.globl	mul
	.type	mul, @function
mul:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	addi	s0,sp,16
	li	a3,0
	li	a2,0
	j	.loop
.loop:
	bge	a2,a4,.done
	add	a3,a3,a5
	addi	a2,a2,1
	mv	a0,a3
	j	.loop
.done:
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	mul, .-mul
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a4,8
	li	a5,7
	call	mul
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
