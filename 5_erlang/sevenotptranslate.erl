-module(sevenotptranslate).
-behaviour(gen_server).

% define server name
-define(SERVER, sevenotptranslate).
% API
-export([start_link/0, translate/1]).
% callback
-export([init/1, handle_call/3, handle_cast/2]).

init(_Args) ->
		{ok, running}.

start_link() ->
		gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

handle_call({translate, Word}, _From, State) ->
		{reply, {translate_reply, translation(Word)}, State}.

handle_cast(_, State) ->
		{noreply, State}.		

translate(Word) ->
		gen_server:call(?SERVER, {translate, Word}).

translation(Word) ->
		case Word of
				"jag" ->
						{success, "I"};
				"du" ->
						{success, "You"};
				"kindergarten" ->
						% this will cause a crash
						exit({sevenotptranslate,die,at,erlang:time()});
				_ ->
						{failure, "I don't know"}
		end.

