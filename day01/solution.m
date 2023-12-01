f = fopen('input.txt', 'r');

part1 = 0;
part2 = 0;
words = {'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'};

line = fgetl(f);
while ischar(line)        
    % Part 1
    p1_digits = regexp(line, '\d', 'match');
    num1 = cellfun(@str2double, p1_digits);
    res1 = num1(1) * 10 + num1(end);
    part1 = part1 + res1;
   
    % Part 2
    p2_digits = {};
    for i = 1:strlength(line)
        if isstrprop(line(i), 'digit')
            p2_digits{end+1} = line(i);
        end
        for j = 1:length(words)
            val = words{j};
            if startsWith(line(i:end), val)
                p2_digits{end+1} = num2str(j);
            end
        end
    end
    num2 = cellfun(@str2double, p2_digits);
    res2 = num2(1) * 10 + num2(end);
    part2 = part2 + res2;

    line = fgetl(f);
end

fprintf('Part 1: %d\n', part1);
fprintf('Part 2: %d\n', part2);

fclose(f);
