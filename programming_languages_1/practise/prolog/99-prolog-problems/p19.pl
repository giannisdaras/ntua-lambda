% Rotate a list N places to the left

split(L, Counter, L1, L2) :- split_helper(L, Counter, [], L1, L2).
split_helper(L, 0, Accum, Accum, L).
split_helper([], _, _, _, _) :- false.
split_helper([H|T], Counter, Accum, L1, L2) :-
  append(Accum, [H], NewAccum),
  NewCounter is Counter - 1,
  split_helper(T, NewCounter, NewAccum, L1, L2).

rotate(L, N, Y) :-
  (
    N > 0 ->
      Length is N
    ;
      length(L, ListLength),
      Length is ListLength + N
  ),
  split(L, Length, L1, L2),
  append(L2, L1, Y).
