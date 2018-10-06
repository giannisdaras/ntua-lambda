with open("file8.in") as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content] 
maxim=0
how_many=13
L=len(content[0])
for i in content:
	current_line=list(i)
	indx=0
	while(indx+how_many-1<=L-1):
		current=1
		for k in range(indx,indx+how_many):
			current=current*int(current_line[k])
		if (current>maxim):
			maxim=current
		indx=indx+1
print(maxim)




