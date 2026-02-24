-module(demo_ws).
-behaviour(cowboy_websocket).

-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2]).

init(Req, _Opts) ->
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    self() ! tick,
    {ok, State}.

websocket_handle(_Data, State) ->
    {ok, State}.

websocket_info(tick, State) ->
    %% Generate simple animation data
    Time = erlang:monotonic_time(millisecond),
    Json= jsx:encode(#{
	<<"t">> => Time,
	<<"rotX">> => math:sin(Time/2000),
	<<"rotY">> => math:cos(Time/3000)
	}),
    erlang:send_after(16, self(), tick), %% ~60 FPS
    {reply, {text, Json}, State};

websocket_info(_, State) ->
    {ok, State}.
