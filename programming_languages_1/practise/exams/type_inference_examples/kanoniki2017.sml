fun foo x y z = z (y x + 1);
fun bar x y = x (bar y x);
fun doh x y z = z (x y) (y + 1);
fun ugh x y z = x z (y z);
