function [Q,R] = QRrot(T)
    n = size(T);
    I = eye(n);
    for k= 1:n-1
        Rot = 1/sqrt(T(k,k)^2 + T(k+1,k)^2) * [T(k,k),T(k+1,k);-T(k+1,k),T(k,k)];
        T(k:k+1,1:end) = Rot * T(k:k+1,1:end);
        I(k:k+1,1:end) = Rot * I(k:k+1,1:end);
    end
    Q = I';
    R = T;
    