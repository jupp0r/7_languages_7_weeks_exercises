smallest([X],X).
smallest([H|T],H) :- smallest(T,X), X > H.
smallest([H|T],X) :- smallest(T,X), X =< H.

sortl([],[]).
sortl([H|T],Slist) :-
	sortl(T,Nlist),
	smallest(H,Slist),
	append([H], Nlist, Slist).
	
	
	
	