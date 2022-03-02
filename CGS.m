function [Q,R] = CGS(A)
[n,k] = size(A);
Q = A;
V = zeros(n,k);
R = zeros(n);
for j = 1:k
    V(:,j)=A(:,j);
    for i=1:j-1
        R(i,j)=Q(:,i)'*A(:,j);
        V(:,j)=V(:,j)-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(V(:,j));
    Q(:,j)=V(:,j)/R(j,j);
end
end