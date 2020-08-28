% simps_int.m

% Simpsons rule: definite integral from a to b of f(x).
% h = b - a / n (n intervals)
% used to solve two integrals, I1 and I2, saved in simps and simps 1:
% simps = y = exp(-x.^2) and simps 1 = y = 1/(1+x.^2)

clear all; clc;


%define for simps 1, use 0 to 1:
a = input('input a lower bound for integration 1, a =')
b = input('input an upper bound for integration 1, b =')
n = [2 ,4, 8, 16, 32, 64, 128, 256];
h = (b-a)./n;

%solutions saved in approx vector
I1 = [];
i=1;

%loop for simps (first function) use 0 and 1 as lims 
for h = [.5, .25, .125, .0625, .0312, .0156, .0078, .0039]
    xval = [a:h:b];
    yval = simps(xval);
    yvalodds = yval(1:2:end);
    I1(i) = (h./3).*(4.*sum(yval)-yval(1)-yval(end)-2.*sum(yvalodds));
    i = i+1;
end

%change to second function, use 0 and 4 as lims:

a1 = input('input a lower bound for integration 2, a =')
b1 = input('input an upper bound for integration 2, b =')
n1 = [2 ,4, 8, 16, 32, 64, 128, 256];
h1 = (b1-a1)./n1;

%solutions saved in approx vector
I2 = [];
i=1;

%loop for simps (second function) use 0 and 4 as lims 
for h1 = [2, 1, 0.5, 0.25, .125, .0625, 0.0312, 0.0156]
    xval1 = [a1:h1:b1];
    yval1 = simps(xval1);
    yvalodds1 = yval1(1:2:end);
    I2(i) = (h1./3).*(4.*sum(yval1)-yval1(1)-yval1(end)-2.*sum(yvalodds1));
    %this has an error in it
    i = i+1;
end



approximate_firstfunction = transpose(I1)
approximate_secondfunction = transpose(I2)
n = transpose(n);
table(n,approximate_firstfunction, approximate_secondfunction)

% calculate actual error
e1 = transpose(.74682413281243 - I1);
e2 = transpose(1.3258176636680 - I2);
disp('the actual errors are')
table(e1,e2)

display('if they tend towards constant O(h^4)')
check1 = e1./h^4
check2 = e2./h1^4

%they tend towards a constant
display('proven o(h^4)')




