%% team(Name, No_matches, Goals_Out, Goals_In)
%% state(Winners, Losers, Matches(.)
%% match(Name1, Name2, Goals1, Goals2)


is_losing_team(Name, Out, [Name1, Name2]):- not(Name = Name1) ->
not(Name = Name2) -> Out = true ; Out = false.


subseq([],[]).
subseq([H|T],[H|T2]):-  subseq(T,T2).
subseq(L,[_|T2]):- subseq(L,T2).

% merging two lists
merge([X], [Y], [[X,Y]]):-!.
merge([], [], []).
merge([X|L1], [Y|L2], [[X,Y]|L3]):- merge(L1, L2, L3).

% check pairing validity calls recursively check pair validity for every pair
check_pairing_validity([], _).
check_pairing_validity([[X1,X2]|RestPairs], Finalists):- check_pair_validity(X1, X2, true, Finalists),
check_pairing_validity(RestPairs, Finalists).

% TODO: fix this according to the new rules
% check_pair_validity(team(Name, No_Matches1, Goals_Out1, Goals_In1), team(_, _, Goals_Out2, Goals_In2), Out, Finalists):- Goals_Out1 < Goals_In2 -> Out = false ;
%     Goals_In1 < Goals_Out2 -> Out = false ;
%     Goals_Out1 is Goals_In2, No_Matches1 > 2 -> Out = false ;
%     Goals_In1 is Goals_Out2, No_Matches1 is 2, is_losing_team(Name, TempOut, Finalists), TempOut = true -> Out = false;
%     Out = true.

check_pair_validity(team(Name, No_Matches1, Goals_Out1, Goals_In1), team(_, _, Goals_Out2, Goals_In2), Out, Finalists):-
  (New_Out is Goals_Out1 - Goals_In2, New_In is Goals_In1 - Goals_Out2),(
  New_Out < 0 -> Out = false;
  New_In < 0 -> Out = false;
  (New_In = 0, is_losing_team(Name, true, Finalists)) -> Out = false;
  (New_Out = 0, No_Matches1 > 2) -> Out = false;
  Out = true).



check_losers_validity([]).
check_losers_validity([team(_,_,Goals_Out, Goals_In)|Losers]):- check_loser_validity(Goals_Out, Goals_In, true),
  check_losers_validity(Losers).
check_loser_validity(Goals_Out, Goals_In, Out):- Goals_Out >= Goals_In -> Out = false ; Out = true.


process_pairs(Pairs, Matches, Winners, Losers) :- get_matches_from_pairs(Pairs, Matches, Teams),
get_winners(Teams, Winners),
get_losers(Teams, Losers).

get_matches_from_pairs([], [], []).
get_matches_from_pairs([H|T], Matches, NewTeams) :- get_match_from_pair(H, Match, NewTeam),
get_matches_from_pairs(T, MatchesRec, NewTeamsRec),
append(MatchesRec, [Match], Matches),
append(NewTeamsRec, [NewTeam], NewTeams).


get_match_from_pair([team(Name1, No_Matches1, Goals_Out1, Goals_In1), team(Name2, 1, Goals_Out2, Goals_In2)], Match, NewTeam):-
                    Match = match(Name1, Name2, Goals_In2, Goals_Out2), NewGoalsOut is Goals_Out1 - Goals_In2, NewGoalsIn is Goals_In1 - Goals_Out2, NewMatches is No_Matches1 -1,NewTeam = team(Name1, NewMatches, NewGoalsOut, NewGoalsIn).


winning_state(state(Winners, [team(_, No_Matches1, Goals_Out1, Goals_In1), team(_, No_Matches2, Goals_In1, Goals_Out1)|RestLosers],_), Out):-
              (No_Matches1  > 1 -> Out= false ; No_Matches2 > 1 -> Out = false ; length(Winners, WinnersLength), WinnersLength > 0 -> Out = false ; length(RestLosers, RestLosersLength), RestLosersLength > 0 -> Out = false ; not(Goals_Out1 = Goals_In1) -> Out = true; Out = false).



get_winning_state(state(Winners, Losers, Matches), WinningState, Finalists):-
                permutation(WinnersPerm, Winners),
                merge(WinnersPerm, Losers, Pairs),
                check_pairing_validity(Pairs, Finalists),
                process_pairs(Pairs, NewMatches, NewWinners, NewLosers),
                append(Matches, NewMatches, AllMatches),
                Temp = state(NewWinners, NewLosers, AllMatches),
                ( winning_state(Temp, Out),  Out = true -> WinningState = Temp ;
                check_losers_validity(Losers),
                check_losers_validity(NewLosers),
                get_winning_state(Temp, WinningState, Finalists) ).


read_input(File, Losers, Winners):-
    open(File, read, Stream), % get Stream from file
    read_line_to_codes(Stream,First_Line),
    atom_codes(First_Atom, First_Line),
    atom_number(First_Atom, N), % N how many stages we have
    read_lines(Stream,N,Teams),
    get_winners(Teams, Winners),
    get_losers(Teams, Losers).

read_lines(_,0,[]).
read_lines(Stream, N, Teams):-
    read_line_to_codes(Stream, Line),
    atom_codes(AtomFromLine, Line),
    atomic_list_concat([Name|T], ' ', AtomFromLine),
    maplist(atom_number, T, [No_Matches, Goals_Out, Goals_In]),
    New_N is N-1,
    read_lines(Stream, New_N, TeamsRec),
    append([(team(Name, No_Matches, Goals_Out, Goals_In))], TeamsRec, Teams).



get_finalists([], []).
get_finalists([team(Name, No_Matches, _, _)|T], Finalists):-
              get_maxim([team(Name, No_Matches, _, _)|T],Maxim),
              get_finalists(T, FinalistsRec), (No_Matches = Maxim -> Finalists = [Name|FinalistsRec] ; Finalists = FinalistsRec).

get_maxim(Winners, Maxim):-
          get_matches(Winners, Matches),
          sort(Matches, MatchesSorted),
          reverse(MatchesSorted, [H|_]), Maxim = H.

get_matches([], []).
get_matches([team(_,No_Matches, _, _)|Rest], Matches):-
            get_matches(Rest, MatchesRec),
            append(MatchesRec, [No_Matches], Matches).


get_winners([], []).
get_winners([team(Name, No_Matches, Goals_Out, Goals_In)|T], Winners):-
            No_Matches is 1 -> get_winners(T, Winners) ;
            get_winners(T, WinnersRec),
            append([team(Name, No_Matches, Goals_Out, Goals_In)], WinnersRec, Winners).


get_losers([], []).
get_losers([team(Name, No_Matches, Goals_Out, Goals_In)|T], Losers):-
          No_Matches is 1 -> get_losers(T, LosersRec), append([team(Name, No_Matches, Goals_Out, Goals_In)], LosersRec, Losers);
          get_losers(T, Losers).
printList([]).
printList([H|T]):- write(H), nl, printList(T).
mundial(File, Matches):-
        read_input(File, Losers, Winners),
        get_finalists(Winners, Finalists), First_State = state(Winners, Losers, []), get_winning_state(First_State, state([], [team(Finalist1, _, GoalsOut, GoalsIn), team(Finalist2, _, GoalsIn, GoalsOut)], PreMatches), Finalists),
        X = match(Finalist1, Finalist2, GoalsOut, GoalsIn), append(PreMatches, [X], Matches).
