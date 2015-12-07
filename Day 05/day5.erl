-module(day5).

main(Input) -> 
    Lines = split_lines(Input),
    NiceLines = lists:filter(fun is_nice/1, Lines),
    length(NiceLines).
    

split_lines(Input) ->
    string:tokens(Input, "\r\n").

is_nice(Line) ->
    contains_three_vowels(Line) andalso contains_double(Line) andalso not contains_bad_string(Line).

contains_three_vowels(Str) ->
    contains_three_vowels(Str, 0).

contains_three_vowels([], Count) when Count > 2 ->
    true;
contains_three_vowels([], _) ->
    false;
contains_three_vowels([H | T], Count) when H =:= $a; H =:= $e; H =:= $i; H =:= $o; H =:= $u ->
    contains_three_vowels(T, Count + 1);
contains_three_vowels([_ | T], Count) ->
    contains_three_vowels(T, Count).

contains_double(Str) when is_list(Str), length(Str) < 2 ->
    false;
contains_double([H, H | _]) ->
    true;
contains_double([_ | T]) ->
    contains_double(T).

contains_bad_string([$a, $b | _]) -> true;
contains_bad_string([$c, $d | _]) -> true;
contains_bad_string([$p, $q | _]) -> true;
contains_bad_string([$x, $y | _]) -> true;
contains_bad_string([]) -> false;
contains_bad_string([_ | T]) -> contains_bad_string(T).

