%% generates a permutation matrix
n = 5;
p = zeros(n,n); % Set Permutation Matrix of size nxn

%% assign values to permutation matrix based on the randomized indeces in rc
% generate a diagonal matrix of random complex values with moduli 1 
% for r = 1:n
%     C = rand(1,1) + 1i*rand(1,1); % randomly generate complex numbers with moduli 1
%     C_norm = C/abs(C);
%     p(r,r) = C_norm;
% end
% p

ar = zeros(1,n); %initial vector
ar(1) = 1;
ar_unique = unique(perms(ar),'rows')

for i = 1:n
    for j = 1:n
        if ar_unique(i,j) == 1
            C = rand(1,1) + 1i*rand(1,1); % randomly generate complex numbers with moduli 1
            C_norm = C/abs(C);
            ar_unique(i,j) = C_norm;
        end
    end
end
 
% find the second largest eigenvalue - ISSUE: sorted by magnitude but they
% are all 1 so it is sorted by phase angle on [-pi, pi]
eig_val = eigs(ar_unique)
plot(eig_val)
eig_val_sorted = sort(eig_val)
second_largest = eig_val_sorted(2)



