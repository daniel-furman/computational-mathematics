% This script performs row reduction manually and then back subsitutes.

% ROW_REDUCTION.M 


n = 4; %size of square matrix
A = randi(10,n);
B = zeros(n)

for i = 1:n-1
    for j = i+1:n
        mult = A(i,j)/A(i,i);
    
    for k = i+1:n
        A(j,k) = A(j,k)./(mult.*A(i,k);
    end
    B(j) = B(j) - mult.*B(i)
    end 
end
