% Drop every N'th element from a list.
% Example:
% ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
% X = [a,b,d,e,g,h,k]


drop(L, Step, Y) :- drop_helper(L, Step, 1, [], Y).

drop_helper([], _, _, Accum, Accum).
drop_helper([_|T], Step, Step, Accum, Y) :- drop_helper(T, Step, 1, Accum, Y).
drop_helper([H|T], Step, CurrStep, Accum, Y) :-
  append(Accum, [H], NewAccum),
  NewCurrStep is CurrStep + 1,
  drop_helper(T, Step, NewCurrStep, NewAccum, Y).
