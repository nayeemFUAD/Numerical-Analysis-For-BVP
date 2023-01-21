function Y = nonLinearShootingMethod(func, x_initial, x_final, y_initial, y_final, guesses, increment)
n = length(x_initial : increment : x_final);
for i = 1 : length(guesses)
Y(i, :) = eulersMethodIVP(func, x_initial, x_final, y_initial, guesses(i), increment);
if(round(Y(i, n), 4)-y_final == 0)
    fprintf("Solution at Guess: %.4f", guesses(i));
    break;
end
end
while(1)
i = length(guesses)+1;
guesses(i) = secantFormula(i, guesses, y_final, Y);
Y(i, :) = eulersMethodIVP(func, x_initial, x_final, y_initial, guesses(i), increment);
if(round(Y(i, n), 4)-y_final == 0)
    fprintf("Solution at Guess: %.4f", guesses(i));
    break;
end
end
end