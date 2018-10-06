from collections import defaultdict
letters=defaultdict(lambda: 1)
letters["A"]=1
letters["B"]=2
letters["C"]=3
letters["D"]=4
letters["E"]=5
letters["F"]=6
letters["G"]=7
letters["H"]=8
letters["I"]=9
letters["J"]=10
letters["K"]=11
letters["L"]=12
letters["M"]=13
letters["N"]=14
letters["O"]=15
letters["P"]=16
letters["Q"]=17
letters["R"]=18
letters["S"]=19
letters["T"]=20
letters["U"]=21
letters["V"]=22
letters["W"]=23
letters["X"]=24
letters["Y"]=25
letters["Z"]=26

my_file=open("file22.in")
inp=my_file.read().split(",")
inp.sort()
summ=0
counter=1
for i in inp:
	my_contribution=0
	for j in i:
		my_contribution+=letters[j]
	my_contribution=my_contribution*counter
	summ+=my_contribution
	counter+=1
print(summ) 
