.global value_substitution
.include "macros.s"
.data
two: .double 2 
one: .double 1  

# Function find f(x) = x^4 + 2x^3 -x -1, where x is the value passed through the parameter (register) fa0
.text
value_substitution:
	
	fmul.d ft9 fa0 fa0 # get x^2
	
	fmul.d ft11 ft9 fa0 # get x^3 and store it in f11 register

	fmsub.d ft9 ft11 fa0 fa0 # get x^4 - x 
	
	fld ft10, two, t0 # save 2.0 in ft10  (coefficient)
	fmul.d ft11 ft11 ft10 # get result from 2x^3
	
	fld ft10, one, t0 # save 1.0 in ft10  (coefficient)
	fsub.d ft11 ft11 ft10

	fadd.d fa0 ft9 ft11 # get result from x^4 + 2x^3 - x - 1 and save it into fa0 register
	ret
