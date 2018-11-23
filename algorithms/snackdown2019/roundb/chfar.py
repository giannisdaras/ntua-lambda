T = int(input())
for i in range(T):
    [N, K] = [int(x) for x in input().split(' ')]
    seq = [int(x) for x in input().split(' ')]
    count = 0
    for i in seq:
        if (i != 1):
            count +=1
    if (count > K):
        print('NO')
    else:
        print('YES')
