function [L, U, P] = luFactor(A)
%% luFactor - this function determines the LU Factorization of a square
%   matrix using A as the input, and outputs L, U, and P, such that
%   ultimatley P*A = L*U. 
%   Note: there may be some instances where P*A == L*U returns some 0s (false) 
%   in the returned matrix, this is only due to round off errors. Examine
%   and compare P*A and L*U individually to ensure this. 
%   [L, U, P] = luFactor(A)
%   By: Carissa Vos
%   Created on: 3/28/19
%   Last Editted on: 4/2/19
% Inputs
%   A - the coefficient matrix (must be a square matrix)
% Outputs
%   L - lower triangular matrix
%   U - upper triangular matrix 
%   P - pivot matrix

%% Check for errors
% Note: it is unnecessary to check for the number of inputs or outputs because
% there is no varargin or varargout for this function

% Determine the number of rows and columns of the input A, check for a
% square matrix
[M,N] = size(A);
if M ~= N
    error('Please input a SQUARE matrix, with the same number of rows and columns');
end

%% Presets
% Preset pivot matrix (P) identity matrix (aka diagonal (left to right) ones)
P = eye(N);
% Preset lower triangular matrix to all zeros (temporary)
L = zeros(N);

%% Pivoting & Gauss Elimination
for i=1 : N-1 % for column(i)=1 to the total number of columns-1
    % Pivoting
    [~,row] = max(abs(A(i:N,i))); % finding what row the |max#| for each column
    row_adj = row + i - 1; % correcting for 'miscounting' of rows in line 32: look at the pivot element
    % Pivoting matrix A
    temp_A = A(row_adj, :); 
    A(row_adj, :) = A(i, :); 
    A(i, :) = temp_A;
    % Pivoting matrix P
    temp_P = P(row_adj, :); 
    P(row_adj, :) = P(i, :); 
    P(i, :) = temp_P;
    % Pivoting matrix L
    temp_L = L(row_adj, :); 
    L(row_adj, :) = L(i, :); 
    L(i, :) = temp_L;
    
    % Elimination
    for j=i+1 : M % for row(j)=column(i)+1 to the total number of rows
        elim_num = A(j,i)/A(i,i); % sets elim_num to the coeffient of elimination based on row & column
        A(j, :) = A(j,:) - (elim_num*A(i,:)); % eliminates numbers using elim_num
        L(j,i) = elim_num; % sets L at row, column to elim_num
    end
    
end

L = L + eye(N); % includes zeros/ones in L matrix
U = A; % sets U equal to final A

end
