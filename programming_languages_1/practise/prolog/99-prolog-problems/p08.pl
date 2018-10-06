% Eliminate consecutive duplicates of list elements
compress([], []).
compress([H|T], Y) :- compress_helper(T, H, [H], Y).


compress_helper([], _, Accum, Accum).
compress_helper([H|T], Prev, Accum, Y) :-
  (
    \=(H, Prev) -> append(Accum, [H], NewAccum), compress_helper(T, H, NewAccum, Y)
  ) ;
  compress_helper(T, Prev, Accum, Y).
