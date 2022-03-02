function L = cholesky(A)
[m,n] = size(A); 
B = A'*A;
L = zeros(size(B));
L(1,1) = sqrt(B(1,1));

for i = 2:n
    for j = 1:i
        sum = 0.0;
        for k =1:j
            sum = sum + L(i,k) * L(j,k);
        end
        
        if i == j
            L(i,j) = sqrt(B(i,i) - sum);
        else
            L(i,j) = (B(i,j) - sum) / (L(j,j)) ;
        end
    end
end
L;
