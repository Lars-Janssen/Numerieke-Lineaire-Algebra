function [Q,R] = CHQR(A)

R = Cholesky(A)';
Q = A * inv(R);