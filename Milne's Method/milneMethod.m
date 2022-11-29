% Using Milner's Predictor and Corrector Method Find The Solution of
% 10(dy/dx) =  x^2 + y^2 
clear all
clc
syms x y
r1 = input('Enter Initial Range: ');
r2 = input('Enter Final Range: ');
h = input('Enter Increament: ');
i = input('Enter Initial Value of x: ');
X = i : h : r2;
Y(1) = input('Enter Initial Value of y: ');
f = @(x, y) (x^2 + y^2) / 10;
iP = int(f(x, Y(1)), x, X(1), x);
F(x) = Y(1) + iP;
Z(1) = f(X(1), Y(1));
n = (r1 -h)/ h;
for i = 2 : n + 1;
    Y(i) = round(double(F(X(i))), 2);
    Z(i) = f(X(i), Y(i));
end
P = Y;
C = Y;
l = length(X);
for i = n + 1 : l - 1
   Y(i+1) = round(fPredictor(i, h, Y, Z), 4); %Using Milner's Predictor Formula
   Z(i+1) = round(f(X(i+1), Y(i+1)), 4);
   P(i+1) = Y(i+1);
   Y(i+1) = round(fCorrector(i, h, Y, Z), 4); %Using Milner's Corrector Formula
   Z(i+1) = round(f(X(i+1), Y(i+1)), 4);
   temp = Z(i+1);
   Y(i+1) = round(fCorrector(i, h, Y, Z), 4); %Using Milner's Corrector Formula Further
   Z(i+1) = round(f(X(i+1), Y(i+1)), 4);
   while temp ~= Z(i+1)
        Y(i+1) = round(fCorrector(i, h, Y, Z), 4);
        Z(i+1) = round(f(X(i+1), Y(i+1)), 4);
   end
   C(i+1) = Y(i+1);
end
for i = 6 : 11
   fprintf('AT X = %.2f\nPredictor Value: %.4f\tCorrector Value: %.4f\n', X(i), P(i), C(i));  
end