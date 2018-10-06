def check_if_palindrome (list_a):
	flag=True
	L=len(list_a)
	index_left=0
	index_right=L-1
	while (index_left<L):
		if (list_a[index_left]!=list_a[index_right]):
			flag=False
			index_left=L+1
		else:
			index_left+=1
			index_right-=1
	return flag

maxim=0


for i in range(100,1000):
	for j in range(100,1000):
		current=i*j
		if (current>maxim):
			if (check_if_palindrome (list(str(current)) ) ):
				maxim=current
print(maxim)


