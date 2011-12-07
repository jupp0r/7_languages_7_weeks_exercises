-module(twocounttoten).
-export([count/0]).

count()->
		do_count(1,10).
do_count(X,X)->
		printnum(X);
do_count(Y,Z) ->
		printnum(Y),
		do_count(Y+1,Z).

printnum(X) ->
		io:fwrite("~.10B~n",[X]).

