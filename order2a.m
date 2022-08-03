alpha = 'abxy'; %2 generator set
length_word = 6; num_words = 1;
iter_words = 1:8;
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

        parity_mat

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
            elseif word(i) == "y"
                nn = append(nn,'y');
                nn1(k) = "y";
            end
        end

        for i = 1:length(word)
            if word(k) == "m"
                nn = append(nn,'m');
                nn1(k) = 'm';
            elseif word(k) == "n"
                nn = append(nn,'n');
                nn1(k) = "n";
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

samples = 1000
length = 1

mu = .23;
sigma = .25;
L = length(iter_words);
Rmat=nan(L,samples);
pdfNormalCd = normpdf(iter_words, mu, sigma)

for i = 1:samples
    R=normrnd(mu,sigma,[L,1]);
    Rmat(:,i)=R;
end
    
Rmat

hold on
plot(iter_words,num_reduced)
plot(iter_words,num_bad)
hold off

