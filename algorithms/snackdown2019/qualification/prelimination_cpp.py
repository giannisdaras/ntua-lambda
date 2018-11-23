import heapq
T=int(input())
for j in range (T):
	X=input().split()
	N=int(X[0])
	K=int(X[1])
	S1=input().split()
	S=[int(x) for x in S1]
	H=S[0:K]
	heapq.heapify(H)
	for i in range(K,len(S)):
		if (S[i]>H[0]):
			heapq.heapreplace(H,S[i])
	print(K+S.count(H[0])-H.count(H[0]))
