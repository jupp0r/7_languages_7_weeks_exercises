-module(sevenotpsupervisor).
-behaviour(supervisor).
-export([start_link/0, start_in_shell_for_testing/0]).
-export([init/1]).

-define(SERVER, sevenotpsupervisor).

start_link() ->
		supervisor:start_link({global, ?SERVER}, ?SERVER, []).

start_in_shell_for_testing() ->
		{ok, Pid} = supervisor:start_link(?SERVER, []),
		unlink(Pid),
		{ok, Pid}.

init(_Args) ->
		{ok, {{one_for_one, 1, 60}, [ {sevenotptranslate, {sevenotptranslate, start_link, []}, permanent, brutal_kill, worker, [sevenotptranslate]} ] } }.
