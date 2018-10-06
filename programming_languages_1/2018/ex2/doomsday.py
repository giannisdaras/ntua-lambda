import sys

def getNeighbors(grid,i,j):
	neighbors=[]
	if (grid[i-1][j]!='X'):
		neighbors.append([i-1,j])
	if (grid[i+1][j]!='X'):
		neighbors.append([i+1,j])
	if (grid[i][j-1]!='X'):
		neighbors.append([i,j-1])
	if (grid[i][j+1]!='X'):
		neighbors.append([i,j+1])
	return neighbors

filename=sys.argv[1]
grid=[]
with open(filename) as fileinst:
	for line in fileinst:
		grid.append(['X']+ list(line.rstrip())+['X'])
N=len(grid)
M=len(grid[0])-2
tmp=['X' for x in range(M+2)]
grid.append(tmp)
grid.insert(0,tmp)
last_updated=[]
last_updated_new=[]
for i in range(1,N+1):
	for j in range(1,M+1):
		if (grid[i][j]=='+' or grid[i][j]=='-'):
			last_updated.append([i,j])
flagEnd=False
flagQueue=True
counter=0
while ( (not flagEnd) and flagQueue):
	counter+=1
	last_updated_new=[]
	to_update=[]
	flagQueue=False
	while(last_updated):
		curr=last_updated.pop()
		currI=curr[0]
		currJ=curr[1]
		symbol=grid[currI][currJ]
		for i in getNeighbors(grid,currI,currJ):
			neighI=i[0]
			neighJ=i[1]
			neighSymb=grid[neighI][neighJ]
			if (neighSymb=='.'):
				grid[neighI][neighJ]=symbol
				last_updated_new.append([neighI,neighJ])
				flagQueue=True
			elif (neighSymb!=symbol):
				flagEnd=True
				to_update.append([neighI,neighJ])
	while (to_update):
		curr=to_update.pop()
		grid[curr[0]][curr[1]]='*'
	last_updated=last_updated_new
if (flagEnd==False):
	print("the world is saved")
else:
	print(counter)

for i in range(1,N+1):
	for j in range(1,M+1):
		print(grid[i][j],end='')
	print()




