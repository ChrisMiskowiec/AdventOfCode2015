-module(wrappingpaper).
-export([main/1]).

main(Input) ->
    ParsedInput = parse_input(Input),
    PaperTotal = lists:foldl(fun (X, Sum) -> calc_paper(X) + Sum end, 0, ParsedInput),
    RibbonTotal = lists:foldl(fun (X, Sum) -> calc_ribbon(X) + Sum end, 0, ParsedInput),
    io:fwrite("Paper: ~B~n", [PaperTotal]),
    io:fwrite("Ribbon: ~B~n", [RibbonTotal]).

parse_input(Input) ->
    Lines = string:tokens(Input, "\n\t\f"),
    lists:map(fun parse_dimensions/1, Lines).

parse_dimensions(Str) ->
    StrDim = string:tokens(Str, "x"),
    lists:map(fun parse_integer/1, StrDim).

parse_integer(Str) ->
    {I, _} = string:to_integer(Str),
    I.

calc_paper([L, W, H]) ->
    Areas = [L * W, W * H, L * H],
    TotalArea = lists:sum(Areas) * 2,
    SmallestArea = lists:min(Areas),
    TotalArea + SmallestArea.

calc_ribbon([L, W, H]) ->
    Wrap = lists:min([L + W, L + H, W + H]) * 2,
    Bow = L * W * H,
    Wrap + Bow. 
