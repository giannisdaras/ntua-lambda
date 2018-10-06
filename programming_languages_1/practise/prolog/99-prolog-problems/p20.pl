% Remove the K'th element from a list.
% Example:
% ?- remove_at(X,[a,b,c,d],2,R).
% X = b
% R = [a,c,d]

% Indexing starts from 1
remove_at(RemovedElement, L, Index, Remainder) :-
  remove_at_helper(RemovedElement, L, Index, 1, [], Remainder).

remove_at_helper(H, [H|T], Index, Index, Accum, Remainder) :-
  append(Accum, T, Remainder).

remove_at_helper(RemovedElement, [H|T], Index, Counter, Accum, Remainder) :-
  append(Accum, [H], NewAccum),
  NewCounter is Counter + 1,
  remove_at_helper(RemovedElement, T, Index, NewCounter, NewAccum, Remainder).
