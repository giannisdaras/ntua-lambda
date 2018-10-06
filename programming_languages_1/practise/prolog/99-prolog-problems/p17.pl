% Split the list into two parts, the length of the first part is given.
split(L, Counter, L1, L2) :- split_helper(L, Counter, [], L1, L2).
split_helper(L, 0, Accum, Accum, L).
split_helper([], _, _, _, _) :- false.
split_helper([H|T], Counter, Accum, L1, L2) :-
  append(Accum, [H], NewAccum),
  NewCounter is Counter - 1,
  split_helper(T, NewCounter, NewAccum, L1, L2).
