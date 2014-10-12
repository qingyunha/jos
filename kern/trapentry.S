/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>

#include <kern/picirq.h>


###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)						\
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */		\
	name:			/* function starts here */		\
	pushl $(num);							\
	jmp _alltraps

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
	.globl name;							\
	.type name, @function;						\
	.align 2;							\
	name:								\
	pushl $0;							\
	pushl $(num);							\
	jmp _alltraps

.text

/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */

TRAPHANDLER_NOEC(thdlr0, 0)
TRAPHANDLER_NOEC(thdlr1, 1)
TRAPHANDLER_NOEC(thdlr2, 2)
TRAPHANDLER_NOEC(thdlr3, 3)
TRAPHANDLER_NOEC(thdlr4, 4)
TRAPHANDLER_NOEC(thdlr5, 5)
TRAPHANDLER_NOEC(thdlr6, 6)
TRAPHANDLER_NOEC(thdlr7, 7)
TRAPHANDLER(thdlr8, 8)
TRAPHANDLER_NOEC(thdlr9, 9)
TRAPHANDLER(thdlr10, 10)
TRAPHANDLER(thdlr11, 11)
TRAPHANDLER(thdlr12, 12)
TRAPHANDLER(thdlr13, 13)
TRAPHANDLER(thdlr14, 14)
TRAPHANDLER_NOEC(thdlr15, 15)
TRAPHANDLER_NOEC(thdlr16, 16)
TRAPHANDLER(thdlr17, 17)
TRAPHANDLER_NOEC(thdlr18, 18)
TRAPHANDLER_NOEC(thdlr19, 19)
TRAPHANDLER_NOEC(thdlr20, 20)
TRAPHANDLER_NOEC(thdlr21, 21)
TRAPHANDLER_NOEC(thdlr22, 22)
TRAPHANDLER_NOEC(thdlr23, 23)
TRAPHANDLER_NOEC(thdlr24, 24)
TRAPHANDLER_NOEC(thdlr25, 25)
TRAPHANDLER_NOEC(thdlr26, 26)
TRAPHANDLER_NOEC(thdlr27, 27)
TRAPHANDLER_NOEC(thdlr28, 28)
TRAPHANDLER_NOEC(thdlr29, 29)
TRAPHANDLER_NOEC(thdlr30, 30)
TRAPHANDLER_NOEC(thdlr31, 31)
TRAPHANDLER_NOEC(thdlr32, 32)
/*
 * Lab 3: Your code here for _alltraps
 */

.globl _alltraps
_alltraps:
	pushl %ds
	pushl %es
	pushal

	movw $GD_KD, %ax
	movw %ax, %ds
	movw %ax, %es 

	pushl %esp  /* trap(%esp) */
	call trap






.data
.globl trap_handlers
trap_handlers:
	.long thdlr0
	.long thdlr1
	.long thdlr2
	.long thdlr3
	.long thdlr4
	.long thdlr5
	.long thdlr6
	.long thdlr7
	.long thdlr8
	.long thdlr9
	.long thdlr10
	.long thdlr11
	.long thdlr12
	.long thdlr13
	.long thdlr14
	.long thdlr15
	.long thdlr16
	.long thdlr17
	.long thdlr18
	.long thdlr19
	.long thdlr20
	.long thdlr21
	.long thdlr22
	.long thdlr23
	.long thdlr24
	.long thdlr25
	.long thdlr26
	.long thdlr27
	.long thdlr28
	.long thdlr29
	.long thdlr30
	.long thdlr31
	.long thdlr32
