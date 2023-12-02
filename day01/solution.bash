#!bin/bash

p1=0;
for line in `cat input.txt`; do 
    num=$(echo $line | grep -op '\d' | sed -n '1p;$p' | tr -d '\n')
    p1=$((p1 + num));
done

echo "Part 1: ${p1}";
