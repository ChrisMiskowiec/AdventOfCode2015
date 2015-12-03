-module(santafloor).
-export([find_floor/0]).

% Find destination floor based in input instructions.

read_instructions() ->
    {ok, File} = file:read_file("input.txt"),
    binary_to_list(File).

find_floor([H | L], Agg) when [H] =:= "(" ->
    find_floor(L, Agg + 1);
find_floor([H | L], Agg) when [H] =:= ")" ->
    find_floor(L, Agg - 1);
find_floor([], Agg) ->
    Agg.

find_floor() ->
    Instructions = read_instructions(),
    find_floor(Instructions, 0).
