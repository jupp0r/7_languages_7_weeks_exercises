book(george_rr_martin,a_game_of_thrones).
book(george_rr_martin,a_feast_for_crows).
book(christopher_hitchens,hitch_22).
book(bruce_a_tate,seven_languages_in_seven_weeks).

% find all books by george rr martin
report :-
findall(Which, book(george_rr_martin, Which),Cs),
write(Cs).
