% Eulers Method For Solving First Order Differnetial Equation
% Single Step Method
function Y= eulersMethod(func, initialValues, desiredPoint, increment)
X= initialValues(1) : increment : desiredPoint(1);
Y= initialValues(2);
for i= 2: size(X, 2)
    Y(i)= Y(i-1) + increment*func(X(i-1), Y(i-1));
end
end
% f = @(x, y) ((y - x) / (y + x));
% I = [0, 1];
% D = .5;
% h = .1;
% eulersMethod(f, I, D, h)