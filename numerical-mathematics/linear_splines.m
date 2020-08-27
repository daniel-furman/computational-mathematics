clear all; clc;

% Construct a linear spline regression from scratch (accompanying written
% work also completed):

x1 = [0:.05:1]; %intialize x
y1 = (-3.79/6).*x1.^3 + (2+3.79/6).*x1; % first split

x2 = [1:.05:2];
y2 = (.95/6).*(x2-1).^3 + (3.79/6).*(x2-2).^3 ...
    + (1-.95/6).*(x2-1) -(2+3.79/6).*(x2-2); % second spline


x3 = [2:.05:3];
y3 = (-.95/6).*(x3-3).^3 - (1-.95/6).*(x3-3); % third spline

% points for nodes:

xdata=[0 1 2 3];
ydata=[0 2 1 0];

%plot:

plot(x1,y1)
hold on
plot(x2,y2)
plot(x3,y3)
plot(xdata, ydata, 'o')


