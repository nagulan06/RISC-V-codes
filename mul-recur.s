	.file	"multrecursion.c"
	.option nopic
	.text
	.align	2
	.globl	mul
	.type	mul, @function
mul:
	addi	sp,sp,-8
	sw	ra,4(sp)
	li	t0,1
	blt	a3,t0,.done
	add	a4,a4,a2
	addi	a3,a3,-1
	mv	a0,a4
	call	mul
.finish:
	jr	ra
.done:
	beq	a6,zero,.finish
	addi	sp,sp,8
	addi	a6,a6,-1
	lw	ra,4(sp)
	j	.done
	jr	ra
	.size	mul, .-mul
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-8
	sw	ra,4(sp)
	addi	s0,sp,8
	li	a2,4
	li	a3,6
	li	a4,0
	mv	a6,a3
	call	mul
	mv	a5,a0
	lw	ra,4(sp)
	addi	sp,sp,8
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
