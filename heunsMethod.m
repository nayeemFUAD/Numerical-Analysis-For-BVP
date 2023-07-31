% Heuns Formula For Solving Simultaneous First Order Differential Equation
% Single Step Method
function [Y, Z]= heunsMethod(funcs, initialValues, desiredPoint, increment)
X= initialValues(1): increment: desiredPoint(1);
Y= initialValues(2);
Z= initialValues(3);
for i = 2 : size(X, 2)
    k1= funcs{1}(X(i-1), Y(i-1), Z(i-1));
    k2= funcs{2}(X(i-1), Y(i-1), Z(i-1));
    k3= funcs{1}(X(i-1)+increment, Y(i-1)+(increment*k1), Z(i-1)+(increment*k2));
    k4= funcs{2}(X(i-1)+increment, Y(i-1)+(increment*k1), Z(i-1)+(increment*k2));
    Y(i)= Y(i-1)+ (increment/2)*(k1+k3);
    Z(i)= Z(i-1)+ (increment/2)*(k2+k4);
end
end
% X = [0, 1, -1];
% T = [1];
% h = .1;
% f{1} =@(x, y, z) x+y+z;                   cell arrays
% f{2} =@(x, y, z) 1+y+z;
% [A, B]=heunsMethod(f, X, T, h)