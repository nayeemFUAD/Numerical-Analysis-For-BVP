function Y = RK3(func, x_initial, y_initial, increment, desired_point)
X = x_initial : increment : desired_point; Y = y_initial;
for i = length(Y)+1 : length(X)
   k1 = increment * func(X(i - 1), Y(i - 1));
   k2 = increment * func(X(i - 1) + (increment/2), Y(i - 1) + (k1/2));
   k3 = increment * func(X(i - 1) + increment, Y(i - 1) + 2 * k2 - k1);
   Y(i) = round(Y(i - 1) + (1 / 6) * (k1 + 4 * k2 + k3), 4);
end
end