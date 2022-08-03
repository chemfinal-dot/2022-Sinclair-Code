alpha = 'abxymnfgpqst'; %6 generator set
length_word = 6; num_words = 1;
iter_words = 98:100;
num_reduced = zeros(1,length(iter_words));
num_bad = zeros(1,length(iter_words));
num_red_word = 0;
num_bad_strings = 0;
inst = 0;

for i = 1:length(iter_words)
    for j = 1:iter_words(i)
        %% code to reduce and reorder EACH word
        word = split(convertCharsToStrings(alpha(randi(numel(alpha),num_words,length_word))),"")' %consecutive letters are inverses of each other;
        red_word = "";
        temp_char = "";
        steps = 0;

        parity_mat = zeros(6,1);
        new_word = word;
        insert = @(a, x)cat(2,  x(1:length(word)));

        for i = 1:length(word)
            if word(i) == "a"
                parity_mat(1) = parity_mat(1)+1;
            elseif word(i) == "b"
                parity_mat(1) = parity_mat(1)-1;

            elseif word(i) == "x"
                parity_mat(2) = parity_mat(2)+1;
            elseif word(i) == "y"
                parity_mat(2) = parity_mat(2)-1;

            elseif word(i) == "m"
                parity_mat(3) = parity_mat(2)+1;
            elseif word(i) == "n"
                parity_mat(3) = parity_mat(2)-1;

            elseif word(i) == "f"
                parity_mat(4) = parity_mat(2)+1;
            elseif word(i) == "g"
                parity_mat(4) = parity_mat(2)-1;

            elseif word(i) == "p"
                parity_mat(5) = parity_mat(2)+1;
            elseif word(i) == "q"
                parity_mat(5) = parity_mat(2)-1;

            elseif word(i) == "s"
                parity_mat(6) = parity_mat(2)+1;
            elseif word(i) == "t"
                parity_mat(6) = parity_mat(2)-1;
            end
        end 

        parity_mat

        nn = ""
        nn1 = zeros(size(word));

        for i = 1:length(word)
            if word(i) == "a"
                nn = append(nn,"a");
                nn1(i) = 'a';
            elseif word(i) == "b"
                nn = append(nn,"b");
                nn1(i) = 'b';
            end
        end

        for i = 1:length(word)
            if word(i) == "x"
                nn = append(nn,'x');
                nn1(i) = 'x';
            elseif word(i) == "y"
                nn = append(nn,'y');
                nn1(i) = "y";
            end
        end

        for i = 1:length(word)
            if word(i) == "m"
                nn = append(nn,'m');
                nn1(i) = 'm';
            elseif word(i) == "n"
                nn = append(nn,'n');
                nn1(i) = "n";
            end
        end

        for i = 1:length(word)
            if word(i) == "f"
                nn = append(nn,'f');
                nn1(i) = 'f';
            elseif word(i) == "g"
                nn = append(nn,'g');
                nn1(i) = "g";
            end
        end

        for i = 1:length(word)
            if word(i) == "p"
                nn = append(nn,'p');
                nn1(i) = 'p';
            elseif word(i) == "q"
                nn = append(nn,'q');
                nn1(i) = "q";
            end
        end

        for i = 1:length(word)
            if word(i) == "s"
                nn = append(nn,'s');
                nn1(i) = 's';
            elseif word(i) == "t"
                nn = append(nn,'t');
                nn1(i) = "t";
            end
        end

        nn
        red_word = nn

        if parity_mat == zeros(size(parity_mat))
            while red_word ~= "" && steps <= 10
                if contains(red_word,'ab')
                    red_word = replace(red_word,'ab',' ')
                    inst = count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'ba')
                    red_word = replace(red_word,'ba',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'xy')
                    red_word = replace(red_word,'xy',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'yx')
                    red_word = replace(red_word,'yx',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'mn')
                    red_word = replace(red_word,'mn',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'nm')
                    red_word = replace(red_word,'nm',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'fg')
                    red_word = replace(red_word,'gf',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'gf')
                    red_word = replace(red_word,'yx',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'pq')
                    red_word = replace(red_word,'pq',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'qp')
                    red_word = replace(red_word,'qp',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'st')
                    red_word = replace(red_word,'st',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if contains(red_word,'ts')
                    red_word = replace(red_word,'ts',' ')
                    inst = inst + count(red_word,' ')
                    red_word = strrep(red_word, ' ', '')
                    steps = steps+1
                end
                if red_word == ""
                    num_red_word = num_red_word+1
                end
            end
        elseif parity_mat ~= zeros(size(parity_mat))     
            num_bad_strings = num_bad_strings+1
        end
        num_reduced(i) = num_red_word;
        num_bad(i) = num_bad_strings
    end
end
hold on
plot(iter_words,num_reduced)
plot(iter_words,num_bad)
hold off
