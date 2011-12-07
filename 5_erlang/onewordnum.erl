-module(onewordnum).
-export([count/1]).

count([]) ->
		1;
count([32 | Tail]) ->
		1 + count(Tail);
count([_X | Tail]) ->
		count(Tail).
