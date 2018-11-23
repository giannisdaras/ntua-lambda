import math
T = int(input())
times = []
people = []
for t in range(T):
    [N, M, K, L] = [int(x) for x in input().split(' ')]
    A = [int(x) for x in input().split(' ')]
    curr_people = M
    prev_kontinotero_pollaplasio = 0
    A.sort()
    best_time = math.inf
    for i in (A + [K]):
        kontinotero_pollaplasio = i - (i % L)
        posoi_efigan = max(0, (kontinotero_pollaplasio - prev_kontinotero_pollaplasio) // L )
        people_now = curr_people - posoi_efigan
        next_leave = kontinotero_pollaplasio + L
        time_left = (next_leave - i) + people_now * L
        times.append(time_left)
        people.append(people_now)
        if (time_left < best_time):
            best_time = time_left
        curr_people += 1
    print(best_time)
