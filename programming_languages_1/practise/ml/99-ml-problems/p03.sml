(* Find the k'th element of a list. (easy) *)
fun at [] _ = NONE |
at (h::_) 1 = SOME(h) |
at (_::t) k = at t (k-1);
