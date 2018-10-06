% Get a slice from a list.
split(L, Counter, L1, L2) :- split_helper(L, Counter, [], L1, L2).
split_helper(L, 0, Accum, Accum, L).
split_helper([], _, _, _, _) :- false.
split_helper([H|T], Counter, Accum, L1, L2) :-
  append(Accum, [H], NewAccum),
  NewCounter is Counter - 1,
  split_helper(T, NewCounter, NewAccum, L1, L2).


slice(L, IndexStart, IndexEnd, Y) :-
  FirstSplit is IndexStart - 1,
  split(L, FirstSplit, _, L2),
  Interval is IndexEnd - IndexStart + 1,
  split(L2, Interval, Y,  _).
