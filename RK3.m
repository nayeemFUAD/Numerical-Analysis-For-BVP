% RK3 Method for solving First Order Differential Equation
% Single Step Method
function Y= RK3(func, initialValues, desiredPoint, increment)
X= initialValues(1): increment: desiredPoint(1);
Y= initialValues(2);
for i= 2 : size(X, 2)
    k1= increment*func(X(i-1), Y(i-1));
    k2= increment*func(X(i-1)+(increment/2), Y(i-1)+(k1/2));
    k3= increment*func(X(i-1)+increment, Y(i-1)+2*k2-k1);
    Y(i)= Y(i-1)+(1/6)*(k1+4*k2+k3);
end
end
% f = @(x, y) ((x.^2 + y.^2) / 10);
% I = [0, 1];
% D = .5;
% h = .1;
% RK3(f, I, D, h)