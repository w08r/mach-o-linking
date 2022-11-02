	.globl	_foo
	.p2align	2
_foo:
	.cfi_startproc
	sub	sp, sp, #16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x9, [sp]
	add	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
