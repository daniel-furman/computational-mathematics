% Approximate a linear system solution with the jacobi method

% set tolerance
tol = eps;
format LONG
Z = [24 -3 7 -4 5; 1 -12 -3 -2 5; 2 1 -6 1 1; -3 5 1 14 -2; -1 5 6 3 -17];
% this is diagonally dominant xyztv system of eqns
B = diag(diag(Z));
% you need to do twice so that the result is not just a matrix, diag diag
A = Z-B; %get the remaining

x = [1;1;1;1;1]; % first guess's initiazed
SOL(:,1) = x; %initialize matrix to collect each iteration

b = [184;-87;66;59;84]; % RHS solns to eqns

%B xnew = -(A * x old) + b
en = 1; % initialize starting conition for while loop
i = 1; % counter
while en > tol
    xold = x; % need to collect the x's into vector upon each iteration
    x = -inv(B)*A*x+inv(B)*b; % jacobi equation
    en(i+1) = abs(x(1) - xold(1)) + abs(x(2) - xold(2)) + abs(x(3) - ...
        xold(3)) + abs(x(4) - xold(4)) + abs(x(5) - xold(5)); %en equation
    i = i + 1;
    SOL(:,i) = x;
end

%set up the table:
iteration_count = [1:i]';
en = en';
approximation = SOL';
table(iteration_count, en, approximation)
