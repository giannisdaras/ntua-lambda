import sys
def check (a,b):
	return (1000*(a+b)-a*b==500000)

for i in range(1000):
	for j in range(1000):
		c=1000-i-j
		if (check(i,j) and c>i and c>j):
			print(i*j*c)