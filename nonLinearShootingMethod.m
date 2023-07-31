% Non-Linear Shooting Method For Solving Second Order Differential Equation
% Boundary Value Problems
function y = nonLinearShootingMethod(func, initialValues, desiredPoint, increment, guesses)
f{1}= @(x, y, z) z;
f{2}= @(x, y, z) func(x, y, z);
D= desiredPoint(1);
for i= 1: size(guesses, 2)                                               %IVP- 1 at i=1, IVP-2 at i=2
    I= [initialValues(1), initialValues(2), guesses(i)];
    Y(i, :)= eulersMethod(f, I, D, increment);
    if(((round(Y(i, size(Y, 2))*10^4))/(10.^4))-desiredPoint(2) == 0)
        y= Y(i, :);
        break;
    end
end
while(1)
    i= i+ 1;                                                            %IVP-n Continues
    guesses(i)= secantMethod(i-1, desiredPoint(2), guesses, Y);
    I= [initialValues(1), initialValues(2), guesses(i)];
    Y(i, :)= eulersMethod(f, I, D, increment);
    if(((round(Y(i, size(Y, 2))*10^4))/(10.^4))-desiredPoint(2) == 0)
        y= Y(i, :);
        break;
    end
end
    function y = secantMethod(n, yFinal, guesses, calculatedY)                      %For finding next root
        m= size(calculatedY, 2);
        y= guesses(n) + (yFinal- calculatedY(n, m))*(guesses(n)- guesses(n-1))/(calculatedY(n, m)- calculatedY(n-1, m)); 
    end
    function Y = eulersMethod(funcs, initialValues, desiredPoint, increment)        %Function with three variables
        X= initialValues(1): increment: desiredPoint(1);
        Y= initialValues(2);
        Z= initialValues(3);
        for j= 2: size(X, 2)
            Y(j)= Y(j-1)+ increment*funcs{1}(X(j-1), Y(j-1), Z(j-1));
            Z(j)= Z(j-1)+ increment*funcs{2}(X(j-1), Y(j-1), Z(j-1));
        end
    end
end
% f=@(x, y, z) 6*y^2-x;
% I = [0, 1];
% D = [1, 5];
% h = 1/3;
% g = [1.2, 1.5];
% nonLinearShootingMethod(f, I, D, h, g)