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


encode([], []).
encode(L, Y) :- pack(L, X), encode_helper(X, [], Y).
encode_helper([], Accum, Accum).
encode_helper([H|T], Accum, Y) :-
  length(H, N), H = [Head|_],
  append(Accum, [[N, Head]], NewAccum),
  encode_helper(T, NewAccum, Y).
