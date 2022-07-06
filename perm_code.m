figure(1)
hold on

for f = 4:2:50
    p = zeros(f,f); % Set Permutation Matrix of size nxn
 
    %% assign values to permutation matrix based on the randomized indeces in rc
    % generate a diagonal matrix of random complex values with moduli 1 
    ar = zeros(1,f); %initial vector
    ar(1) = 1;
    %ar_unique = unique(perms(ar),'rows')
    ar_unique = eye(f,f);
    for i = 1:f
        for j = 1:f
            if ar_unique(i,j) == 1
                C = rand(1,1) + 1i*rand(1,1); % randomly generate complex numbers with moduli 1
                C_norm = C/abs(C);
                ar_unique(i,j) = C_norm;
            end
        end
    end
 
    % Pull two intergers: ex: 2 and 4
    % Swap column 2 with column 4 
    % Do process 1-20 number of times
    iterations = randi(f/2);
 
    for k = 1:iterations
        swap_col1 = randi(f);
        swap_col2 = randi(f);
        v = ar_unique(:, swap_col1);
        ar_unique(:, swap_col1) = ar_unique(:, swap_col2);
        ar_unique(:, swap_col2) = v;
    end
 
    % are all 1 so it is sorted from most positive to most negative
    ar_unique;
    eig_val = eigs(ar_unique);
    eig_val_sorted = flip(sortrows([real(eig_val) imag(eig_val)])*[1;1i]);
    second_largest = eig_val_sorted(2);
    index = find(eig_val == second_largest); %a = the index of the 2nd largest eigenvalue in the unsorted array
    large2_eig(1,f) = second_largest;
    %aN2(1,f) = large2_eig(1,f)./(f.^2)
    plot([2:length(eig_val_sorted)], eig_val_sorted(2:length(eig_val_sorted)))
end
hold off