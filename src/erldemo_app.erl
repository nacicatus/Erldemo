%%%-------------------------------------------------------------------
%% @doc erldemo public API
%% @end
%%%-------------------------------------------------------------------

-module(erldemo_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([{'_', [
		{"/ws", demo_ws, []},
		{"/", cowboy_static, {priv_file, erldemo, "index.html"}}]}]),
    
    {ok, _} = cowboy:start_clear(http_listener,[{port, 8080}],#{env => #{dispatch => Dispatch}}),
    
	erldemo_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
