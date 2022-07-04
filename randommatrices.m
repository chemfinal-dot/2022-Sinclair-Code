%% generates a permutation matrix
n = 10;
large2_eig = zeros(1,n);
aN2 = zeros(1,n); %a_N^2 matrix


for f = 1:n
    p = zeros(n,n); % Set Permutation Matrix of size nxn

    %% assign values to permutation matrix based on the randomized indeces in rc
    % generate a diagonal matrix of random complex values with moduli 1 
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

    % Pull two intergers: ex: 2 and 4
    % Swap column 2 with column 4 
    % Do process 1-20 number of times
    iterations = randi(20);

    for k = 1:iterations
        swap_col1 = randi(n);
        swap_col2 = randi(n);
        v = ar_unique(:, swap_col1);
        ar_unique(:, swap_col1) = ar_unique(:, swap_col2);
        ar_unique(:, swap_col2) = v;
    end

    % are all 1 so it is sorted from most negative to most positive
    ar_unique
    eig_val = eigs(ar_unique)
    eig_val_sorted = sortrows([real(eig_val) imag(eig_val)])*[1;1i]
    second_largest = eig_val_sorted(2)
    large2_eig(1,f) = second_largest;
    aN2(1,f) = large2_eig(1,f)/(n.^2)
    
end

large2_eig %lambda_a array
plot(aN2,large2_eig)