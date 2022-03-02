function T = TriDiag(A)
    [n,n] = size(A);
    for k=1:n-2
        x = A(k+1:n,k);
        e = [1;zeros(length(x)-1,1)];
        v = sign(x(1)) * norm(x) * e + x;
        v = v/ norm(v);
        A(k+1:n,k:n) = A(k+1:n,k:n) - 2 * v * (v'*A(k+1:n,k:n));
        A(1:n,k+1:n) = A(1:n ,k+1:n) - 2* (A(1:n,k+1:n) * v) * v';
    end
    T = A - triu(A) + tril(A)' - tril(A,-2)' - tril(A,-2);
end