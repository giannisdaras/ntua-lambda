read_input(File,L) :-
    open(File,read,Stream),
    read_line_to_codes(Stream,First_Line),
    atom_codes(First_Atom,First_Line),
    atom_number(First_Atom,_),
    read_line_to_codes(Stream,Second_Line),
    atom_codes(Second_Atom,Second_Line),
    atomic_list_concat(Atoms, ' ', Second_Atom),
    maplist(atom_number, Atoms, L).

gcd(X, 0, X) :- !.
gcd(X,0,Z):- Z is X.
gcd(X,Y,Z):- P is X mod Y, gcd(Y,P,Z).

lcm(X,Y,Z):- gcd(X,Y,Gcder), Z is (X/Gcder)*Y.

left_lcms(X, Curr_lcm, Y):- left_lcms_helper(X, Curr_lcm, [], Y_rev),
reverse(Y_rev, Y).
left_lcms([],_,[]).

left_lcms_helper([], _, Accum, Accum).
left_lcms_helper([Head|Tail], Curr_lcm, Accum, Y):-
  lcm(Head, Curr_lcm, Out),
  left_lcms_helper(Tail, Out, [Out|Accum], Y).


right_lcms(X,Y):-
    reverse(X,X_rev),
    left_lcms(X_rev,1,Y_out),
    reverse(Y_out,Y).


lcms_without([],_,L):-L=[].
lcms_without(_,[],L):-L=[].
lcms_without([Head_left|Tail_left],[Head_right|Tail_right],L):-
    lcm(Head_left,Head_right,Out),
    lcms_without(Tail_left,Tail_right,P),
    append([Out],P,L).


index([Head|_], Element, Index):- Head is Element, Index is 1.
index([_|Tail], Element, Index):-
  index(Tail, Element, Index1),
  Index is Index1+1.



% Minimum function from StackOverflow: https://stackoverflow.com/questions/3965054/prolog-find-minimum-in-a-list
find_minim([L|Ls], Min) :- foldl(num_num_min, Ls, L, Min).
num_num_min(X, Y, Min) :- Min is min(X, Y).



minim(L,Min,Pos):- time(find_minim(L,Min)),index(L,Min,Pos).



solve(F,When,Missing):-
    read_input(F,Input),left_lcms(Input,1,Left),right_lcms(Input,[Lcm_All|Tail_right]), append([1],Left,L), append(Tail_right,[1],R),lcms_without(L,R,Lcms_without),minim(Lcms_without,When,Pos), (When is Lcm_All -> Missing is 0; Missing is Pos).

agora(F,When,Missing):- once(solve(F,When,Missing)).
