function truthval = badStringTest(V)

% BADSTRINGTEST   Test if a string of digits is "bad"
% Indexes through all entries of the array, returns 1 if any two adjacent
% digits are the same, 0 otherwise

L = length(V);
truthval = 0;

for i = 2:L
    if V(i) == V(i-1)
        truthval = 1;
        break
    end
end



end
