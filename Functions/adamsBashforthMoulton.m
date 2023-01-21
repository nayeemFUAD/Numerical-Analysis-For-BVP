function C = adamsBashforthMoulton(func, x_initial, y_initial, increment, desired_point)
X = x_initial : increment : desired_point;
Y = RK4(func, x_initial, y_initial, increment, desired_point-increment);
P = Y; C = Y;
P(length(P)+1) = abPredictor(length(P), func, X, C, increment);
C(length(C)+1) = amCorrector(length(C), func, X, P, increment);
    function y = abPredictor(n, f, X, Y, h)
        y = round(Y(n) + ((h/24) * (55*f(X(n), Y(n)) - 59*f(X(n-1), Y(n-1)) + 37*f(X(n-2), Y(n-2)) - 9*f(X(n-3), Y(n-3)))), 4);
    end
    function y = amCorrector(n, f, X, Y, h)
        y = round(Y(n) + ((h/24) * (9*f(X(n+1), Y(n+1)) + 19*f(X(n), Y(n)) - 5*f(X(n-1), Y(n-1)) + f(X(n-2), Y(n-2)))), 4);
    end
end
% f = @(x, y) (1+y.^2);
% y(0)=0
% h=.2
% y(.8)=?