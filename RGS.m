function [Q,R] = RGS(A)
n = size(A);
Q = A;
R = zeros(n);
for i = 1:n
    R(i,i) = norm(Q(:,i));
    Q(:,i) = Q(:,i)/R(i,i);
    for j= i+1:n
        R(i,j) = Q(:,i)'*A(:,j);
        Q(:,j) = Q(:,j) - R(i,j) * Q(:,i);
    end
end
end

