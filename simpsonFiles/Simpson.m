function [I] = Simpson(x, y, varargin)
% Simpson - this function will integrate experimental data numerically 
% using Simpson's 1/3 rule. If there are an odd number of intervals the
% trapezoidal rule will be used on the last interval. The function
% numerically evaluates the integral of the vector function values 'y' 
% with respect to 'x'.
%
%   [I] = Simpson(x, y)
%   By: Carissa Vos
%   Created on: 4/14/19
%   Last Editted on: 4/18/19
%
% Inputs
%   x - x array of data 
%   y - y array of data (y data corresponds to x data)
%
% Outputs
%   I - numerically evaluted solution for the intergral

%% Presets

trap_rule = 0; % initially sets trap_rule to 0 
% (i.e. don't use trap rule unless determined necesary later)

I = 0; % initally sets integral equal to 0

% Size of each input
[M_X, N_X] = size(x);
[M_Y, N_Y] = size(y);


%% Check for Errors/Warnings

% Check to make sure there are 2 inputs 
if nargin ~= 2 
    error('Please input 2 agruments into the function: x and y');
end

% Check to make sure inputs are arrays (not matrices)
if M_X > 1 || M_Y > 1
    error('Please input arrays (not matrices) for X and Y');
end

% Check if inputs are same length
if length(x) ~= length(y)
    error('Please make sure that your inputs (x and y) are the SAME length. I.E. if x = 1, 3, 5 and y = 1, 3 an error will occur.')
end

% Check if x input is equally spaced
x_diff = diff(x); % spacing between each interval of x array
diff_diff = diff(x_diff); % spacing between each interval of x_diff array

for i = 1:(length(x)-2)
    if diff_diff(i) > 1500*eps(1) && diff_diff(i) ~= 0
            error('Please make sure your intervals are all equally spaced');
    end
end

% Check if trapezoidal rule will be applied (if x input has an odd number of intervals)
if mod(length(x), 2) == 0 % if mod == 0, the number inputs for x is even, aka x has an odd # of intervals
    trap_rule = 1;
    fprintf("\n Warning: The trapezoidal rule will be applied to the last interval \n")
end

%% Simpson's Rule - Numerical Integral Calculation

% calculate the "inner" parts of Simpson's 1/3 rule that are *4
for i = 2:2:(length(x)-1)
    I = I + 4*y(i);
end

% calculate the "inner" parts of Simpson's 1/3 rule that are *2
for i = 3:2:(length(x)-2)
    I = I + 2*y(i);
end

% multiply the total by the x_diff and 1/3 to gain final I value
I = (1/3)*(x_diff(1))*I;

% if trap rule needs to be applied to the last interval
if trap_rule == 1
    I = I + (x_diff(1))*(1/2)*(y(length(x)) + y(length(x)-1));
    if length(x) > 2
        I = I + (1/3)*x_diff(1)*(y(1) + y(length(y)-1)); % calculate the "outer" parts of Simpson 1/3 rule, BUT account for trap rule
    end
else % calculate the "outer" parts of Simpson 1/3 rule
    I = I + (1/3)*x_diff(1)*(y(1) + y(length(y)));
end

end
