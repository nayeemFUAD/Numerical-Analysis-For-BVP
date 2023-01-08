% Linear Shooting Method to solve y''= (2y/x.^2)-(2y'/x)+(sin(ln(x))/x.^2)
clear all
clc
% Defined
u=@(x, y, z) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2));
v=@(x, y, z) (((-2*z)/x)+((2*y)/x.^2));
ll = input("Enter Lower Limit: ");
ul = input("Enter Upper Limit: ");
fprintf("Y(%d): ", ll); p = input("");
fprintf("Y(%d): ", ul); q = input("");
h = input("Enter Increment: ");
% Calculation
X = ll : h : ul; n = length(X);
Y(1) = p; Y(n) = q;
% IVP-1 Condition
U1(1) = 1; U2(1) = 0;
% IVP-2 Condition
V1(1) = 0; V2(1) = 1;
for i = 2 : n
    [U1(i), U2(i)] = modifiedEulerMethod(i, u, X, U1, U2, h);
    [V1(i), V2(i)] = modifiedEulerMethod(i, v, X, V1, V2, h);
end
for i = 2: n
Y(i) = U1(i) + (((Y(n)-U1(n))/V1(n)) * V1(i));
end
fprintf("\t\t\t\t\t\tTABLE\n")
for i = 1: n
fprintf("Y1(%.2f)= %.4f\tY2(%.2f)= %.4f\tY(%.2f)= %.4f\n\n", X(i), U1(i), X(i), V1(i), X(i), Y(i));
end
% Functions
function [w1, w2] = modifiedEulerMethod(i, f, X, U1, U2, increment)
A = increment*U2(i-1);
B = increment*f(X(i-1), U1(i-1), U2(i-1));
C = increment*(U2(i-1) + B);
D = increment*f(X(i), U1(i-1)+A, U2(i-1)+B);
w1 = U1(i-1) + .5*(A+C);
w2 = U2(i-1) + .5*(B+D);
end
% X= all x values
% Y= all y values
% u= IVP-1 function
% v= IVP-2 function
% U1, U2= Collection of IVP-1 values
% V1, V2= Collection of IVP-2 values