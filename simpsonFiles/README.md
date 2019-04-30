# Simpson.m
This MATLAB Function (Simpson.m) will integrate experimental data using Simpson's 1/3 rule. 

## Inputs
x: an array (NOT matrix) of the independent data from the experimental data

## Outputs
y: an array (NOT matrix) of the dependent data from the experimental data

## Limitations/Notes:
- x and y arrays **must** be the same length
- x array **must** be equally spaced
- if the experimental data has an odd number of intervals, the trapezoidal rule will be used on the last interval
