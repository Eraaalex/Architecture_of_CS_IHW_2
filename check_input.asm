.global check_size
.include "macros.s"

# check_size: checks the entered accurancy n to satisfy the condition 9 > n > 2
# if it is true subprogram return 0 else 1 in register a0
# Parameter a1 -- value (degree) for checking
check_size:
	
	li a0, 1   # Assumption that accurancy is correct, so a0 = 1
	
	li a2, 3     # Check if size < 3 a0 = 0
	blt a1, a2, incorrect_size_error
	
	li a2, 8   # Check if size > 8 a0 = 0
	blt a2, a1, incorrect_size_error
	
	end_check: 
	ret 	
	
	incorrect_size_error:
	li a0 0
	ret
	
