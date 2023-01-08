% Non-Linear Shooting Method
clear all
clc
f = @(x, y) (6*y.^2 - x); 
% User Defined Part
j = input("Enter Number Of Initial Guess: ");
for i = 1 : j
u(i) = input("Enter Guess: ");
end
ll = input("Enter Lower Limit: ");
ul = input("Enter Upper Limit: ");
fprintf("Y(%d): ", ll); p = input("");
fprintf("Y(%d): ", ul); q = input("");
h = input("Enter Increment: ");
% Defined Part Calculation
X = 0 : h : 1;
n = length(X);
for k = 1 : j
u1(1) = p; u2(1) = u(k);
for i = 2 : n
[u1(i), u2(i)] = eulersMethod(i, f, u1, u2, X, h);
end
Y(k, :) = u1(1, :);
B(k) = u1(n);
Z(k, :) = u2(1, :);
if round(u1(n), 4)-q == 0
fprintf("\t Guess\t\tY0\t\t  Y1\t\tY2\t\t  Y3\n");
disp([u', Y])
fprintf("The required solution is at %.4f\n", u(k));
break;
end
end
% If not satisfied Extention Part
while(1)
j = j + 1;
u(j) = secantMethod(j, u, B, q);
u1(1) = p; u2(1) = u(j);
for i = 2 : n
[u1(i), u2(i)] = eulersMethod(i, f, u1, u2, X, h);
end
Y(j, :) = u1(1, :);
B(j) = u1(n);
Z(j, :) = u2(1, :);
if round(u1(n), 4)-q == 0
fprintf("\t Guess\t\tY0\t\t  Y1\t\tY2\t\t  Y3\n");
disp([u', Y])
fprintf("The required solution is at %.4f\n", u(j));
break;
end
end
% Functions
function [a, b] = eulersMethod(n, f, u1, u2, X, h)
a = u1(n-1) + h*u2(n-1);
b = u2(n-1) + h*f(X(n-1), u1(n-1));
end
function r = secantMethod(n, R, B, fv)
r = R(n-1) + (fv-B(n-1))/(B(n-1)-B(n-2))*(R(n-1)-R(n-2));
end
% 