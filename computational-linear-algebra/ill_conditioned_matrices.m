% Exploration of round off error in Hilbert matrix and Pascal matrix.

% We first compute the determinant of the Hilbert matrix and its inverse
% finding that MATLAB fails to identfiy integers among the inverse.

% We then try to solve b = hilb(n) # ones(n,1), and observe innacurate
% solutions. 

% Next, we find the smallest n for which the Pascal_n matrix is predicted
% as not having determinant one, when n = 6. 

% We lastly compute the condition number of the matrices, revealing they 
% are conditioned to err. We also confirm the cond(A) is equivalent to 
% taking the ratio of the largest eigenvalue to the smallest. 

format long
warning('off')
%part 1

c = [];
c_inv = [];

for n = 1:20
    A = hilb(n);
    c(n) = det(A);
    
    A_inv = inv(A);
    c_inv(n) = det(A_inv);
    
end

c; % begins at 1 and decreases rapidly, by the sixth entry collapses to 0
A_inv; % does not recognize as integers
c_inv(3); % begins at 1 and rapidly increases

%part 2

res = [];
for n = 1:20
    res = hilb(n)\(hilb(n) * ones(n, 1));
end
res; % not a vector of ones


% part 3

cc = [];

for n = 1:10
    A = pascal(n);
    cc(n) = det(A);
      
end

cc;  % the sixth entry is the first non-1 result

% part 4

conds_pascal = [];
conds_hilb = [];
for n = 1:5
    A = pascal(n);
    B = hilb(n);
    
    
    conds_pascal(n) = cond(A);
    conds_hilb(n) = cond(B);
      
end

conds_pascal(4); %begins at 1, grows to 7, 61, 692 ... 
conds_hilb(4); %begins at 1, quickly grows to 19, then 524, 15,513 ...

%confirm largest eig/ smallest eig = cond for n = 4

A = pascal(4);
B = hilb(4);
    
max(eig(A))/min(eig(A));
cond(A);
% both are 691.937

max(eig(B))/min(eig(B));
cond(B);
%both are 15513.739 


