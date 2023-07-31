% Linear Shooting Method For Solving Second Order Differential Equation
% Boundary Value Problems
function Y = linearShootingMethod(func, initialValues, desiredPoint, increment)
f{1}= @(x, y, z) z;
% IVP: 1                            With r(x) Term
f{2}= @(x, y, z) func(x, y, z, 1);
I = [initialValues(1), initialValues(2), 0];
D = desiredPoint(1);
U = heunsMethod(f, I, D, increment);                %Can Be Use Other Simultaneous Equation Solving Method
% IVP: 2                            Without r(x) Term
f{2}= @(x, y, z) func(x, y, z, 0);
I = [initialValues(1), 0, 1];
V = heunsMethod(f, I, D, increment);                %Can Be Use Other Simultaneous Equation Solving Method
for i = 1 : size(U, 2)
    Y(i) = shootingMethod(i, U, V, desiredPoint(2));
end
    function y = shootingMethod(n, U, V, b)
        y = U(n) + ((b-U(size(U, 2)))/V(size(V, 2))) * V(n);
    end
end
% I = [1, 1];
% D = [2, 2];
% h = .2;
% u=@(x, y, z, k) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k);
% linearShootingMethod(u, I, D, h)