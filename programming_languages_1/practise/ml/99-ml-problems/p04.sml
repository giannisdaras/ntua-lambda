fun length x =
  let
    fun length_helper nil counter = counter |
        length_helper (h::t) counter = length_helper t counter+1
  in
    length_helper x 0
  end;
