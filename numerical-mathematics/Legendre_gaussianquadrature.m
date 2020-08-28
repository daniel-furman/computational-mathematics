% Legendre Polynomials

clear all; clc; figure(1); clf; axis off; hold on;

% Set Up axes and x vectror for plotting for plotting
setupaxes;
x=[-1:.001:1];

% Number of nodes
n = 2;

% Generate y vectors for Legendre polynomials
P(1,:) = ones(size(x));
P(2,:) = x;
for i = 3:n+1
    P(i,:) = ((2*i-1).*x.*P(i-1,:)-(i-1)*P(i-2,:))/i;
end;

plot(x,P(n+1,:),'k','linewidth',2);

% Find zeros for gaussian quadrature
[xi,wi] = gauss(n);
disp('  Gaussian Quadrature');
disp('    Nodes     Weights');
disp([xi wi']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Example: Use Gaussian Quadrature with the above nodes and weights
% % to approximate the integral of 2^x from 0 to 4.
% 
I = 8*sum((wi'.*2.^(2*xi)));
disp('Approximation is ...');
disp(I);
disp('Exact is...')
exact = 15/log(2);
disp(exact)
disp('Relative error is ...');
disp(abs((I-exact)/exact))
