cbal_tree(0, nil).
cbal_tree(N, t(x,L,R)) :-
    N > 0,
    N0 is N - 1,    % -1 to account for root node
    N1 is N0 div 2,
    N2 is N0 - N1,
    (N mod 2 =\= 0 -> permutation([N1,N2], [NLeft,NRight]) ;
                      [N1, N2] = [NLeft, NRight]),
    cbal_tree(NLeft, L),
    cbal_tree(NRight, R).
