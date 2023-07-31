% Milnes Method For Solving First Order Differential Equation
% Multi Step Method
function YC= milnesMethod(func, initialValues, desiredPoint, increment)
X= initialValues(1): increment: desiredPoint;
Y= picardsFormula(func, initialValues, .4, increment);
YP = Y; YC = Y;
for i= size(Y, 2): size(X, 2)-1
    YP(i+1)= milnesPredictor(i, func, X, YC, increment);
    YC(i+1)= milnesCorrector(i, func, X, YP, increment);
    YC(i+1)= milnesCorrector(i, func, X, YC, increment);
end
    function y= milnesPredictor(n, f, X, Y, h)
        y= Y(n-3) + ((4*h)/3)*(2*f(X(n-2), Y(n-2))-f(X(n-1), Y(n-1))+2*f(X(n), Y(n)));
    end
    function y= milnesCorrector(n, f, X, Y, h)
        y= Y(n-1) + (h/3)*(f(X(n-1), Y(n-1))+4*f(X(n), Y(n))+f(X(n+1), Y(n+1)));
    end
end
% f=@(x, y) (x^2+y^2)/10;
% I = [0, 1];
% D = 1;
% h = .1;
% milnesMethod(f, I, D, h)