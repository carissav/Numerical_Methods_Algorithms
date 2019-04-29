function [root, fx, ea, iter] = falsePosition(func,x_l,x_u,es,maxiter,varargin)
%falsePosition - this function estimates the root of a given function
%   within given bounds: 
%   [root, fx, ea, iter] = falsePosition(func, x_l, x_u, es, maxiter)
%   By: Carissa Vos
%   Created on: 2/28/19
%   Last Editted on: 3/3/19
% Inputs
%   func - the function of which to find a root, must be in
%          terms of x with "@(x)" directly in front of the function (ex:
%          input "@(x)x^2-x-1" for func)
%   x_l - the lower limit (x value) to bracket the left side of the root
%   x_u - the upper limit (x value) to bracket the right side of the root
%   es - the desired relative error (defaults to 0.0001%)
%   maxiter - the number of iterations desired (defaults to 200)
% Outputs
%   root - the root that was found within x_l and x_u
%   fx - the function evalutated at the root 
%   ea - approximate relative error (%)
%   iter - how many interations were preformed

% Presets
% if only 3 inputs
if nargin < 4
    es = 0.0001;
    maxiter = 200;
end

% if only 4 inputs
if nargin < 5
    maxiter = 200;
end

% Preset variables for later
old_root = 0;
ea = 100;
iter = 0;

% Defining the Function
syms f(x);
f(x) = func;

% Check for Errors
if nargin > 5 || nargin < 3 % less than 3 or more than 5 inputs
    error('Please input between 3 and 5 arguments into the function');
end
if x_u < x_l % x_u is smaller than x_l
    error('Make sure that the x_u is larger than x_l');
end
if f(x_l)*f(x_u) > 0 % sign does not change
    error('Make sure that x_l and x_u bound a root (i.e. f(x_l) and f(x_u) have different signs)');
end

% Finding the Root & Iterations: while the approximate rel error is less
% than the stopping criteria or the number of iterations is less than the
% max number of iterations
while ea > es && iter < maxiter
    % cacluate root (using false position equation)
    root = double(x_u - ([f(x_u)*(x_l-x_u)]/[f(x_l)-f(x_u)]));
    
    % determine which bound to change to calculated root
    if (f(root)) > 0 && (f(x_l)) > 0 % positive & same sign as f(x_l)
        x_l = root;
    elseif (f(root)) > 0 && (f(x_u)) > 0 % positive & same sign as f(x_u)
        x_u = root;
    elseif (f(root)) < 0 && (f(x_l)) < 0 % negative & same sign as f(x_l)
        x_l = root;
    else % negative & same sign as f(x_u)
        x_u = root;
    end
        
    % calculate the approximate rel error based on root and previous root calculation     
    ea = abs((root - old_root)/root)*100;
    
    % set old_root equal to root for next iteration of error calculations
    old_root = root;
        
    % count the number iterations
    iter = iter + 1;
end

% Function evaluated at the root
fx = double(f(root));

end

