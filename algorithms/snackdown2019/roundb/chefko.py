from operator import itemgetter
import math
from collections import defaultdict
from bisect import bisect


T = int(input())

for i in range(T):
    [N, K] = [int(x) for x in input().split(' ')]
    max_range = - math.inf
    intervals = []
    starts = []
    ends = []
    for i in range(N):
        [start, end] = [int(x) for x in input().split(' ')]
        if (end - start > max_range):
            max_range = end - start
        intervals.append([start, end])
        starts.append(start)
        ends.append(end)
    starts.sort()
    ends.sort()
    flag = True
    left = 0
    right = max_range
    best_found = 0
    while ( left >= 0 and right >= 0 and left<=right):
        middle = (left + right) // 2
        print("Left: {}, Right: {}, New middle: {}". format(left, right, middle))
        # print('')
        found = False
        for i in intervals:
            curr_start = i[0]
            curr_end = curr_start + middle
            if (curr_start < curr_end):
                print("Mikos:{}, Arxi: {}".format(middle, curr_start))
                left_counted = bisect(starts, curr_start)
                right_counted = N - bisect(ends, curr_end - 1)
                total_inside = left_counted + right_counted - N
                print('Left: {}, Right: {}, Total inside: {}'.format(left_counted, right_counted, total_inside))
                if (total_inside >= K):
                    if (middle > best_found):
                        best_found = middle
                    left = middle + 1
                    found = True
                    break
        if (found == False):
            right = middle - 1
        # print(' ')
    print(best_found)
