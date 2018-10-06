% Create a list containing all integers within a given range.
% Example:
% ?- range(4,9,L).
% L = [4,5,6,7,8,9]

range(IndexStart, IndexEnd, L) :- range_helper(IndexStart, IndexEnd, [], L).

range_helper(IndexEnd, IndexEnd, Accum, L) :-
  append(Accum, [IndexEnd], L).

range_helper(IndexStart, IndexEnd, Accum, L) :-
  NewIndexStart is IndexStart + 1,
  append(Accum, [IndexStart], NewAccum),
  range_helper(NewIndexStart, IndexEnd, NewAccum, L).
