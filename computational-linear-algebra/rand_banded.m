
% When measuring the run time for solving k-banded matrix, we observe
% performance often  better than n^3. Often when the matrix has special
% properties, we approach rin time proportional to n or n^2 (n x n matrix).

% We first write function rand_band(n,k). Takes integers n > 0 and k ? 0
% and outputs a randomly generated n × n matrix that is k-banded. 

% Generate a plot with the values of n on the x-axis and the corresponding
% running times on the y-axis.



f = 3000; %final val
t = zeros(1,length(100:50:f));
nn = zeros(1,length(100:50:f));

k = 10;

p = 1;
for n = 100:50:f
    A = rand_band(n,k);
    b = rand(n,1);
    tic;
    A\b;
    t(p) = toc;
    nn(p) = n;
    p = p + 1;
end

plot(nn, t, 'ro')

function z = rand_band(n,k)
    A = rand(n,n);
    for i = 1:n
        for j = 1:n
            if k < abs(i - j)
                A(i,j) = 0;
            end
            
        end
        
    end
    z = sparse(A);
end
               



