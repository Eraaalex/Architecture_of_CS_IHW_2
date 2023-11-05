.macro read_int_a0
   li a7, 5
   ecall
.end_macro

.macro print_int (%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro

.macro print_double (%x)
	li a7, 3
	fmv.d fa0, %x
	ecall
.end_macro

.macro check_size_(%x) 
	mv a1 %x  # Save the accurancy value to the a1 register for transmission to the function check_size
	jal check_size
.end_macro

.macro print_str(%x)
   .data
str:
   .asciz %x
   .text
   push (a0)
   li a7, 4
   la a0, str
   ecall
   pop	(a0)
   .end_macro

.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro

.macro push_double(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

.macro pop_double(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro


.macro equation(%x)
	fmv.d fa0 %x
	jal value_substitution
.end_macro

.macro find_root(%x)
	fmv.d fa4 %x
	jal find_solution
.end_macro


.macro pow_accurancy_macro(%x)
	mv a0 %x
	jal pow_accurancy
.end_macro


