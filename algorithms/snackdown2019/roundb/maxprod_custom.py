import math
import random
T = int(input())
# T = 1000
p = 10**9 + 7
for t in range(T):
    starts = []
    solutions = []
    [N, K] = [int(x) for x in input().split(' ')]
    # N = random.randint(5, 10**9)
    # K = random.randint(5, min(10**4, N))
    min_start = math.floor(N/K - K/2)
    starts.append(min_start)
    starts.append(min_start + 1)
    # starts.append(min_start - 1)
    best_result = -1
    best_start = -1
    for start in starts:
        if (start <=0):
            result = -1
        else:
            max_elem = start + K
            initial_list = [i for i in range(start, max_elem + 1)]
            summ = sum(initial_list)
            if (summ < N):
                result = -1
            elif (summ == N):
                result = 0
            else:
                diff = summ - N
                if (diff > max_elem):
                    result = -1
                else:
                    numbers = []
                    for i in range(start, max_elem + 1):
                        if (i!=diff):
                            numbers.append(i)
                    numbers_sum = sum(numbers)
                    if (numbers_sum != N):
                        result = -1
                    else:
                        mult_list = [ (i**2 - i) % p for i in numbers]
                        result = 1
                        for i in mult_list:
                            result = ( (result % p) * (i % p) ) % p
            if (result > best_result):
                best_result = result
                best_start = start
    print(best_result)
