function [y, f] = fCorrector( term, increament, X, Y, fun, FValues)
y = round(Y(term-1) + (increament/3) * (FValues(term-1) + 4*FValues(term) + FValues(term+1)), 4);
f = round(double(fun(X(term+1), y)), 4);
end

