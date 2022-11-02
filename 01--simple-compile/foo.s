;;; see https://sourceware.org/binutils/docs/as/Pseudo-Ops.html
;;; for details on the . directives and
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;; some docs here on the aarch64 instructions:
;;; https://wiki.cdot.senecacollege.ca/wiki/Aarch64_Register_and_Instruction_Quick_Start

;;; transpiled from (-O0 of)
;;; uint64_t foo(uint64_t a, uint64_t b) { return a + b; }
;;;
	.globl	_foo
	.p2align	2
_foo:
	.cfi_startproc
	sub	sp, sp, #16     ; grab some space on stack for spilling registers
	str	x0, [sp, #8]    ; save x0 (first arg) in to the stack (offset by 8)
	str	x1, [sp]        ; save x1 (second arg) into the stack
	ldr	x8, [sp, #8]    ; load x8 with the first arg
	ldr	x9, [sp]        ; load x9 with the second arg
	add	x0, x8, x9      ; insert the sum of x8 and x9 in to x0
	add	sp, sp, #16     ; put stack back to how it was
	ret                     ; return
	.cfi_endproc
