function [N,R] = House2(A)
[m,n] = size(A);
N = zeros(m,n);

for i = 1:n
    e = [1; zeros(m-i,1)];
    kolom = A(i:end,i);
    u = kolom - norm(kolom) * e;
    
    if e' * kolom > 0
        u = kolom + norm(kolom) * e;
         if norm(u) ~= 0
            u = sqrt(2) * u / norm(u);
        end
    elseif e' * kolom == 0
        u = (kolom / norm(kolom)) - e;
    else 
        u = kolom - norm(kolom) * e;
        if norm(u) ~= 0
            u = sqrt(2) * u / norm(u);
        end
        
    end
    A(i:end, i:end) = A(i:end, i:end) - u * (u' * A(i:end, i:end));
    N(:,i) = [zeros(i-1,1);u]; 
    
    if A(i,i) < 0
        A(i:end,i:end) = -A(i:end,i:end);
    end
end

R = A;
