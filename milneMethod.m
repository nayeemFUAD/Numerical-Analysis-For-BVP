% Using Milner's Predictor and Corrector Method Find The Solution of 10(dy/dx) =  x^2 + y^2
clear all
clc
syms x y
% Definition
r1 = input('Enter Initial Range: '); r2 = input('Enter Final Range: ');
h = input('Enter Increament: ');
i = input('Enter Initial Value of x: '); fprintf("y(%d): ", i); Y(1) = input("");
% Calculation
X = i : h : r2;
f = @(x, y) (x^2 + y^2) / 10;
F(x) = Y(1) + int(f(x, Y(1)), x, X(1), x);
Z(1) = f(X(1), Y(1));
pPoints = i : h : (r1-h);
l = length(pPoints);
for i = 2 : l
    Y(i) = round(double(F(X(i))), 2);
    Z(i) = f(X(i), Y(i));
end
P = Y; C = Y;                                       % Set Predictor and Corrector (Similar at all points)
for i = 5 : length(X)-1
   [Y(i+1), Z(i+1)] = fPredictor(i, h, X, Y, f, Z); % Using Milner's Predictor Formula
   P(i+1) = Y(i+1);
   [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z); % Using Milner's Corrector Formula
   temp = Z(i+1);
   [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z); % Using Milner's second Corrector Formula
   while temp ~= Z(i+1)                             % Using Milner's Corrector Formula Further
        [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z);
   end
   C(i+1) = Y(i+1);
end
for i = l+1 : length(X)
   fprintf('AT X = %.2f\tPredictor Value: %.4f\tCorrector Value: %.4f\n', X(i), P(i), C(i));  
end
% Functions
function [y, f] = fPredictor(term, increament, X, Y, fun, FValues )
y = round(Y(term-3) + (((4*increament)/3) * (2*FValues(term-2) - FValues(term-1) + 2*FValues(term))), 4);
f = round(double(fun(X(term+1), y)), 4);
end
function [y, f] = fCorrector(term, increament, X, Y, fun, FValues)
y = round(Y(term-1) + (increament/3) * (FValues(term-1) + 4*FValues(term) + FValues(term+1)), 4);
f = round(double(fun(X(term+1), y)), 4);
end
% X= all x values
% Y= all y values
% Z= all f values
% f= given function
% F= Picard's formula function
% P= Predictor Values
% C= Corrector Values