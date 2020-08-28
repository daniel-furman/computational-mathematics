% Script which explored run time of LU factorization. For nxn matrices
% with n from 1 to 2001 we measure the runtime for the LU functin and 
% a good fit with a third degree polynomial.

t = zeros(1,51);
nn = zeros(1,51);
b = 1;
for n = 1:40:2001
    A = rand(n,n);
    tic;
    [L, U] = lu(A);
    t(b) = toc;
    nn(b) = n;
    b = b + 1;
end
t;


p = polyfit(nn,t,3);
x1 = 1:2001;
y1 = polyval(p,x1);
plot(x1,y1)
hold on
plot(nn, t, 'ro')

