function Y = croutDecomposition(A, B)
[row, col] = size(A);
L(:, 1) = A(:, 1);
for c = 1: col
    U(1, c) = A(1, c)/L(1, 1);
    U(c, c) = 1;
end
for r = 2: row
    for c = 2: col
        temp = 0;
        if r >= c
            for i = 1: c-1
                temp = temp+ L(r, i)* U(i, c);
            end
            L(r, c) = A(r, c)- temp;
        else
            for i = 1: r-1
                temp = temp+ U(i, c)* L(r, i);
            end
            U(r, c) = (A(r, c)- temp)/L(r, r);
        end
    end
end
Z = L\B;
Y = U\Z;
end