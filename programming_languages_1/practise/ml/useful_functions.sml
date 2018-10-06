fun foo x = x + 1;
List.map foo [1,2,3];
fun boo x = if (x mod 2 = 1) then false else true;
List.filter boo [1,2,3];

fun goo (x,y) = x + y;
fun zoo (x,y) = x - y;
List.foldl goo 0 [1,2,3,4];
List.foldr zoo 0 [1,2,3,4];
List.foldl zoo 0 [1,2,3,4];


List.partition boo [1,2,3,4];
