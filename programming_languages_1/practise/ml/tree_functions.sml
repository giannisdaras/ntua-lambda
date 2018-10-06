datatype tree = Lf | Br of tree*int*tree;

fun insert value Lf = Br (Lf, value, Lf)
|   insert value Br(Tree1, Root, Tree2)
