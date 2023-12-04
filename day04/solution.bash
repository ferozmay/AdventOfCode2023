#!bin/bash

p1=0
len=$(($(wc -l < input.txt) + 1))
cards=($(yes 1 | head -n $len))
i=0
while read -r line; do
    # Part 1
    left=$(echo "$line" | awk -F"[:|]" '{printf $2}' | tr ' ' '\n')
    right=$(echo "$line" | awk -F"[:|]" '{printf $3}' | tr ' ' '\n')
    common=$(comm -12 <(echo "$left"| sort) <(echo "$right" | sort) | wc -w)
    if ((common));then
        p1=$((p1 + 2 ** (common-1)))
    fi;
    # Part 2
    for ((j=0; j<common; j++)); do
        ((cards[$((i+j+1))]+=cards[$i]))
    done
    ((i++))
done < input.txt

p2=$(echo "${cards[@]}" | tr ' ' '+' | bc)

echo "Part 1: $p1";
echo "Part 2: $p2";
