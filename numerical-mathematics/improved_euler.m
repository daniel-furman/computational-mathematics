% Use improved euler method to approx set of points on following ODE:

% d2y/dx2 - dy/dx - 6y = 50 sinx

% boundary conditions are y(0) = 0, y'(0) = 1

% approx values from x = 0 to x = 2 with h = .5, .25, .125, .05

clear all; clc;
% first points:
x = [0:.5:2];
h = 0.5;
ystar = zeros(1,5); %initialize ystar
zstar = zeros(1,5); %initialize zstar
y = zeros(1,5); %iniatlize y
z = zeros(1,5); %iniatlize z
y(1) = 0; % first value of yo
z(1) = 1; % first value of zo

for i = 1:4 %one less than length(x)
    ystar(i) = y(i) + h*z(i);
    zstar(i) = z(i) + h.*(z(i)+6.*y(i)+50.*sin(x(i)));
    y(i+1) = y(i) + (h/2)*(zstar(i) + z(i));
    z(i+1) = z(i) + (h/2)*((z(i)+6*y(i)+50.*sin(x(i))) + (zstar(i)+6*...
        ystar(i)+50.*sin(x(i))));
end

% second points:
x1 = [0:.25:2];
h1 = 0.25;
ystar1 = zeros(1,9); %initialize ystar
zstar1 = zeros(1,9); %initialize zstar
y1 = zeros(1,9); %iniatlize y
z1 = zeros(1,9); %iniatlize z
y1(1) = 0; % first value of yo
z1(1) = 1; % first value of zo

for i = 1:8 %one less than length(x)
    ystar1(i) = y1(i) + h1*z1(i);
    zstar1(i) = z1(i) + h1.*(z1(i)+6.*y1(i)+50.*sin(x1(i)));
    y1(i+1) = y1(i) + (h1/2)*(zstar1(i) + z1(i));
    z1(i+1) = z1(i) + (h1/2)*((z1(i)+6*y1(i)+50.*sin(x1(i))) + ...
        (zstar1(i)+6*ystar1(i)+50.*sin(x1(i))));
end

% third points:
x2 = [0:.125:2];
h2 = 0.125;
ystar2 = zeros(1,17); %initialize ystar
zstar2 = zeros(1,17); %initialize zstar
y2 = zeros(1,17); %iniatlize y
z2 = zeros(1,17); %iniatlize z
y2(1) = 0; % first value of yo
z2(1) = 1; % first value of zo

for i = 1:16 %one less than length(x)
    ystar2(i) = y2(i) + h2*z2(i);
    zstar2(i) = z2(i) + h2.*(z2(i)+6.*y2(i)+50.*sin(x2(i)));
    y2(i+1) = y2(i) + (h2/2)*(zstar2(i) + z2(i));
    z2(i+1) = z2(i) + (h2/2)*((z2(i)+6*y2(i)+50.*sin(x2(i))) + ...
        (zstar2(i)+6*ystar2(i)+50.*sin(x2(i))));
end

% fourth points:
x3 = [0:.05:2];
h3 = 0.05;
ystar3 = zeros(1,41); %initialize ystar
zstar3 = zeros(1,41); %initialize zstar
y3 = zeros(1,41); %iniatlize y
z3 = zeros(1,41); %iniatlize z
y3(1) = 0; % first value of yo
z3(1) = 1; % first value of zo

for i = 1:40 %one less than length(x)
    ystar3(i) = y3(i) + h3*z3(i);
    zstar3(i) = z3(i) + h3.*(z3(i)+6.*y3(i)+50.*sin(x3(i)));
    y3(i+1) = y3(i) + (h3/2)*(zstar3(i) + z3(i));
    z3(i+1) = z3(i) + (h3/2)*((z3(i)+6*y3(i)+50.*sin(x3(i))) + ...
        (zstar3(i)+6*ystar3(i)+50.*sin(x3(i))));
end


% actual solution:
xreal = [0:.05:2];
yreal = (-11/5).*exp(-2.*xreal)+(6/5).*exp(3.*xreal)-7.*sin(xreal)+...
    cos(xreal);

% plots
hold on
plot(xreal,yreal)
plot(x,y)
plot(x1,y1)
plot(x2,y2)
plot(x3,y3)

legend('real', 'approx h = .5', 'approx h = .25', 'approx h = .125', ...
    'approx h = .05')


%table of exact errors:
% absolute error = abs(y-ybar)
% at x = 1
yreal1 = (-11/5).*exp(-2.*1)+(6/5).*exp(3.*1)-7.*sin(1)+cos(1);
en(1,1) = abs(yreal1-y(3));
en(2,1) = abs(yreal1-y1(5));
en(3,1) = abs(yreal1-y2(9));
en(4,1) = abs(yreal1-y3(21));
% at x = 1.5
yreal2 = (-11/5).*exp(-2.*1.5)+(6/5).*exp(3.*1.5)-7.*sin(1.5)+cos(1.5);
en(1,2) = abs(yreal2-y(4));
en(2,2) = abs(yreal2-y1(7));
en(3,2) = abs(yreal2-y2(13));
en(4,2) = abs(yreal2-y3(31));
% at x = 2
yreal3 = (-11/5).*exp(-2.*2)+(6/5).*exp(3.*2)-7.*sin(2)+cos(2);
en(1,3) = abs(yreal3-y(5));
en(2,3) = abs(yreal3-y1(9));
en(3,3) = abs(yreal3-y2(17));
en(4,3) = abs(yreal3-y3(41));

errors1 = en(:,1);
errors2 = en(:,2);
errors3 = en(:,3);

table(errors1, errors2, errors3) % final table

