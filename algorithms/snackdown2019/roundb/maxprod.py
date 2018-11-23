import argparse
import math
import random
from datetime import datetime
my_seed = random.seed(datetime.now())
random.seed(my_seed)
def accel_asc(n):
    a = [0 for i in range(n + 1)]
    k = 1
    y = n - 1
    while k != 0:
        x = a[k - 1] + 1
        k -= 1
        while 2 * x <= y:
            a[k] = x
            y -= x
            k += 1
        l = k + 1
        while x <= y:
            a[k] = x
            a[l] = y
            yield a[:k + 2]
            x += 1
            y -= 1
        a[k] = x + y
        y = x + y - 1
        yield a[:k + 1]

parser = argparse.ArgumentParser(description="Dummy parser")
parser.add_argument('number', type=int)
parser.add_argument('parts', type=int)
args = parser.parse_args()
number = args.number
parts = args.parts
for k in range(1):
    maxim = -math.inf
    max_list = []
    # number = random.randint(10, 60)
    # parts = random.randint(3, math.floor(math.sqrt(number) + 2))
    print("Testcase {}. Number: {}, Parts: {}".format(k, number, parts))
    for i in accel_asc(number):
        if (len(i) == parts and len(set(i)) == len(i)):
            my_list = [x**2 - x for x in i]
            curr_prod = 1
            for j in my_list:
                curr_prod = curr_prod * j
            if (curr_prod > maxim):
                maxim = curr_prod
                max_list = i
    # if (maxim !=0 and max_list != []):
    #     count = 0
    #     for i in range(1, parts):
    #         if (max_list[i] - max_list[i-1] > 1):
    #             count +=1
    #     if (count > 1):
    #         print(max_list)
    print(maxim)
    print(max_list)
