musician(jimmy_page, guitar).
musician(beethoven, pen).
musician(jimmy_hendrix, guitar).
musician(meg_white, drums).

report :-
	findall(Who, musician(Who, guitar), Cs),
	write(Cs).
