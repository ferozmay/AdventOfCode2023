#!bin/bash

p1=0;
p2=0;
for line in `cat input.txt`; do 
    # Part 1
    num1=$(echo $line | grep -op '\d' | sed -n '1p;$p' | tr -d '\n')
    p1=$((p1 + num1));
    # Part 2 (may contain a bug!)
    l2=$(echo $line | sed -e 's/one/o1ne/;s/two/t2wo/;s/three/t3hree/;s/four/f4our/;s/five/f5ive/;s/six/s6ix/;s/seven/s7even/;s/eight/e8ight/;s/nine/n9ine/')
    num2=$(echo $l2 | grep -op '\d' | sed -n '1p;$p' | tr -d '\n')
    p2=$((p2 + num2));
done

echo "Part 1: ${p1}";
echo "Part 2: ${p2}";
