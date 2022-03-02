function [Tnew, tn] = QRalg(T, s)
[n,n] = size(T);
S = [];
shift = 0;

while abs(T(n,n-1)) > 10^(-12)
    if s == 1
        shift = T(n,n);
    end
    if s == 2
        LM = T(n-1:n,n-1:n);
        eigen = eig(LM);
        [value, index] = min(abs(eigen - T(n,n)));
        shift = eigen(index);
    end
    
    [Q,R] = QRrot(T - shift * eye(n));
    T = R*Q + shift * eye(n);
    
    T = T - triu(T) + tril(T)' - tril(T,-2)' - tril(T,-2);
    S = [S,abs(T(n,n-1))];
end
Tnew = T;
tn = S;