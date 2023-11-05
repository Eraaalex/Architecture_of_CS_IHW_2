.global tests
.include "macros.s"
.data
n1: .double 1
half: .double 0.5
n2: .word 2
n3: .word 3 
n4: .word 4 
n5: .word 5 
n6: .word 6 
n7: .word 7 
n8: .word 8 
n9: .word 9  

.text
tests:
# test value_substitution subprogramm(as macro equation(%x)):
	print_str("F(x) = x^4 + 2x^3 -x -1; Expected result F(1) = 1.0\n")
	fld fa0 n1 t0
	equation(fa0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")
	
# test value_substitution subprogramm(as macro equation(%x)):
	print_str("F(x) = x^4 + 2x^3 -x -1; Expected result F(0.5) = -1.1875\n")
	fld fa0 half t0
	equation(fa0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")
	
# test pow_accurancy subprogramm:
	print_str("n = 4, Expected result: 1E-4 \n")
	lw a0 n4
	pow_accurancy_macro(a0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")

# test find_solution subprogramm(as macro find_root(%x)):
	print_str("Etalon: 0.8667603991738 \n")
	print_str("Expected result (match in the first 3): 0.866... \n")
	lw a0 n3
	pow_accurancy_macro(a0)
	find_root(fa0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")
	
# test find_solution subprogramm(as macro find_root(%x)):
	print_str("Etalon: 0.8667603991738 \n")
	print_str("Expected result (match in the first 4): 0.8667... \n")
	lw a0 n4
	pow_accurancy_macro(a0)
	find_root(fa0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")

# test find_solution subprogramm(as macro find_root(%x)):
	print_str("Etalon: 0.8667603991738 \n")
	print_str("Expected result (match in the first 8): 0.86676039... \n")
	lw a0 n8
	pow_accurancy_macro(a0)
	find_root(fa0)
	print_str("Result: ")
	print_double(fa0)
	print_str("\n-----------------\n")
	
	
# test check_input subprogramm:
	print_str("Test wrong input (more than 8) \n")
	print_str("Expected result: 0 \n")
	print_str("Result: ")
	lw a0 n9
	check_size_(a0)
	print_int(a0)
	print_str("\n-----------------\n")
	
	
# test check_input subprogramm:
	print_str("Test wrong input (less 3) \n")
	print_str("Expected result: 0 \n")
	print_str("Result: ")
	lw a0 n9
	check_size_(a0)
	print_int(a0)
	print_str("\n-----------------\n")

# test check_input subprogramm:
	print_str("Test correct input (6) \n")
	print_str("Expected result: 1 \n")
	print_str("Result: ")
	lw a0 n6
	check_size_(a0)
	print_int(a0)
	print_str("\n-----------------\n")
	
li a7 10
ecall
