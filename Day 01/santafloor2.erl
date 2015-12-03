-module(santafloor2).
-export([main/0]).

% Find first instruction that puts Santa in the basement.
main() ->
    Instructions = read_instructions(),
    find_floor(Instructions).

read_instructions() ->
    {ok, File} = file:read_file("input.txt"),
    binary_to_list(File).

find_floor(Instructions) ->
    find_floor(Instructions, {0, 0}).

find_floor(_, {Floor, CharPos}) when Floor < 0 -> {ok, CharPos};
find_floor([], _) -> {error, never_bit_basement};

find_floor([$( | L], {Floor, CharPos}) -> find_floor(L, {Floor + 1, CharPos + 1});
find_floor([$) | L], {Floor, CharPos}) -> find_floor(L, {Floor - 1, CharPos + 1}).

