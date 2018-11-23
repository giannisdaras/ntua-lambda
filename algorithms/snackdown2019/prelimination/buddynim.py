T = int(input())
for t in range(T):
    [N, M] = [int(x) for x in input().split(' ')]
    alice = [int(x) for x in input().split(' ')]
    bob = [int(x) for x in input().split(' ')]
    alice_sum = sum(alice)
    bob_sum = sum(bob)
    if (alice_sum == bob_sum and alice_sum == 1 and bob_sum == 1):
        print('Bob')
    elif (abs(alice_sum - bob_sum) == 1 or alice_sum >= bob_sum):
        print('Alice')
