function X = BPM(A,Q,p,k)
for j=1:p
    W = A * Q;
    [Q,R] = qr(W,0);
    X(:,j) = Q(:,k);
end