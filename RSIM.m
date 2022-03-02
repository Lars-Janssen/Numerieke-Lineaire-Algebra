function A = RSIM(s)
    D = diag(1:1:s);
    while true
        R = rand(s,s);
        if rank(R) == s
            O = orth(R);
            A = O' * D * O;
            A = A - triu(A) + tril(A)';
            break
        end
    end