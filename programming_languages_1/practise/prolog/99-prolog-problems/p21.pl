% Insert an element at a given position into a list.
% Example:
% ?- insert_at(alfa,[a,b,c,d],2,L).
% L = [a,alfa,b,c,d]

% Indexing starts from 1
remove_at(RemovedElement, L, Index, Remainder) :-
  remove_at_helper(RemovedElement, L, Index, 1, [], Remainder).

remove_at_helper(H, [H|T], Index, Index, Accum, Remainder) :-
  append(Accum, T, Remainder).

remove_at_helper(RemovedElement, [H|T], Index, Counter, Accum, Remainder) :-
  append(Accum, [H], NewAccum),
  NewCounter is Counter + 1,
  remove_at_helper(RemovedElement, T, Index, NewCounter, NewAccum, Remainder).

insert_at(ElementToInsert, L, Position, Y) :-
  remove_at(ElementToInsert, Y, Position, L).
