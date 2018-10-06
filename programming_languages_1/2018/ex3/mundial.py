import sys
import itertools
class Team:
	def __init__(self, name, no_matches, goals_out, goals_in):
		self.name = name
		self.no_matches = no_matches
		self.goals_out = goals_out
		self.goals_in = goals_in
class State:
	def __init__(self, winners, losers, matches):
		self.winners = winners # more than one match left
		self.losers = losers # one match left
		self.matches = matches
		self.wrong = False
		for i in self.losers:
			if (i.goals_out >= i.goals_in):
				self.wrong = True
				break
		self.dead  = False # dead State can't give other matches
		if (len(self.winners) == 0 and len(self.losers) == 2):
			self.finished = 1
		else:
			self.finished = 0
		self.perms = itertools.permutations(self.winners,len(self.losers))

	def check_pair_validity(self, pair):
		flag = True
		for i in pair:
			x = i[0]
			y = i[1]
			x_new_out = x.goals_out - y.goals_in
			x_new_in = x.goals_in - y.goals_out
			# Rule 1.
			if (x_new_out < 0 or x_new_in < 0):
				flag = False
				break
			# Rule 2: αν δεν μπορεί να φάει άλλο γκολ και δεν είναι φιναλίστ,
			# πρόβλημα.
			elif (x_new_in == 0 and (x.name not in finalist_names)):
				flag = False
				break
			# Rule 3: αν δεν μπορεί να ξανανικήσει αλλά δεν είναι να
			# χάσει στον επόμενο γύρο, πρόβλημα.
			elif (x_new_out == 0  and x.no_matches > 2):
				flag = False
				break
		return flag


	def __call__(self):
		try:
			while(True):
				z = next(self.perms)
				k = list(zip(z, self.losers))
				if (self.check_pair_validity(k)):
					new_matches = self.matches
					new_winners = []
					new_losers = []
					for i in k:
						x = i[0]
						y = i[1]
						x_new = Team(x.name, x.no_matches, x.goals_out, x.goals_in)
						x_new.goals_in -= y.goals_out
						x_new.goals_out -= y.goals_in
						x_new.no_matches = x_new.no_matches - 1
						new_matches = new_matches + [[x_new.name,y.name,y.goals_in, y.goals_out]]
						if (x_new.no_matches == 1):
							new_losers.append(x_new)
						elif (x_new.no_matches > 1):
							new_winners.append(x_new)
					other_state = State(new_winners, new_losers, new_matches)
					return (other_state)
		except:
			self.dead = True
			return -1



losers = []
winners = []

file_name=sys.argv[1]
i=0
with open(file_name) as file_inst:
	for line in file_inst:
		if (i==0):
			N=(int)((line.rsplit())[0])
			i+=1
		else:
			line_fixed = line.rsplit()
			x = Team(line_fixed[0],(int) (line_fixed[1]), (int) (line_fixed[2]), (int) (line_fixed[3]))
			if (x.no_matches==1):
				losers.append(x)
			else:
				winners.append(x)
maxim = 0
finalist_names=[]
for i in winners:
	if (i.no_matches > maxim):
		maxim = i.no_matches
for i in winners:
	if (i.no_matches == maxim):
		finalist_names.append(i.name)
states = []
states.append(State(winners,losers,[]))
count=0
while ( len(states) > 0):
	# get the current state
	curr_state  = states.pop()
	# check if it is a final state
	if (curr_state.finished == 1):
		finalist1 = curr_state.losers[0]
		finalist2 = curr_state.losers[1]
		# check that it is a valid final game
		if (finalist1.goals_out == finalist2.goals_in and finalist1.goals_in == finalist2.goals_out and finalist1.goals_out!=finalist2.goals_out):
			finished_state = curr_state
			finished_state.matches = finished_state.matches + [[finalist1.name,finalist2.name, finalist1.goals_out, finalist1.goals_in]]
			break
	else:
		if (curr_state.wrong != True):
			x = curr_state()
			if (curr_state.dead != True):
				states.append(curr_state)
				states.append(x)

for k in finished_state.matches:
	print('{}-{} {}-{}'.format(k[0],k[1],k[2],k[3]))
