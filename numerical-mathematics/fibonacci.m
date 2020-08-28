% fibonacci.m

% Write a script that displays the Fibonacci sequence and the ratio of
% consecutive terms. Also display the absolute error of each ratio as an 
% approximation to the Golden Ratio, 1+root(5)/2, include enough terms to
% reach the computer epsilon, then plot errors on loglog scale.

format long e

clear all; clc; clf;% clear everything
phi = (1+sqrt(5))/2 % this is golden ratio
tol = eps; %tolerance

z = ones(4,3);  %itialize z matrix with ones,

n = 2; %iteration number, set to two so that it starts with the second
%number of the fibb series, 1, and goes from there ignoring the zero term

while z(n,3) >= tol %greater than or equal to eps
    n = n+1; %iterator
    z(n,1) = z(n-1,1)+z(n-2,1); %fib series column 
    z(n,2) = z(n,1)/z(n-1,1); % ratio between consecitive terms column
    z(n,3) = abs(z(n,2)-phi); % absolute exact error column
end
fib = z(:,1);
ratio = z(:,2);
erval = z(:,3);

T = table(fib, ratio, erval) %create a table , notice last erval is 0

loglog(z(:,3),1:n, 'r-') %plot loglog plot of error versus iteration, 
%notice how it tends to 0
title('Loglog error per iteration')
xlabel('error')
ylabel('iteration')



    
