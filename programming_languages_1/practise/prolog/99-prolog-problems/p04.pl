% find the number of elements of a list


 % easy peasy
 sol1(L, X) :- length(L, X).

 sol2(L, X) :- sol2helper(L, 0, X).

 sol2helper([], X, X).
 sol2helper([_|T], Counter, X) :-
   NewCounter is Counter + 1,
   sol2helper(T, NewCounter, X).
