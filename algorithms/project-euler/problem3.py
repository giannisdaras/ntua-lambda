index=3
maxim=0
n=600851475143
while (index<=775146):
	while (n % index ==0):
		n=n/index
		maxim=index
	index+=2

print(maxim)