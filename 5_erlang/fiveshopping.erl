-module(fiveshopping).
-export([total/1, compute/1]).

compute(List) ->
		[ {Item, Quantity * Price} || {Item, Quantity, Price} <- List ].

total(Qlist) ->
		lists:foldl(fun({_, Price}, Total) -> Total + Price end, 0, compute(Qlist)).
