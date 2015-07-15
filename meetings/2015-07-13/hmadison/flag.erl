-module(flag).

-export([start_link/0, loop/1]).

start_link() ->
  spawn(?MODULE, loop, [1]).

loop(Points) ->
  receive
    {From, is_it_ready} ->
      io:format("Yeah, ~p~n", [From]),
      print_flag(Points),
      NewPoints = Points + 1,
      loop(NewPoints);
    stop ->
      ok;
    _ ->
      io:format("Bad message~n"),
      loop(Points)
  end.

print_flag(1) ->
  io:format("Not yet~n");
print_flag(2) ->
  io:format("Getting Closer~n");
print_flag(_) ->
  io:format("9::::=======~n|::::=======~n|===========~n|===========~n").
