% Using Milner's Predictor and Corrector Method Find The Solution of
% 10(dy/dx) =  x^2 + y^2 
clear all
clc
syms x y
r1 = input('Enter Initial Range: '); r2 = input('Enter Final Range: ');
h = input('Enter Increament: ');
i = input('Enter Initial Value of x: '); Y(1) = input('Enter Initial Value of y: ');
X = i : h : r2;
f = @(x, y) (x^2 + y^2) / 10;
iP = int(f(x, Y(1)), x, X(1), x);
F(x) = Y(1) + iP;
Z(1) = f(X(1), Y(1));
for i = 2 : 5
    Y(i) = round(double(F(X(i))), 2);
    Z(i) = f(X(i), Y(i));
end
P = Y; C = Y;
for i = 5 : length(X)-1
   [Y(i+1), Z(i+1)] = fPredictor(i, h, X, Y, f, Z); %Using Milner's Predictor Formula
   P(i+1) = Y(i+1);
   [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z); %Using Milner's Corrector Formula
   temp = Z(i+1);
   [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z); %Using Milner's Corrector Formula Further
   while temp ~= Z(i+1)
        [Y(i+1), Z(i+1)] = fCorrector(i, h, X, Y, f, Z);
   end
   C(i+1) = Y(i+1);
end
for i = 6 : 11
   fprintf('AT X = %.2f\tPredictor Value: %.4f\tCorrector Value: %.4f\n', X(i), P(i), C(i));  
end
