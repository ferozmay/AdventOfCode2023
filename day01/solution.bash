#!bin/bash

p1=0;
p2=0;
for line in `cat input.txt`; do 
    # Part 1
    num1=$(echo $line | grep -op '\d' | sed -n '1p;$p' | tr -d '\n')
    p1=$((p1 + num1));
    # Part 2 (Fixed bug by adding global replacement! May still contain another bug)
    l2=$(echo $line | sed -e 's/one/o1ne/g;s/two/t2wo/g;s/three/t3hree/g;s/four/f4our/g;s/five/f5ive/g;s/six/s6ix/g;s/seven/s7even/g;s/eight/e8ight/g;s/nine/n9ine/g')
    num2=$(echo $l2 | grep -op '\d' | sed -n '1p;$p' | tr -d '\n')
    p2=$((p2 + num2));
done

echo "Part 1: ${p1}";
echo "Part 2: ${p2}";
