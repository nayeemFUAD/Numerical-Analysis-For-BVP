function [y, f] = fPredictor( term, increament, X, Y, fun, FValues )
y = round(Y(term-3) + (((4*increament)/3) * (2*FValues(term-2) - FValues(term-1) + 2*FValues(term))), 4);
f = round(double(fun(X(term+1), y)), 4);
end

