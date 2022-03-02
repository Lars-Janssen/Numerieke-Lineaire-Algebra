function [Q,R] = House(A)
[m,n] = size(A);
M = [A eye(m)];
for i = 1:n
    e = [1; zeros(m-i,1)];
    kolom = M(i:end,i);
    u = kolom - norm(kolom) * e;
    if e' * kolom > 0
        u = kolom + norm(kolom) * e;
    end
    
    if norm(u) ~= 0
        u = u / norm(u);
    end
    
M(i:end, i:end) = M(i:end, i:end) - 2 * u * (u' * M(i:end, i:end));

    if M(i,i) < 0
        M(i:end,i:end) = -M(i:end,i:end);
    end
end

R = M(:,1:n);
Q = M(:,n+1:end)';
