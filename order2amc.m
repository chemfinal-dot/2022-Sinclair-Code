alpha = 'abxy'; %2 generator set
length_word = 1:40; num_words = 1;
iter_words = [samples(length_word)];
num_reduced = zeros(1,length(iter_words));
num_bad = zeros(1,length(iter_words));
num_red_word = 0;
num_bad_strings = 0; %does not pass parity
num_irred = 0;
num_irred_array = zeros(1,length(iter_words));
inst = 0;
gb = -1; %good or bad for repeated letters


for m = length_word
    for i = 1:length(iter_words)
        for j = 1:iter_words(i)
            %% code to reduce and reorder EACH word
            word = split(convertCharsToStrings(alpha(randi(numel(alpha),num_words,length_word(m)))),"")'; %consecutive letters are inverses of each other
            gb = check_word(word);
            if gb == 0
                num_bad_strings = num_bad_strings+1;
                word = split(convertCharsToStrings(alpha(randi(numel(alpha),num_words,length_word(m)))),"")';
                gb = check_word(word);
            end
            num_bad(m) = num_bad_strings + num_bad_strings;
            if gb == 1
                red_word = "";
                temp_char = "";
                steps = 0;

                parity_mat = zeros(2,1);
                new_word = word;
                insert = @(a, x)cat(2,  x(1:length(word)));

                for k = 1:length(word)
                    if word(k) == "a"
                        parity_mat(1) = parity_mat(1)+1;
                    elseif word(k) == "b"
                        parity_mat(1) = parity_mat(1)-1;

                    elseif word(k) == "x"
                        parity_mat(2) = parity_mat(2)+1;
                    elseif word(k) == "y"
                        parity_mat(2) = parity_mat(2)-1;
                    end
                end 

                parity_mat;

                nn = ""
                nn1 = zeros(size(word));

                for k = 1:length(word)
                    if word(k) == "a"
                        nn = append(nn,"a");
                        nn1(k) = 'a';
                    elseif word(k) == "b"
                        nn = append(nn,"b");
                        nn1(k) = 'b';
                    end
                end

                for k = 1:length(word)
                    if word(k) == "x"
                        nn = append(nn,'x');
                        nn1(k) = 'x';
                    elseif word(k) == "y"
                        nn = append(nn,'y');
                        nn1(k) = "y";
                    end
                end

                nn;
                red_word = nn;

                if parity_mat == zeros(size(parity_mat))
                    while red_word ~= ""
                        if contains(red_word,'ab')
                            red_word = replace(red_word,'ab',' ');
                            inst = count(red_word,' ');
                            red_word = strrep(red_word, ' ', '');
                            steps = steps+1;
                        end
                        if contains(red_word,'ba')
                            red_word = replace(red_word,'ba',' ');
                            inst = inst + count(red_word,' ');
                            red_word = strrep(red_word, ' ', '');
                            steps = steps+1;
                        end
                        if contains(red_word,'xy')
                            red_word = replace(red_word,'xy',' ');
                            inst = inst + count(red_word,' ');
                            red_word = strrep(red_word, ' ', '');
                            steps = steps+1;
                        end
                        if contains(red_word,'yx')
                            red_word = replace(red_word,'yx',' ');
                            inst = inst + count(red_word,' ');
                            red_word = strrep(red_word, ' ', '');
                            steps = steps+1;
                        end
                        %
                    end
                    if red_word == ""
                            num_red_word = num_red_word+1;
                    elseif red_word ~= ""
                            display("bad word passed parity: " + red_word)
                            num_bad_strings = num_bad_strings+1;
                    end
                else
                    display("bad word failed parity: " + red_word)
                    num_bad_strings = num_bad_strings+1;
                end
                %
            end
        end
    end
    num_reduced(m) = num_red_word;
    num_red_word = 0;
    num_bad(m) = num_bad_strings;
    num_bad_strings = 0;
    num_irred_array(m) = num_irred;
    num_irred = 0;
end
figure(1)
hold on
plot(num_bad)
hold off

function iterations = samples(length_word)
    iterations = 1000*ceil(log(length_word))
end

function check = check_word(given_word)
    for i = 1:length(given_word)
        if i ~= length(given_word)
            if given_word(i) == given_word(i+1)
                check = 0; %bad
            else
                check = 1; %good
            end 
        end
    end
end
