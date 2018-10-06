/*
 * A predicate that reads the input from File and returns it in
 * the second argument: Countries.
 * Example:
 *
 * ?- read_input('m1.txt', N, Teams).
 * N = 4,
 * Teams = [team(monaco, 2, 10, 2),
 *          team(andorra, 2, 6, 4),
 *          team(sanmarino, 1, 1, 4),
 *          team(liechtenstein, 1, 0, 7)].
 */
read_input(File, N, Teams) :-
    open(File, read, Stream),
    read_line_to_codes(Stream, Line),
    atom_codes(Atom, Line),
    atom_number(Atom, N),
    read_lines(Stream, N, Teams).

read_lines(Stream, N, Teams) :-
    ( N == 0 -> Teams = []
    ; N > 0  -> read_line(Stream, Team),
                Nm1 is N-1,
                read_lines(Stream, Nm1, RestTeams),
                Teams = [Team | RestTeams]).

read_line(Stream, team(Name, P, A, B)) :-
    read_line_to_codes(Stream, Line),
    atom_codes(Atom, Line),
    atomic_list_concat([Name | Atoms], ' ', Atom),
    maplist(atom_number, Atoms, [P, A, B]).
