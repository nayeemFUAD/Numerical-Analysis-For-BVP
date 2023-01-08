clear all
clc
f = @(x, y) (1+y.^2);
% Definition
q = input('Enter Initial Value of x: ');
fprintf("y(%d): ", q); Y(1) = input("");
h = input('Enter Increment: ');
z = input("Enter a Point To Find It's Predictor and Corrector Value: ");
% Calculation
X = q : .2 : z;
iCalc = q : h : z - h;
fprintf('At x =  %.2f\tY(%.2f): %.4f\n', X(1), X(1), Y(1));
for i = 2 : length(iCalc)
    Y(i) = RK4(X(i-1), Y(i-1), h, f);
    fprintf('At x =  %.2f\tY(%.2f): %.4f\n', X(i), X(i), Y(i));
end
for i = length(iCalc) : length(X) - 1
   Y(i+1) = abPredictor(i, X, Y, h, f);
   fprintf('\nAT x = %.2f\t\tPredictor: %.4f\t\t', X(i+1), Y(i+1));
   Y(i+1) = amCorrector(i, X, Y, h, f);
   fprintf('Corrector: %.4f\n', Y(i+1));
end
% Functions
function out = RK4(x, y, h, f)
   k1 = h * f(x, y);
   k2 = h * f(x + (h / 2), y + (k1 / 2));
   k3 = h * f(x + (h / 2), y + (k2 / 2));
   k4 = h * f(x + h, y + k3);
   out = round(y + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4), 4);
end
function out = abPredictor(n, X, Y, increment, fun)
out = round(Y(n) + ((increment/24) * (55*fun(X(n), Y(n)) - 59*fun(X(n-1), Y(n-1)) + 37*fun(X(n-2), Y(n-2)) - 9*fun(X(n-3), Y(n-3)))), 4);
end
function out = amCorrector(n, X, Y, increment, fun)
out = round(Y(n) + ((increment/24) * (9*fun(X(n+1), Y(n+1)) + 19*fun(X(n), Y(n)) - 5*fun(X(n-1), Y(n-1)) + fun(X(n-2), Y(n-2)))), 4);
end
% X= all x values
% Y= all y values
% f= given function
