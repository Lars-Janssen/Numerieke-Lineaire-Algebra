function [N,R] = House2Em(A)
[m,n] = size(A);

A = [A, eye(m)];
for i = 1:n
    e = [1; zeros(m-i,1)];
    kolom = A(i:end,i);
    
    if e' * kolom > 0
        u = kolom + norm(kolom) * e;
         if norm(u) ~= 0
            u = sqrt(2) * u / norm(u);
         else
        
        end
    elseif e' * kolom == 0
        u = (kolom / norm(kolom)) - e;
    else 
        u = kolom - norm(kolom) * e;
        if norm(u) ~= 0
            u = sqrt(2) * u / norm(u);
        end
    end
   
    
    A(i:end, i:end) = A(i:end, i:end) -  u * (u' * A(i:end, i:end));
end

R = A(:,1:n);
N = A(:,n+1:end)';