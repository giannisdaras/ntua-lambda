T = int(input())
for t in range(T):
    N = int(input())
    arr = [int(x) for x in input().split(' ')]
    index = 0
    step = arr[0]
    days = 0
    while (index <= N -1):
        index = index + step
        days += 1
        to_add = 0
        for i in range(index, min(index+step, N)):
            to_add += arr[i]
        step += to_add
    print(days)
