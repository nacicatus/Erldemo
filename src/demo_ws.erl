-module(demo_ws).
-behaviour(cowboy_websocket).

-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2]).

init(Req, _Opts) ->
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    %% Send periodic messages
    erlang:send_after(100, self(), tick),
    {ok, State}.

websocket_handle(_Data, State) ->
    {ok, State}.

websocket_info(tick, State) ->
    %% Send beat + frequency
   Msg = jsx:encode(#{
    <<t>> => Time,
    <<"beat">> => (Time div 5000) rem 2,
    <<"freq">> => rand:uniform(),
    <<"nodes">> => Nodes,
    <<"messages">> => Msgs
   }),
   erlang:send_after(100, self(), tick),
   {[{text, Msg}], State}.

websocket_info(_, State) ->
    {ok, State}.
