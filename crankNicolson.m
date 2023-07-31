clear all
clc
% learn crank
x = 0: .1: 1;
t = 0: .01: .5;
tn = length(t);
n = length(x);
lemda = 1;
for i = 1: length(x)
    lm(i, i) = -lemda;
    lm(i, i+1) = 2 + 2*lemda;
    lm(i, i+2) = -lemda;
    rm(i, i) = lemda;
    rm(i, i+1) = 2 - 2*lemda;
    rm(i, i+2) = lemda;
end
lm = lm(1: length(x)-2, 2:length(x)-1);
rm = rm(1: length(x)-2, 2:length(x)-1);
for i = 1: n
    u(1, i) = sin(pi*x(i));  
end
for i = 2: tn
    u(i, 2:n-1) = croutDecomposition(lm, rm*u(i-1, 2:n-1)');
end
