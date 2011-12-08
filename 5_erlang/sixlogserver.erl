-module(sixlogserver).
-behaviour(gen_server).

% define server name
-define(SERVER, sixtranslation).
% API
-export([start_link/0, log/1]).
% callback
-export([init/1, handle_call/3, handle_cast/2]).

init(_Args) ->
		{ok, running}.

start_link() ->
		gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

handle_call(_Request, _From, State) ->
		{reply, error, State}.

handle_cast({log, FileName, Msg}, State) ->
		{ok, FileId} = file:open(FileName, [append]), 
		{{Year,Month,Day},{Hour,Min,Seconds}} = erlang:localtime(),
		io:fwrite(FileId, "[~p/~p/~p ~p:~p:~p] ~s~n", [Year, Month, Day, Hour, Min, Seconds, Msg]),
		file:close(FileId),
		{noreply, State}.		

log(Msg) ->
		gen_server:cast(?SERVER, {log, "log.txt", Msg}).
