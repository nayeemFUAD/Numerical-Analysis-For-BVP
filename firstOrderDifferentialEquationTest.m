clear all
clc
% RK2 - RK3 - RK4 - Eulers Method - Modified Eulers Method - Picards Formula(First Order Differential Equation)
% Single Step Method
I = [0, 1];                         %Storing Initial Values In an Array
D = .5;                             %Desired Point
h = .1;                             %Increment

% Example: 1
f = @(x, y) ((x.^2 + y.^2) / 10);   %Differential Equation
RK4(f, I, D, h)                     %Function Calling
eulersMethod(f, I, D, h)            %Function Calling
modifiedEulersMethod(f, I, D, h)    %Function Calling
% By Changing Calling Function Name We will get Different Values

% Example: 2
f = @(x, y) ((y - x) / (y + x));    %Diffential Equation
RK4(f, I, D, h)                     %Function Calling
eulersMethod(f, I, D, h)            %Function Calling
modifiedEulersMethod(f, I, D, h)    %Function Calling
% By Changing Calling Function Name We will get Different Values

% Example: 3
f = @(x, y) (x.^2 + y);             %Differential Equation  
RK4(f, I, D, h)                     %Function Calling
eulersMethod(f, I, D, h)            %Function Calling
modifiedEulersMethod(f, I, D, h)    %Function Calling
picardsFormula(f, I, D, h)          %Function Calling
% By Changing Calling Function Name We will get Different Values
f= @(x, y) y-x;
I = [0, 1];
D = .5;
h = .1;
modifiedEulersMethod(f, I, D, h)