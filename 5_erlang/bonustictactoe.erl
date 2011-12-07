-module(bonustictactoe).
-include_lib("eunit/include/eunit.hrl").
-export([check/1]).

check({F1, F2, F3, F4, F5, F6, F7, F8, F9})->
		Combs = [{F1, F2, F3}, {F4, F5, F6}, {F7, F8, F9},
						 {F1, F4, F7}, {F2, F5, F8}, {F3, F6, F9},
						 {F1, F4, F9}, {F3, F5, F7}],
		Checkstrike = fun({e,_,_}, no_winner) ->
													no_winner;
										 ({X,X,X}, no_winner) ->
													X;
										 ({_,_,_}, no_winner) ->
													no_winner;
										 ({_,_,_}, X) ->
													X
									end,
		Strike = lists:foldl(Checkstrike, no_winner, Combs),
		Someleft = fun(e, not_found) ->
											 found;	
									(_, X) ->
											 X
							 end,
		Spaces = lists:foldl(Someleft, not_found, [F1, F2, F3, F4, F5, F6, F7, F8, F9]),
		case Strike of
				no_winner ->
						case Spaces of
								not_found ->
										cat;
								found ->
										no_winner
						end;
				X ->
						X
		end.

check_test_()->
		[?_assertEqual(check({x,x,e,e,e,e,e,e,e}), no_winner),
		 ?_assertEqual(check({x,x,e,o,o,o,e,e,e}), o),
		 ?_assertEqual(check({x,x,o,o,o,x,x,x,o}), cat)].
