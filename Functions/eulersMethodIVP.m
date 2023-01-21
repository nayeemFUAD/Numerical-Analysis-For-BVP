function Y = eulersMethodIVP(func, x_initial, x_final, y_initial, z_initial, increment)
X = x_initial : increment : x_final; Y = y_initial; Z = z_initial;
for i = length(Y)+1 : length(X)
    Y(i) = Y(i-1) + increment*Z(i-1);
    Z(i) = Z(i-1) + increment*func(X(i-1), Y(i-1), Z(i-1));
end
end