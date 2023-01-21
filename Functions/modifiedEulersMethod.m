function Y = modifiedEulersMethod(func, x_initial, y_initial, increment, desired_point)
X = x_initial : increment : desired_point;
Y = eulersMethod(func, x_initial, y_initial, increment, desired_point);
for i = 2 : length(X)
    while(1)
        temp = Y(i);
        Y(i) = Y(i-1) + (increment/2)*(func(X(i-1), Y(i-1)) + func(X(i), Y(i)));
        if(abs(temp-Y(i)) <= .0001)
            break;
        end
    end
end
end