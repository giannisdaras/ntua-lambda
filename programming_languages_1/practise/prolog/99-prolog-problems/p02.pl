%  Find the last but one element of a list
 last_but_one([], _) :- false.
 last_but_one([_], _) :- false.
 last_but_one([H,_], H).
 last_but_one([_|T], X) :- last_but_one(T, X).

 
