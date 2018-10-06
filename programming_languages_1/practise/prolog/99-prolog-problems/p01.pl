% Find the last element of a list.
% Example:
% ?- my_last(X,[a,b,c,d]).
% X = d

my_last([], _) :- false.
my_last([H], X).
my_last([_|L], H):- my_last(L, H).
