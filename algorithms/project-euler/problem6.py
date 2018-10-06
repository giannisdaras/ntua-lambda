n=100
sum1=0
sum2=0
for i in range(n+1):
	sum1+=i**2
	sum2+=i
print(sum2**2 - sum1)