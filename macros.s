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
	mv a1 %x  # Save the accurancy degree value to the a1 register for transmission to the function check_size
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


.macro equation(%x)
	fmv.d fa0 %x   # Save the value to the fa0 register for transmission to the function value_substitution
	jal value_substitution
.end_macro

.macro find_root(%x)
	fmv.d fa4 %x  # accurancy is in fa4 register for transmission as parameter
	jal find_solution
.end_macro


.macro pow_accurancy_macro(%x)
	mv a0 %x  # save degree value into a0 register for trasmission to the function as parameter
	jal pow_accurancy
.end_macro


