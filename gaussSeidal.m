clear all
clc
n = 3;
f =@(x, y) 0;
h = 1;
D = eye(n-1);
U = diag(ones(1, n-2), 1);
L = diag(ones(1, n-2), -1);
M = -4*D+ U+ L;
M1 = kron(D, M);
M2 = kron(U, D);
M3 = kron(L, D);
M = M1+ M2+ M3;
for r = 1: length(M)
    for c = 1: length(M)
        if r > c
            L(r, c) = -M(r, c);
        elseif r < c
            U(r, c) = -M(r, c);
        else
            D(r, c) = M(r, c);
        end
    end
end
U(r, :) = 0;
L(:, c) = 0;
for r = 1: n-1
    for c = 1: n-1
        C(r, c) = h.^2*f(h*r, h*c);
    end
end
C = C(:);
% boundary(1: (n-1).^2, 1) = 0;
b_x = [0; 0; 1; 1];
b_y = [0; 0; 0; 0];
d = (C- (b_x+b_y));
J = inv(D-L)*U;
K = inv(D-L)*d;
sol(1: (n-1).^2) = 0;
sol = sol(:);
N = 5;
for i = 1: N
    temp = J*sol + K;
    sol = temp;
end
sol