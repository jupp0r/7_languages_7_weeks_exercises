-module(fourkeyval).
-export([lookup/2]).

lookup(_, []) ->
		notfound;
lookup(Key, [{Key, Value} | _]) ->
		Value;
lookup(Key, [_|T]) ->
		lookup(Key, T).
