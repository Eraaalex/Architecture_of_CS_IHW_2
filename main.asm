.include "macros.s"
.global main

.text
main:	
	print_str("Enter the accuracy degree from 3 to 8: ")
	read_int_a0
	mv s0 a0                      # save accurancy degree into s0 register	
	check_size_(s0)               # macro containing checking accurancy degree function	
	beqz a0, incorrect_size_info  # if a0 = 0 accurancy is incorrect 	
	mv a0 s0
	pow_accurancy_macro(a0)       # a0 - parameter accurancy for function in the range from 3 8 ([0.001;0.00000001])
	
	# Function in macro returns the closest root in order to accurancy
	find_root(fa0)  # fa0 - parameter accurancy for function in the range from (0.001) to (0.00000001)
	print_str("Root of x^4 + 2x^3 -x -1 = 0 in [0,1]: ")
	print_double(fa0) 
	print_str("\n")
	b exit # program completion label


incorrect_size_info:                # Returns information about the wrong accurancy entered
	print_str("Incorrect input\n")
	b exit	
	
exit: 
	li s0 0     # Clear s0
	li a7 10    # Exit call
	ecall 	
	
			
							
	


		
	    
