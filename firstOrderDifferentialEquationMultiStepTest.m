clear all
clc
% Adams Bashforth Moulton Method For Solving First Order Differential Equation
% Multi Step Method
 
% % Example: 01
f=@(x, y) y-x^2;                    %Differential Equation
I = [0, 1];                         %Storing Initial Values In an Array
D = 1;                              %Desired Point
h = .1;                             %Increment
adamsBashforthMoulton3(f, I, D, h)  %Function Calling
adamsBashforthMoulton4(f, I, D, h)  %Function Calling
% By Changing Calling Function Name We will get Different Values

% Example: 02
f=@(x, y) 1+y^2;                    %Differential Equation
I = [0, 0];                         %Storing Initial Values In an Array
D = .8;                             %Desired Point
h = .2;                             %Increment
adamsBashforthMoulton3(f, I, D, h)  %Function Calling
adamsBashforthMoulton4(f, I, D, h)  %Function Calling
% By Changing Calling Function Name We will get Different Values

f=@(x, y) (x^2+y^2)/10;
I = [0, 1];
D = 1;
h = .1;
milnesMethod(f, I, D, h)