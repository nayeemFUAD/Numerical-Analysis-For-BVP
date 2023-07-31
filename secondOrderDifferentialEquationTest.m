clear all
clc
I = [1, 1];
D = [2, 2];
h = .2;
u=@(x, y, z, k) (((-2*z)/x)+((2*y)/x.^2)+(sin(log(x))/x.^2)*k);
linearShootingMethod(u, I, D, h)

f=@(x, y, z) 6*y^2-x;
I = [0, 1];
D = [1, 5];
h = 1/3;
g = [1.2, 1.5];
nonLinearShootingMethod(f, I, D, h, g)