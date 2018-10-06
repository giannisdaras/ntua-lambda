mirror(nil, nil).
mirror(t(_, Left1, Right1), t(_, Left2, Right2)):-
    mirror(Left1, Left2), mirror(Right1, Right2).


symmetric(t(_, Left, Right)) :- mirror(Left, Right).
