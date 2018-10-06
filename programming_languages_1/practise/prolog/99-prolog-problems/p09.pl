pack([],[]).
pack([H|T], Y) :- pack_helper(T, H, [H], [], Y).

pack_helper([], _, Sublist, Accum, Y) :- append(Accum, [Sublist], Y).
pack_helper([H|T], Prev, Sublist, Accum, Y):-
  (
  H = Prev ->
    append(Sublist, [H], NewSublist),
    pack_helper(T, Prev, NewSublist, Accum, Y)
  ) ;
    append(Accum, [Sublist], NewAccum),
    pack_helper(T, H, [H], NewAccum, Y).
