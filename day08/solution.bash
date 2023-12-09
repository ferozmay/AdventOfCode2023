#!bin/bash

declare -A lookup
data=$(<example.txt)
path=$(echo "$data" | sed '/^$/q')
data=$(echo "$data" | sed '1,/^$/d')

IFS=$'\n' read -r -d '' -a data <<< "$data"
for ds in "${data[@]}"; do
    IFS=" = " read -r key rest <<< "$ds"
    key=${key// /}
    values=${rest//[\(\)]/}
    IFS=', ' read -r left right <<< "$values"
    lookup["$key"]="$values"
done
curr="AAA"
i=0
c=0
while [ "$curr" != "ZZZ" ]; do
    next=${path:$i:1} 
    IFS=', ' read -r left right <<< "${lookup[$curr]}"
    if [ "$next" == "L" ]; then
        curr="$left"
    else
        curr="$right"
    fi
    i=$(( (i + 1) % ${#path} ))
    c=$((c + 1))
done

p1=$c
echo "Part 1: $p1"
