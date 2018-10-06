% Find the Kth element of a list.

% Easy way
sol1(K, L, X):- nth0(K, L, X).

sol2(K, L, X):- sol2helper(K, 0, L, X).
sol2helper(_, _, [], _):- false.
sol2helper(K, K, [H|_], H).
sol2helper(K, Counter, [_|T], X) :-
  NewCounter is Counter + 1,
  sol2helper(K, NewCounter, T, X).
