,clc;
clear all ;
%
% It is to attempt linear convolution of DT signals / sequences
% using user defined functions instead of using MATLAB 'conv'
%
x = input('Enter the 1st sequence: ');
nx = input('Enter the Time Index sequence: ');
h = input('Enter the second sequence: ');
nh = input('Enter the Time Index sequence: ');
% Sending parameters to a separate function
[y, ny] = findconv(x, nx, h, nh);
figure;
stem(ny, y);
xlabel('Time');
ylabel('Amplitude');
title('Linear Convolution');
disp(y);
disp(ny);
% Function to find the length of our output
function [y, ny] = findconv(x, nx, h, nh)
 ybegin_index = nx(1) + nh(1); % Starting index of result y[n]
 yend_index = nx(length(nx)) + nh(length(nh)); % End index of result y[n]
 ny = ybegin_index : yend_index;

 % Calling a function within a function
 y = calconv(x, h);
end
% Here is where the summation is calculated
function [y] = calconv(x, h)
 l1 = length(x);
 l2 = length(h);
 N = l1 + l2 - 1; % length of result y[n]
 for n = 1 : 1 : N
 y(n) = 0;
 for k = 1 : 1 : l1
 if(n - k + 1 >= 1 & n - k + 1 <= l2)
 y(n) = y(n) + x(k) * h(n - k + 1);
 end
 end
 end
end