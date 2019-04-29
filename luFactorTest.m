clear
clc

A = magic(3);

%luFactor - this function determines the LU Factorization of a square
%   matrix 
%   [L, U, P] = luFactor(A)
%   By: Carissa Vos
%   Created on: 3/28/19
%   Last Editted on: 3/31/19
% Inputs
%   A - the coefficient matrix (must be a square matrix)
% Outputs
%   L - lower triangular matrix
%   U - upper triangular matrix 
%   P - pivot matrix

% Check for errors
% Determine the number of rows and columns of the input A, check for a
% square matrix
[M,N] = size(A);
if M ~= N
    error('Please input a SQUARE matrix');
end

% Presets
P = eye(N);

% Pivoting & Gauss Elimination
for i=1 : N-1
    [~,row] = max(abs(A(i:N,i)));
    row = row + i - 1;
    A([i row],:) = A([row i], :);
    P([i row], :) = P([row i], :);
    
    for j=i+1 : M
        elim_num = A(j,i)/A(i,i);
        A(j, :) = A(j,:) - (elim_num*A(i,:))
    end
    
end

%     A([i row_adj], :) = A([row_adj i], :); % pivot matrix A
%     P([i row_adj], :) = P([row_adj i], :); % pivot matrix P
%     L([i row_adj], :) = L([row_adj i], :); % pivot matrix L


