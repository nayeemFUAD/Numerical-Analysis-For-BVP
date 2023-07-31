% Modified Eulers Method For Solving First Order Differential Equation
% Single Step Method
function Y= modifiedEulersMethod(func, initialValues, desiredPoint, increment)
X= initialValues(1): increment: desiredPoint(1);
Y= eulersMethod(func, initialValues, desiredPoint, increment);
for i= 2: size(X, 2)
    while(1)
        temp= Y(i);
        Y(i)= Y(i-1) + (increment/2)*(func(X(i-1), Y(i-1)) + func(X(i), Y(i)));
        if(abs(temp-Y(i))<=.00001)
            break;
        end
    end
end
end
% f = @(x, y) (x.^2 + y);
% I = [0, 1];
% D = .5;
% h = .1;
% modifiedEulersMethod(f, I, D, h)