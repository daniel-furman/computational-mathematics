% Applied least square regression. 

% a) We first approximate the spring constant through linear regression, 
% with initial condition at time zero, and a particular set of displacement
% measurements corresponding to forces applied to the spring. 

% b) We then approximate the graviational constant with time series 
% of a mass falling from a reference point. We use the second order ODE
% of newton's second law and fit a second order regression.

% a)
x = [.155 .193 .221 .264]';
y = [0 2 4 6]';
format short
X = [ones(length(x),1) x];
b = X\y;

disp('the k constant is approximated by:')
disp(b(2))

yCalc2 = X*b;
scatter(x,y, 'b')
hold on
plot(x,yCalc2,'--')
xlabel('length')
ylabel('force')
title('Linear Regression Approximate of k')
grid on


x = [.1, .2, .3, .4, .5]';
x1 = [.1*.1, .2*.2, .3*.3, .4*.4, .5*.5]';
y = [-.079, .091, .357, .713, 1.167]';
format short
X = [ones(length(x),1) x, x1];
b = X\y;

disp('gravity approximated by:')
disp(b(3)*2)
figure()
yCalc2 = X*b;
scatter(x,y, 'b')
hold on
plot(x,yCalc2,'--')
xlabel('time')
ylabel('displacement')
title('Linear Regression Approximation of Gravity')
grid on




