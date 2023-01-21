function Y = eulersMethod(func, x_initial, y_initial, increment, desired_point)
X = x_initial : increment : desired_point; Y = y_initial;
for i = length(Y)+1 : length(X)
    Y(i) = Y(i-1) + increment*func(X(i-1), Y(i-1));
end
end