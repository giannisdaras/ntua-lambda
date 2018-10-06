% Duplicate the elements of a list.
% Example:
% ?- dupli([a,b,c,c,d],X).
% X = [a,a,b,b,c,c,c,c,d,d]

dupli(L, Y) :- dupli_helper(L, [], Y).
dupli_helper([], Accum, Accum).
dupli_helper([H|T], Accum, Y) :-
  append(Accum, [H,H], NewAccum),
  dupli_helper(T, NewAccum, Y).
