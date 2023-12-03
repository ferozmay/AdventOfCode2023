
data = [l.strip() for l in open("input.txt")]
p = {'red':12, 'green':13, 'blue':14}
p1 = 0
p2 = 0
for l in data:
    game_id, bag = l.split(':')
    cubes = bag.split(';')
    sets = [c.strip().split(', ') for c in cubes]
    poss = True
    m = {'red':0, 'green':0, 'blue':0}
    for S in sets:
        for cube in S:
            n, colour = cube.split()
            if int(n) > p[colour]:
                poss = False
            if int(n) > m[colour]:
                m[colour] = int(n)

    sum = int(m['red']) * int(m['green']) * int(m['blue'])
    p2+=sum
        
    if poss:
        p1 += int(game_id.split()[-1])

print("Part 1:", p1)
print("Part 2:", p2)