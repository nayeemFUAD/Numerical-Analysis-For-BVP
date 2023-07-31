% RK4 Formula For solving Simultaneous First Order Differnetial Equations
% Single Step Method
function [Y, Z]= RK4forSimultaneousDE(funcs, initialValues, desiredPoint, increment)
X= initialValues(1):increment:desiredPoint(1);
Y= initialValues(2);
Z= initialValues(3);
for i= 2: size(X, 2)
    k1= increment*funcs{1}(X(i-1), Y(i-1), Z(i-1));
    l1= increment*funcs{2}(X(i-1), Y(i-1), Z(i-1));
    k2= increment*funcs{1}(X(i-1)+(increment/2), Y(i-1)+(k1/2), Z(i-1)+(l1/2));
    l2= increment*funcs{2}(X(i-1)+(increment/2), Y(i-1)+(k1/2), Z(i-1)+(l1/2));
    k3= increment*funcs{1}(X(i-1)+(increment/2), Y(i-1)+(k2/2), Z(i-1)+(l2/2));
    l3= increment*funcs{2}(X(i-1)+(increment/2), Y(i-1)+(k2/2), Z(i-1)+(l2/2));
    k4= increment*funcs{1}(X(i-1)+increment, Y(i-1)+k3, Z(i-1)+l3);
    l4= increment*funcs{2}(X(i-1)+increment, Y(i-1)+k3, Z(i-1)+l3);
    Y(i)= Y(i-1)+(1/6)*(k1+2*k2+2*k3+k4);
    Z(i)= Z(i-1)+(1/6)*(l1+2*l2+2*l3+l4);
end
end
% f{1}=@(x, y, z) x+z;
% f{2}=@(x, y, z) x-y^2;
% I = [0, 2, 1];
% D = .1;
% h = .1;
% [A, B]= RK4forSimultaneousDE(f, I, D, h)