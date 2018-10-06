def lcm(a,b):
	if (a<b):
		tmp=a
		a=b
		b=tmp

	a_copy=a
	b_copy=b
	while (b>0):
		tmp=a
		a=b
		b=tmp % b

	return ( a_copy/a * b_copy )



current_lcm=2
for i in range(1,21):
	current_lcm=lcm(current_lcm,i)
print(current_lcm)