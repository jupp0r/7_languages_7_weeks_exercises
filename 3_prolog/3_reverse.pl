reverse([],[]).
reverse([H|T], Rlist) :-
	reverse(T,Nlist),
	append(Nlist,[H],Rlist).