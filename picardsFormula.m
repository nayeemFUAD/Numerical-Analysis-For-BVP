% Picards Formula for solving first order differential equation
% Single Step Method
function Y = picardsFormula(func, initialValues, desiredPoint, increment)
syms x                                          %independent variable consider for integration
X= initialValues(1): increment: desiredPoint(1);
Y= initialValues(2);
g(x)= Y+ int(func(x, Y), x, X(1), x);         %integration with respect to x range[x0 to x]
for i= 2: size(X, 2)
    Y(i)= round(g(X(i))*10.^2)/(10.^2);
end
end
% f=@(x, y) (x^2+y^2)/10;
% I = [0, 1];
% D = .4;
% h=.1;
% picardsFormula(f, I, D, h)