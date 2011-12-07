-module(threeerror).
-export([handle_error/1]).

handle_error({error, Msg}) ->
		io:fwrite("Error: ~s~n", [Msg]);

handle_error(success) ->
		io:fwrite("Success~n").
