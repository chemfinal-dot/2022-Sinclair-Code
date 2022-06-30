function n = opNorm(M)

% OPNORM   Calculates operator norm of matrix (the largest singular value)
% requires: nothing
%
%    n = OPNORM(M) generates a random unit vector with n entries,

n = sqrt(max(eig(ctranspose(M)*M)));

end
