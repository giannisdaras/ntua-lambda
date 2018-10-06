% tree is nil or has the form t(X, LeftTree, RightTree)

istree(nil).
istree(t(_ ,Y,Z)) :- istree(Y), istree(Z).
