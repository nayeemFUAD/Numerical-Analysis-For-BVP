function Y = finiteDifferenceMethod(f, I, D, h)
p =@(x) f(x, 1, 0, 0);
q =@(x) f(x, 0, 1, 0);
r =@(x) f(x, 0, 0, 1);
X = I(1): h: D(1);
n = length(X);
for i = 2: n-1
    A(i, i) = 2+(h.^2)*q(X(i));
    A(i, i+1) = -1+(h/2)*p(X(i));
    A(i, i-1) = -1-(h/2)*p(X(i));
    B(i) = -h.^2*r(X(i));
    if i == 2
        B(i) = B(i)- A(i, i-1)*I(2);
        A(i, i-1) = 0;
    elseif i == n-1
        B(i) = B(i)- A(i, i+1)*D(2);
        A(i, i+1) = 0;
    end    
end
A = A(2:n-1, 2: n-1);
B = B(2:10);
Z = croutDecomposition(A, B');
Y(1) = I(2);
Y(n) = D(2);
for i = 2: n-1
    Y(i) = Z(i-1);
end
end
% f =@(x, i, j, k) (-2/x)*i+ (2/x.^2)*j+ (sin(log(x))/x.^2)*k; 
% I = [1, 1];
% D = [2, 2];
% h = .1;
% finiteDifferenceMethod(f, I, D, h)