clear all
clc
% Heuns Method - RK4 for First Order Simultaneous Differential Equation
% Single Step Method

% Example: 1
f{1}=@(x, y, z) x+z;                        %Creating Cell Arrays
f{2}=@(x, y, z) x-y^2;                      %Creating Cell Arrays
I = [0, 2, 1];                              %Storing Initial Values In an Array
D = .1;                                     %Desired Point
h = .1;                                     %Increment
[A, B]= RK4forSimultaneousDE(f, I, D, h);   %Function Calling
disp([A; B])
[A, B]= heunsMethod(f, I, D, h);            %Function Calling
disp([A; B])
% By Changing Calling Function Name We will get Different Values

% Example: 2
f{1} =@(x, y, z) x+y+z;                     %Creating Cell Arrays
f{2} =@(x, y, z) 1+y+z;                     %Creating Cell Arrays
I = [0, 1, -1];                             %Storing Initial Values In an Array
D = .1;                                     %Desired Point
h = .1;                                     %Increment
[A, B]= RK4forSimultaneousDE(f, I, D, h);   %Function Calling
disp([A; B])
[A, B]= heunsMethod(f, I, D, h);            %Function Calling
disp([A; B])
% By Changing Calling Function Name We will get Different Values