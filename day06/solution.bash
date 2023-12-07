#!bin/bash

f="input.txt"

read -ra times <<< $(awk '/Time:/ {for (i=2; i<=NF; i++) printf "%s ", $i}' $f)
read -ra dist <<< $(awk '/Distance:/ {for (i=2; i<=NF; i++) printf "%s ", $i}' $f)

# Part 1
p1=1
for ((i=0; i<${#times[@]}; i++)); do
    time=${times[i]}
    wins=0
    for ((dt=0; dt<time; dt++)); do
        dx=$((dt * (time - dt)))
        if ((dx > dist[i])); then
            ((wins++))
        fi
    done
    ((p1 *= wins))
done

# Part 2 (Cannot brute force so take difference quadratic roots)
t=`echo ${times[*]} | tr -d " "`
d=`echo ${dist[*]} | tr -d " "`
r1=$(bc -l <<< "scale=0; ($t + sqrt($t^2 - 4 * $d))/2")
r2=$(bc -l <<< "scale=0; ($t - sqrt($t^2 - 4 * $d))/2")
p2=$((r1 - r2))

echo "Part 1: $p1"
echo "Part 2: $p2"


