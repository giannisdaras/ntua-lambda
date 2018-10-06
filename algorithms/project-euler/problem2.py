summ=2
previous_2=1
previous_1=2
flag=True
while (flag):
	current=previous_1+previous_2
	if (current<=4000000):
		if (current%2==0):
			summ=summ+current
		previous_2=previous_1
		previous_1=current
	else:
		flag=False
print(summ)
