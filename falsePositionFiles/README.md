# False Position Files

## falsePosition.m 
This MATLAB function (falsePosition.m) will estimate the root of a function. 

### Inputs
- func: the function to be evaluated
- x_l: the lower guess for the root
- x_u: the upper guess for the root
- es: the desired relative error (default: 0.0001%)
- maxiter: the maximum number of iterations desired (default: 200)

### Outputs
- root: the estimated root location
- fx: the function evaluated at the root 
- ea: the approximate relative error 
- iter: how many iterations were preformed

### Limitations/Notes
- It is **necessary** to input at least func, x_l, and x_u (es and maxiter are not required)

## falsePositionTest.m
A MATLAB script written to test falsePosition.m.

## falsePositionTest1.m
An additional MATLAB script written to test falsePosition.m.
