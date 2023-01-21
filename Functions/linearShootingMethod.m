function Y = linearShootingMethod(func, x_initial, x_final, y_final, increment)
U = heunsFormula(func, x_initial, 1, 0, increment, x_final, 1);
V = heunsFormula(func, x_initial, 0, 1, increment, x_final, 0);
for i = 1 : length(U)
    Y(i) = shootingMethod(i, U, V, y_final);
end
    function y = shootingMethod(n, U, V, b)
        y = U(n) + ((b-U(length(U)))/V(length(V))) * V(n);
    end
end
% f=@(x, y, z, k) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k);
% y(1)=1, y(2)=2
% h=.2