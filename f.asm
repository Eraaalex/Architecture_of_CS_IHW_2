.global find_solution
.include "macros.s"

.data
zero_: .double 0
one: .double 1 
two: .double 2 
newline: .asciz "\n"  

.text
# Function find solution count f(middle), f(right), f(left) (where f(x) = x^4 + 2x^3 -x -1; and middle = left + right). 
# Start value for left (left bound) 0, Start value for right (right bound) 1.
#  if f(middle)*f(left) >= 0 then we discard the left segment([0; 0.5]) and consider only the right segment ([0.5, 1]), 
# where is the root of the equation. 
# Then the halves are discarded in the same way, changing the value of the left or right border depending on the condition 
# (f(middle)*f(left) >= 0) to middle

# Parameter: f14 (fa4) -- accurancy (from 0.001 to 0.000000001)
# fa0 -- return close value

# f4 -- left border
# f5 -- middle 
# f6 -- right border
# ft8 -- count close value (f(middle)) 

find_solution:
	mv s1 ra              # saving the return register
	fld f4, zero_, t0     # left border
        fld f6, one, t0       # right border 
        
  loop:
    
    fadd.d  f5, f4, f6    # middle = left_border+ right_border
    fld ft10 two t0
    fdiv.d  f5, f5, ft10    # middle = middle / 2 
    
    equation(f5) # get value f(middle) by function value_substitution, which describes in
    fmv.d ft8 fa0 # save  value f(middle) into f8 register
    
    equation(f4) # get value f(left)
    fmv.d f2 fa0  # save value f(left)
     
    equation(f6) # get value f(right)
    fmv.d f3 fa0  # save value f(right)
     
    fmul.d ft1 ft8 f2 # ft1 = f(middle)* f(left)
    fld ft0, zero_, t0

    flt.d  t0 ft1 ft0
    beqz   t0, if_left_half  # if f(middle)*f(left) >=0
    
    if_right_half:  # right = middle 
    	fmv.d f6 f5
    	j check_accurancy
    if_left_half:  # left = middle 
        fmv.d f4 f5 
        
    check_accurancy:        
        fsub.d f1 f6 f4
        flt.d   t0, f1, f14   # f(middle) < ε (accurancy)
    	beqz    t0, loop

    fadd.d  f5, f4, f6    # middle = left_bound + right_bound
    fld ft10 two t0
    fdiv.d  f5, f5, ft10    # middle = middle / 2 

    fmv.d fa0 f5
    mv ra s1
    li s1 0  # Clear s1
ret
