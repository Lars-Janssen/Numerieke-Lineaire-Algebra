m = 99;
n = 14;
t = [0:m]'/m;
A = [];

for j=0:n
    A = [A t.^j];
end

b = exp(sin(4*t));
z = 2006.787453080206;
b = b/z;

[Q,R] = House(A);

x = R\(Q'*b);
x(15) - 1
plot(t,b);