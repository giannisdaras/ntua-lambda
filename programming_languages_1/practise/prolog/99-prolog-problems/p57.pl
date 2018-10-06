% construct binary search tree

add_node(X, nil, t(X, nil, nil)).
add_node(X, t(Root, Left, Right), t(Root, NewLeft, NewRight)):-
  (X > Root ->
    NewLeft = Left,
    add_node(X, Right, NewRight)
    ;
    NewRight = Right,
    add_node(X, Left, NewLeft)
  ).


construct([Node|Nodes], T) :-
  construct_helper(Nodes, t(Node, nil, nil), T).

construct_helper([], T, T).
construct_helper([Node|Nodes], TAccum, T) :-
  add_node(Node, TAccum, NewTAccum),
  construct_helper(Nodes, NewTAccum, T).
