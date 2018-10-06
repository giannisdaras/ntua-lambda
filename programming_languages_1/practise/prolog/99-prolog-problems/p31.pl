% Determine whether a given integer number is prime.
% Example:
% ?- is_prime(7).
% Yes
range(IndexStart, IndexEnd, L) :- range_helper(IndexStart, IndexEnd, [], L).

range_helper(IndexEnd, IndexEnd, Accum, L) :-
  append(Accum, [IndexEnd], L).

range_helper(IndexStart, IndexEnd, Accum, L) :-
  NewIndexStart is IndexStart + 1,
  append(Accum, [IndexStart], NewAccum),
  range_helper(NewIndexStart, IndexEnd, NewAccum, L).
% TODO
