function Y = picardsFormula(func, x_initial, y_initial, increment, desired_point)
syms x
X = x_initial : increment : desired_point; Y = y_initial;
g(x) = y_initial + int(func(x, y_initial), x, x_initial, x);
for i = length(Y)+1 : length(X)
    Y(i) = round(g(X(i)), 2);
end
end