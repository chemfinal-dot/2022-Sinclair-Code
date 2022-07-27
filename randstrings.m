alpha = 'a':'d';
length_word = 5; num_words = 1;
word = convertCharsToStrings(alpha(randi(numel(alpha),num_words,length_word))) %consecutive letters are inverses of each other;
red_word = "";
temp_char = "";

for i = 2:length_word
    if word(i) == "a"
        parity_mat(1) = parity_mat(1)+1
    elseif word(i) == "b"
        parity_mat(1) = parity_mat(1)-1
    elseif word(i) == "c"
        parity_mat(2) = parity_mat(2)+1
    elseif word(i) == "d"
        parity_mat(2) = parity_mat(2)-1
    end
    if parity_mat ~= zeros(size(parity_mat))
        display(word)
    else
        %% reduce the string
        %  reorder string
        if (word(i) ~= "a" || word(i) ~= "b") && (word(i-1) == "a" || word(i-1) == "b")
            temp_char = word(i-1)
            word = strrep(word(1:num_words),word(i),word(i-1))
            word = strrep(word(1:num_words),word(i-1),temp)
        end
        word = reverse(word)
        % reduce string
        if word(i) == "a" && word(i-1) == "b"
            word = reduce(word,word(i-1:i))
        elseif word(i) == "c" && word(i-1) == "d"
            word = reduce(word,word(i-1:i))
        elseif word(i) == "b" && word(i-1) == "a"
            word = reduce(word,word(i-1:i))
        elseif word(i) == "d" && word(i-1) == "c"
            word = reduce(word,word(i-1:i))
        end
    end 
end
red_word = word
        
