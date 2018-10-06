% Duplicate the elements of a list a given number of times.
% Example:
% ?- dupli([a,b,c],3,X).
% X = [a,a,a,b,b,b,c,c,c]

duplicate_single(_, 0, Accum, Accum).
duplicate_single(Element, Times, Accum, Y) :-
  append(Accum, [Element], NewAccum),
  NewTimes is Times - 1,
  duplicate_single(Element, NewTimes, NewAccum, Y).

dupli(L, Times, Y) :- dupli_helper(L, Times, [], Y).
dupli_helper([], _, Accum, Accum).
dupli_helper([H|T], Times, Accum, Y) :-
  duplicate_single(H, Times, [], Duplicated),
  append(Accum, Duplicated, NewAccum),
  dupli_helper(T, Times, NewAccum, Y).
