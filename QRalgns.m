function Tnew = QRalgns(T)
[n,n] = size(T);

while abs(T(n,n-1)) > 10^(-12)
    
    [Q,R] = QRrot(T);
    T = R * Q;
    
    T = T - triu(T) + tril(T)' - tril(T,-2)' - tril(T,-2);
end
Tnew = T;