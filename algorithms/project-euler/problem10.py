n=2000000
my_list=[i for i in range(2,n)]
flags=[False for i in range(2,n)]
summ=0

for i in range(n-2):
	if (flags[i]==False):
		index=2
		my_val=my_list[i]
		summ+=my_val
		while (index*my_val<n):
			flags[index*my_val-2]=True
			index+=1

print(summ)

