function D = eigenvalues(A, s)
T = TriDiag(A);
[n,n] = size(A);

U = [];
for i = 0:n-2
    C = T(1:end - i ,1:end - i);
    [B,S] = QRalg(C, s);
    T(1:end - i ,1:end - i) = B;
    U = [U,S];
end
D = T;
semilogy(U);