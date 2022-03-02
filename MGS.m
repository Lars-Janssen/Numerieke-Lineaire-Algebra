function [Q,R] = MGS(A)

[m, n] = size(A);

Q = A;
for i=1:n
    for j=1:i - 1
        R(j,i) =  Q(:,j)' * Q(:,i) ;
        Q(:,i) = Q(:,i) - Q(:,j)*(R(j,i)) ;
    end
    R(i,i) = norm(Q(:,i));
    Q(:,i) = Q(:,i) / R(i,i);
end