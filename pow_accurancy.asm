.global pow_accurancy
.include "macros.s"
.data
one: .double 1  
ten:
    .double 10
.text

# Function get 1E-<degree>, where degree is parameter in a0 register
# first, 10^{degree} is calculated, then the resulting number is divided by 1
pow_accurancy:

	fld f2 one t0 # save start accurancy
	fld     f10, ten, t0  # here will be ε (accurancy)
	fmv.d   f0, f2        # decimal length degree
	# Get in fa0 1E-<degree>
	enext:
		    blez    a0, edone     # 10^(degree+1)
		    fmul.d  f0, f0, f10
		    addi    a0, a0, -1
		    j       enext
	edone:
	    	fdiv.d  f10, f2, f0   # ε (accurancy)
        ret 
	
