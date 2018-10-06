 (* Find the last but one (last and penultimate) elements of a list. (easy) *)
fun last_two(x) =
 case x of
   nil => NONE |
   (h::nil) => NONE |
   (h::_::nil) => SOME(h) |
   (_::t) => last_two(t);
