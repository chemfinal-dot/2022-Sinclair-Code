function U = randVect(n)

% RANDVECT   Generate random unit vector
% requires: nothing
%
%    U = RANDVECT(n) generates a random unit vector with n entries

X = randn(1,n);
U = X/norm(X);

end
