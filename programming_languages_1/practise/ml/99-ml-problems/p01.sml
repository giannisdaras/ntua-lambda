(* Write a function last : 'a list -> 'a option that returns the last element of a list. (easy) *)
fun last nil = NONE
  | last (h::nil) =
  let
    val y = SOME h
  in
    y
  end
  | last (_::t) = last t;
