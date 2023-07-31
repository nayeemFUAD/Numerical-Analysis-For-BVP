% Adams Bashforth Moulton 3-Step Method For Solving First Order
% Differential Equation
% Multi Step Method
function YC = adamsBashforthMoulton3(func, initialValues, desiredPoint, increment)
X = initialValues(1): increment: desiredPoint;
Y = RK4(func, initialValues, desiredPoint, increment);     %Can Use Other Single Step Method
YP = Y; YC = Y;
for i = 4 : size(X, 2)
    YP(i) = abPredictor(i, func, X, YC, increment);
    YC(i) = amCorrector(i, func, X, YP, increment);
    YC(i) = amCorrector(i, func, X, YC, increment);
end
    function y = abPredictor(n, f, X, Y, h)
        y = Y(n-1) + ((h/12) * (23*f(X(n-1), Y(n-1)) - 16*f(X(n-2), Y(n-2)) + 5*f(X(n-3), Y(n-3))));
    end
    function y = amCorrector(n, f, X, Y, h)
        y = Y(n-1) + ((h/12) * (5*f(X(n), Y(n)) + 8*f(X(n-1), Y(n-1)) - f(X(n-2), Y(n-2))));
    end
end
% f=@(x, y) y-x^2;
% I = [0, 1];
% D = 1;
% h = .1;
% adamsBashforthMoulton3(f, I, D, h)